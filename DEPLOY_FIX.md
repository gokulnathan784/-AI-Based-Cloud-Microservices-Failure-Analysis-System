# Deployment fixes

The final package uses `deploy.cmd` and `deploy-k8s.cmd` wrappers so Windows PowerShell execution-policy settings do not block the provided deployment scripts.

The Kubernetes deployment uses `open-k8s.cmd` to start local port-forward sessions because this is reliable for Docker Desktop's local kind cluster.
