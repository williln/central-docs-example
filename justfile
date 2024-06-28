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

# Open a shell in the container
shell:
    docker-compose run --rm docs /bin/bash
