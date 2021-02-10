#!/bin/bash

# Adds all the changes under TP session folder
git add ./tp-sessions

# Creates an auto commit message
git commit -m "commited `date +'%Y-%m-%d %H:%M:%S'`";

# Pushes
git push
