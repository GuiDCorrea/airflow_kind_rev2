
#cria cluster com Kind
kind create cluster --name airflow-cluster --config kind-cluster.yaml

#define namespace
kubectl create namespace airflow


#add repositorio helm
helm repo add apache-airflow https://airflow.apache.org
helm repo update

helm search repo airflow

#aplica configuracoes

kubectl apply -f airflow-deployment.yaml
kubectl apply -f airflow-user.yaml
kubectl get svc airflow-service

helm upgrade --install airflow apache-airflow/airflow -f values.yaml

echo -n 'apples:password' | base64


#iniciar
kubectl port-forward svc/airflow-webserver 8080:8080 -n airflow --context kind-airflow-cluster

#configuraçes poodme ser passadas no values

