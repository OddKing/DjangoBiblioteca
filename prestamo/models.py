from django.db import models

class Estados(models.Model):
    idestados = models.AutoField(primary_key=True)
    estado = models.CharField(max_length=200)

    def __str__(self):
        return self.estado

class TipoUsuarios(models.Model):
    idTipoUsuario = models.AutoField(primary_key=True)
    TipoUsuario = models.CharField(max_length=200)

    def __str__(self):
        return self.TipoUsuario

class Usuarios(models.Model):
    RUT = models.CharField(max_length=15, primary_key=True)
    nombre = models.CharField(max_length=255)
    idTipoUsuario = models.ForeignKey(TipoUsuarios, on_delete=models.CASCADE)
    Contacto = models.CharField(max_length=255)
    correo = models.CharField(max_length=255)
    idEstado = models.ForeignKey(Estados, on_delete=models.CASCADE)

    def __str__(self):
        return self.nombre

class Login(models.Model):
    usuario = models.CharField(max_length=100, primary_key=True)
    correo = models.CharField(max_length=255)
    clave = models.CharField(max_length=255)
    fecha = models.DateField()

class Libros(models.Model):
    codigoLibro = models.AutoField(primary_key=True)
    titulo = models.CharField(max_length=255)
    autor = models.CharField(max_length=255)
    anioPublicacion = models.IntegerField()

    def __str__(self):
        return self.titulo

class StockLibros(models.Model):
    codigoLibro = models.OneToOneField(Libros, on_delete=models.CASCADE, primary_key=True)
    cantidadDisponible = models.IntegerField()

class Prestamos(models.Model):
    idPrestamo = models.AutoField(primary_key=True)
    codigoLibro = models.ForeignKey(Libros, on_delete=models.CASCADE)
    RUTUsuario = models.ForeignKey(Usuarios, on_delete=models.CASCADE)
    fechaPrestamo = models.DateField()
    fechaVencimiento = models.DateField()
    fechaDevolucion = models.DateField(null=True, blank=True)
    idEstado = models.ForeignKey(Estados, on_delete=models.CASCADE)

class Renovaciones(models.Model):
    idRenovacion = models.AutoField(primary_key=True)
    idPrestamo = models.ForeignKey(Prestamos, on_delete=models.CASCADE)
    fechaRenovacion = models.DateField()
    fechaVencimiento = models.DateField()
    idEstado = models.ForeignKey(Estados, on_delete=models.CASCADE)

class Deudas(models.Model):
    idDeuda = models.AutoField(primary_key=True)
    RUTUsuario = models.ForeignKey(Usuarios, on_delete=models.CASCADE)
    idPrestamoLibro = models.ForeignKey(Prestamos, on_delete=models.CASCADE)
    diasRetraso = models.IntegerField()
    montoDeuda = models.IntegerField()
    idEstado = models.ForeignKey(Estados, on_delete=models.CASCADE)
