# Final Deployment Guide

## Docker Desktop deployment

Open Docker Desktop and wait until the engine is running.

From the project folder:

```powershell
.\deploy.cmd
```

Check:

```powershell
.\verify.cmd
```

Open:
- Dashboard: http://localhost:3000
- Swagger: http://localhost:8000/docs
- Prometheus: http://localhost:9090
- Grafana: http://localhost:3001 (admin/admin)
- Jaeger: http://localhost:16686

## Kubernetes deployment

Enable Kubernetes in Docker Desktop and check:

```powershell
kubectl get nodes
```

The node must be `Ready`.

Deploy:

```powershell
.\deploy-k8s.cmd
```

Check:

```powershell
kubectl get pods -n ai-cloud
kubectl get services -n ai-cloud
```

For Docker Desktop's kind-based local cluster, NodePort host access can depend on the Docker Desktop networking path. The project therefore provides a reliable forwarding helper:

```powershell
.\open-k8s.cmd
```

It opens port-forward sessions for the dashboard, backend, Grafana, Prometheus and Jaeger.

Use:
- Dashboard: http://localhost:30080
- Swagger: http://localhost:8000/docs
- Grafana: http://localhost:30001 (admin/admin)
- Prometheus: http://localhost:30090
- Jaeger: http://localhost:16686

## AI model

The final ZIP includes the trained LSTM model, the saved training metrics, a model reference dataset and the exact scaler artifact used by the package for live inference.

For future retraining only:

```powershell
cd backend
python preprocessing.py
python train_lstm.py
```

The training script saves the new model reference dataset and scaler together with the trained model.
