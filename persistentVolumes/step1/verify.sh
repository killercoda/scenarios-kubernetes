#!/bin/bash

kubectl get persistentvolume cool-volume

SIZE=$(kubectl get persistentvolume cool-volume -o json | jq -r .spec.capacity.storage)
HOSTPATH=$(kubectl get persistentvolume cool-volume -o json | jq -r .spec.hostPath.path)
CLASS=$(kubectl get persistentvolume cool-volume -o json | jq -r .spec.storageClassName)

if [[ $SIZE = "100Mi" && $HOSTPATH = "/tmp/my-cool-vol" && $CLASS = "manual" ]]; then
    exit 0
else
    exit 1
fi