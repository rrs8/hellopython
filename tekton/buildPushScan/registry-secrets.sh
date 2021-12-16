#!/bin/bash
oc create secret generic image-push-secrets --from-literal username=$REGISTRY_USER --from-literal password=$REGISTRY_PASS
