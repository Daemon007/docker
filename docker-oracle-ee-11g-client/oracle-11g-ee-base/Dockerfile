FROM oraclelinux

RUN groupadd dba && useradd -m -G dba oracle && mkdir /u01 && chown oracle:dba /u01
RUN yum install -y oracle-rdbms-server-11gR2-preinstall glibc-static wget unzip && yum clean all

ADD install /install
RUN su -c "sh /install/oracle_install.sh"
