#!/bin/bash

NS=battlefield

kubectl apply -f environment/$NS.yaml
kubectl config set-context --current --namespace=$NS

kubectl apply -f environment/victim.yaml
kubectl apply -f environment/caldera.yaml
kubectl apply -f environment/frigate.yaml
