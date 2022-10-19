Now that our pod has a PersistentVolume any data it creates under /mnt/share/my-pvc will persist even if the container crashes or restarts.

Go ahead and create a file named `coolfile` in the container `pvc-user` under `/mnt/share/my-pvc`.
>! k exec pvc-user -- touch /mnt/share/my-pvc/coolfile

Restart/Recreate the container
>! k get pod pvc-user -o yaml | kubectl replace -f - --force

Look under `/mnt/share/my-pvc` is `coolfile` still there?
>! k exec pvc-user -- ls /mnt/share/my-pvc

<br>
<details><summary>Solution</summary>
<br>

```plain
k set image deployment my-first-deployment nginx=httpd:alpine

k get deployment my-first-deployment
```{{exec}}

</details>
