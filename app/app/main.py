from fastapi import FastAPI

from app.config import APP_NAME, VERSION
from app.routes import router

app = FastAPI(
    title=APP_NAME,
    version=VERSION,
)

app.include_router(router)