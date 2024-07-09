# Dockerfile para Frontend
FROM node:18-alpine

# Definir diretório de trabalho
WORKDIR /app

# Copiar package.json e package-lock.json
COPY package*.json ./

# Instalar dependências
RUN npm install

# Copiar o código da aplicação
COPY . .

# Compilar o projeto para produção
RUN npm run build

# Instalar um servidor HTTP simples para servir a aplicação
RUN npm install -g http-server

# Expor a porta que o HTTP Server utilizará
EXPOSE 8080

# Comando para rodar a aplicação
CMD ["http-server", "dist", "-p", "8080"]
