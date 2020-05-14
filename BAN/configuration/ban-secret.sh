
kubectl create secret generic ibm-ban-secret \
  --from-literal=navigatorDBUsername="db2inst1" \
  --from-literal=navigatorDBPassword="passw0rd" \
  --from-literal=ldapUsername="cn=root" \
--from-literal=ldapPassword="passw0rd" \
--from-literal=externalLdapUsername="cn=root" 
--from-literal=externalLdapPassword="passw0rd" \
  --from-literal=keystorePassword="passw0rd" \
  --from-literal=ltpaPassword="passw0rd" \
--from-literal=appLoginUsername="ceadmin" \
--from-literal=appLoginPassword="passw0rd"