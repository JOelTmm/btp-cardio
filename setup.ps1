# Script PowerShell d'aide pour le projet BTP Cardio

Write-Host "=== BTP Cardio - Script d'aide ===" -ForegroundColor Cyan
Write-Host ""

# Vérification de Docker
try {
    $dockerVersion = docker --version
    Write-Host "✅ Docker est disponible: $dockerVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Docker n'est pas installé ou pas dans le PATH" -ForegroundColor Red
    exit 1
}

# Test de connexion Docker
try {
    docker info | Out-Null
    Write-Host "✅ Docker est démarré et accessible" -ForegroundColor Green
} catch {
    Write-Host "❌ Docker n'est pas démarré. Veuillez lancer Docker Desktop." -ForegroundColor Red
    exit 1
}

# Vérification de l'image cardio.tar
if (-Not (Test-Path "cardio.tar")) {
    Write-Host "❌ Le fichier cardio.tar n'est pas présent dans ce répertoire" -ForegroundColor Red
    Write-Host "   Veuillez copier cardio.tar dans $PWD" -ForegroundColor Yellow
    exit 1
}

Write-Host "✅ cardio.tar trouvé" -ForegroundColor Green

# Chargement de l'image
Write-Host "📦 Chargement de l'image Docker..." -ForegroundColor Yellow
try {
    docker load -i cardio.tar
    Write-Host "✅ Image chargée avec succès" -ForegroundColor Green
} catch {
    Write-Host "❌ Erreur lors du chargement de l'image" -ForegroundColor Red
    exit 1
}

# Vérification de l'image
$imageExists = docker images btp-cardio --format "{{.Repository}}" | Select-String "btp-cardio"
if ($imageExists) {
    Write-Host "✅ Image btp-cardio disponible" -ForegroundColor Green
} else {
    Write-Host "❌ Image btp-cardio non trouvée après le chargement" -ForegroundColor Red
    exit 1
}

# Lancement du container
Write-Host "🚀 Lancement du container..." -ForegroundColor Yellow
try {
    $containerId = docker run -d btp-cardio
    Write-Host "✅ Container lancé avec l'ID: $containerId" -ForegroundColor Green
    Write-Host ""
    Write-Host "Pour accéder au container, utilisez :" -ForegroundColor Cyan
    Write-Host "   docker exec -it $containerId bash" -ForegroundColor White
    Write-Host ""
    Write-Host "Une fois dans le container, lisez START-HERE.md pour continuer." -ForegroundColor Yellow
} catch {
    Write-Host "❌ Erreur lors du lancement du container" -ForegroundColor Red
    exit 1
}