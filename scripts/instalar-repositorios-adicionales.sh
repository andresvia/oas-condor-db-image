#!/bin/bash

# rationale: en los repositorios EPEL se encuentran paquetes necesarios como: docker y docker-compose

set -eu

echo Agregando epel

# Repositorio EPEL
sudo yum install -y epel-release
