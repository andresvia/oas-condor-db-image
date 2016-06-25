#!/bin/bash

set -eu

sudo systemctl enable mariadb
sudo systemctl start mariadb

password="$(uuidgen)"
sudo mysql_secure_installation << EOF

$password
$password
Y
Y
Y
EOF

sudo tee /root/.my.cnf << EOF
[client]
user = root
password = $password
EOF

sudo chmod 600 /root/.my.cnf

sudo systemctl stop mariadb
