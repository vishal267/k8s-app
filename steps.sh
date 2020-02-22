eksctl create cluster -f cluster.yaml



#Helm Installation - 

helm init

kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'

#Metric service 
kubectl apply -f k8s/metrics-server/

#Dashboard setup 

kubectl apply -f dashboard/

#Jenkins Setup 

#helm install --name cicd stable/jenkins --set rbac.create=true,master.servicePort=80,master.serviceType=LoadBalancer

#prometheus Setup

kubectl create namespace prometheus
#helm install --name prometheus stable/prometheus \
#    --namespace prometheus \
#    --set alertmanager.persistentVolume.storageClass="gp2" \
#    --set server.persistentVolume.storageClass="gp2"


