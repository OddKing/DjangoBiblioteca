from django.contrib import admin
from .models import Estado, TipoUsuario, Usuario, Login, Libro, StockLibro, Prestamo, Renovacione, Deuda

admin.site.register(Estado)
admin.site.register(TipoUsuario)
admin.site.register(Usuario)
admin.site.register(Login)
admin.site.register(Libro)
admin.site.register(StockLibro)
admin.site.register(Prestamo)
admin.site.register(Renovacione)
admin.site.register(Deuda)
