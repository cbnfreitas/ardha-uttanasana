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
docker build --no-cache -t myapp:latest .

docker run -it -p 8000:8000 myapp:latest


docker run -d -p 8000:8000 --name myapp-container myapp:latest
docker logs -f myapp-container


docker-go(){ docker exec -it $(docker ps --filter "name=$1" -q) sh; }
docker-go myapp-container
exit

docker stop myapp-container
##

http://localhost:8000/api
http://localhost:8000/ (carrega aqui, sem problemas)

---

https://docs.render.com/environment-variables#by-runtime

https://quasar.dev/quasar-cli-webpack/handling-process-env#example