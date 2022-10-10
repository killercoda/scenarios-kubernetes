Deployments also offer the ability to gracefully update an application. Kubernetes offers multiple rollout strategies, but the default is `rollingUpdate`.

https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#scaling-a-deployment

Change the image `my-first-deployment` runs from `nginx:alpine` to `httpd:alpine`.


<br>
<details><summary>Solution</summary>
<br>

```plain
k set image deployment my-first-deployment nginx=httpd:alpine

k get deployment my-first-deployment
```{{exec}}

</details>
