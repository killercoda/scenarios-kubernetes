Just as deployments can be used to scale an application up, they can be used to scale one down.

https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#scaling-a-deployment

Scale `my-first-deployment` down to run 2 replicas.

Check to make sure all 2 replicas are ready.

<br>
<details><summary>Solution</summary>
<br>
Since there are other Kubernetes resources that offer the same scaling mechanisms, it's important to make sure we're scaling a deployment.

```plain
k scale deployment/my-first-deployment --replicas=2

k get deployment my-first-deployment
```{{exec}}

</details>
