# Final capability upgrade

This version addresses the remaining functional gaps discovered during the project review.

## 1. Any microservice can be simulated
The controlled demo now supports User, Order, Payment and Notification service failures. The backend exposes:

- `POST /simulate/service/{service_name}/failure`
- `POST /simulate/service/{service_name}/warning`
- `POST /simulate/normal`

The RCA layer uses the actual failed service returned by service monitoring instead of hard-coding payment_service.

## 2. Project-specific assistant
The previous narrow keyword assistant has been replaced by an offline-first project Q&A assistant. It uses TF-IDF retrieval over a project knowledge base and injects live runtime data for health, service status, RCA, incidents, metrics, and recovery questions. This is intentionally presented as a project-specific NLP assistant, not as a fake general-purpose LLM.

If a true generative LLM is required later, an API provider can be attached to this interface without changing the core monitoring/RCA pipeline.

## 3. More questions
The assistant can answer questions about architecture, objective, microservices, LSTM, model features, metrics, RCA, fallback behavior, recovery, incidents, PostgreSQL, MongoDB, Prometheus, Grafana, OpenTelemetry, Jaeger, Docker, Kubernetes, real-world use, and limitations.

## 4. Backward compatibility
`POST /simulate/failure` and `POST /simulate/warning` remain valid; they use Payment Service only as the legacy default demonstration route. The dashboard now uses the service-specific endpoints so Payment is no longer the only option.
