#!/bin/sh -l

cd /

oc login https://console.pathfinder.gov.bc.ca:8443 --token="$OPENSHIFT_AUTH_TOKEN_TEST" # Login to cluster

make oc-all-clean NAMESPACE=$NAMESPACE APP_NAME=$APP_NAME
make oc-persisted-clean NAMESPACE=$NAMESPACE APP_NAME=$APP_NAME

make create-nsp NAMESPACE=$NAMESPACE APP_NAME=$APP_NAME
sleep 30s

case "$MODE" in
  "server")
    make create-server NAMESPACE="$NAMESPACE" APP_NAME="$APP_NAME" REPO="https://github.com/$GITHUB_REPOSITORY" BRANCH=master IMAGE_TAG=latest
    ;;
  "client")
    make create-client NAMESPACE="$NAMESPACE" APP_NAME="$APP_NAME" API_URL="$API_URL" REPO="https://github.com/$GITHUB_REPOSITORY" BRANCH=master IMAGE_TAG=latest
    ;;
  *)
    echo "Must specify MODE as either client or server"
    exit 1
    ;;
esac

exit 1 # Ensure job fails so we can re-run GH Action
