#!/bin/bash

kubectl get pod pvc-user -o json | jq -r .spec.containers[0].volumeMounts | grep "/mnt/share/my-pvc"
