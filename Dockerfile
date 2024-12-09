# Usa la imagen oficial de Python
FROM python:3.12-slim

# Setea el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos del proyecto
COPY . /app/

# Instala las dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Define la variable de entorno con la URL de la base de datos
ENV DATABASE_URL=postgresql://postgres:uxHDHVENJblVytTToxKHsAVRdnvxfhUp@postgres.railway.internal:5432/railway

# Expone el puerto que usará la aplicación
EXPOSE 8000

# Ejecuta la aplicación usando Gunicorn
CMD ["gunicorn", "weib.wsgi:application", "--bind", "0.0.0.0:8000"]
