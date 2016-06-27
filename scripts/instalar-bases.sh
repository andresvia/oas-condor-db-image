#!/bin/bash

set -eu

# SELINUX
# rationale: simplificar instalación
echo Configurando SELINUX
sudo setenforce permissive
sudo sed -i.packer-bak 's/^SELINUX=.*/SELINUX=permissive/' /etc/selinux/config
egrep '^SELINUX=' /etc/selinux/config

# NTP
# rationale: Tener el servidor en la zona horaria local
echo Configurando hora
sudo mv /etc/localtime /etc/localtime.packer-bak
sudo ln -sv /usr/share/zoneinfo/America/Bogota /etc/localtime
sudo systemctl enable ntpd.service
sudo timedatectl set-timezone America/Bogota
sudo timedatectl set-ntp true
date

# BASES COMPOSE
sudo mkdir -p /usr/local/bases
sudo cp -r /tmp/archivos/compose/* /usr/local/bases
sudo cp /tmp/archivos/bases.service /usr/lib/systemd/system/bases.service

sudo systemctl enable docker
sudo systemctl enable bases

# hacer pull de las imágenes para tenerlas listas en cache
sudo systemctl start docker
c=0
while ! sudo docker ps
do
  sleep 1
  c=$((c+1))
  if [ "$c" -ge 10 ]
  then
    echo docker no no esta listo
    exit 1
  fi
done
pushd /usr/local/bases
sudo docker-compose pull
popd
sudo systemctl stop docker
