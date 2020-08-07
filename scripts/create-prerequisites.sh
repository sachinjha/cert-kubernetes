#!/bin/sh


#### root ca secret when using signed root CA for secure routes . If using self-signed cert, the below line can be commented #####
oc create secret generic cp4a-root-ca --from-file=tls.key=tls/automation-root-ca.key --from-file=tls.crt=tls/automation-root-ca_intermediate.pem

## ums external tls certs ###
oc create secret tls ibm-dba-ums-external-tls-secret --cert tls/automation-root-ca.pem --key tls/automation-root-ca.key
oc create secret tls ibm-dba-ums-external-tls-teams-secret --cert tls/automation-root-ca.pem --key tls/automation-root-ca.key
oc create secret tls ibm-dba-ums-external-tls-scim-secret --cert tls/automation-root-ca.pem --key tls/automation-root-ca.key
oc create secret tls ibm-dba-ums-external-tls-sso-secret --cert tls/automation-root-ca.pem --key tls/automation-root-ca.key

oc create secret generic ibm-dba-ums-external-tls-ca-secret --from-file=tls.key=tls/automation-root-ca.key --from-file=tls.crt=tls/automation-root-ca_intermediate.pem


## copy jdbc files to operator 
podname=$(oc get pod | grep ibm-cp4a-operator | awk '{print $1}')
kubectl cp jdbc $podname:/opt/ansible/share -c ansible



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



######################## BAN  ########################

../BAN/configuration/ban-secret.sh

######################## FNCM  ########################

../FNCM/configuration/ibm-fncm-secret.sh


############# BAW ##########

oc apply -f 
oc create serviceaccount ibm-pfs-es-service-account
oc adm policy add-scc-to-user privileged -z ibm-pfs-es-service-account