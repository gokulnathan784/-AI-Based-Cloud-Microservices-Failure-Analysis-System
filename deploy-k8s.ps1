$ErrorActionPreference = "Stop"
Write-Host "Checking Kubernetes..." -ForegroundColor Cyan
kubectl get nodes
Write-Host "Building Kubernetes images..." -ForegroundColor Cyan
docker build -t ai-cloud-backend:latest ./backend
docker build -t ai-cloud-user-service:latest ./user-service
docker build -t ai-cloud-order-service:latest ./order-service
docker build -t ai-cloud-payment-service:latest ./payment-service
docker build -t ai-cloud-notification-service:latest ./notification-service
docker build -t ai-cloud-frontend:latest ./frontend
Write-Host "Applying Kubernetes manifests..." -ForegroundColor Cyan
kubectl apply -f k8s/all.yaml
Write-Host "Waiting for application deployments..." -ForegroundColor Cyan
kubectl -n ai-cloud rollout status deployment/postgres --timeout=180s
kubectl -n ai-cloud rollout status deployment/mongodb --timeout=180s
kubectl -n ai-cloud rollout status deployment/backend --timeout=240s
kubectl -n ai-cloud rollout status deployment/frontend --timeout=180s
kubectl -n ai-cloud rollout status deployment/grafana --timeout=180s
kubectl -n ai-cloud rollout status deployment/prometheus --timeout=180s
Write-Host "Deployment complete." -ForegroundColor Green
kubectl -n ai-cloud get pods
kubectl -n ai-cloud get services
Write-Host "For reliable Windows host access with Docker Desktop/kind, run: .\open-k8s.cmd" -ForegroundColor Yellow
