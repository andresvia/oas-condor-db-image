#!/bin/bash

# rationale: mariadb-server y postgresql-server: las bases de datos que utiliza la aplicación
# rationale: docker: para correr un contenedor de oracle 11g

set -eu

sudo yum install -y mariadb-server postgresql-server docker
