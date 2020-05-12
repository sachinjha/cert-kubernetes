#!/bin/sh

oc create secret tls ibm-dba-bas-external-tls-secret --key=tls.key --cert=tls.crt
oc create secret generic ibm-dba-bas-external-tls-ca-secret --from-file=cacert.crt=ca.crt
# what about trust list ? 
