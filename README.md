condor-db
=========

 - Para construir localmente ejecute `./local`, necesitará:
   - [Docker](https://www.docker.com/)
   - [Drone](http://readme.drone.io/devs/cli/)
 - Para construir automáticamente activar el proyecto en Drone
   - Generar los secretos necesarios según el archivo `secrets_example.yml` de la siguiente manera:

   ```
   cp secrets_example.yml .drone.sec.yml
   # editar el archivo .drone.sec.yml
   # gedit .drone.sec.yml
   # vim .drone.sec.yml
   # emacs .drone.sec.yml
   # etc...
   drone secure --repo plataforma/condor-db-image --checksum
   rm .drone.sec.yml
   git add .drone.sec
   git commit -m "configurando secretos"
   git push origin master
   ```

Actualmente este repositorio genera imágenes de AWS (AMIs).

Esta es una imágen que contiene las bases de datos necesarias para la aplicación. Está pensado para tener rápidamente un ambiente de pruebas. Todas las bases de datos se encuentran inicialmente vacías. A continuación se documenta como conectarse a cada una de ellas.

mysql
-----

    mysql -h x.x.x.x -u app_user01 -ppassword app

oracle xe
---------

    sqlplus 'app_user01/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=x.x.x.x)(Port=1521))(CONNECT_DATA=(SID=xe)))'

postgres
--------

El password es "password".

     psql -h x.x.x.x -U app_user01 -W app

vagrant
-------

Luego de aprovisionar con `vagrant up --provision`, las bases estarán listas en:

### mysql

    mysql -h dbs.192.168.12.95.xip.io -u app_user01 -ppassword app

### oracle xe

    sqlplus 'app_user01/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=dbs.192.168.12.95.xip.io)(Port=1521))(CONNECT_DATA=(SID=xe)))'

### postgres

El password es "password".

    psql -h dbs.192.168.12.95.xip.io -U app_user01 -W app

docker
------

*Nota:* debes tener los puertos `3306`, `5432` y `1521` libres en tu máquina.

Luego de aprovisionar con `docker-compose --file archivos/compose/docker-compose.yml up --build -d`, las bases estarán listas en localhost.

### mysql

    mysql -h 127.0.0.1 -u app_user01 -ppassword app

### oracle xe

    sqlplus 'app_user01/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=127.0.0.1)(Port=1521))(CONNECT_DATA=(SID=xe)))'

### postgres

El password es "password".

    psql -h 127.0.0.1 -U app_user01 -W app

Requerimientos y Mantenimiento
==============================

Es proyecto comparte los mismos requerimientos y reglas de mantenimiento que `condor-image`.
