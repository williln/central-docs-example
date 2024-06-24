# Build docs 
build:
    mkdocs build

# Serve the docs to localhost 
docs:
    mkdocs serve

# Run the update script to re-import the docs 
update-docs:
    python3 update_docs.py