#!/bin/bash

# waits for background init to finish

rm $0

clear

echo -n "Initialising Kubernetes..."
while [ ! -f /ks/.k8sfinished ]; do
    echo -n '.'
    sleep 1;
done;
echo " done"

echo
