#!/usr/bin/env bash
# Sets the Docker Hub token as the secret DOCKERHUB_TOKEN in every repository
# named on the command line, for the publishing workflow of mwaeckerlin/scratch.
# A name without owner means mwaeckerlin/<name>.
#
# Usage: ./set-gh-secret.sh hindsight opencode
#
# The token is read once without echo and handed to gh on stdin, so it never
# stands on a command line, in the process list or in the shell history.

set -euo pipefail

if [[ $# -eq 0 ]]; then
    echo "usage: $0 <repository>..." >&2
    exit 1
fi

read -rsp "Enter DOCKERHUB_TOKEN secret: " TOKEN
echo
if [[ -z "${TOKEN}" ]]; then
    echo "the token is empty, nothing set" >&2
    exit 1
fi

for repo in "$@"; do
    [[ "${repo}" == */* ]] || repo="mwaeckerlin/${repo}"
    gh secret set DOCKERHUB_TOKEN --repo "${repo}" <<< "${TOKEN}"
done
unset TOKEN
