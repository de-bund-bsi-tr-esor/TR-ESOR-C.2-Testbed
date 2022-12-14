FROM alpine-j11:1.0.0

LABEL COPYRIGHT BSI TR-ESOR-S.4-Testbed (C) 2022
LABEL COMPONENT TR-ESOR Evidence Record Verification Tool

ENV ERV_HOST=erv-srv
ENV ERV_PORT=9090
ENV ERV_CONF=/opt/config-rfc4998-online.xml
ENV ERV_VERSION=1.3.3
ENV ERV_HOME=/opt/ERVerifyTool
ENV ERV_BIN=$ERV_HOME/all/build/install/cli/bin
  
ADD config-rfc4998-online.xml /opt/
ADD run-srv.sh /opt/
ADD build-erv.sh /opt/

RUN cd /opt && \
	mkdir lxaip && \
	chmod 0777 run-srv.sh && \
	chmod 0777 build-erv.sh

EXPOSE 9090
  
CMD ["/opt/run-srv.sh"]
