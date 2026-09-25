# Troubleshoot Application Not Accessible in Kubernetes

An application has been deployed to the Kubernetes cluster, but it is not accessible.

Although all required resources exist, the application is not functioning as expected.

Your task is to investigate and fix the issues step by step.

---

## Observed Problems

- The backend pod is stuck in `CrashLoopBackOff`
- A Service exists for the application
- Accessing the application through the Service fails

---

## Tasks

1. Investigate why the pod is crashing and fix the issue.
2. Ensure the pod reaches the `Running` state.
3. Investigate why the Service is not routing traffic correctly.
4. Fix the Service configuration so the application becomes accessible.

---

## Useful Commands

```bash
kubectl get pods -n app-demo
kubectl describe pod <pod-name> -n app-demo
kubectl logs <pod-name> -n app-demo

kubectl get svc -n app-demo
kubectl describe svc backend-svc -n app-demo
kubectl port-forward svc/backend-svc 8080:80 -n app-demo
