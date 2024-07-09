from django.shortcuts import render
from django.http import HttpResponse


def index(request):
    # Contexto de datos para pasar a la plantilla
    context = {
        'mensaje': '¡Hola  totobal desde la vista!',
    }
    # Renderizar la plantilla index.html con el contexto proporcionado
    return render(request, 'index.html', context)
