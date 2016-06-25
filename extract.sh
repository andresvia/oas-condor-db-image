#!/bin/bash

set -eu

# extraer el artefacto a partir del log y crear un json con eso
awk -F, '
  BEGIN {
    printf("{\"artifacts\":[")
  }

  $3=="artifact" && $5=="id" {
    printf("%s{\"id\":\""$4"\",\"data\":\""$6"\"}",sep);sep=","
  }

  END {
    printf("]}")
  }' target/packer.log > target/artifacts.json

jq . < target/artifacts.json
