kubectl create secret generic ibm-fncm-secret \
--from-literal=gcdDBUsername="db2inst1" --from-literal=gcdDBPassword="lti@db2passw0rd" \
--from-literal=osDBUsername="db2inst1" --from-literal=osDBPassword="lti@db2passw0rd" \
--from-literal=ldapUsername="cn=root" \
--from-literal=ldapPassword="LTI@TDIPassw0rd" \
--from-literal=keystorePassword="passw0rd" \
--from-literal=ltpaPassword="passw0rd" \
--from-literal=appLoginUsername="ceadmin" --from-literal=appLoginPassword="passw0rd" \
