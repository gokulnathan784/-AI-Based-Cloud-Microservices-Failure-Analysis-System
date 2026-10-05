# Faculty Demo — 5 to 10 minutes

## 1. Open the dashboard

Docker:
`http://localhost:3000`

Kubernetes local:
run `.\open-k8s.cmd`, then use `http://localhost:30080`.

## 2. Show the normal state

Click `Normal` and `Refresh`.

Show:
- all four microservices Running
- AI Prediction Normal
- Active Incidents empty
- Incident History may contain earlier Resolved incidents

## 3. Demonstrate a failure

Click `Failure` and `Refresh`.

Show:
- Payment Service becomes Failed
- AI Prediction becomes Failure
- faulty service is `payment_service`
- root cause is displayed
- recovery recommendation is displayed
- Critical incident appears as Open
- PDF report link is available

## 4. Show observability

Open Prometheus and Grafana.

Then open Jaeger and show the backend traces.

## 5. Show AI assistant

Ask:
- `health`
- `root cause`
- `recovery`
- `incident`

Use the microphone button for voice input and the speaker button for speech output.

Change the language selector to Tamil or Hindi and repeat a chatbot question.

## 6. Recover

Click `Normal` and `Refresh`.

Show:
- Payment Service Running
- AI Prediction Normal
- Active Incidents empty
- the previous incident is visible in Incident History as Resolved

## Key viva sentence

"The system combines microservice telemetry, logs and distributed tracing with an LSTM-based temporal failure predictor and a root-cause layer, then presents recovery guidance and incident evidence through a real-time dashboard."
