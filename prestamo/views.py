from django.shortcuts import render
from django.http import HttpResponse


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