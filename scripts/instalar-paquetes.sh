#!/bin/bash

# rationale: docker: para correr las bases
# rationale: python-pip: para instalar docker-compose
# rationale: docker-compose: para correr las bases
# rationale: ntp: mantener el servidor con la hora precisa

set -eu

sudo yum install -y docker python-pip ntp
sudo pip install docker-compose==1.7.1
sudo pip install backports.ssl_match_hostname --upgrade
