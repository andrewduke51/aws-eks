#!/bin/bash

VERSION=$1
wget https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip
unzip *.zip -d ops/