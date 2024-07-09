# Stage 1: Build the frontend
FROM node:18-alpine as frontend-build

# Set the working directory
WORKDIR /frontend

ARG RENDER_EXTERNAL_HOSTNAME=https://ardha-uttanasana.onrender.com/api

# Copy frontend package.json and install dependencies
COPY frontend/package*.json ./
RUN npm install

# Copy the rest of the frontend code and build it
COPY frontend/ ./
RUN npm run build

# Stage 2: Build the backend
FROM python:3.12-slim as backend-build

# Set the working directory
WORKDIR /app

# Copy the Pipfile and Pipfile.lock to the working directory
COPY backend/Pipfile* ./

# Install pipenv and dependencies
RUN pip install pipenv \
    && pipenv install --system --deploy

# Copy the rest of the backend code to the working directory
COPY backend/ ./

# Copy the frontend build files to a static folder in the backend
COPY --from=frontend-build /frontend/dist/spa /app/static

# Expose the port the app runs on
EXPOSE 8000

# Command to run the FastAPI server
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
