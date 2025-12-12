# BTP Cardio - Renforcement Shell et Git

## Description du projet

Ce projet vise à renforcer les compétences sur les technologies essentielles du développement :
- **Shell** : commandes UNIX, configuration d'environnement, pipelines
- **Git** : bonnes pratiques, gestion des branches, commits atomiques

## Objectifs

### Shell
- Maîtriser les commandes UNIX essentielles
- Configurer son environnement (alias, variables)
- Utiliser la documentation (man)
- Penser en pipelines et chaînage de commandes

### Git
- Utiliser un .gitignore adapté
- Construire des commits atomiques
- Gérer les branches efficacement
- Merger sans conflits

## Structure du projet

Le projet sera organisé en groupes, chacun dans sa propre branche :
- `groupe-1/` : [Description à venir]
- `groupe-2/` : [Description à venir]
- `groupe-3/` : [Description à venir]
- etc.

## Règles de développement

1. **Un commit = un fichier modifié**
2. **Une branche par groupe**
3. **Commits isolés par groupe dans leur branche respective**
4. **Merge final dans la branche main**

## Installation

1. Charger l'image Docker : `docker load -i cardio.tar`
2. Lancer le container : `docker run -d btp-cardio`
3. Accéder au terminal : `docker exec -it <container-id> bash`
4. Suivre les instructions dans `START-HERE.md`

## État du projet

- [x] Repository initialisé
- [x] .gitignore configuré
- [ ] Image Docker chargée
- [ ] Container lancé
- [ ] Instructions START-HERE.md lues