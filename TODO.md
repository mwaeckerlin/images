# TODO

## Orders from Marc

- 2026-10-23 · in work · php-fpm: the images run without a shell, which is what they are for. PHP still reports `exec()`, `shell_exec()`, `system()` and `passthru()` as available, so a caller that asks `function_exists('exec')` first runs into a failing call instead of skipping it — measured in nextcloud as «exec(): Unable to fork [command -v -- 'sendmail']» from the Symfony ExecutableFinder, and as Talk's «PHP and Apache configuration is not compatible» from `exec('apachectl -V | grep MPM')`. With `disable_functions = exec,shell_exec,system,passthru` in the base `php.ini` both callers take their own fallback and the messages stop; `proc_open` stays. Marc on 2026-10-23: «Alles muss funktionieren, aber ohne Shell und ohne zusätzliche Executables im Image» — that rules out the two other ways, so the base declares them disabled; the CHANGELOG and the README say so, because foreign users pull this image. Reported by the session mwaeckerlin-6e, built by the session that owns php-fpm; nextcloud carries it in `php-fpm/nextcloud.ini` until the base version is out

- 2026-10-21 · open · Marc, through the nextcloud work: check in every Docker project that what an operator may configure is an environment variable with a default, never a config file that has to be mounted or edited (found in nextcloud: `99-nextcloud.ini` and `fpm.conf` lay unused beside the variables `UPLOAD_MAX_FILESIZE`, `MEMORY_LIMIT`, `MAX_INPUT_TIME`, `MAX_REQUEST_WORKERS`)
- 2026-10-21 · open · Marc, through the nextcloud work: check in every PHP-FPM Docker project that the nginx image defaults `PHP_FPM_HOST` to the service name of the php-fpm image in its own examples (nextcloud: `nextcloud-php-fpm`; the base image mwaeckerlin/nginx defaults to `php-fpm`)
- 2026-10-21 · in work · Marc: check out mwaeckerlin/lam and mwaeckerlin/openldap as submodules and maintain them; LAM is PHP 5 on Ubuntu 14.04 with Apache mod_php (last built 2018) and gets rebuilt headless on mwaeckerlin/php-fpm and nginx, OpenLDAP (last built 2022) on the family pattern; Marc 2026-10-21: no multi-master replication (the dead code goes), the image stays supported for its public users, the README gets the upgrade information from the old image (what stays, what changes, backup with slapcat first, the way back through /var/restore)
- 2026-10-20 · public images and vernunft done; Pacta.News and atheismus taken over by Marc; LAM and OpenLDAP open · Marc: follow the announced PHP RCEs CVE-2026-109618 and CVE-2026-109619 (php.net release 2026-10-21 14:00 UTC, moved forward from the rumoured 2026-10-22), from then check whether Alpine publishes the patched PHP packages and rebuild the PHP chain bottom-up (very-base → php-fpm → nextcloud, wordpress-php-fpm, wordpress-nginx, postfixadmin, rainloop, postfixadmin-proxy → parliament-winterthur-tool); if Alpine lags, patch PHP temporarily in the images; once the images are published, inform the session of every project under ~/git built on them: pacta/projects (src/web/wordpress), atheismus/atheismus-wordpress-template, politik/vernunft
- 2026-09-26 · in work · Marc: every image also tagged YYYYMMDD, version and version-YYYYMMDD (also for other tags); version branches such as nextcloud's built and pushed, the Nextcloud major version addressable — shared workflow done, branch callers with the nextcloud and parliament sessions

- 2026-09-26 · in work · Marc: coordinate with the new subprojects ubuntu-very-base and ubuntu-scratch and set up their pipeline
- 2026-09-26 · done, open: PATH install decided by Marc · Marc: find who loads the machine and coordinate the heavy runs — machine-wide queue `~/.claude/bin/machine-lock.mjs`

- 2026-09-26 · open · Marc: uniform npm scripts in every project (`build`, `start`, `test` …), version in `package.json` raised after every commit, every Dockerfile built through docker compose, README current — for every project checked out here; afterwards the GitHub projects that are not checked out

- 2026-09-26 · in work · Marc: audit every project against the global rules (base image, headless, FEATURES.md, TESTS.md, CHANGELOG.md, every feature tested); hand each gap to the agent responsible for the project, fix the rest
- 2026-09-26 · in work · Marc: GitHub Actions in every image project: `docker compose build` of all images of the compose file, push to Docker Hub on every commit, token from a secret
- 2026-09-26 · in work · Marc: base images and every derived image also for arm64

## Open decisions

- dockindock and vscode are not headless by design (rootless docker and code-server need a shell)
- the machine queue needs a name on the PATH (`machine-lock` in `~/.local/bin`) so that project scripts can call it

- no LICENSE in allow-write-access, build, fake-smtp, mailservice/mailforward, pico-httpd, sandbox-base; the licence is his choice (the family uses MIT, GPL and LGPL)
- nodejs ships only the English ICU data (`icu-data-en`), so `Intl` formats `de-CH` like English; `icu-data-full` costs about 30MB
- nextcloud is published by Docker Hub build rules from the branches `new` and `new-NN` (tags `nginx`, `php-fpm`, `nginx-NN`, `php-fpm-NN`); the shared GitHub workflow builds only from `master`/`main`, so nextcloud got no caller until it is decided which of the two publishes
- parliament-winterthur-tool is also published by Docker Hub build rules (per Nextcloud version branch); with the new GitHub workflow two publishers write `:nginx`, `:php-fpm`, `:realtime`; whether the Docker Hub automated builds of the other repositories are still on is not known here
