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



######################## AAE  ########################

oc apply -f ../AAE/configuration/secrets.yaml

######################## IAWS  ########################


######################## IAWS  ########################

oc create serviceaccount ibm-pfs-es-service-account
oc apply -f ../IAWS/configuration/ibm-pfs-privileged-scc.yaml
oc adm policy add-scc-to-user ibm-pfs-privileged-scc -z ibm-pfs-es-service-account
oc apply -f ../IAWS/configuration/secrets.yaml
kubectl create secret generic wfs-lombardi-custom-xml-secret --from-file=sensitiveCustomConfig=../IAWS/configuration/100Custom.xml

######################## ODM ###########################

# this is using basic UserRegistry. For advance options see instructions here: https://www.ibm.com/support/knowledgecenter/SSYHZ8_20.0.x/com.ibm.dba.offerings/topics/tsk_config_secret.html
kubectl create secret generic odm-user-registry-secret --from-file=webSecurity.xml=../ODM/configuration/security/sample-webSecurity-basic-registry.xml