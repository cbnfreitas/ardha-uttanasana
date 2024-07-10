from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
import os

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=['*'],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Read environment variable
backend_env_var = os.getenv("BACKEND_ENV_VAR", "No variable set!")  

@app.get("/api")
async def sample_route():
    ''' Retrieves the content of the BACKEND_ENV_VAR
    '''
    return {"message": f"BACKEND_ENV_VAR content: {backend_env_var}"}

# Check if the static directory exists before mounting. For local development and debug, it won't be available.
if os.path.isdir("static"):
    # Mount the static files in the frontend. 
    # Do it in the end, that is, after the other routes are defined, to avoid conflict.
    app.mount("/", StaticFiles(directory="static", html=True), name="static")
else:
    print("Static directory not found. Skipping mounting of static files.")
