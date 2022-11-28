Docker Essentials: A Developer Introduction

http://play-with-docker.com/

Video 1:

Que son los Contenedores
Procesos que corren aislados, con un kernel compartido. Se aislan con "namespaces": PID, USER, etc.

VM vs Contenedor
- VM tiene su propio sistema operativo, pesan mucho.
- Contenedor no tiene un sistema operativo completo, sino solo archivos específicos de sistema operativo, rápidos de iniciar y pesan poco.

**Build once, deploy anywhere**

Ventajas Contenedores:
- No más problema de funciona en mi máquina
- Rápidos y pesan poco.
- Mejor uso de recursos.
- Standar developers operations interface
- Ecosystem and tooling


## Lab 1:

`docker container run -t ubuntu top`
Corre un contenedor con la imagen ubuntu, usando el comando top. La variable -t permite hacer un pseudo-tty, necesario para que top funcione bien.

`docker container exec`
Permite entrar en *namespaces* de un contenedor corriendo, con un nuevo proceso.

`docker container ls`
Obtiene id de contenedores corriendo.

`docker container exec -it {CONTAINER ID} bash`
Entra al *namespace* del contenedor y con un proceso **bash**. Es la forma más común de inspeccionar un contenedor.

Notar que si el prefijo del terminal se vuelve algo como root@b3ad2a23fab3 (root@{CONTAINER ID}), es un indicador de que está corriendo **bash** en un contenedor. -it Es una variable para correr una interfaz interactiva.

`ps -ef`
Comando linux para ver procesos ejecutandose

Algunos namespaces que proveen el aislamiento:


    MNT: Mount and unmount directories without affecting other namespaces.
    NET: Containers have their own network stack.
    IPC: Isolated interprocess communication mechanisms such as message queues.
    User: Isolated view of users on the system.
    UTC: Set hostname and domain name per container.


--------

Docker Store [https://store.docker.com/](https://store.docker.com/) es un registro cebtral de imágenes de Docker.

`docker container run --detach --publish 8080:80 --name nginx nginx`

 --detach Corre el contenedor en el fondo. `--publish 8080:80` publica el puerto 80 del contenedor usando el puerto 8080 del host. `--name` para asignar nombre a un contenedor.

`docker container inspect nginx`
Para inspeccionar un contenedor.


`docker container run --detach --publish 8081:27017 --name mongo mongo:3.4`

`:3.4` para una version específica. 

`docker container stop {CONTAINER ID}*` (puedes agregar hartos ids: ... stop e3 r4 5t)
Detiene contenedores.

`docker system prune`
Remueve contenedores detenidos.

----------------------

Los contenedores poseen todo lo que necesitan, por lo tanto no se debe descargar alguna dependencia adicional.


--------------------

DOCKERFILE
Lista de instrucciones de como construir un contenedor.

`docker build -f Dockerfile`
Ejemplo de Dockerfile:
```
FROM ubuntu
ADD myapp /
EXPOSE 80
ENTRYPOINT /myapp
```


## Lab 2

```
FROM python:3.6.1-alpine
RUN pip install flask
CMD ["python","app.py"]
COPY app.py /app.py
```
- `FROM python:3.6.1-alpine` es una capa base de python, `alpine` es más liviana
- `RUN pip install flask` instala paquetes, edita archivos o cambia permisos. `RUN` se añade a capas de la imagen.
- `CMD ["python","app.py"]` se ejecuta cuando inicia un contenedor. En este caso corre una aplicación de python, solo puede haber un CMD en un Dockerfile, en caso de haber más solo el último toma efecto.
- `COPY app.py /app.py` copia app.py en el directorio local, donde se correrá `docker image build` en la nueva capa de la imagen. Esta instrucción es la última en Dockerfile




## Lab 2


`docker image build -t python-hello-world .`
Construye una imagen, `-t` permite asignarle un nombre, usa el Dockerfile que encuentra.

`docker image ls`
Lista imagenes en local.

`docker run -p 5001:5000 -d python-hello-world`

`-p` mapea el puerto 5000 de python al 5001 del host.

`docker container logs {CONTAINER ID}`
Muestra logs del container

### Pushear imagen a dockerhub

`docker login`
Loguearse.

`docker tag python-hello-world [dockerhub username]/python-hello-world`

Poner nombre a la imagen.

`docker push jzaccone/python-hello-world`

Pushearla a DockerHub

Si se edita la imagen hacer build de nuevo.



-----------

## Lab 2

`docker swarm init --advertise-addr eth0`
Crea un swarm, además retorna un comando para que se puedan unir.

`docker service create --detach=true --name nginx1 --publish 80:80  --mount source=/etc/hostname,target=/usr/share/nginx/html/index.html,type=bind,ro nginx:1.12`

Servir un nginx

`docker service ls`
Inspeccionar servicios.

`docker service ps nginx1`
Inspeccionar tareas.

`docker service update --replicas=5 --detach=true nginx1`
Actualiza el servicio para incluir 5 réplicas, definiendo un nuevo estado para el servicio.

`docker service logs {CONTAINER NAME}`
Obtiene logs del servicio.

`docker service update --image nginx:1.13 --detach=true nginx1`
Activa rolling update para el swarm, actualizando nginx.

`docker swarm leave`
Para que un trabajador salga de la swarm.

