
Descargar Docker:
https://www.docker.com/

https://app.docker.com/

Libreria de Imagenes:
https://hub.docker.com/

Practicar los Comandos de Docker:
https://labs.play-with-docker.com/


docker run hello-world

Crear Imagen de Mongo:
docker pull mongo

Ver Imagenes Descargadas:
docker images

Crear un Contenedor de Mongo:
docker container create mongo
Id Asignado Automaticamente:
feb280c8860f224c1171fbae8615595fd414d4a371018ca1c483ace2f46c5333

Levantar la Instancia de Mongo (mas de 4 digitos del Identificador):
docker start feb28

Verificar Instancias:
docker ps

Generar Otro Contenedor de Mongo:
docker container create mongo
Id Asignado Automaticamente:
19eca9e0e20d7623dadbd2a1d8b7d8e8d428ef9fbc8f37c61eafdd9867acb684

Levantar la Otra Instancia de Mongo (mas de 4 digitos del Identificador):
docker start 19eca

Verificar Instancias:
docker ps

Verificar Todas las Instancias:
docker ps -a

Eliminar la Instancia de HelloWorld (mas de 4 digitos del Identificador):
docker rm 80950

Eliminar Imagen de HelloWorld:
docker rmi hello-world

Detener un Contenedor en Ejecucion:
docker stop 19eca

Crear un Contenedor de Mongo con Nombre Asignado ("mongodb"):
docker create --name mongodb mongo
Id Asignado Automaticamente:
43b2fc1bed1111875c593891a38ef3b439ef992743a0340f6f947ff91e4c9c32



Comandos Básicos de Docker:

Gestión de Imágenes:

docker pull <imagen>: Descarga una imagen de Docker desde Docker Hub.
docker images: Lista todas las imágenes descargadas en tu máquina.
docker rmi <imagen>: Elimina una imagen local.

Gestión de Contenedores:

docker container create <imagen>: Crear un nuevo contenedor basado en la imagen especificada.
docker create --name <nombre> <imagen>: Crear un nuevo contenedor con el nombre asignado basado en la imagen especificada.
docker create -p <puerto_host>:<puerto_contenedor> --name <nombre> <imagen>: Crear un nuevo contenedor con puerto y nombre asignado basado en la imagen especificada.
docker run <imagen>: Busca y descarga la imagen especificada; y luego, crea y ejecuta un nuevo contenedor basado en dicha imagen. O sea, resume 3 pasos (pull, create y start) en uno solo (run).
docker run -d <imagen>: Ejecuta un contenedor en segundo plano (modo detach).
docker run --name <nombre_contenedor> <imagen>: Ejecuta un contenedor con un nombre específico.
docker run -p <puerto_host>:<puerto_contenedor> <imagen>: Mapea un puerto del host a un puerto del contenedor.
docker run -e <VARIABLE>=<VALOR> <imagen>: Establecer variables de entorno dentro de un contenedor en el momento de su creación.
docker run -v <ruta_host>:<ruta_contenedor> <imagen>: Monta un volumen desde el host en el contenedor.
docker ps: Muestra una lista de los contenedores en ejecución.
docker ps -a: Muestra todos los contenedores, incluidos los detenidos.
docker stop <id_contenedor>: Detiene un contenedor en ejecución.
docker start <id_contenedor>: Inicia un contenedor detenido.
docker restart <id_contenedor>: Reinicia un contenedor.
docker rm <id_contenedor>: Elimina un contenedor detenido.
docker exec -it <id_contenedor> bash: Accede a un contenedor en ejecución con una terminal interactiva.

Gestión de Volúmenes:

docker volume create <nombre_volumen>: Crea un nuevo volumen.
docker volume ls: Lista todos los volúmenes.
docker volume rm <nombre_volumen>: Elimina un volumen.

Gestión de Redes:

docker network ls: Lista todas las redes de Docker.
docker network create <nombre_red>: Crea una nueva red.
docker network connect <nombre_red> <id_contenedor>: Conecta un contenedor a una red específica.
docker network disconnect <nombre_red> <id_contenedor>: Desconecta un contenedor de una red.
docker network rm <nombre_red>: Elimina una red.

Mapeo de Puertos:

docker run -p <puerto_host>:<puerto_contenedor> <imagen>: Mapea un puerto del host a un puerto del contenedor.
docker run -P <imagen>: Mapea automáticamente todos los puertos expuestos del contenedor a puertos del host.

Gestión de Docker Compose:

docker-compose up: Inicia todos los servicios definidos en un archivo docker-compose.yml.
docker-compose down: Detiene y elimina los contenedores, redes y volúmenes definidos por docker-compose.
docker-compose ps: Muestra el estado de los contenedores gestionados por docker-compose.
docker-compose logs: Muestra los logs de los servicios gestionados por docker-compose.

Información y Depuración:

docker info: Muestra información sobre la instalación de Docker.
docker logs <id_contenedor>: Muestra los logs de un contenedor.
docker logs <id_contenedor> --details: Muestra los logs de un contenedor detalladamente.
docker logs --follow <id_contenedor>: Sigue los logs de un contenedor en tiempo real.
docker logs --follow --tail <lineas> <id_contenedor>: Ver las últimas líneas de los logs y luego seguir la salida en tiempo real.
docker logs -f <id_contenedor>: Sigue los logs de un contenedor en tiempo real.
docker logs --since <tiempo> <id_contenedor>: Filtrar los logs de un contenedor, mostrando solo aquellos generados a partir de un tiempo específico.
docker logs --since <inicio> --until <fin> <id_contenedor>: Ver los logs generados entre dos momentos determinados.
docker inspect <id_contenedor>: Muestra información detallada sobre un contenedor o una imagen.

Otras Opciones de Ejecución:

docker run --env <variable>=<valor> <imagen>: Establece variables de entorno en el contenedor.
docker run --link <nombre_contenedor>:<alias>: Conecta un contenedor a otro para que puedan comunicarse.
docker run --restart always <imagen>: Configura un contenedor para que se reinicie automáticamente si se detiene.



Un Dockerfile es un archivo de texto que contiene una serie de instrucciones para construir una imagen de Docker. 
Estas instrucciones definen el entorno, las dependencias, y las configuraciones necesarias para ejecutar una aplicación 
dentro de un contenedor. El Dockerfile es la base para crear imágenes reproducibles y consistentes.

Estructura Básica de un Dockerfile
Aquí tienes un ejemplo simple de un Dockerfile y una explicación de cada instrucción:

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
Instrucciones Comunes
FROM: Define la imagen base a partir de la cual construir la nueva imagen. Es la primera instrucción en un Dockerfile.

Ejemplo: FROM ubuntu:20.04
RUN: Ejecuta comandos dentro de la imagen para instalar paquetes o realizar otras configuraciones. Se utiliza para modificar el sistema de archivos del contenedor.

Ejemplo: RUN apt-get update && apt-get install -y curl vim
COPY: Copia archivos o directorios del contexto de construcción (del host) al sistema de archivos del contenedor.

Ejemplo: COPY . /app copia todos los archivos del directorio actual al directorio /app en el contenedor.
ADD: Similar a COPY, pero también puede descomprimir archivos tar y descargar archivos desde URLs.

Ejemplo: ADD app.tar.gz /app/
WORKDIR: Establece el directorio de trabajo para las instrucciones siguientes. Cambia el directorio en el contenedor antes de ejecutar comandos.

Ejemplo: WORKDIR /app
EXPOSE: Documenta el puerto en el que el contenedor escuchará. No publica el puerto por sí mismo, solo sirve como documentación.

Ejemplo: EXPOSE 8080
CMD: Define el comando por defecto que se ejecutará cuando se inicie el contenedor. Solo debe haber una instrucción CMD en un Dockerfile.

Ejemplo: CMD ["python3", "app.py"]
ENTRYPOINT: Similar a CMD, pero se utiliza para definir el comando que siempre se ejecutará cuando se inicie el contenedor. Puede ser combinado con CMD para proporcionar argumentos.

Ejemplo: ENTRYPOINT ["python3", "app.py"]
ENV: Define variables de entorno que estarán disponibles en el contenedor.

Ejemplo: ENV APP_ENV=production
VOLUME: Crea un punto de montaje para un volumen en el contenedor. Los datos en el volumen persisten incluso si el contenedor se elimina.

Ejemplo: VOLUME ["/data"]
USER: Define el usuario que debe ejecutar los comandos del contenedor.

Ejemplo: USER appuser
Construir una Imagen Desde un Dockerfile
Para construir una imagen a partir de un Dockerfile, usa el comando docker build:

docker build -t my_image:latest .
-t my_image:latest: Etiqueta la imagen como my_image con la etiqueta latest.
.: Indica el contexto de construcción (el directorio actual).
Ejecutar un Contenedor Desde una Imagen
Una vez construida la imagen, puedes crear y ejecutar un contenedor con:

docker run -d -p 8080:8080 my_image:latest
-d: Ejecuta el contenedor en modo detach.
-p 8080:8080: Mapea el puerto 8080 del host al puerto 8080 del contenedor.

Resumen
Dockerfile: Define los pasos para construir una imagen Docker.
Instrucciones Clave: FROM, RUN, COPY, WORKDIR, EXPOSE, CMD, ENTRYPOINT, ENV, VOLUME, USER.
Construcción y Ejecución: docker build para construir imágenes y docker run para ejecutar contenedores.
El Dockerfile te permite crear imágenes reproducibles que encapsulan todas las dependencias y configuraciones necesarias para ejecutar tu aplicación en cualquier entorno que soporte Docker.



El archivo docker-compose.yml es un archivo de configuración utilizado por Docker Compose, una herramienta que facilita la definición y ejecución de aplicaciones multi-contenedor. Con docker-compose.yml, puedes definir cómo se deben construir y ejecutar múltiples contenedores Docker que componen una aplicación completa.

Estructura Básica de un docker-compose.yml
Aquí tienes un ejemplo simple de un archivo docker-compose.yml:

version: '3.8'

services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
    volumes:
      - ./html:/usr/share/nginx/html
    networks:
      - webnet

  db:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: example
      MYSQL_DATABASE: mydb
    networks:
      - webnet

networks:
  webnet:
Componentes Clave del docker-compose.yml
version: Define la versión del archivo de configuración de Docker Compose que se está utilizando. La versión especifica la sintaxis y las características disponibles. En el ejemplo, se está utilizando la versión 3.8.

services: Define los servicios que forman parte de la aplicación. Cada servicio representa un contenedor Docker que se ejecutará. Cada servicio puede tener varias configuraciones:

image: Especifica la imagen Docker que se usará para crear el contenedor.

Ejemplo: image: nginx:latest
build: Alternativa a image. Define un contexto de construcción y un Dockerfile para construir una imagen localmente.

Ejemplo:
build:
  context: .
  dockerfile: Dockerfile
ports: Mapea puertos del contenedor a puertos del host.

Ejemplo: ports: - "8080:80"
volumes: Monta directorios del host en el contenedor, útil para persistir datos o compartir archivos.

Ejemplo: volumes: - ./html:/usr/share/nginx/html
environment: Define variables de entorno para el contenedor.

Ejemplo:
environment:
  MYSQL_ROOT_PASSWORD: example
  MYSQL_DATABASE: mydb
networks: Especifica las redes a las que debe unirse el contenedor. Puedes definir redes en la sección networks.

Ejemplo: networks: - webnet
networks: Define redes personalizadas para los contenedores. Puedes crear redes aisladas para que los servicios se comuniquen entre sí sin estar expuestos al exterior.

Ejemplo:
networks:
  webnet:
volumes: (Opcional) Define volúmenes que pueden ser compartidos entre contenedores o persistir datos entre reinicios de contenedores.

Ejemplo:
volumes:
  data:
Comandos Comunes de Docker Compose
docker-compose up: Construye, (re)crea, inicia y adjunta a los contenedores para los servicios definidos en docker-compose.yml.

-d: Ejecuta los contenedores en segundo plano (modo detach).
Ejemplo:
docker-compose up -d
docker-compose down: Detiene y elimina los contenedores, redes y volúmenes creados por docker-compose up.

Ejemplo:
docker-compose down
docker-compose ps: Muestra el estado de los contenedores definidos en docker-compose.yml.

Ejemplo:
docker-compose ps
docker-compose logs: Muestra los logs de los servicios. Puedes usar -f para seguir los logs en tiempo real.

Ejemplo:
docker-compose logs -f
docker-compose exec: Ejecuta un comando en un contenedor en ejecución.

Ejemplo:
docker-compose exec web bash

Resumen
version: Especifica la versión del archivo de configuración.
services: Define los contenedores y sus configuraciones.
networks: Define redes personalizadas para la comunicación entre contenedores.
volumes: Define volúmenes para persistencia de datos.
El archivo docker-compose.yml te permite gestionar aplicaciones complejas con múltiples contenedores de manera simple y organizada.



Para subir una imagen Docker a Docker Hub, debes seguir una serie de pasos que incluyen etiquetar tu imagen, iniciar sesión en Docker Hub y luego subir la imagen. Aquí te explico cómo hacerlo:

Pasos para Subir una Imagen a Docker Hub
Inicia Sesión en Docker Hub

Antes de subir una imagen, debes iniciar sesión en tu cuenta de Docker Hub desde la línea de comandos. Usa el siguiente comando:

docker login
Se te pedirá que ingreses tu nombre de usuario y contraseña de Docker Hub. Una vez autenticado, podrás subir imágenes a tu repositorio.
Etiqueta la Imagen

Docker Hub requiere que la imagen esté etiquetada con el nombre del repositorio en Docker Hub. La etiqueta debe seguir el formato <usuario>/<nombre_del_repositorio>:<etiqueta>. Si no especificas una etiqueta, Docker usa latest por defecto.

docker tag <nombre_imagen>:<etiqueta> <usuario>/<nombre_del_repositorio>:<etiqueta>
<nombre_imagen>:<etiqueta>: Nombre y etiqueta de la imagen local.
<usuario>/<nombre_del_repositorio>:<etiqueta>: Nombre del repositorio en Docker Hub y la etiqueta para la imagen en Docker Hub.
Ejemplo:

docker tag my_image:1.0 myusername/myrepository:1.0
Sube la Imagen a Docker Hub

Una vez que la imagen esté etiquetada correctamente, puedes subirla a Docker Hub con el comando docker push.

docker push <usuario>/<nombre_del_repositorio>:<etiqueta>
Ejemplo:

docker push myusername/myrepository:1.0
<usuario>/<nombre_del_repositorio>:<etiqueta>: La misma etiqueta que usaste para etiquetar la imagen.
Verificación y Gestión en Docker Hub
Verifica la Imagen: Puedes iniciar sesión en Docker Hub y navegar a tu repositorio para verificar que la imagen ha sido subida correctamente.
Gestiona el Repositorio: Puedes administrar tu repositorio desde la interfaz web de Docker Hub, incluyendo la visualización de etiquetas, eliminación de imágenes, y ajustes del repositorio.
Ejemplo Completo
Aquí tienes un flujo de trabajo completo para subir una imagen llamada my_image con la etiqueta 1.0 a un repositorio llamado myrepository bajo el usuario myusername:

Inicia Sesión:

docker login
Etiqueta la Imagen:

docker tag my_image:1.0 myusername/myrepository:1.0
Sube la Imagen:

docker push myusername/myrepository:1.0

Resumen
Inicia sesión en Docker Hub con docker login.
Etiqueta la imagen con docker tag.
Sube la imagen con docker push.
Estos pasos te permitirán compartir tus imágenes Docker con otros usuarios o equipos y utilizar Docker Hub como un registro centralizado para tus imágenes.
