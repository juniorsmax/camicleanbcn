#!/bin/bash

CURRENT_BRANCH=$(git branch --show-current)

read -p "Describe qué cambiaste: " message

git add .
git commit -m "$message"
git push origin $CURRENT_BRANCH

echo ""
echo "✅ Cambios guardados en GitHub"
echo "Rama: $CURRENT_BRANCH"
