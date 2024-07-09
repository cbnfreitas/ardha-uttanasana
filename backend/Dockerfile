# Dockerfile para Backend
FROM python:3.12-slim

# Definir diretório de trabalho
WORKDIR /app

# Copiar Pipfile e Pipfile.lock
COPY Pipfile* ./

# Instalar dependências
RUN pip install pipenv && pipenv install --deploy --ignore-pipfile

# Copiar o código da aplicação
COPY . .

# Expor a porta que o FastAPI utilizará
EXPOSE 8000

# Comando para rodar a aplicação
CMD ["pipenv", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
