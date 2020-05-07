#!/bin/sh
# UMS

set +x 
echo "applying UMS configuration "
oc apply -f ../UMS/configuration/secrets.yaml
../UMS/configuration/ldap-bind-secret.sh 



# BACA
echo "applying BACA configuration "
../ACA/configuration/aca-basedb-secret.sh
../ACA/configuration/label-nodes.sh

pwd=`pwd`

echo "changing directory to ../ACA/configuration-ha/security/ "
cd ../ACA/configuration-ha/security/
./create-rolebinding-npol.sh

echo "changing directory to $pwd "
cd $pwd

# BAS 
echo "applying BAS configuration "
oc apply -f ../BAS/configuration/secret.yaml 
