# For explanation of how this script works look at this step 5.2 on this page: https://github.com/sachinjha/cert-kubernetes/blob/20.0.1/ACA/README_config.md

# replace node*.ibm.com with actual IP addresses of worker nodes.
# if deploying to namespace other than automation, replace automation with <namespace> where deploying.
kubectl label nodes {node1.ibm.com,node2.ibm.com,node3.ibm.com, node4.ibm.com} {celeryautomation=aca,mongoautomation=aca,mongo-adminautomation=aca}
