#!/bin/bash

minikube status

minikube addons enable ingress

minikube tunnel &> /dev/null &
echo "Enabled tunnel mode"

minikube dashboard

