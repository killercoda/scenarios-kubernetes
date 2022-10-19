Now that our pod has a PersistentVolume any data it creates under /mnt/share/my-pvc will persist even if the container crashes or restarts.

Go ahead and create a file named `coolfile` in the container `pvc-user` under `/mnt/share/my-pvc`.
<details><summary>Solution</summary>
```plain
k exec pvc-user -- touch /mnt/share/my-pvc/coolfile
```{{exec}}
</details>

Restart/Recreate the container

<details><summary>Solution</summary>
```plain
k get pod pvc-user -o yaml | kubectl replace -f - --force
```{{exec}}
</details>

Look under `/mnt/share/my-pvc` is `coolfile` still there?
<details><summary>Solution</summary>
```plain
k exec pvc-user -- ls /mnt/share/my-pvc
```{{exec}}
</details>
