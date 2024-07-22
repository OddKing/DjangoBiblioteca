from django.db import models
from django.utils import timezone
from datetime import timedelta
from django.core.exceptions import ValidationError
from django.db.models import Q

class Estado(models.Model):
    idestado = models.AutoField(primary_key=True)
    estado = models.CharField(max_length=200)

    class Meta:
        verbose_name = "Estado"
        verbose_name_plural = "Estados"

    def __str__(self):
        return self.estado

class TipoUsuario(models.Model):
    idTipoUsuario = models.AutoField(primary_key=True)
    TipoUsuario = models.CharField(max_length=200)

    class Meta:
        verbose_name = "Tipo de Usuario"
        verbose_name_plural = "Tipos de Usuarios"

    def __str__(self):
        return self.TipoUsuario

class Usuario(models.Model):
    RUT = models.CharField(max_length=15, primary_key=True)
    nombre = models.CharField(max_length=255)
    idTipoUsuario = models.ForeignKey(TipoUsuario, on_delete=models.CASCADE)
    contacto = models.CharField(max_length=255)
    correo = models.CharField(max_length=255)
    idEstado = models.ForeignKey(Estado, on_delete=models.CASCADE)

    class Meta:
        verbose_name = "Usuario"
        verbose_name_plural = "Usuarios"

    def __str__(self):
        return self.nombre

    def puede_pedir_prestado(self):
        if self.idTipoUsuario.TipoUsuario.lower() == 'alumno':
            prestamos_activos = Prestamo.objects.filter(
                RUTUsuario=self,
                fechaDevolucion__isnull=True
            ).count()
            return prestamos_activos < 4
        return True  # Para docentes, siempre pueden pedir prestado

    def numero_prestamos_activos(self):
        return Prestamo.objects.filter(
            RUTUsuario=self,
            fechaDevolucion__isnull=True
        ).count()

class Login(models.Model):
    usuario = models.CharField(max_length=100, primary_key=True)
    correo = models.CharField(max_length=255)
    clave = models.CharField(max_length=255)
    fecha = models.DateField()

    class Meta:
        verbose_name = "Login"
        verbose_name_plural = "Logins"

class Libro(models.Model):
    codigoLibro = models.AutoField(primary_key=True)
    titulo = models.CharField(max_length=255)
    autor = models.CharField(max_length=255)
    anioPublicacion = models.IntegerField()

    class Meta:
        verbose_name = "Libro"
        verbose_name_plural = "Libros"

    def __str__(self):
        return self.titulo

class StockLibro(models.Model):
    codigoLibro = models.OneToOneField(Libro, on_delete=models.CASCADE, primary_key=True)
    cantidadTotal = models.IntegerField(default=1)
    cantidadDisponible = models.IntegerField(default=1)

    class Meta:
        verbose_name = "Stock de Libro"
        verbose_name_plural = "Stocks de Libros"

    def __str__(self):
        return f"Stock de {self.codigoLibro.titulo}"

    def esta_disponible(self):
        return self.cantidadDisponible > 0

    def prestar(self):
        if not self.esta_disponible():
            raise ValidationError("No hay ejemplares disponibles de este libro.")
        self.cantidadDisponible -= 1
        self.save()

    def devolver(self):
        if self.cantidadDisponible < self.cantidadTotal:
            self.cantidadDisponible += 1
            self.save()
        else:
            raise ValidationError("No se puede devolver más ejemplares de los que existen.")

class Prestamo(models.Model):
    idPrestamo = models.AutoField(primary_key=True)
    codigoLibro = models.ForeignKey(Libro, on_delete=models.CASCADE)
    RUTUsuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    fechaPrestamo = models.DateField(default=timezone.now)
    fechaVencimiento = models.DateField()
    fechaDevolucion = models.DateField(null=True, blank=True)
    idEstado = models.ForeignKey(Estado, on_delete=models.CASCADE)
    renovaciones = models.IntegerField(default=0)

    class Meta:
        verbose_name = "Préstamo"
        verbose_name_plural = "Préstamos"

    def save(self, *args, **kwargs):
        if not self.pk:  # Si es un nuevo préstamo
            if not self.RUTUsuario.puede_pedir_prestado():
                raise ValidationError("El usuario ha alcanzado el límite de préstamos permitidos.")
            stock = StockLibro.objects.get(codigoLibro=self.codigoLibro)
            stock.prestar()
        
        if not self.fechaVencimiento:
            self.fechaVencimiento = self.calcular_fecha_vencimiento()
        
        super().save(*args, **kwargs)

    def calcular_fecha_vencimiento(self):
        tipo_usuario = self.RUTUsuario.idTipoUsuario.TipoUsuario.lower()
        if tipo_usuario == 'alumno':
            dias_prestamo = 7
        elif tipo_usuario == 'docente':
            dias_prestamo = 20
        else:
            dias_prestamo = 7  # Valor por defecto si no es ni alumno ni docente

        return self.fechaPrestamo + timedelta(days=dias_prestamo)

    def puede_renovar(self):
        tipo_usuario = self.RUTUsuario.idTipoUsuario.TipoUsuario.lower()
        if tipo_usuario == 'alumno':
            return self.renovaciones == 0
        elif tipo_usuario == 'docente':
            return self.renovaciones < 3
        return False

    def renovar(self):
        if not self.puede_renovar():
            raise ValidationError("No se puede renovar más este préstamo.")

        tipo_usuario = self.RUTUsuario.idTipoUsuario.TipoUsuario.lower()
        if tipo_usuario == 'alumno':
            dias_renovacion = 3
        elif tipo_usuario == 'docente':
            dias_renovacion = 20
        else:
            raise ValidationError("Tipo de usuario no válido para renovación.")

        self.fechaVencimiento += timedelta(days=dias_renovacion)
        self.renovaciones += 1
        self.save()

        Renovacion.objects.create(
            idPrestamo=self,
            fechaRenovacion=timezone.now(),
            fechaVencimiento=self.fechaVencimiento,
            idEstado=self.idEstado
        )

    def devolver(self):
        if not self.fechaDevolucion:
            fecha_actual = timezone.now().date()
            self.fechaDevolucion = fecha_actual
            self.idEstado = Estado.objects.get(estado='Devuelto')  # Asume que existe un estado 'Devuelto'
            self.save()
            
            stock = StockLibro.objects.get(codigoLibro=self.codigoLibro)
            stock.devolver()

            # Cálculo de multa
            dias_retraso = (fecha_actual - self.fechaVencimiento).days
            if dias_retraso > 0:
                monto_multa = dias_retraso * 1000  # 1000 pesos por día de retraso
                Multa.objects.create(
                    prestamo=self,
                    diasRetraso=dias_retraso,
                    montoMulta=monto_multa
                )
                return monto_multa
        return 0

    def tiene_multa(self):
        return Multa.objects.filter(prestamo=self).exists()

    @classmethod
    def filtrar_prestamos(cls, fecha=None, tipo_usuario=None):
        queryset = cls.objects.all()
        
        if fecha:
            queryset = queryset.filter(
                Q(fechaPrestamo=fecha) | 
                Q(fechaVencimiento=fecha) | 
                Q(fechaDevolucion=fecha)
            )
        
        if tipo_usuario:
            queryset = queryset.filter(RUTUsuario__idTipoUsuario__TipoUsuario__iexact=tipo_usuario)
        
        return queryset.select_related('RUTUsuario', 'codigoLibro', 'idEstado')

class Renovacion(models.Model):
    idRenovacion = models.AutoField(primary_key=True)
    idPrestamo = models.ForeignKey(Prestamo, on_delete=models.CASCADE)
    fechaRenovacion = models.DateField()
    fechaVencimiento = models.DateField()
    idEstado = models.ForeignKey(Estado, on_delete=models.CASCADE)

    class Meta:
        verbose_name = "Renovación"
        verbose_name_plural = "Renovaciones"

    def __str__(self):
        return f"Renovación {self.idRenovacion} del préstamo {self.idPrestamo.idPrestamo}"

class Multa(models.Model):
    idMulta = models.AutoField(primary_key=True)
    prestamo = models.ForeignKey(Prestamo, on_delete=models.CASCADE)
    diasRetraso = models.IntegerField()
    montoMulta = models.IntegerField()
    fechaCreacion = models.DateField(auto_now_add=True)
    pagada = models.BooleanField(default=False)

    class Meta:
        verbose_name = "Multa"
        verbose_name_plural = "Multas"

    def __str__(self):
        return f"Multa de {self.montoMulta} pesos para el préstamo {self.prestamo.idPrestamo}"
    
class Deuda(models.Model):
    idDeuda = models.AutoField(primary_key=True)
    RUTUsuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    idPrestamoLibro = models.ForeignKey(Prestamo, on_delete=models.CASCADE)
    diasRetraso = models.IntegerField()
    montoDeuda = models.IntegerField()
    idEstado = models.ForeignKey(Estado, on_delete=models.CASCADE)

    class Meta:
        verbose_name = "Deuda"
        verbose_name_plural = "Deudas"

    def __str__(self):
        return f"Deuda de {self.montoDeuda} pesos para el préstamo {self.idPrestamoLibro.idPrestamo}"