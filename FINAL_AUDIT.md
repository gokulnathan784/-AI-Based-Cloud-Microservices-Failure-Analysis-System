# Final Audit Checklist

This package is the final consolidated version prepared from the project history, the uploaded reference paper, and the previously observed Docker/Kubernetes runtime results.

## Bugs addressed

1. Frontend Docker build failed with `npm ci` because package.json and package-lock.json were out of sync. The production Dockerfile now uses a normal `npm install` build path.
2. Incident display had a race condition. The dashboard now completes the analysis before fetching the incident list.
3. Resolved incidents were confusingly shown as active. The UI separates Active Incidents from Incident History and displays resolved status explicitly.
4. PowerShell blocked the unsigned Kubernetes deployment script. `.cmd` wrappers invoke PowerShell with `-ExecutionPolicy Bypass` only for the deployment command.
5. Kubernetes kind/NodePort host access was unreliable on Windows. `open-k8s.cmd` starts the required port-forwards automatically.
6. Live LSTM inference could use a different normalization basis from the data used to train the packaged model. The package now includes `model_inference_dataset.csv` and `scaler.json`, and `ai_engine.py` uses these artifacts.
7. Kubernetes backend could fail hard if the model artifact was absent. The final package includes the model, reference dataset and scaler; analysis also has a rule-based fallback so the API returns a diagnosis rather than crashing when the model artifact is unavailable.
8. Backend now exposes `/ready` for Kubernetes readiness/liveness checks.
9. PostgreSQL metric storage now captures disk and network telemetry without breaking existing databases; missing columns are added automatically.
10. Incident report now returns HTTP 404 for an unknown incident instead of a misleading success response.
11. The project includes operational/model metrics and clearer architecture/dependency information for demonstration and viva.

## Project alignment checked

The reference material calls for microservices, logs/metrics/traces, preprocessing, AI failure analysis, RCA, recovery recommendations, dashboards, incident reporting, Docker/Kubernetes, Prometheus/OpenTelemetry, PostgreSQL/MongoDB, LSTM-based temporal learning, and evaluation metrics. The final package contains the corresponding modules that are implementable in the supplied project.

## Runtime evidence available from the project history

- Docker Compose successfully started backend, frontend, four microservices, PostgreSQL, MongoDB, Prometheus, Grafana and Jaeger.
- The dashboard was successfully opened through Docker Compose.
- Failure simulation produced the expected failed payment service, AI failure result and recovery recommendation.
- Kubernetes cluster reported a `Ready` control-plane node and application pods were later observed running.
- Kubernetes frontend was successfully opened via `kubectl port-forward`.
- The remaining final package checks are intended to be run on the user's own Docker Desktop/Kubernetes installation because that environment is outside this build environment.

## Packaged AI model

The packaged LSTM evaluation file records:

- Accuracy: 99.64%
- Precision: 100%
- Recall: 95.83%
- F1-score: 97.87%

These are the saved test-set metrics for the packaged model, not a claim about a newly retrained model on later telemetry records.
