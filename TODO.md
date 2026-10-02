# TODO

## Orders from Marc

- 2026-09-28 · in work, reopened 2026-09-30 · Marc: /commit everything changed in mwaeckerlin including the umbrella — done: hermes, hindsight, opencode, openclaw, maestro, umbrella pointers; open: uncommitted work in bind, lizardfs-client, mailservice, nextcloud, parliament-winterthur-tool, reverse-proxy, rsync, vscode, wordpress, owners asked
- 2026-09-26 · in work · Marc: every image also tagged YYYYMMDD, version and version-YYYYMMDD (also for other tags); version branches such as nextcloud's built and pushed, the Nextcloud major version addressable — shared workflow done, branch callers with the nextcloud and parliament sessions

- 2026-09-26 · in work · Marc: coordinate with the new subprojects ubuntu-very-base and ubuntu-scratch and set up their pipeline
- 2026-09-26 · done, open: PATH install decided by Marc · Marc: find who loads the machine and coordinate the heavy runs — machine-wide queue `~/.claude/bin/machine-lock.mjs`

- 2026-09-26 · open · Marc: uniform npm scripts in every project (`build`, `start`, `test` …), version in `package.json` raised after every commit, every Dockerfile built through docker compose, README current — for every project checked out here; afterwards the GitHub projects that are not checked out

- 2026-09-26 · in work · Marc: audit every project against the global rules (base image, headless, FEATURES.md, TESTS.md, CHANGELOG.md, every feature tested); hand each gap to the agent responsible for the project, fix the rest
- 2026-09-26 · in work · Marc: GitHub Actions in every image project: `docker compose build` of all images of the compose file, push to Docker Hub on every commit, token from a secret
- 2026-09-26 · in work · Marc: base images and every derived image also for arm64

## Open decisions

- dockindock and vscode are not headless by design (rootless docker and code-server need a shell)
- parliament-winterthur-tool: the branches nc33–nc35 carry no caller and no `deploy` script, so the pipeline fails there until those files are committed on each branch
- the machine queue needs a name on the PATH (`machine-lock` in `~/.local/bin`) so that project scripts can call it

- no LICENSE in allow-write-access, build, fake-smtp, mailservice/mailforward, pico-httpd, sandbox-base; the licence is his choice (the family uses MIT, GPL and LGPL)
- nodejs ships only the English ICU data (`icu-data-en`), so `Intl` formats `de-CH` like English; `icu-data-full` costs about 30MB
- nextcloud is published by Docker Hub build rules from the branches `new` and `new-NN` (tags `nginx`, `php-fpm`, `nginx-NN`, `php-fpm-NN`); the shared GitHub workflow builds only from `master`/`main`, so nextcloud got no caller until it is decided which of the two publishes
- parliament-winterthur-tool is also published by Docker Hub build rules (per Nextcloud version branch); with the new GitHub workflow two publishers write `:nginx`, `:php-fpm`, `:realtime`; whether the Docker Hub automated builds of the other repositories are still on is not known here
