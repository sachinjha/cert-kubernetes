#!/bin/sh



############### For BACA #################

mkdir -p /opt/nfs2/aca/caop/data
mkdir -p /opt/nfs2/aca/caop/log
mkdir -p /opt/nfs2/aca/caop/config

# permissions

chown -Rf 51000:0 /opt/nfs2/aca/caop/
chgrp -R 0 /opt/nfs2/aca/caop/
chmod -R g=u /opt/nfs2/aca/caop/



############# For FNCM ##################

# GRAPHQL
mkdir -p /opt/nfs2/graphql1/configDropin/overrides
mkdir -p /opt/nfs2/graphql1/logs



# permissions
#
#chown -Rf 50001:0 /opt/nfs2/graphql1/
#chmod -Rf g=u /opt/nfs2/graphql1/
# above is the official recommendation but pod doesn't start with this 
chgrp -R 65534 /opt/nfs2/graphql1
chmod -Rf g=u /opt/nfs2/graphql1
#chown -R nfsnobody:nfsnobody /opt/nfs2/graphql1/

#CMIS
mkdir -p /opt/nfs2/cmis/configDropin/overrides
mkdir -p /opt/nfs2/cmis/logs

#permissions
chgrp -R 65534 /opt/nfs2/cmis
chmod -Rf g=u /opt/nfs2/cmis


#CPE

mkdir -p /opt/nfs2/cpe/configDropin/overrides
mkdir -p /opt/nfs2/cpe/logs
mkdir -p /opt/nfs2/cpe/cpefnlogstore
mkdir -p /opt/nfs2/cpe/bootstrap
mkdir -p /opt/nfs2/cpe/textext
mkdir -p /opt/nfs2/cpe/icmrules
mkdir -p /opt/nfs2/cpe/asa

# permissions
chgrp -R 65534 /opt/nfs2/cpe
chmod -Rf g=u /opt/nfs2/cpe


############# For Navigator ##################


mkdir -p /opt/nfs2/icn/configDropin/overrides
mkdir -p /opt/nfs2/icn/logs
mkdir -p /opt/nfs2/icn/plugins
mkdir -p /opt/nfs2/icn/viewercache
mkdir -p /opt/nfs2/icn/viewerlog
mkdir -p /opt/nfs2/icn/aspera

chgrp -R 65534 /opt/nfs2/icn
chmod -Rf g=u /opt/nfs2/icn


############ for IAWS ####################


mkdir -p /opt/nfs2/iaws/pfs-es-0
mkdir -p /opt/nfs2/iaws//pfs-es-1
mkdir -p /opt/nfs2/iaws/pfs-logs-0
mkdir -p /opt/nfs2/iaws/pfs-logs-1
mkdir -p /opt/nfs2/iaws/pfs-output-0
mkdir -p /opt/nfs2/iaws/pfs-output-1

chown -R :65534 /opt/nfs2/iaws/pfs-*
chmod g+rw /opt/nfs2/iaws/pfs-*

##############  Update /etc/exports ###########



cat ./nfs-exports-configuration.txt >> /etc/exports
service nfs restart
service nfs status

