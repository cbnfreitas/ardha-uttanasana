# ardha-uttanasana

This is a "Hello World" using Python (FastApi) in the backend and VueJs (Quasar) in the frontend, running in a single container, which is normally enough and safe for small repos. The main contribution here is to show how to integrate these technologies in two flavors:
- Local run and debug with Vscode, for the sake of developer's life quality.
- Deployment via a single Dockerfile. So, it can be easily deployed on platforms with free plans (like Render) as a starting point.

> Ardha-uttanasana is a beginner friendly yoga posture, just like this repo 😉

It was tested on Windows, but I guess it should be adapatable to Linux or Mac without much problem.

## Requirements
- Vscode
- Git bash
- Python 3.12, including pipenv
- Node 18 or higher
- Docker Desktop (so can troubleshoot the Dockerfile is necessary)

## Local run and debug

- Frontend: http://localhost:9000/ 
- Backend:http://localhost:8000/api
- Swagger: http://localhost:8000/docs

### Backend setup
- Open the root folder of this project on VsCode and the integrated terminal (gitbash)
- `cd backend`
- `mkdir .venv` (so it installs the virtual environment on this subfolder).
- `pipenv install --dev`
- F1: Developer reload. Pick the virtual environment you have just installed. 

### Backend run

- In the integrated terminal, on the backend folder, type `/run.sh` (or `pipenv run uvicorn main:app --reload`)
- http://localhost:8000/api should return
{
    "message": "BACKEND_ENV_VAR content: No variable set!"
}
- If you quit the the app (CTRL+C) and change the BACKEND_ENV_VAR variable via terminal (`export BACKEND_ENV_VAR="hello world"`). This new value will appear on the response.
- http://localhost:8000/docs should show the Swagger documentation.

### Backend debug

- Place a breakpoint on .\backend\main.py, for instance at the return of the sample_route.
- On "Run and debug" (Ctrl+Shift+D), selected Backend
- Hit F5 and go to http://localhost:8000/api - It should stop in your breakpoint

### Frontend setup
- `cd frontend`
- `npm install`
- F1: Developer reload. 

### Frontend run
- Leave the backend running. 
- In the integrated terminal, on the frontend folder, type `/run.sh` (or `quasar dev`)
- Go to http://localhost:9000/#/

### Frontend debug
- Place a breakpoint on .\frontend\src\pages\IndexPage.vue, for instance inside fetchData.
- Leave the backend running. 
- Leave the frontend running and close the browser.
- On "Run and debug" (Ctrl+Shift+D), selected "Frontend"
- Hit F5 and go to http://localhost:9000/ . If you click on fetch data, it should stop in your breakpoint.


## Run docker locally to emulate deployment
- On the root folder of this project, in the integrated terminal 
- docker build --no-cache --build-arg BACKEND_ENV_VAR="Hello world via docker!" -t myapp:latest .
- docker run -it --rm -p 8000:8000 --name myapp-container myapp:latest
- If everything is fine, you'll see the following in the browser once if you click in the button

![alt text](image.png)

- Frontend: http://localhost:8000/ 
- Backend:http://localhost:8000/api
- Swagger: http://localhost:8000/docs

## Deploy on Render with Dockerfile

- Frontend: http://localhost:8000/ 
- Backend:http://localhost:8000/api
- Swagger: http://localhost:8000/docs

## Lessons learned:

- 


# References

https://docs.render.com/environment-variables#by-runtime

https://quasar.dev/quasar-cli-webpack/handling-process-env#example

Fastapi postgres