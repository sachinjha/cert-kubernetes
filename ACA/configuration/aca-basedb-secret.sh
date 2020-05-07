export BASE_DB_USER=db2inst1
export BASE_DB_PWD=passw0rd
kubectl  create secret generic aca-basedb \
--from-literal=BASE_DB_USER="$BASE_DB_USER" \
--from-literal=BASE_DB_PWD="$BASE_DB_PWD"