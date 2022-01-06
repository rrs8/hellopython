#!/bin/bash
#
# only needed if Sysdig requires credentials for an external registry e.g. docker.io
# for an openshift pipeline the internal registry secret is provided by tekton
#
oc create secret generic registry-secrets --from-literal username=$REGISTRY_USER --from-literal password=$REGISTRY_PASS
