$ErrorActionPreference = "Stop"
Write-Host "Starting Kubernetes port forwards..." -ForegroundColor Cyan
$ports = @(
  @{Name="AI Dashboard"; Service="frontend"; Local=30080; Remote=80},
  @{Name="Backend Swagger"; Service="backend"; Local=8000; Remote=8000},
  @{Name="Grafana"; Service="grafana"; Local=30001; Remote=3000},
  @{Name="Prometheus"; Service="prometheus"; Local=30090; Remote=9090},
  @{Name="Jaeger"; Service="jaeger"; Local=16686; Remote=16686}
)
foreach ($p in $ports) {
  $title = $p.Name
  $cmd = "kubectl -n ai-cloud port-forward svc/$($p.Service) $($p.Local):$($p.Remote)"
  Start-Process powershell.exe -ArgumentList @("-NoProfile","-NoExit","-Command","`$Host.UI.RawUI.WindowTitle='$title'; $cmd") | Out-Null
}
Write-Host "Port forwards launched in separate PowerShell windows." -ForegroundColor Green
Write-Host "Dashboard:   http://localhost:30080"
Write-Host "Swagger:     http://localhost:8000/docs"
Write-Host "Grafana:     http://localhost:30001"
Write-Host "Prometheus:  http://localhost:30090"
Write-Host "Jaeger:      http://localhost:16686"
