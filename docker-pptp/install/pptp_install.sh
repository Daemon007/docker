#!/bin/bash

set -e

echo '---Deploying Apache2 and axis2c-1.6.0---'
echo 'Unzipping Apache2 and axis2c-1.6.0'
cd /install
tar xvf Apache2.tar
tar xvf axis2c-1.6.0.tar

rm -f *.tar

mkdir -p /home/xQuantTp/work
mv /install/Apache2 /home/xQuantTp/work/
mv /install/axis2c-1.6.0 /home/xQuantTp/work/
mv /install/Install.sh /home/xQuantTp/work/

echo 'Modifying PATH in Apache conf file'
sed -i "s/\/home\/admin/\/home\/xQuantTp\/work/g" /home/xQuantTp/work/Apache2/conf/httpd.conf
sed -i "s/\/home\/admin/\/home\/xQuantTp\/work/g" /home/xQuantTp/work/Apache2/bin/apachectl

echo
echo '---Deploying xQuantPP, xQuantTp, xQuantETL---'
mkdir /home/xQuantTp/work/axis2c-1.6.0/services
mv /install/xQuantPP /home/xQuantTp/work/axis2c-1.6.0/services/
mv /install/xQuantTp /home/xQuantTp/work/axis2c-1.6.0/services/
mv /install/xQuantETL /home/xQuantTp/work/axis2c-1.6.0/services/
mv /install/Common /home/xQuantTp/work/

cd /home/xQuantTp/work/Common && chmod 755 CreateXQCommLink.sh && ./CreateXQCommLink.sh
cd /home/xQuantTp/work/axis2c-1.6.0/services/xQuantPP && chmod 755 CreateXPPLink.sh && ./CreateXPPLink.sh
cd /home/xQuantTp/work/


echo 'Modifying xQuantPP'
cp /install/pptp-conf/xQuantPP/* /home/xQuantTp/work/axis2c-1.6.0/services/xQuantPP/
cd /home/xQuantTp/work/axis2c-1.6.0/services/xQuantPP/ && \
    mv TMP_xQuant.PP.Service.config xQuant.PP.Service.config && \
    sed -i "s/xir_trd/XIR_TRD/g" xQuant.PP.Service.config && \
    sed -i "s/127.0.0.1/ams-db/g" xQuant.PP.Service.config && \
    sed -i "s/XRPCY/EE.oracle.docker/g" xQuant.PP.Service.config && \
    cd /home/xQuantTp/work/

echo 'Modifying xQuantTp'
cp /install/pptp-conf/xQuantTp/* /home/xQuantTp/work/axis2c-1.6.0/services/xQuantTp/

echo 'Modifying xQuantETL'
mv /install/pptp-conf/xQuantETL/* /home/xQuantTp/work/axis2c-1.6.0/services/xQuantETL/
cd /home/xQuantTp/work/axis2c-1.6.0/services/xQuantETL/data && \
    sed -i "s/xir_trd/XIR_TRD/g" config.xml && \
    sed -i "s/22.188.20.66/ams-db/g" config.xml && \
    sed -i "s/orau11g/EE.oracle.docker/g" config.xml && \
    cd /home/xQuantTp/work/

rm -rf /install


echo '---Modifying Log config---'
