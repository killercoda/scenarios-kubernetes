It's always a good idea to clean up any resources that are no longer used.

Delete the pod `pvc-user`.
Delete the PVC `my-claim`.
Delete the PV `cool-volume`

Check `/tmp/my-cool-vol` on the host. Did K8s clean up the volume? 

<br>
<details><summary>Solution</summary>
<br>

```plain
k delete pod pvc-user
k delete pvc my-claim
k delete pv cool-volume
```{{exec}}

Did K8s Clean up the volume?
No. By default, if you don't specify a `persistentVolumeReclaimPolicy` K8s defaults to Retain. Better safe than sorry!

</details>
