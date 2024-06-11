from django.contrib import admin
from .models import Estados, TipoUsuarios, Usuarios, Login, Libros, StockLibros, Prestamos, Renovaciones, Deudas

admin.site.register(Estados)
admin.site.register(TipoUsuarios)
admin.site.register(Usuarios)
admin.site.register(Login)
admin.site.register(Libros)
admin.site.register(StockLibros)
admin.site.register(Prestamos)
admin.site.register(Renovaciones)
admin.site.register(Deudas)
