#!/bin/bash

if ! kubectl get pvc my-claim; then exit 1; fi

STATE=$(kubectl get pvc my-claim -o json | jq -r .status.phase)

if [[ "$STATE" -eq "Bound" ]]; then
    exit 0
else
    exit 1
fi

