#!/bin/sh -l
set -e

GGU="$GLITCH_GIT_URL"

GITHUB_TOKEN_AND_REPO_URL="https://github-actions:${TOKEN}@github.com/${GITHUB_REPOSITORY}"

git clone "${GITHUB_TOKEN_AND_REPO_URL}".git ghrepo
cd ghrepo
git remote add glitch "${GGU}"

git push glitch "${TARGET_BRANCH}":main