docker-compose up -d

docker-compose up -d backend
docker-compose up -d frontend

docker-compose logs -f backend
docker-compose logs -f frontend


docker-compose down

docker-compose up -d --build

docker-compose restart

docker ps

##

docker build -t myapp:latest .
docker run -p 8000:8000 myapp:latest
docker run -it -p 8000:8000 myapp:latest

http://localhost:8000/static


http://localhost:8000/#/ (carrega aqui, sem problemas)

---

https://docs.render.com/environment-variables#by-runtime