#!/bin/bash
oc create secret generic sysdig-secrets --from-literal=sysdig-secure-api-token=$SYSDIG_API_TOKEN
