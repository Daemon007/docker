#!/bin/bash

set -e

#Delete limits cause of docker limits issue
cat /etc/security/limits.conf | grep -v oracle | tee /etc/security/limits.conf

echo 'Unzipping'
unzip -q /install/linux.x64_11gR2_client.zip
rm -f linux*.zip

mv client /home/oracle/

su oracle -c 'cd /home/oracle/client && ./runInstaller -ignorePrereq -ignoreSysPrereqs -silent -responseFile /install/client_install.rsp -waitForCompletion 2>&1'
rm -rf /home/oracle/client

mv /u01/app/oracle/product /u01/app/oracle-product

#/u01/app/oraInventory/orainstRoot.sh
#/u01/app/oracle/product/11.2.0/EE/root.sh


#$ORACLE_HOME/bin/dbca -silent -createDatabase -templateName General_Purpose.dbc -gdbname EE.oracle.docker -sid EE -responseFile NO_VALUE -totalMemory 2048 -emConfiguration LOCAL  -sysPassword oracle -systemPassword oracle -dbsnmpPassword oracle
