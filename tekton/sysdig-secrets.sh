#!/bin/bash
#
# Sysdig image scan requires a valid Sysdig Secure API Token
# This is available in the Sysdig UI under Settings (select the circle with your initials in lower right)
#   in the first settings screen (User Profile) in the section Sysdig Secure API
#
oc create secret generic sysdig-secrets --from-literal=sysdig-secure-api-token=$SYSDIG_API_TOKEN
