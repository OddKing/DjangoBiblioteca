from django.db import models

class Estado(models.Model):
    idestados = models.AutoField(primary_key=True)
    estado = models.CharField(max_length=200)

    class Meta:
        verbose_name = "Estado"
        verbose_name_plural = "Estados"

    def __str__(self):
        return self.estado

class TipoUsuario(models.Model):
    idTipoUsuario = models.AutoField(primary_key=True)
    TipoUsuario = models.CharField(max_length=200)

    class Meta:
        verbose_name = "Tipo de Usuario"
        verbose_name_plural = "Tipos de Usuarios"

    def __str__(self):
        return self.TipoUsuario

class Usuario(models.Model):
    RUT = models.CharField(max_length=15, primary_key=True)
    nombre = models.CharField(max_length=255)
    idTipoUsuario = models.ForeignKey(TipoUsuario, on_delete=models.CASCADE)
    contacto = models.CharField(max_length=255)
    correo = models.CharField(max_length=255)
    idEstado = models.ForeignKey(Estado, on_delete=models.CASCADE)

    class Meta:
        verbose_name = "Usuario"
        verbose_name_plural = "Usuarios"

    def __str__(self):
        return self.nombre

class Login(models.Model):
    usuario = models.CharField(max_length=100, primary_key=True)
    correo = models.CharField(max_length=255)
    clave = models.CharField(max_length=255)
    fecha = models.DateField()

    class Meta:
        verbose_name = "Login"
        verbose_name_plural = "Logins"

class Libro(models.Model):
    codigoLibro = models.AutoField(primary_key=True)
    titulo = models.CharField(max_length=255)
    autor = models.CharField(max_length=255)
    anioPublicacion = models.IntegerField()

    class Meta:
        verbose_name = "Libro"
        verbose_name_plural = "Libros"

    def __str__(self):
        return self.titulo

class StockLibro(models.Model):
    codigoLibro = models.OneToOneField(Libro, on_delete=models.CASCADE, primary_key=True)
    cantidadDisponible = models.IntegerField()

    class Meta:
        verbose_name = "Stock de Libro"
        verbose_name_plural = "Stocks de Libros"

class Prestamo(models.Model):
    idPrestamo = models.AutoField(primary_key=True)
    codigoLibro = models.ForeignKey(Libro, on_delete=models.CASCADE)
    RUTUsuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    fechaPrestamo = models.DateField()
    fechaVencimiento = models.DateField()
    fechaDevolucion = models.DateField(null=True, blank=True)
    idEstado = models.ForeignKey(Estado, on_delete=models.CASCADE)

    class Meta:
        verbose_name = "Préstamo"
        verbose_name_plural = "Préstamos"

class Renovacion(models.Model):
    idRenovacion = models.AutoField(primary_key=True)
    idPrestamo = models.ForeignKey(Prestamo, on_delete=models.CASCADE)
    fechaRenovacion = models.DateField()
    fechaVencimiento = models.DateField()
    idEstado = models.ForeignKey(Estado, on_delete=models.CASCADE)

    class Meta:
        verbose_name = "Renovación"
        verbose_name_plural = "Renovaciones"

class Deuda(models.Model):
    idDeuda = models.AutoField(primary_key=True)
    RUTUsuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    idPrestamoLibro = models.ForeignKey(Prestamo, on_delete=models.CASCADE)
    diasRetraso = models.IntegerField()
    montoDeuda = models.IntegerField()
    idEstado = models.ForeignKey(Estado, on_delete=models.CASCADE)

    class Meta:
        verbose_name = "Deuda"
        verbose_name_plural = "Deudas"
