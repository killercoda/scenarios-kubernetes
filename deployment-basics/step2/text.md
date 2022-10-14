Deployments offer an easy way to scale up an application by running more Pods. 

https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#scaling-a-deployment

Scale `my-first-deployment` up to run 3 replicas.

Check to make sure all 3 replicas are ready.

<br>
<details><summary>Solution</summary>
<br>
Since there are other Kubernetes resources that offer the same scaling mechanisms, it's important to make sure we're scaling a deployment.

```plain
k scale deployment/my-first-deployment --replicas=3

k get deployment my-first-deployment
```{{exec}}

</details>
