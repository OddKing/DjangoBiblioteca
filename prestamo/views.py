from django.shortcuts import render
from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth import authenticate, login, logout
from django.utils import timezone
from django.contrib import messages
from django.db import transaction
from datetime import timedelta
from .models import Prestamo, TipoUsuario, Usuario
from .forms import PrestamoForm


#ESTE ME DA PASO A LA FECHA ACTUAL (NO MODIFICAR)
@login_required
def usuarios_con_deuda(request):
    fecha_actual = timezone.now().date()

    prestamos_vencidos = Prestamo.objects.filter(
        fechaVencimiento__lt=fecha_actual,
        fechaDevolucion__isnull=True
    ).select_related('RUTUsuario', 'RUTUsuario__idTipoUsuario', 'codigoLibro')

    usuarios_con_deuda = []
    for prestamo in prestamos_vencidos:
        dias_retraso = (fecha_actual - prestamo.fechaVencimiento).days
        tipo_usuario = prestamo.RUTUsuario.idTipoUsuario.TipoUsuario.lower()

        if (tipo_usuario == 'alumno' and dias_retraso > 7) or (tipo_usuario == 'docente' and dias_retraso > 20):
            usuarios_con_deuda.append({
                'usuario': prestamo.RUTUsuario,
                'libro': prestamo.codigoLibro,
                'dias_retraso': dias_retraso,
                'tipo_usuario': tipo_usuario,
                'fecha_vencimiento': prestamo.fechaVencimiento
            })

    return render(request, 'usuarios_con_deuda.html', {'usuarios_con_deuda': usuarios_con_deuda})

#DESCOMENTO ESTO PARA MOSTRAR PERSONAS CON DEUDA.
# @login_required
# def usuarios_con_deuda(request):
#     # Usa una fecha futura para simular que estamos en el futuro
#     fecha_simulada = timezone.now().date() + timedelta(days=30)  # 30 días en el futuro

#     prestamos_vencidos = Prestamo.objects.filter(
#         fechaVencimiento__lt=fecha_simulada,
#         fechaDevolucion__isnull=True
#     ).select_related('RUTUsuario', 'RUTUsuario__idTipoUsuario', 'codigoLibro')

#     usuarios_con_deuda = []
#     for prestamo in prestamos_vencidos:
#         dias_retraso = (fecha_simulada - prestamo.fechaVencimiento).days
#         tipo_usuario = prestamo.RUTUsuario.idTipoUsuario.TipoUsuario.lower()
#         monto_deuda = dias_retraso * 1000  # $1.000 por día de retraso

#         usuarios_con_deuda.append({
#             'usuario': prestamo.RUTUsuario,
#             'libro': prestamo.codigoLibro,
#             'dias_retraso': dias_retraso,
#             'tipo_usuario': tipo_usuario,
#             'fecha_vencimiento': prestamo.fechaVencimiento,
#             'en_deuda': True,
#             'monto_deuda': monto_deuda
#         })

#     return render(request, 'usuarios_con_deuda.html', {'usuarios_con_deuda': usuarios_con_deuda})

@login_required
def devolucion_libro(request):
    if request.method == 'POST':
        prestamo_id = request.POST.get('prestamo_id')
        prestamo = get_object_or_404(
            Prestamo, idPrestamo=prestamo_id, idEstado__estado='Activo')
        monto_multa = prestamo.devolver()
        if monto_multa > 0:
            messages.warning(
                request, f"Libro devuelto con éxito. Se ha generado una multa de ${monto_multa}.")
        else:
            messages.success(request, "Libro devuelto con éxito.")
        return redirect('devolucion_libro')

    prestamos_activos = Prestamo.objects.filter(idEstado__estado='Activo')
    return render(request, 'devolucion_libro.html', {'prestamos': prestamos_activos})

@login_required
def index(request):
    context = {
        'mensaje': '¡Hola totobal desde la vista!',
    }
    return render(request, 'index.html', context)

@login_required
def prestamo_libro(request):
    if request.method == 'POST':
        form = PrestamoForm(request.POST)
        if form.is_valid():
            try:
                with transaction.atomic():
                    prestamo = form.save()
                    messages.success(request, "¡Préstamo realizado con éxito!")
                    return render(request, 'prestamo_confirmacion.html', {'prestamo': prestamo})
            except Exception as e:
                messages.error(request, f"Error al realizar el préstamo: {str(e)}")
    else:
        form = PrestamoForm()
    
    return render(request, 'prestamo_libro.html', {'form': form})

@login_required
def admin_biblioteca(request):
    return render(request, 'admin_biblioteca.html')

def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('index')
        else:
            return render(request, 'login.html', {'error': 'Credenciales inválidas'})
    return render(request, 'login.html')

@login_required
def logout_view(request):
    logout(request)
    return redirect('index')

def es_encargado_biblioteca(user):
    return user.groups.filter(name='EncargadoBiblioteca').exists()

@login_required
def listado_prestamos(request):
    fecha = request.GET.get('fecha')
    tipo_usuario = request.GET.get('tipo_usuario')
    
    if fecha:
        fecha = timezone.datetime.strptime(fecha, '%Y-%m-%d').date()
    
    prestamos = Prestamo.filtrar_prestamos(fecha=fecha, tipo_usuario=tipo_usuario)
    tipos_usuario = TipoUsuario.objects.all()
    
    context = {
        'prestamos': prestamos,
        'tipos_usuario': tipos_usuario,
        'fecha_seleccionada': fecha,
        'tipo_usuario_seleccionado': tipo_usuario,
    }
    
    return render(request, 'listado_prestamos.html', context)


def terminos_condiciones(request):
    return render(request, 'terminos_condiciones.html')
