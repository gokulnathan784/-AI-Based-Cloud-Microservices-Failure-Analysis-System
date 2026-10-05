$ErrorActionPreference = "Stop"
Write-Host "=== Docker ===" -ForegroundColor Cyan
docker --version
docker compose version
Write-Host "=== Compose containers ===" -ForegroundColor Cyan
docker compose ps
Write-Host "=== Kubernetes ===" -ForegroundColor Cyan
kubectl get nodes
if (kubectl get namespace ai-cloud 2>$null) {
  kubectl get pods -n ai-cloud
  kubectl get services -n ai-cloud
}
Write-Host "Verification commands completed." -ForegroundColor Green
