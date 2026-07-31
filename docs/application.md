# Application

The application is built using FastAPI.

## Features

- REST API
- Health Endpoint
- Docker Ready

## Endpoints

| Endpoint | Description |
|-----------|-------------|
| / | Home |
| /health | Health Check |
| /docs | Swagger UI |

## Run Locally

```bash
uvicorn app.main:app --reload
```

## Docker

```bash
docker build -t secure-notes-api .

docker run -p 8000:8000 secure-notes-api
```