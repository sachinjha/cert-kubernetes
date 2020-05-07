#!/bin/sh
# Read Step 5.6 on this page for explanation of how this works: https://github.com/sachinjha/cert-kubernetes/blob/20.0.1/ACA/README_config.md 


export BASE_DB_USER=db2inst1
export BASE_DB_PWD=passw0rd
kubectl  create secret generic aca-basedb \
--from-literal=BASE_DB_USER="$BASE_DB_USER" \
--from-literal=BASE_DB_PWD="$BASE_DB_PWD"