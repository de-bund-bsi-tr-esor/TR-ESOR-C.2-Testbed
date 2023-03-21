FROM alpine-j11:1.0.0

LABEL COPYRIGHT BSI TR-ESOR-S.4-Testbed (C) 2023
LABEL COMPONENT TR-ESOR AIP Signatur Validator

ENV XSV_HOME=/opt/xsv
ENV XSV_PORT=19090
ENV XSV_HOST=xsv-srv
ENV XSV_VERSION=1.1.0-3-SNAPSHOT
ENV XSV_VER_URL=https://tresortest.protectr.de/VerificationService/eCard?wsdl
ENV XSV_SCHEMA_DIR=$XSV_HOME/default-syntax-validator/src/main/resources/definitions

ADD run-srv.sh /opt/
ADD build-xsv.sh /opt/
ADD clean-xsv.sh /opt/

RUN cd /opt && \
	chmod 0777 run-srv.sh && \
	chmod 0777 build-xsv.sh && \
	chmod 0777 clean-xsv.sh && \
    mkdir lxaip
  
EXPOSE 19090
  
CMD ["/opt/run-srv.sh"]