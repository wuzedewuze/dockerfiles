FROM centos:7
ENV ROCKETMQ_VERSION "4.3.0"
ENV ROCKETMQ_HOME  /opt/rocketmq-${ROCKETMQ_VERSION}
#tme zone
RUN rm -rf /etc/localtime \
&& ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN yum install -y java-1.8.0-openjdk-headless unzip vim gettext nmap-ncat openssl\
 && yum clean all -y

RUN mkdir -p \
 /opt/logs \
 /opt/store

RUN mkdir -p ${ROCKETMQ_HOME}

WORKDIR  ${ROCKETMQ_HOME}
# rocketmq-all-4.3.0 源码直接解压缩获得
# wget https://dist.apache.org/repos/dist/release/rocketmq/4.3.0/rocketmq-all-4.3.0-bin-release.zip
COPY rocketmq-all-4.3.0-bin-release ${ROCKETMQ_HOME}/

COPY scripts/ ${ROCKETMQ_HOME}/bin/

RUN chmod -R +x ${ROCKETMQ_HOME}/bin/* \
   && cd ${ROCKETMQ_HOME}/bin/  \
   && ls -alF  \
   && mkdir -p /etc/rocketmq \
   && cp -rf ${ROCKETMQ_HOME}/conf/broker.conf  /etc/rocketmq/ \
   && mv ${ROCKETMQ_HOME}/conf/broker.conf ${ROCKETMQ_HOME}/conf/broker.conf.old \
   && mv -bf ${ROCKETMQ_HOME}/bin/runbroker-customize.sh ${ROCKETMQ_HOME}/bin/runbroker.sh  \
   && mv -bf ${ROCKETMQ_HOME}/bin/runserver-customize.sh ${ROCKETMQ_HOME}/bin/runserver.sh  \
   && ln -s ${ROCKETMQ_HOME}/bin/mqadmin /usr/local/bin/mqadmin  \
   && ln -s ${ROCKETMQ_HOME}/bin/runbroker /usr/local/bin/runbroker \
   && ln -s ${ROCKETMQ_HOME}/bin/mqnamesrv /usr/local/bin/mqnamesrv \
   && ln -s ${ROCKETMQ_HOME}/bin/mqbroker /usr/local/bin/mqbroker \
   && ln -s ${ROCKETMQ_HOME}/bin/runbroker.sh /usr/local/bin/runbroker.sh \
   && ln -s ${ROCKETMQ_HOME}/bin/runserver.sh /usr/local/bin/runserver.sh \
   && ln -s ${ROCKETMQ_HOME}/bin/runbroker.sh /usr/local/bin/runbroker-customize.sh \
   && ln -s ${ROCKETMQ_HOME}/bin/runserver.sh /usr/local/bin/runserver-customize.sh

RUN sed -i 's/${JAVA_HOME}\/jre\/lib\/ext/${JAVA_HOME}\/jre\/lib\/ext:${JAVA_HOME}\/lib\/ext/' ${ROCKETMQ_HOME}/bin/tools.sh

# broker 配置文件位于 /etc/rocketmq/broker.conf ，具体请看 broker Dockerfile CMD启动

VOLUME /opt/logs /opt/store

WORKDIR  ${ROCKETMQ_HOME}/bin

CMD cd ${ROCKETMQ_HOME}/bin \
 && export JAVA_OPT=" -Duser.home=/opt" \
 && ${ROCKETMQ_HOME}/bin/mqbroker -c /etc/rocketmq/broker.conf