$ErrorActionPreference = "Stop"

Write-Host "Building Docker images..." -ForegroundColor Cyan
docker compose build
if ($LASTEXITCODE -ne 0) {
    Write-Host "Docker image build failed. Deployment stopped." -ForegroundColor Red
    exit $LASTEXITCODE
}

Write-Host "Starting full Docker deployment..." -ForegroundColor Cyan
docker compose up -d
if ($LASTEXITCODE -ne 0) {
    Write-Host "Docker Compose startup failed." -ForegroundColor Red
    exit $LASTEXITCODE
}

Write-Host "Deployment complete." -ForegroundColor Green
Write-Host "Dashboard: http://localhost:3000"
Write-Host "Backend:   http://localhost:8000/docs"
Write-Host "Prometheus:http://localhost:9090"
Write-Host "Grafana:   http://localhost:3001  (admin/admin)"
Write-Host "Jaeger:    http://localhost:16686"
