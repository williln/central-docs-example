# Central Docs Example 

This repository collects the documentation from multiple repositories into one deployment, enabling users of very large codebases to maintain their docs close to the code, but navigate across all of their docs in one deployment. 

This is an example of using [`mkdocs-monorepo-plugin`](https://github.com/backstage/mkdocs-monorepo-plugin) to display the docs of several repositories in one mkdocs deployment. 

## Local Development 

- Install requirements with `pip install -r requirements.txt` 
- Run `mkdocs serve` 
- See the docs at `localhost:8000`

### Links 

- [backstage/mkdocs-monorepo-plugin](https://github.com/backstage/mkdocs-monorepo-plugin/tree/master)
- [mkdocs-monorepo-plugin demo site: Cats API](https://backstage.github.io/mkdocs-monorepo-plugin/monorepo-example/) ([sample project source code](https://github.com/backstage/mkdocs-monorepo-plugin/tree/master/sample-docs))

## Adding a new repo 

### Preparing the new repo 

**Requirements**: 

1. Add and install the requirements -- `mkdocs`, `mkdocs-material` (for the theme) and `mkdocs-monorepo-plugin` (to support multiple repos)

Example `pyproject.toml`: 

```toml
dependencies = ["django>=3.2", "mkdocs", "mkdocs-material", "mkdocs-monorepo-plugin"]
```

Then run `pip install .` in your virtual environment. 

2. Add a `mkdoc.yml` file at the root level.  

Example `mkdoc.yml`: 

```yaml
site_name: django-email-relay
repo_name: "williln/django-email-relay"
repo_url: "https://github.com/williln/django-email-relay"

nav:
  - Home: "index.md"
  - Configuration: "configuration/index.md"
  - Contributing: "contributing/index.md"
  - Just: "development/just.md"
  - Installation: "installation/index.md"
```

The important section is the `nav` element. See [Adding Pages](https://www.mkdocs.org/getting-started/#adding-pages) in the MkDocs docs. 

> 📌 For each repo you add, you will need to set up the navigation via this `mkdocs.yml` file.

3. Commit the result to that repo. 


4. Come back to this repo, `central-docs`. Add the repo to `repos.yml`:

```yaml
repos:
  - name: django-email-relay
    url: https://github.com/williln/django-email-relay.git
    docs_path: docs/
```

5. Run locally 

Run `mkdocs serve` in this repo to preview your changes. 


### Adding a private repo 

TBD. 


## Deployment 

TBD. The plan is use GitHub webhooks to trigger a rebuild of these docs whenever any of the `docs/` directories in `repos.yaml` has an update to its `main` branch. The docs would also rebuild on a push to this `main` branch (example: when a new repository is added). 