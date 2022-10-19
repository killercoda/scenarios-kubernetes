#!/bin/bash
  
if kubectl get pod pvc-user; then exit 1; fi
if kubectl get pvc my-claim; then exit 1; fi
if kubectl get pv cool-volume; then exit 1; fi