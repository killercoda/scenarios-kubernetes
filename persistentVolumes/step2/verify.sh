#!/bin/bash

STATE=$(kubectl get pvc my-claim -o json | jq -r .status.phase)

if [[ "$STATE" -eq "Bound" ]]; then
    exit 0
else
    exit 1
fi

