#!/bin/bash

# install istio in the cluster
istioctl manifest apply 

# add namespace battlefield
kubectl apply -f environment/battlefield.yaml

# activate auto sidecar injection
kubectl label namespace battlefield istio-injection=enabled
