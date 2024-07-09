#!/bin/bash

# Start Uvicorn
uvicorn main:app --host 0.0.0.0 --port ${PORT}