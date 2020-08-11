kubectl create secret generic my-ums-admin-secret \
  --from-literal=adminUser=umsadmin \
  --from-literal=adminPassword=password 