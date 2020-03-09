FROM widerin/openshift-cli:v4.5

RUN apk add make

RUN pwd

COPY entrypoint.sh /entrypoint.sh
COPY Makefile /Makefile
COPY openshift/. /openshift/

ENTRYPOINT ["/entrypoint.sh"]
