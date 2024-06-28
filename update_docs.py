import os
import subprocess

import yaml


def clone_or_pull(repo):
    repo_path = f"temp_docs/{repo['name']}"
    if os.path.exists(repo_path):
        print(f"Pulling latest changes for {repo['name']}")
        subprocess.run(["git", "-C", repo_path, "pull"])
    else:
        print(f"Cloning {repo['name']}")
        subprocess.run(["git", "clone", "--depth", "1", repo["url"], repo_path])

    # Ensure destination directories exist
    docs_destination = f"{repo['name']}/{repo['docs_path']}"
    os.makedirs(docs_destination, exist_ok=True)

    # Copy only the docs directory
    source = f"{repo_path}/{repo['docs_path']}"
    destination = f"{repo['name']}/{repo['docs_path']}"
    subprocess.run(["rsync", "-av", source, destination])

    # Also copy the mkdocs.yml
    source = f"{repo_path}/mkdocs.yml"
    destination = f"{repo['name']}/mkdocs.yml"
    subprocess.run(["rsync", "-av", source, destination])


# Load repo configuration
with open("repos.yml", "r") as file:
    config = yaml.safe_load(file)

# Process each repo
for repo in config["repos"]:
    clone_or_pull(repo)

print("Documentation update complete")
