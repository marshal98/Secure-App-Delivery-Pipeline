# Continuous Deployment

Deployment is manually triggered using GitHub Actions.

## Workflow

```text
Run Workflow

↓

SSH to VM

↓

Docker Login

↓

Docker Pull

↓

Stop Existing Container

↓

Start New Container

↓

Health Check
```

Deployment succeeds only if the application responds successfully to `/health`.