oc create secret generic ldap-bind-secret \
    --from-literal=ldapUsername="cn=root" \
    --from-literal=ldapPassword="passw0rd" \
    --from-literal=lc_ldap_bind_dn="cn=root"  \
    --from-literal=lc_ldap_bind_password="passw0rd" \
    --from-literal=externalLdapUsername="cn=root"  \
    --from-literal=externalLdapPassword="passw0rd"  
    