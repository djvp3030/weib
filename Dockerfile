# Usa una imagen oficial de Python como base
FROM python:3.11-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos de tu aplicación al contenedor
COPY . /app/

# Instala las dependencias del sistema necesarias (por ejemplo, compiladores)
RUN apt-get update && apt-get install -y \
    libpq-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Crea un entorno virtual y activa el entorno
RUN python -m venv /venv
ENV PATH="/venv/bin:$PATH"

# Instala las dependencias de Python
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Ejecuta los comandos necesarios para construir los estilos de Tailwind
RUN python manage.py collectstatic --noinput
RUN python manage.py tailwind build

# Exponer el puerto en el que la app estará corriendo
EXPOSE 8000

# Comando para iniciar la aplicación con Gunicorn
CMD ["gunicorn", "weib.wsgi:application", "--bind", "0.0.0.0:8000"]