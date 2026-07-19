from fastapi import APIRouter

from app.config import APP_NAME, VERSION, ENVIRONMENT

router = APIRouter()


@router.get("/")
def root():
    return {
        "application": APP_NAME,
        "message": "Welcome to Secure Notes API",
        "version": VERSION,
    }


@router.get("/health")
def health():
    return {
        "status": "healthy"
    }


@router.get("/version")
def version():
    return {
        "version": VERSION
    }


@router.get("/info")
def info():
    return {
        "application": APP_NAME,
        "framework": "FastAPI",
        "environment": ENVIRONMENT,
        "version": VERSION,
        "containerized": False,
        "cloud": "Google Cloud",
        "repository": "Secure-App-Delivery-Pipeline",
    }