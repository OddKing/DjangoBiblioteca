from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth import authenticate, login, logout
from .models import Prestamo, TipoUsuario
from django.utils import timezone

@login_required
def index(request):
    context = {
        'mensaje': '¡Hola totobal desde la vista!',
    }
    return render(request, 'index.html', context)

@login_required
def prestamo_libro(request):
    return render(request, 'prestamo_libro.html')

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