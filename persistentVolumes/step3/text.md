Now that we've created a PersistentVolume and a PersistentVolumeClaim, we're ready to use the volume!

Create a pod named `pvc-user` in namespace `default` that mounts your PVC `my-claim` under `/mnt/share/my-pvc`. Use the image `nginx`.

<br>
<details><summary>Solution</summary>
<br>
This is another one where starting with an from the K8s docs and modifying it for our use case is a good strategy.

A good starting example: https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-pod

```plain
kubectl apply -f - <<EOF

apiVersion: v1
kind: Pod
metadata:
  name: pvc-user
spec:
  volumes:
    - name: my-claim
      persistentVolumeClaim:
        claimName: my-claim
  containers:
    - name: c1
      image: nginx
      volumeMounts:
        - mountPath: "/mnt/share/my-pvc"
          name: my-claim

EOF
```{{exec}}

</details>
