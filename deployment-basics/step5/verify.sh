#!/bin/bash
  
if kubectl get deployment my-first-deployment; then exit 1; fi