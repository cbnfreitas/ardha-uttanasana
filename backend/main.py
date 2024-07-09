from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
from starlette.responses import FileResponse
import os

app = FastAPI()

# Configurar CORS
origins = [
    "http://localhost",  # Adicione outros domínios conforme necessário
    "http://localhost:9000",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/api")
async def read_root():
    return {"message": "Hello, World 3"}


# Mount the static files
app.mount("/", StaticFiles(directory="static", html=True), name="static")
