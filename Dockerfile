# Usa una imagen base
FROM ubuntu:20.04

# Instala paquetes necesarios
RUN apt-get update && apt-get install -y \
    curl \
    vim

# Copia archivos al contenedor
COPY . /app

# Establece el directorio de trabajo
WORKDIR /app

# Expone un puerto
EXPOSE 8080

# Define el comando por defecto para ejecutar el contenedor
CMD ["python3", "app.py"]
