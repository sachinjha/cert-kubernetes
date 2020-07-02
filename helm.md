# Download helm binaries and install the client only:

    wget https://get.helm.sh/helm-v2.12.2-linux-386.tar.gz
    tar -zxvf helm-v2.12.2-linux-386.tar.gz
    mv linux-386/helm /usr/local/bin/
    helm init --client-only
    helm version

# Create an openshift project where the Helm tiller (the server side) will be installed:

    oc new-project tiller
    oc project tiller
    export TILLER_NAMESPACE=tiller

    You can add the export TILLER_NAMESPACE=tiller to your ~/.bash_profile for instance to avoid exporting in each session.
  Install the tiller:
  Use the same version of the client in the following command line to have the same version of client and tiller.

    oc process -f https://github.com/openshift/origin/raw/master/examples/helm/tiller-template.yaml -p TILLER_NAMESPACE="${TILLER_NAMESPACE}" -p HELM_VERSION=v2.12.2 | oc create -f -
    oc get pods
    # Check pods are running
    oc rollout status deployment tiller
    helm init
    helm version

# Prepare
## Logging-in to your cluster IBM Cloud OpenShift cluster

## Start by loging in to IBM Cloud with the ibmcloud login or ibmcloud login --sso command, then select your cluster and login to it.


  ibmcloud oc cluster-config --cluster <your-cluster-name>
  oc login 


