
> Pods are the smallest deployable units of computing that you can create and manage in Kubernetes.

https://kubernetes.io/docs/concepts/workloads/pods

Create a pod called `my-pod` of image `nginx:alpine`

<br>
<details><summary>Solution</summary>
<br>

```plain
k run my-pod --image=nginx:alpine
```{{exec}}

</details>
