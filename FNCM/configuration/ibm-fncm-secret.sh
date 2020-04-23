kubectl create secret generic ibm-fncm-secret \
--from-literal=gcdDBUsername="db2inst1" --from-literal=gcdDBPassword="Login#6229" \
--from-literal=osDBUsername="db2inst1" --from-literal=osDBPassword="Login#6229" \
--from-literal=ldapUsername="cn=admin,dc=GSI-Labs-Cognizant,dc=cloud" \
--from-literal=ldapPassword="Login#6229" \
--from-literal=keystorePassword="passw0rd" \
--from-literal=ltpaPassword="passw0rd" \
--from-literal=appLoginUsername="p8admin" --from-literal=appLoginPassword="passw0rd" \
