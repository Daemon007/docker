#!/bin/bash
set -e

# Prevent owner issues on mounted folders
echo "Preparing oracle installer."
chown -R oracle:dba /u01/app/oracle
rm -f /u01/app/oracle/product
ln -s /u01/app/oracle-product /u01/app/oracle/product

#Run Oracle root scripts
echo "Running root scripts."
/u01/app/oraInventory/orainstRoot.sh 2>&1
echo | /u01/app/oracle/product/11.2.0/EE/root.sh 2>&1 || true


case "$1" in
	'')
		;;

	*)
		echo "Database is not configured. Please run '/entrypoint.sh' if needed."
		exec "$@"
		;;
esac
