#!/bin/bash

NUM_REP=$(kubectl get deployment my-first-deployment -o json | jq .spec.replicas)

if [ "$NUM_REP" -eq "3" ]; then
    exit 0
else
    exit 1
fi

