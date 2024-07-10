

# References
https://docs.render.com/environment-variables#by-runtime
https://quasar.dev/quasar-cli-webpack/handling-process-env#example


# Local development and debug

## Backend
mkdir .venv
pipenv install --dev

## Frontend


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

