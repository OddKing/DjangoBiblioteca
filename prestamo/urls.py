from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path('prestamo/', views.prestamo_libro, name='prestamo_libro'),
    path('admin-biblioteca/', views.admin_biblioteca, name='admin_biblioteca'),
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
]