#!/bin/sh

# Read Step 5.4 on this page for explanatino of how this works: https://github.com/sachinjha/cert-kubernetes/blob/20.0.1/ACA/README_config.md 
# update KUBE_NAME_SPACE value if not deploying to "automation" namespace.
export KUBE_NAME_SPACE=automation
sed -i.bak s#\$KUBE_NAME_SPACE#"$KUBE_NAME_SPACE"# ./aca-netpol.yaml
sed -i.bak s#\$KUBE_NAME_SPACE#"$KUBE_NAME_SPACE"# ./aca-rolebinding.yaml
kubectl apply -f aca-netpol.yaml
kubectl apply -f aca-scc.yaml --validate=false
kubectl apply -f aca-rolebinding.yaml
oc adm policy add-scc-to-group aca-scc system:serviceaccounts:{KUBE_NAME_SPACE}
