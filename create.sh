#!/bin/bash

set -eu

packer -machine-readable validate plantilla.json

now="$(date +%s)"
OAS_EXPIRATION_TIMESTAMP="$((now+2592000))"  # un mes
PACKER_EXPIRATION_TIMESTAMP="$((now+86400))" # un día

export OAS_EXPIRATION_TIMESTAMP
export PACKER_EXPIRATION_TIMESTAMP

rm -rf target
mkdir -p target

if [ "${PACKER_MOCK_CREATION:-}" != "true" ]
then
  packer -machine-readable build plantilla.json | tee target/packer.log
else
  tee target/packer.log << EOF
timestamp,packer-provider,artifact,0,id,us-east-1:ami-fake1
timestamp,packer-provider,artifact,1,id,us-west-1:ami-fake2
EOF
fi
