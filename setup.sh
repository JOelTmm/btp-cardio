#!/bin/bash

# Script d'aide pour le projet BTP Cardio
# Ce script vous guide dans les étapes de setup

echo "=== BTP Cardio - Script d'aide ==="
echo ""

# Vérification de Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Docker n'est pas installé ou pas dans le PATH"
    exit 1
fi

if ! docker info &> /dev/null; then
    echo "❌ Docker n'est pas démarré. Veuillez lancer Docker Desktop."
    exit 1
fi

echo "✅ Docker est disponible"

# Vérification de l'image cardio.tar
if [ ! -f "cardio.tar" ]; then
    echo "❌ Le fichier cardio.tar n'est pas présent dans ce répertoire"
    echo "   Veuillez copier cardio.tar dans $(pwd)"
    exit 1
fi

echo "✅ cardio.tar trouvé"

# Chargement de l'image
echo "📦 Chargement de l'image Docker..."
if docker load -i cardio.tar; then
    echo "✅ Image chargée avec succès"
else
    echo "❌ Erreur lors du chargement de l'image"
    exit 1
fi

# Vérification de l'image
if docker images btp-cardio --format "table {{.Repository}}" | grep -q "btp-cardio"; then
    echo "✅ Image btp-cardio disponible"
else
    echo "❌ Image btp-cardio non trouvée après le chargement"
    exit 1
fi

# Lancement du container
echo "🚀 Lancement du container..."
CONTAINER_ID=$(docker run -d btp-cardio)

if [ $? -eq 0 ]; then
    echo "✅ Container lancé avec l'ID: $CONTAINER_ID"
    echo ""
    echo "Pour accéder au container, utilisez :"
    echo "   docker exec -it $CONTAINER_ID bash"
    echo ""
    echo "Une fois dans le container, lisez START-HERE.md pour continuer."
else
    echo "❌ Erreur lors du lancement du container"
    exit 1
fi