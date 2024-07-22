from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login


@login_required
def index(request):
    # Contexto de datos para pasar a la plantilla
    context = {
        'mensaje': '¡Hola  totobal desde la vista!',
    }
    # Renderizar la plantilla index.html con el contexto proporcionado
    return render(request, 'index.html', context)
def prestamo_libro(request):
    return render(request, 'prestamo_libro.html')

def admin_biblioteca(request):
    return render(request, 'admin_biblioteca.html')

def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('home')  # Redirige a la página principal después del login
        else:
            # Mensaje de error si la autenticación falla
            return render(request, 'login.html', {'error': 'Credenciales inválidas'})
    return render(request, 'login.html')

def logout_view(request):
    logout(request)
    return redirect('home')