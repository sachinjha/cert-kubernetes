oc create secret generic ldap-bind-secret \
    --from-literal=ldapUsername="cn=root" \
    --from-literal=ldapPassword="TDIPassw0rd" \
    --from-literal=lc_ldap_bind_dn="cn=root"  \
    --from-literal=lc_ldap_bind_password="TDIPassw0rd" \
    --from-literal=externalLdapUsername="cn=root"  \
    --from-literal=externalLdapPassword="TDIPassw0rd"  
    