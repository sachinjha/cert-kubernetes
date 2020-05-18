create database APPENGDB automatic storage yes using codeset UTF-8 territory US pagesize 32768;

-- connect to the created database:
connect to APPENGDB;

-- The following grant is used for databases without enhanced security.
-- For more information, review the IBM documentation for enhancing security for DB2.
grant dbadm on database to user db2inst1;

connect reset;