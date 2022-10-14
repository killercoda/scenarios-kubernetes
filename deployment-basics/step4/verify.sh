#!/bin/bash
  
IMAGE=$(kubectl get deployment my-first-deployment -o json | jq .spec.template.spec.containers[0].image)

if [ "$IMAGE" = "\"httpd:alpine\"" ]; then
    exit 0
else
    exit 1
fi