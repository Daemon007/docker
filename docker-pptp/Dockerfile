FROM daemonzjf/oracle-ee-11g-client-base:latest

ADD install /install
ADD entrypoint.sh /entrypoint.sh

ENV AXIS2C_HOME=/home/xQuantTp/work/axis2c-1.6.0
ENV APACHE_HOME=/home/xQuantTp/work/Apache2
ENV PATH=$APACHE_HOME/bin:$PATH
ENV LD_LIBRARY_PATH=$APACHE_HOME/lib:$AXIS2C_HOME/lib:$AXIS2C_HOME/services/xQuantPP:$AXIS2C_HOME/services/xQuantTp:$AXIS2C_HOME/services/xQuantETL:/home/oracle/Common:$LD_LIBRARY_PATH

RUN su -c "chmod 755 /install/pptp_install.sh && ./install/pptp_install.sh"
RUN su -c "chmod 755 /entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
