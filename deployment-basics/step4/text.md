Deployments also offer the ability to gracefully update an application. Kubernetes offers multiple rollout stratigies, but 

https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#scaling-a-deployment

Change the image `my-first-deployment` run from `nginx:alpine` to `httpd:alpine`.


<br>
<details><summary>Solution</summary>
<br>
```plain
k set image deployment my-first-deployment nginx=httpd:alpine

k get deployment my-first-deployment
```{{exec}}

You can also use the edit function of kubectl

```plain
k edit deployment my-first-deployment
```{{exec}}

</details>
