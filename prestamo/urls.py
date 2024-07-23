from django.urls import path
from . import views

urlpatterns = [
    path("", views.index, name="index"),  # Ruta raíz, página principal
    path('prestamo/', views.prestamo_libro, name='prestamo_libro'),  # Ruta para préstamo de libros
    path('admin-biblioteca/', views.admin_biblioteca, name='admin_biblioteca'),  # Ruta para administración de la biblioteca
    path('login/', views.login_view, name='login'),  # Ruta para iniciar sesión
    path('logout/', views.logout_view, name='logout'),  # Ruta para cerrar sesión
    path('encargado/listado-prestamos/', views.listado_prestamos, name='listado_prestamos'),
    path('devolucion/', views.devolucion_libro, name='devolucion_libro'),
    path('usuarios-con-deuda/', views.usuarios_con_deuda, name='usuarios_con_deuda'),
    path('terminos-condiciones/', views.terminos_condiciones, name='terminos_condiciones'),
]