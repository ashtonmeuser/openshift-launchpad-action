#!/bin/sh -l

echo "$GITHUB_REPOSITORY"

echo $(which oc)

oc login https://console.pathfinder.gov.bc.ca:8443 --token="$1"

echo $(oc project)

# Ensure job fails so we can re-run GH Action
exit 1
