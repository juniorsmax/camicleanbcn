#!/bin/bash

echo "¿Con qué herramienta trabajas hoy?"
echo "1. Manus"
echo "2. Claude Code"
read -p "Elige (1 o 2): " choice

if [ "$choice" == "1" ]; then
    BRANCH="manus-work"
    TOOL="Manus"
elif [ "$choice" == "2" ]; then
    BRANCH="claude-work"
    TOOL="Claude Code"
else
    echo "Opción no válida"
    exit 1
fi

# Guardar cambios actuales si existen
git add .
git stash

# Cambiar a la rama
git checkout $BRANCH 2>/dev/null || git checkout -b $BRANCH

# Traer últimos cambios
git pull origin $BRANCH 2>/dev/null || echo "Primera vez en esta rama"

# Restaurar cambios guardados
git stash pop 2>/dev/null

echo ""
echo "✅ Listo para trabajar con $TOOL"
echo "Cuando termines, ejecuta: ./save.sh"
