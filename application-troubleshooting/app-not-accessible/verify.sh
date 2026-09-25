#!/bin/bash
set -e

NAMESPACE="app-demo"
APP_LABEL="backend"
SERVICE_NAME="backend-svc"

# 1) Verify the backend pod is Running
POD_PHASE=$(kubectl get pods -n "$NAMESPACE" -l app="$APP_LABEL" \
  -o jsonpath='{.items[0].status.phase}')

if [ "$POD_PHASE" != "Running" ]; then
  echo "❌ Backend pod is not running. Current phase: $POD_PHASE"
  exit 1
fi

# 2) Verify the Service targetPort is correctly set to 8080
TARGET_PORT=$(kubectl get svc "$SERVICE_NAME" -n "$NAMESPACE" \
  -o jsonpath='{.spec.ports[0].targetPort}')

if [ "$TARGET_PORT" != "8080" ]; then
  echo "❌ Service targetPort is incorrect. Expected 8080, got $TARGET_PORT"
  exit 1
fi

echo "✅ Application is running and Service is configured correctly."
