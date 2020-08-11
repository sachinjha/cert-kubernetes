kubectl create secret generic my-ums-admin-secret 
  --from-literal=adminUser=<UMS-ADMIN-USERNAME>
  --from-literal=adminPassword=<UMS-ADMIN-PASSWORD>