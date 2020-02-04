## download/install istio

Follow the instructions:  
https://istio.io/docs/setup/getting-started/#download

After installing `istioctl` we can install istio in our cluster. 

1. Start minicube with 
    >`start_minik.sh`
 
2. install istio in the default namespace 
    >`istioctl apply manifest`


After installing istio in the namespace, Activate auto injection:

>`sudo kubectl label namespace default istio-injection=enabled`

### Add services to the cluster

TODO: not sure what happens when we add them via apply
>`kubectl create -n default -f ./environment/SERVICE.yaml`

## Install kiali

### set environment for kiali

Credentials for the Frontend, just copy paste the next 3 blocks.. 

>KIALI_USERNAME=$(read -p 'Kiali Username: ' uval && echo -n $uval | base64)

>KIALI_PASSPHRASE=$(read -sp 'Kiali Passphrase: ' pval && echo -n $pval | base64)


>NAMESPACE=istio-system

>cat <<EOF | sudo kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: kiali
  namespace: $NAMESPACE
  labels:
    app: kiali
type: Opaque
data:
  username: $KIALI_USERNAME
  passphrase: $KIALI_PASSPHRASE
EOF


### activate kiali in cluster

>`istioctl manifest apply --set values.kiali.enabled=true`

### Start the frontend

>`istioctl dashboard kiali`


get kiali ip: 

>sudo kubectl -n istio-system get svc kiali

