#!/bin/sh
############### UMS ####################
 
pwd=`pwd` 
echo "applying UMS configuration "
oc apply -f ../UMS/configuration/secrets.yaml
../UMS/configuration/ldap-bind-secret.sh 
 generate external TLS secret. Optional.

## OPTIONAL For External tls secrets created by well know CA.
#echo "changing directory to ../UMS/configuration/tls/ "
#../UMS/configuration/tls/
#./external-tls-secret.sh
#echo "changing directory to $pwd "
# cd $pwd

################## BACA  ##################
echo "applying BACA configuration "
../ACA/configuration/aca-basedb-secret.sh
../ACA/configuration/label-nodes.sh
oc apply -f ../ACA/configuration/volumes.yaml

pwd=`pwd`

echo "changing directory to ../ACA/configuration-ha/security/ "
cd ../ACA/configuration-ha/security/
./create-rolebinding-npol.sh

echo "changing directory to $pwd "
cd $pwd

###################### BAS  #################
echo "applying BAS configuration "
oc apply -f ../BAS/configuration/secret.yaml 

## OPTIONAL generate external TLS secret.
#pwd=`pwd`
##echo "changing directory to ../BAS/configuration/tls/ "
#cd ../BAS/configuration/tls/
#./external-tls-secret.sh
#echo "changing directory to $pwd "
#cd $pwd


######################## BAI  ########################

# change demo-template to actual value of CR_NAME if not using default
oc adm policy add-scc-to-user privileged -z demo-template-bai-psp-sa
oc adm policy add-scc-to-user privileged -z default
oc apply -f ../BAI/configuration/bai-psp.yaml


######################## ADW  ########################

# change demo-template to actual value of CR_NAME if not using default
oc apply -f ../ADW/configuration/adw_secret_sample_values.yaml


######################## BAN  ########################

../BAN/configuration/ban-secret.sh
oc apply -f ../BAN/configuration/volumes.yaml

######################## FNCM  ########################

../FNCM/configuration/ibm-fncm-secret.sh
oc apply -f ../FNCM/configuration/volumes_cmis.yaml
oc apply -f ../FNCM/configuration/volumes_cpe.yaml
oc apply -f ../FNCM/configuration/graphql_volume.yaml

