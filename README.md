# ardha-uttanasana

This repo contains a "Hello World" application with Python (FastApi) in the backend and VueJs (Quasar) in the frontend, running on a single container. The main contribution here is to show how to integrate these technologies in two flavors:
- Local run and debug with Vscode, for the sake of developer's life quality. 😊
- Deployment via a single Dockerfile. So, it can be easily deployed on platforms with free plans (like Render) as a starting point. 🤑

## Requirements
- Vscode
- Git bash
- Python 3.12
- Node 18 or higher

## Local run and debug

### Backend
- Open the root folder of this project on VsCode and the integrated terminal (gitbash)
- Run `mkdir .venv`
- Run `pipenv install --dev`

### Frontend


# Run docker locally
docker build -t myapp:latest .
docker build --no-cache --build-arg BACKEND_ENV_VAR="Hello (outer) world. I came from BACKEND_ENV_VAR" -t myapp:latest .

docker run -it --rm -p 8000:8000 --name myapp-container myapp:latest

http://localhost:8000/ 
http://localhost:8000/docs
http://localhost:8000/api


# Deploy on Render

http://localhost:8000/api
http://localhost:8000/ 

