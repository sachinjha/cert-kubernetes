#!/bin/sh

oc create secret tls ibm-dba-ums-external-tls-secret --key=tls.key --cert=tls.crt
oc create secret tls ibm-dba-ums-external-tls-sso-secret --key=tls.key --cert=tls.crt
oc create secret tls ibm-dba-ums-external-tls-scim-secret --key=tls.key --cert=tls.crt
oc create secret tls ibm-dba-ums-external-tls-teams-secret --key=tls.key --cert=tls.crt
