#!/bin/sh
echo "--- rake assets:precompile ---"
rake assets:precompile
echo "--- git status ---"
git status
echo "--- git add . ---"
git add .
echo "--- git commit ---"
git commit -m $1
echo "--- git push ---"
git push
echo "--- git push heroku master---"
git push heroku master