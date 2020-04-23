
kubectl create secret generic ibm-ban-secret \
  --from-literal=navigatorDBUsername="db2inst1" \
  --from-literal=navigatorDBPassword="passw0rd" \
  --from-literal=ldapUsername="cn=admin,dc=GSI-Labs-Cognizant,dc=cloud" \
--from-literal=ldapPassword="passw0rd" \
  --from-literal=keystorePassword="passw0rd" \
  --from-literal=ltpaPassword="passw0rd" \
--from-literal=appLoginUsername="icnadmin" \
--from-literal=appLoginPassword="passw0rd"