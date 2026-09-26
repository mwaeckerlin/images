# Marc Wäckerlin's Docker Images

Root monorepo project with all my (actively maintained) Docker images. The images here are maintained from time to time. Other docker projects may still be maintained but not yet added.

This is especially used for me personally to fetch all my docker image projects at once. It helps in consistency having an IDE (Codex, Claude, …) with access to all projects at once.

All these images are also available from my [Docker Hub](https://hub.docker.com/u/mwaeckerlin) account.

## Rules for Modern Docker Images

These rules are mandatory defaults for all projects in this monorepo. If a project has exceptional needs, document the exception in that project's README.

- multi-stage builds: build stage uses a build image, final stage uses a production base image
- copy only selected runtime artifacts from build stage, never broad unfiltered copy
- no shell, no package manager, no dev/debug tools in production runtime images
- one service process per container
- run as non-root user
- explicit `ENTRYPOINT` and `CMD` in Dockerfile
- expose only required ports
- secrets via Docker secrets (preferred) or environment variables, never hardcoded
- Docker Compose files: no deprecated `version`, minimal and modern
- `package.json` scripts: `build` for all; add `start`, `start:dev`, `stop` only where a real service runs
- exceptions must be documented in the project's own README

### Base Images for Builds

Purpose: reusable builder environments. These images contain all necessary tools and may become large. **Never use in production.**

#### Samples

- [very-base]: minimal alpine base for all build stages
- [ubuntu-very-base]: minimal ubuntu base for build stages that need ubuntu
  - [build]: master of all tooled build images
    - [nodejs-build]: build image for NodeJS
    - [python-build]: build image for Python

#### Specific Rules

- may include shell and helper tooling for build-time convenience
- must not contain service-specific runtime config
- `package.json` with `build` script only, no `start`/`stop`

### Base Images for Production Deployments

Purpose: hardened minimal runtime base. **Always use these as final stage for production releases.**

#### Samples

- [scratch]: master runtime base image for all (headless, non-root)
  - [nodejs]: base for NodeJS services
  - [python]: base for Python services

There used to be a [mwaeckerlin/base](https://github.com/mwaeckerlin/base), but this is deprecated, since it was based on a shell. Modern secure images avoid putting a shell into the image. Perhaps one day, when all old images are migrated, `very-base` will be renamed to `base`.

#### Specific Rules

- include only runtime libs/binaries strictly required by child services
- define safe defaults for environment (`PATH`, runtime user/home as needed)

### Service Images for Production Deployments

Purpose: deployable images that run an actual application/service.

#### Samples

- [nginx]: web server
  - [php-fpm]: PHP handler for [nginx]
    - [wordpress]: WordPress
    - [nextcloud]: NextCloud

#### Specific Rules

- build from production base images
- include health/readiness endpoint where applicable
- `package.json` scripts: `build`, `start`, `start:dev`, `stop`

