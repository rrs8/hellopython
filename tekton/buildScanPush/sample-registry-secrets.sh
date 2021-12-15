#!/bin/bash
oc create secret generic image-push-secrets --from-literal username=$USERNAME --from-literal password=$PASSWORD
