#!/bin/sh -l
set -e

GGU=${GLITCH_GIT_URL:?"Missing Glitch Git URL in Environment. Please check your yml file"}

GITHUB_TOKEN_AND_REPO_URL="https://github-actions:${TOKEN}@github.com/${GITHUB_REPOSITORY}"

git clone "${GITHUB_TOKEN_AND_REPO_URL}".git ghrepo
cd ghrepo
git remote add glitch "${GGU}"

git push glitch "${TARGET_BRANCH:=main}":main