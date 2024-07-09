# Stage 1: Build the frontend
FROM node:18-alpine as frontend-build

# Set the working directory
WORKDIR /frontend

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

# Install pipenv
RUN pip install pipenv

# Install dependencies
RUN pipenv install --system --deploy

# Copy the rest of the backend code to the working directory
COPY backend/ ./

# Stage 3: Create the final container
FROM python:3.12-slim

# Set the working directory
WORKDIR /app

# Copy the backend from the backend build stage
COPY --from=backend-build /app /app

# Copy the frontend build files to a static folder in the backend
COPY --from=frontend-build /frontend/dist/spa /app/static

# Install dependencies for serving static files
RUN pip install fastapi uvicorn

# Expose the port the app runs on
EXPOSE 8000

# Command to run the FastAPI server
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
