An administrator can create multiple volumes for later use. For instance, if the power to create volumes takes special access in a cloud providers portal. For that reason, and to make sure multiple applications don't try to share the same volumes unless intended, you must claim Persistent Volumes. To do so you create an object called a `PersistentVolumeClaim`. These objects also allow for controllers to create volumes on demand as they're needed and destroy them. For our use case, however, we've created our volume and now need to claim it so we can use it.

Create a `PersistentVolumeClaim` named `my-claim` that requests a volume of size `100Mi`, make sure the `storageClassName` is `manual` so Kubernetes will match our Claim to the volume we created earlier.

Make sure after creating the claim it shows up as `Bound`. If not, check to make sure the claim parameters match the volume.

<br>
<details><summary>Solution</summary>
<br>
Again, it's useful to start with K8s doc examples when kubectl doesn't have a create option. 

A good starting point: https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolumeclaim

```plain
kubectl apply -f - <<EOF

apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-claim #changed
spec:
  storageClassName: manual #important
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 100Mi #changed

EOF
```{{exec}}

</details>
