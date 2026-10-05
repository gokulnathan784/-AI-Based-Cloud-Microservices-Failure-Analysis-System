# Project AI Assistant

The final project assistant has two modes.

## Offline mode (default)
No API key is required. The assistant uses a local TF-IDF retrieval model over a project-specific knowledge base and live runtime context. It answers questions about architecture, services, LSTM, preprocessing, RCA, failure types, fallback, recovery, incidents, metrics, databases, Prometheus, Grafana, OpenTelemetry, Jaeger, Docker, Kubernetes and real-world usage.

## Generative LLM mode (optional)
Set `GEMINI_API_KEY` in a `.env` file at the project root. Docker Compose passes the key to the backend. The backend calls Google's Gemini `generateContent` API with a project-constrained system instruction using the existing `requests` dependency. The LLM receives the project knowledge base plus live runtime context, so it can answer natural-language project questions rather than only fixed keywords. If the API is unavailable, the assistant automatically falls back to offline mode.

Example `.env`:

```env
GEMINI_API_KEY=your_key_here
GEMINI_MODEL=gemini-2.5-flash
```

Do not commit or share the `.env` file.

## Kubernetes
To enable the real LLM in Kubernetes, create the secret before deploying/redeploying the backend:

```powershell
kubectl -n ai-cloud create secret generic gemini-secret --from-literal=GEMINI_API_KEY="your_key_here" --dry-run=client -o yaml | kubectl apply -f -
kubectl -n ai-cloud rollout restart deployment/backend
```

Without this secret, the backend runs normally and the assistant uses offline mode.
