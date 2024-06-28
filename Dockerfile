FROM python:3.12-slim as base
ENV PYTHONPATH /app
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DEBUG False
RUN mkdir -p /app
WORKDIR /app

# Install git and other dependencies
RUN apt-get update && apt-get install -y \
    git \
    rsync \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/
RUN python -m pip install --upgrade pip \
    && python -m pip install -r requirements.txt

COPY . /app/

# Install pre-commit hooks
RUN pre-commit install
