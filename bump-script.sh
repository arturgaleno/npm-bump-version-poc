#!/bin/bash
git clone https://www.github.com/arturgaleno/npm-bump-version-poc
cd npm-bump-version-poc
npm version $1
CURRENT_VERSION=$(npm run version --silent)
git commit -m "updating version"
git push origin master
git checkout fix
git merge master
git push origin fix
git tag $CURRENT_VERSION
git push origin $CURRENT_VERSION
docker build . -t myimage:$CURRENT_VERSION
