#!/bin/bash

## run this after setting up kiali 

NS=battlefield

sudo kubectl apply -f environment/$NS.yaml
sudo kubectl config set-context --current --namespace=$NS

# start services
sudo kubectl apply -f environment/victimv2.yaml
sudo kubectl apply -f environment/caldera.yaml
sudo kubectl apply -f environment/frigate.yaml

# network
sudo kubectl apply -f environment/network/destination_rules.yaml 
sudo kubectl apply -f environment/network/virtual_services.yaml 

# telemetrie

sudo kubectl apply -f environment/telemetrie/caldera.yaml 
