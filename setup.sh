#!/bin/bash

## run this after setting up kiali 

NS=battlefield

kubectl apply -f environment/$NS.yaml
kubectl config set-context --current --namespace=$NS

# start services
kubectl apply -f environment/victim_v2.yaml
kubectl apply -f environment/caldera.yaml
kubectl apply -f environment/frigate.yaml

# network
kubectl apply -f environment/network/destination_rules.yaml 
kubectl apply -f environment/network/virtual_services.yaml 

# telemetrie

kubectl apply -f environment/telemetrie/caldera.yaml 
