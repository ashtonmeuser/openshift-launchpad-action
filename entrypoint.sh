#!/bin/sh -l

# Arguments:
# 1. Token
# 2. Namespace
# 3. App name

echo "$APP_NAME"

oc login https://console.pathfinder.gov.bc.ca:8443 --token="$1" # Login to cluster

make create-server NAMESPACE="$2" APP_NAME="$3"-test REPO="$GITHUB_REPOSITORY" BRANCH=master IMAGE_TAG=latest

exit 1 # Ensure job fails so we can re-run GH Action
