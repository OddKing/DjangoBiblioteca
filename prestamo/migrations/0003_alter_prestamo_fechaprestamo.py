# Generated by Django 5.0.6 on 2024-07-22 02:52

import django.utils.timezone
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('prestamo', '0002_rename_renovacion_renovacione_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='prestamo',
            name='fechaPrestamo',
            field=models.DateField(default=django.utils.timezone.now),
        ),
    ]