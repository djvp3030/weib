# Usa una imagen oficial de Python como base
FROM python:3.12.6

# Establece el directorio de trabajo
WORKDIR /app

# Instala las dependencias del sistema necesarias (por ejemplo, compiladores)
RUN apt-get update && apt-get install -y \
    libpq-dev \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Instala Node.js y npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Verifica que node y npm están instalados
RUN node -v
RUN npm -v

# Copia los archivos de tu aplicación al contenedor
COPY . /app/

# Crea un entorno virtual y activa el entorno
RUN python -m venv /venv
ENV PATH="/venv/bin:$PATH"

# Instala las dependencias de Python
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Ejecuta el comando collectstatic para recopilar archivos estáticos
RUN python manage.py collectstatic --noinput

# Exponer el puerto en el que la app estará corriendo
EXPOSE 8000

# Comando para iniciar la aplicación con Gunicorn
CMD ["gunicorn", "weib.wsgi:application", "--bind", "0.0.0.0:8000"]