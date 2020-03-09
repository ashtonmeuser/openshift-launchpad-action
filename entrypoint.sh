#!/bin/sh -l

echo "$GITHUB_REPOSITORY"

# OpenShift CLI
`wget --quiet -O oc.tar.gz https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz`
FILE=$(tar -tf oc.tar.gz | grep '/oc$')
tar -zxf oc.tar.gz "$FILE"
mv "$FILE" /usr/local/bin/oc

oc login https://console.pathfinder.gov.bc.ca:8443 --token="$1"

echo $(oc project)

# Ensure job fails so we can re-run GH Action
exit 1
