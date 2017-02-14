#!/bin/bash

set -eu

sudo systemctl start docker
sudo systemctl start bases

for i in 1 2 3
do
  echo -n $i
  sudo systemctl status bases -l
done
