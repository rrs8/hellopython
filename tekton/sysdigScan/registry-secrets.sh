#!/bin/bash
oc create secret generic registry-secrets --from-literal username=$REGISTRY_USER --from-literal password=$REGISTRY_PASS
