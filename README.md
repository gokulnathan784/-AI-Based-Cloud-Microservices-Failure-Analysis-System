# AI-Based Cloud Microservices Failure Analysis System

Final-year project package for AI-assisted cloud microservice monitoring, failure prediction, root-cause analysis, recovery recommendations and incident management.

## Implemented modules

- React dashboard with English / Tamil / Hindi UI
- FastAPI analysis backend
- User, Order, Payment and Notification microservices
- LSTM-based temporal failure prediction
- Hybrid deterministic failure simulation for repeatable demonstrations
- Rule-based root-cause analysis and faulty-service localization
- PostgreSQL metrics and incident storage
- MongoDB service logs
- Prometheus metrics and Grafana dashboard
- OpenTelemetry + Jaeger distributed tracing
- Incident lifecycle: Open -> Resolved
- PDF incident reports
- AI assistant/chatbot
- Browser voice input and text-to-speech
- CPU, memory, latency, disk and network telemetry
- Accuracy, Precision, Recall, F1-score, MTTD, MTTR and Availability reporting
- Docker Compose deployment
- Kubernetes deployment for Docker Desktop / kind

## Docker Compose deployment

From PowerShell in this folder:

```powershell
.\deploy.cmd
```

This wrapper bypasses the PowerShell script execution-policy prompt for this deployment script only.

URLs:

- Dashboard: http://localhost:3000
- Swagger: http://localhost:8000/docs
- Prometheus: http://localhost:9090
- Grafana: http://localhost:3001 (admin/admin)
- Jaeger: http://localhost:16686

## Kubernetes deployment

Make sure Docker Desktop Kubernetes is enabled and the node is `Ready`.

```powershell
.\deploy-k8s.cmd
```

For Docker Desktop's kind-based local cluster, reliable Windows browser access is provided by port-forwarding:

```powershell
.\open-k8s.cmd
```

Then use:

- Dashboard: http://localhost:30080
- Backend Swagger: http://localhost:8000/docs
- Grafana: http://localhost:30001 (admin/admin)
- Prometheus: http://localhost:30090
- Jaeger: http://localhost:16686

## Failure demonstration

Docker Compose:

```powershell
Invoke-RestMethod -Method Post http://localhost:8000/simulate/failure
Invoke-RestMethod http://localhost:8000/complete-analysis
Invoke-RestMethod -Method Post http://localhost:8000/simulate/normal
```

For Kubernetes, use the Swagger port-forward on port 8000 or the dashboard buttons.

Expected failure state:

- Payment Service: Failed
- AI Prediction: Failure
- Faulty service: `payment_service`
- Root cause: payment service failure
- Critical incident: Open
- Recovery recommendation displayed

Expected normal state:

- Payment Service: Running
- AI Prediction: Normal
- Active Incidents: empty
- Incident History: previous incident marked Resolved

## AI training pipeline

The packaged model is already included under `backend/models/` and is ready for demo inference.

For future retraining with newly collected telemetry:

```powershell
cd backend
python preprocessing.py
python train_lstm.py
```

The training script stores the exact inference dataset and scaler used for the newly trained model so live feature normalization stays aligned.

## Important project note

The failure buttons intentionally use deterministic simulation values so the faculty demonstration is repeatable. Prometheus, OpenTelemetry and the service endpoints still collect real runtime telemetry from the running containers.


## Multi-service failure test
The dashboard supports controlled failure simulation for User, Order, Payment and Notification. The backend also exposes `POST /simulate/service/{service_name}/{mode}`.

## Project assistant
The AI Assistant is an offline-first project-specific NLP assistant. It uses TF-IDF retrieval for project Q&A and live system context for operational questions. It is deliberately not represented as a general-purpose generative LLM. See `UPGRADE_NOTES.md`.


## Final capability upgrade
See `UPGRADE_NOTES.md`, `MULTI_SERVICE_FAILURE_TEST.md`, and `LLM_ASSISTANT.md` for the multi-service failure simulator and hybrid project assistant.
