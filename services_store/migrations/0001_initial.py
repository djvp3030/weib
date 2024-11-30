# Generated by Django 5.1.1 on 2024-10-07 00:55

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='factura_servicios',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('telefono', models.CharField(max_length=100)),
                ('servicio', models.CharField(max_length=100)),
                ('fechaDeCita', models.DateField()),
                ('direccion', models.CharField(max_length=100)),
                ('fechaSolicitada', models.DateTimeField(auto_now_add=True)),
                ('estado', models.CharField(choices=[('pendiente', 'pendiente'), ('en proceso', 'en proceso'), ('finalizado', 'finalizado')], default='en proceso', max_length=100)),
                ('fechaFinalizado', models.DateField(blank=True, null=True)),
                ('solicitante', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='factura_tienda',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('producto', models.CharField(max_length=100)),
                ('tamaño', models.CharField(max_length=100)),
                ('fechaCompra', models.DateTimeField(auto_now_add=True)),
                ('solicitante', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]