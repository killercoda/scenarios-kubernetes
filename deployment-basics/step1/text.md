
> Deployments are an object in Kubernetes used to describe the desired state of subset of pods in a cluster. Once a Deployment is created, various controllers in the cluster use it to create other API objects, and eventually have the desired number of pods running in a cluster.

https://kubernetes.io/docs/concepts/workloads/controllers/deployment/

Create a deployment called `my-first-deployment` of image `nginx:alpine` in the default namespace.

Check to make sure the deployment is healthy.

<br>
<details><summary>Solution</summary>
<br>

```plain
k create deployment my-first-deployment --image=nginx:alpine

k get deployment my-first-deployment
```{{exec}}

</details>
