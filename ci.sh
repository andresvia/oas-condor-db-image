#!/bin/bash

set -eu

echo cleanup
./cleanup.sh
echo crear imagen
./create.sh
echo extraer imagen
./extract.sh
echo generar terraform
./generate_terraform.sh
