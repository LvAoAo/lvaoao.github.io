#!/bin/bash
git add .
git commit -m "update article"
git push
git subtree push --prefix public origin public