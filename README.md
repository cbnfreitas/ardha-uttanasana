docker-compose up -d

docker-compose up -d backend
docker-compose up -d frontend

docker-compose logs -f backend
docker-compose logs -f frontend


docker-compose down

docker-compose up -d --build

docker-compose restart

docker ps