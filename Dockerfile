# Usa una imagen base de Python
FROM python:3.12.6

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo requirements.txt y las dependencias al contenedor
COPY requirements.txt /app/

# Instala las dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto de los archivos de tu proyecto al contenedor
COPY . /app/

# Expone el puerto 8000 para que se pueda acceder a la aplicación desde fuera
EXPOSE 8000

# Establece la variable de entorno para la configuración de Django
ENV PYTHONUNBUFFERED 1

# Comando para ejecutar la aplicación con Gunicorn
CMD ["gunicorn", "weib.wsgi:application", "--bind", "0.0.0.0:8000"]

ENV DATABASE_URL= postgresql://postgres:uxHDHVENJblVytTToxKHsAVRdnvxfhUp@postgres.railway.internal:5432/railway