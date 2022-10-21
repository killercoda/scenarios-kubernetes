
> Pods in Kubernetes are ephemeral, when they are deleted or restarted any changes to their filesystem or memory is lost. This is useful for making sure that an application starts the same way every time, but for application that needs to keep some data around this poses a challenge. Luckily, Kubernetes provides an answer to this challenge in the form of Persistent Volumes.

https://kubernetes.io/docs/concepts/storage/persistent-volumes/

Persistent Volumes are places to store data (volumes) that maintain their contents separate from the lifecycle of the pods that use them (persistent). This is useful to keep data that may be needed even after a container crashes, such as checkpoint files or small caches of data.

There are various types of persistent volume depending on what underlying storage is used to create it. In this scenario we'll be using `hostPath` volumes, there are others such as volumes that are cloud provider backed that have better redundancy and durability. You can find a list on the various types [here](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#types-of-persistent-volumes).

Create a PersistentVolume named `cool-volume` backed by a hostPath `/tmp/my-cool-vol` with size `100Mi` in the `default` namespace, set it's storageClassName to `manual`.

<br>
<details><summary>Solution</summary>
<br>
Kubectl doesn't have a create function for PersistentVolumes. To find a starting point, use something from the K8s docs and adjust it for the requirements.

One such example is here: https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolume

```plain
kubectl apply -f - <<EOF

apiVersion: v1
kind: PersistentVolume
metadata:
  name: cool-volume #changed
  namespace: default #added
  labels:
    type: local
spec:
  storageClassName: manual #make sure to include
  capacity:
    storage: 100Mi #changed
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/tmp/my-cool-vol" #changed

EOF
```{{exec}}

</details>
