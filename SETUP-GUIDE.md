# 🚀 Guide de configuration du nouveau repo

## 📦 Fichiers créés

Tous les fichiers sont dans `/tmp/python-dev-toolkit/`

```
python-dev-toolkit/
├── README.md                      # Documentation principale
├── LICENSE                        # Licence MIT
├── .gitignore                     # Fichiers à ignorer
├── CONTRIBUTING.md                # Guide de contribution
├── install.sh                     # Script d'installation
├── Makefile.template              # Template Makefile
├── configs/
│   ├── .flake8                   # Config flake8
│   ├── pyproject.toml.template   # Template pyproject.toml
│   └── .pre-commit-config.yaml   # Pre-commit hooks
└── SETUP-GUIDE.md                # Ce fichier
```

## 🎯 Étapes pour créer le repo GitHub

### 1. Créer le repo sur GitHub

```bash
# Sur GitHub.com
# Créer un nouveau repo : python-dev-toolkit
# Description: "🛠️ Outils et configurations standardisées pour le développement Python"
# Public
# Ne pas initialiser avec README (on a déjà les fichiers)
```

### 2. Initialiser le repo local

```bash
# Aller dans le dossier
cd /tmp/python-dev-toolkit

# Initialiser git
git init

# Ajouter tous les fichiers
git add .

# Premier commit
git commit -m "feat: initial commit - Python Dev Toolkit v1.0"

# Ajouter le remote
git remote add origin git@github.com:ClaraVnk/python-dev-toolkit.git

# Pousser vers GitHub
git branch -M main
git push -u origin main
```

### 3. Configurer le repo GitHub

#### Badges à ajouter au README

```markdown
![Python](https://img.shields.io/badge/python-3.9+-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)
```

#### Topics suggérés

- `python`
- `development-tools`
- `code-quality`
- `linting`
- `formatting`
- `black`
- `flake8`
- `isort`
- `bandit`
- `pre-commit`

#### Description du repo

```
🛠️ Outils et configurations standardisées pour le développement Python - Black, isort, flake8, Bandit
```

### 4. Rendre le script install.sh exécutable

```bash
chmod +x install.sh
git add install.sh
git commit -m "fix: make install.sh executable"
git push
```

## 🔄 Utiliser dans d'autres projets

### Méthode 1 : Script d'installation

```bash
cd votre-projet
curl -sSL https://raw.githubusercontent.com/ClaraVnk/python-dev-toolkit/main/install.sh | bash
```

### Méthode 2 : Copie manuelle

```bash
# Copier les fichiers nécessaires
cp /tmp/python-dev-toolkit/configs/.flake8 .
cp /tmp/python-dev-toolkit/Makefile.template Makefile

# Ajouter les configs au pyproject.toml
cat /tmp/python-dev-toolkit/configs/pyproject.toml.template >> pyproject.toml
```

### Méthode 3 : Git submodule (avancé)

```bash
git submodule add https://github.com/ClaraVnk/python-dev-toolkit.git .dev-toolkit
ln -s .dev-toolkit/configs/.flake8 .flake8
ln -s .dev-toolkit/Makefile.template Makefile
```

## 📝 Prochaines étapes

### Pour le repo python-dev-toolkit

1. ✅ Créer le repo GitHub
2. ✅ Pousser les fichiers
3. ⬜ Créer une release v1.0.0
4. ⬜ Ajouter des exemples d'utilisation
5. ⬜ Créer une GitHub Action pour tester les configs
6. ⬜ Publier sur PyPI (optionnel, pour la v2)

### Pour openstack-toolbox

1. ⬜ Supprimer les fichiers dupliqués (.flake8, configs dans pyproject.toml)
2. ⬜ Ajouter une référence au python-dev-toolkit dans le README
3. ⬜ Utiliser le script d'installation ou copier les fichiers

## 🎉 Félicitations !

Vous avez maintenant un toolkit réutilisable pour tous vos projets Python !

## 📚 Ressources utiles

- [GitHub: Créer un repo](https://docs.github.com/en/get-started/quickstart/create-a-repo)
- [GitHub: Badges](https://shields.io/)
- [GitHub: Topics](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/classifying-your-repository-with-topics)
