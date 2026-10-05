# Multi-service failure tests

The original demo used Payment Service as a controlled reference. The upgraded project no longer limits the simulation to payment.

## Dashboard
Use the four service buttons:

- Failure User
- Failure Order
- Failure Payment
- Failure Notification

Then click Refresh/Analyze.

## API

```powershell
Invoke-RestMethod -Method Post http://localhost:8000/simulate/service/user_service/failure
Invoke-RestMethod http://localhost:8000/complete-analysis

Invoke-RestMethod -Method Post http://localhost:8000/simulate/service/order_service/failure
Invoke-RestMethod http://localhost:8000/complete-analysis

Invoke-RestMethod -Method Post http://localhost:8000/simulate/service/payment_service/failure
Invoke-RestMethod http://localhost:8000/complete-analysis

Invoke-RestMethod -Method Post http://localhost:8000/simulate/service/notification_service/failure
Invoke-RestMethod http://localhost:8000/complete-analysis

Invoke-RestMethod -Method Post http://localhost:8000/simulate/normal
```

For each failure test, `faulty_service` should correspond to the selected microservice. This is a controlled application-level simulation; it does not kill the actual container.

## Real container failure test
To test an actual service outage under Docker, stop a service from a second PowerShell window:

```powershell
docker compose stop order-service
```

Then open/refresh the dashboard. The backend should observe a connection failure for the stopped service. Restore it with:

```powershell
docker compose start order-service
```

In Kubernetes, the equivalent infrastructure test is to scale a deployment to zero and then restore it, for example `kubectl -n ai-cloud scale deployment/order-service --replicas=0` followed by `--replicas=1`. Use this only for a controlled test environment.
