# Build (or rebuild) the Docker image
build:
    docker-compose build

# Build docs
build-docs:
    docker-compose run --rm docs mkdocs build

# Serve the docs to localhost
up:
    docker-compose up

# Stop the running docs server
down:
    docker-compose down

# Run the update script to re-import the docs
update-docs:
    docker-compose run --rm docs python3 update_docs.py

# Open a shell in the docs container
shell:
    docker-compose run --rm docs /bin/bash

# Run pre-commit hooks
pre-commit-all:
    docker-compose run --rm docs pre-commit run --all-files
