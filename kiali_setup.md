## Install kiali

### set environment for kiali

#Credentials for the Frontend (copy from raw or https://istio.io/docs/tasks/observability/kiali/#create-a-secret) 

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

