

SQLPlus in Linux environment does not support using up/down arrows for accessing the previous/next command. The rlwrap utility provides a command history and editing of keyboard input for any other command. Start sqlplus with the rlwrap utility.

Insider the oracle docker container's bash shell, 
connect to Oracle and login as **system user** with the rlwrap utility.

`rlwrap sqlplus system/12345`{{execute T1}}

Show the tablespace inside the pluggable database SALESPDB.

`select tablespace_name from dba_tablespaces;`{{execute}}

We will store the data under the APP_DATA tablespace. 

As **system** user, create user mickey with password "mickey" in using APP_DATA as the default tablespace.

`create user mickey identified by mickey default tablespace APP_DATA temporary tablespace temp;`{{execute T1}}


Open another terminal (T2). 

In T2, login as mickey.

`docker exec -it oracle-xe bash`{{execute T2}}

`sqlplus mickey/mickey`{{execute T2}}

You will receive the following error since the `mickey` account currently doesn't have "Create Session" Privilege. 
```
ERROR:
ORA-01045: user MICKEY lacks CREATE SESSION privilege; logon denied
```

Press **Ctrl+C** to break out of the login program.





