#!/bin/sh 

# Replace the <password> in the commands below and use the steps below to create the tds instance of ext ldap required in CR file.


cd /opt/ibm/ldap/V6.4/sbin
./idsadduser -u dsinst2 -g grinst2 -w <password>
 ./idsicrt  -I dsinst2 -p 390 s 637 -e mysecretkey! -l /home/dsinst2 -G grinst2 -w <password>
 ./idscfgdb -I dsinst2 -a dsinst2 -w <password> -t dsinst2 -l /home/dsinst2
 ./idsdnpw -I dsinst2 –u cn=root –p <password>
 ./idscfgsuf -I dsinst2 -s o=EXTERNAL,c=US

 