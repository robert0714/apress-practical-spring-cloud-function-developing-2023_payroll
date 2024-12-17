#!/bin/bash
 
wget -cO - https://github.com/knative/client/releases/download/knative-v1.16.1/kn-linux-amd64 > kn
wget -cO - https://github.com/knative-extensions/kn-plugin-quickstart/releases/download/knative-v1.16.0/kn-quickstart-linux-amd64  > kn-plugin-quickstart
chmod +x kn kn-plugin-quickstart
 
./kn version

echo "======================================="
echo "Startup Minikube"

./kn-plugin-quickstart minikube

minikube profile list
minikube -p knative ip

# https://istio.io/latest/docs/setup/platform-setup/minikube/
# https://faun.pub/metallb-configuration-in-minikube-to-enable-kubernetes-service-of-type-loadbalancer-9559739787df


minikube -p knative addons enable metallb
minikube -p knative  addons configure metallb

# https://knative.dev/docs/install/yaml-install/serving/install-serving-with-yaml/#configure-dns
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.16.0/serving-default-domain.yaml

./kn service create hello-example \
  --image gcr.io/knative-samples/helloworld-go \
  --env TARGET="First"


./kn service list

curl http://hello-example.default.svc.cluster.local  

./kn service delete hello-example 

 