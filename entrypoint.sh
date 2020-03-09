#!/bin/sh -l

echo "$APP_NAME"

cd /

oc login https://console.pathfinder.gov.bc.ca:8443 --token="$1" # Login to cluster

echo $(pwd)

make create-server NAMESPACE="$NAMESPACE" APP_NAME="$APP_NAME" REPO="https://github.com/$GITHUB_REPOSITORY" BRANCH=master IMAGE_TAG=latest

# exit 1 # Ensure job fails so we can re-run GH Action
