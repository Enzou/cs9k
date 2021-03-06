#!/bin/bash

status=$(minikube status | grep host | cut -d " " -f2)

if [ "$status" == "Stopped" ]; then 
    minikube start
else
    minikube update-context
fi

minikube addons enable ingress

minikube tunnel &> /dev/null &
echo "Enabled tunnel mode"

minikube status

minikube dashboard

