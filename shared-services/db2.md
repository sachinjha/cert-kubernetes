If you encounter the error below when installing in RHEL.  Just install the required dependency.


* 1. Error:  

[root@tds-ldap ~]# ./server_awse_o/db2setup -r db2dba.rsp
Requirement not matched for DB2 database "Server" . Version: "11.1.0.0". 

Summary of prerequisites that are not met on the current system: 

DBT3520E  The db2prereqcheck utility could not find the library file libaio.so.1. 

Fix: 
yum install libaio



* 2. Fixpack name downloaded from fix central is different from the documentation but instructions are same and you can go ahead with installing the available fix pack.