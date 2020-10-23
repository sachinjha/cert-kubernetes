oc create secret generic ldap-bind-secret \
    --from-literal=ldapUsername="cn=root" \
    --from-literal=ldapPassword="LTI@TDIPassw0rd" \
    --from-literal=lc_ldap_bind_dn="cn=root"  \
    --from-literal=lc_ldap_bind_password="LTI@TDIPassw0rd" \
    --from-literal=externalLdapUsername="cn=root"  \
    --from-literal=externalLdapPassword="LTI@TDIPassw0rd"  
    