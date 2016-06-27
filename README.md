condor-db
=========

Conexiones a cada una de las Base de Datos.

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
