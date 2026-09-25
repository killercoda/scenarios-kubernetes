#! /bin/bash
set -e
kubectl create namespace app-demo || true

kubectl apply -n app-demo -f - <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: app-secret
type: Opaque
stringData:
  DB_PASSWORD: supersecret
EOF

kubectl apply -n app-demo -f - <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: backend
spec:
  replicas: 1
  selector:
    matchLabels:
      app: backend
  template:
    metadata:
      labels:
        app: backend
    spec:
      containers:
      - name: backend
        image: hashicorp/http-echo
        args:
          - "-text=Backend running"
          - "-listen=:8080"
        env:
        - name: DB_PASSWORD
          valueFrom:
            secretKeyRef:
              name: app-secret
              key: DB_PASS
        ports:
        - containerPort: 8080
EOF

kubectl apply -n app-demo -f - <<EOF
apiVersion: v1
kind: Service
metadata:
  name: backend-svc
spec:
  selector:
    app: backend
  ports:
  - port: 80
    targetPort: 80
EOF