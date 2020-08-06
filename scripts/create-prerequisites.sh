#!/bin/sh


#### root ca secret when using signed root CA for secure routes #####

oc create secret cp4a-root-ca tls --cert=tls/automation-root-ca_intermediate.pem --key=tls/automation-root-ca.key


############### UMS ####################
 
pwd=`pwd` 
echo "applying UMS configuration "
oc apply -f ../UMS/configuration/secrets.yaml
../UMS/configuration/ldap-bind-secret.sh 


## OPTIONAL For External tls secrets created by well know CA.
#echo "changing directory to ../UMS/configuration/tls/ "
#../UMS/configuration/tls/
#./external-tls-secret.sh
#echo "changing directory to $pwd "
# cd $pwd

################## BACA  ##################
echo "applying BACA configuration "


echo "changing directory to ../ACA/configuration-ha/security/ "
cd ../ACA/configuration-ha/security/
./create-rolebinding.sh
./aca-basedb-secret.sh

echo "changing directory to $pwd "
cd $pwd

###################### BAS  #################
echo "applying BAS configuration "
oc apply -f ../BAS/configuration/secret.yaml 



