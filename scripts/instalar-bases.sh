#!/bin/bash

set -eu

# SELINUX
# rationale: simplificar instalación
echo Configurando SELINUX
sudo setenforce permissive
sudo sed -i.packer-bak 's/^SELINUX=.*/SELINUX=permissive/' /etc/selinux/config
egrep '^SELINUX=' /etc/selinux/config

sudo mkdir -p /usr/local/bases
sudo cp -r /tmp/archivos/compose /usr/local/bases
sudo cp /tmp/archivos/bases.service /usr/lib/systemd/system/bases.service

sudo systemctl enable docker
sudo systemctl enable bases
