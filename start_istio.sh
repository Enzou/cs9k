#!/bin/bash

#KIALI_USER=$(read -p 'Kiali Username: ' uval && echo -n $uval | base64)
#KIALI_PWD=$(read -sp 'Kiali Passphrase: ' pval && echo -n $pval | base64)
#echo ""
NS=battlefield

echo "Starting istio"
istioctl manifest apply --set values.kiali.enabled=true

#kubectl create secret generic kiali2 --from-literal=username=$KIALI_USER --from-literal=passphrase=$KIALI_PWD --namespace istio-system
kubectl apply -f environment/kiali.yaml

echo "Enabling automatic sidecar injection on '$NS'"
kubectl label namespace $NS istio-injection=enabled --overwrite=true

istioctl dashboard kiali
