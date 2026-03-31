docker pull --platform linux/amd64 ghcr.io/yandex-practicum/scaletestapp:latest
minikube image load ghcr.io/yandex-practicum/scaletestapp:latest
kubectl apply -f k8s/namespace-monitoring.yaml
kubectl apply -f k8s/namespace-scaletest.yaml
kubectl apply -f k8s/prometheus-config.yaml
kubectl apply -f k8s/prometheus-deployment.yaml
kubectl apply -f k8s/deployment-scaletestapp.yaml
minikube addons enable metrics-server
kubectl apply -f k8s/prometheus-adapter.yaml
kubectl apply -f k8s/scaletestapp-hpa.yaml
