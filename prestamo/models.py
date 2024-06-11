from django.db import models

# Create your models here.
class Libro(models.Model):
	codigoLibro=models.DecimalField(max_digits=10, decimal_places=0,primary_key=True)
	titulo=models.CharField(max_length=250,null=False)
	autor=models.CharField(max_length=250,null=False)
	anio_publicacion=models.DecimalField(max_digits=4,decimal_places=0,null=False)

class Tipousuario(models.Model):
	idTipoUsuario=models.DecimalField(max_digits=5,decimal_places=0,primary_key=True)
	tipoUsuario=models.CharField(max_length=100)

class Usuario(models.Model):
	codigoUsuario=models.DecimalField(max_digits=10,decimal_places=0,primary_key=True)
	nombre=models.CharField(max_length=250)
