from django import forms
from .models import Prestamo, Libro, Usuario, Estado
from django.core.exceptions import ValidationError
from django.utils import timezone
from datetime import timedelta

class PrestamoForm(forms.ModelForm):
    codigoLibro = forms.ModelChoiceField(
        queryset=Libro.objects.all(),
        label="Libro",
        widget=forms.Select(attrs={'class': 'form-control'})
    )
    RUT_usuario = forms.CharField(
        max_length=15,
        label="RUT del Usuario",
        widget=forms.TextInput(attrs={'class': 'form-control'})
    )

    class Meta:
        model = Prestamo
        fields = ['codigoLibro', 'RUT_usuario']

    def clean_RUT_usuario(self):
        rut = self.cleaned_data.get('RUT_usuario')
        try:
            usuario = Usuario.objects.get(RUT=rut)
            if not usuario.puede_pedir_prestado():
                raise ValidationError("El usuario ha alcanzado el límite de préstamos permitidos.")
            return usuario
        except Usuario.DoesNotExist:
            raise ValidationError("No se encontró un usuario con este RUT.")

    def clean(self):
        cleaned_data = super().clean()
        libro = cleaned_data.get('codigoLibro')

        if libro:
            stock = libro.stocklibro
            if not stock.esta_disponible():
                raise ValidationError("El libro no está disponible para préstamo.")

        return cleaned_data

    def save(self, commit=True):
        prestamo = super().save(commit=False)
        prestamo.RUTUsuario = self.cleaned_data['RUT_usuario']
        
        # Establecer la fecha de préstamo
        prestamo.fechaPrestamo = timezone.now().date()
        
        # Calcular la fecha de vencimiento
        tipo_usuario = prestamo.RUTUsuario.idTipoUsuario.TipoUsuario.lower()
        if tipo_usuario == 'alumno':
            dias_prestamo = 7
        elif tipo_usuario == 'docente':
            dias_prestamo = 20
        else:
            dias_prestamo = 7  # Valor por defecto

        prestamo.fechaVencimiento = prestamo.fechaPrestamo + timedelta(days=dias_prestamo)
        
        # Asignar el estado "Activo" al préstamo
        estado_activo = Estado.objects.get(estado='Activo')
        prestamo.idEstado = estado_activo
        
        if commit:
            prestamo.save()
        return prestamo