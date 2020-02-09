#!/bin/bash

# install istio in the cluster
sudo istioctl manifest apply 

# add namespace battlefield
sudo kubectl apply -f environment/battlefield.yaml

# activate auto sidecar injection
sudo kubectl label namespace battlefield istio-injection=enabled
