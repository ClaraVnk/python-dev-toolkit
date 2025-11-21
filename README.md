# 🛠️ Python Dev Toolkit

Un ensemble d'outils et de configurations standardisées pour le développement Python.

## 📋 Fonctionnalités

- ✅ **Formatage automatique** avec Black et isort
- ✅ **Linting** avec flake8
- ✅ **Analyse de sécurité** avec Bandit
- ✅ **Configurations pré-configurées** et prêtes à l'emploi
- ✅ **Makefile** avec commandes standardisées
- ✅ **Pre-commit hooks** (optionnel)

## 🚀 Installation rapide

### Via PyPI (recommandé)

```bash
# Installer le package avec les outils de développement
pip install devtools-claravnk[dev]
```

Cette commande installe automatiquement :

- Black (formatage)
- isort (tri des imports)
- flake8 (linting)
- Bandit (sécurité)

### Via script d'installation

```bash
# Dans votre projet Python
curl -sSL https://raw.githubusercontent.com/ClaraVnk/python-dev-toolkit/main/install.sh | bash
```

### Installation manuelle

```bash
# Cloner le repo
git clone https://github.com/ClaraVnk/python-dev-toolkit.git /tmp/python-dev-toolkit

# Copier les fichiers dans votre projet
cd votre-projet
cp /tmp/python-dev-toolkit/configs/.flake8 .
cp /tmp/python-dev-toolkit/Makefile.template Makefile
```

## 📦 Installation des outils

```bash
# Installer les outils de développement
pip install black isort flake8 bandit
```

Ou ajoutez à votre `pyproject.toml` :

```toml
[project.optional-dependencies]
dev = [
    "bandit[toml]>=1.7.5",
    "isort>=5.12.0",
    "black>=23.0.0",
    "flake8>=6.0.0",
]
```

## 🔧 Utilisation

### Commandes Make disponibles

```bash
make format    # Formater le code (isort + black)
make lint      # Vérifier le style (flake8)
make security  # Vérifier la sécurité (bandit)
make check     # Tout vérifier (format + lint + security)
make clean     # Nettoyer les fichiers temporaires
```

### Configuration personnalisée

#### Black

Éditez `pyproject.toml` :

```toml
[tool.black]
line-length = 88
target-version = ['py39']
```

#### isort

```toml
[tool.isort]
profile = "black"
line_length = 88
```

#### flake8

Éditez `.flake8` :

```ini
[flake8]
max-line-length = 88
extend-ignore = E203,W503
```

#### Bandit

```toml
[tool.bandit]
exclude_dirs = ["/tests"]
```

## 🎯 Workflow recommandé

### Avant chaque commit

```bash
make check
```

### Avec pre-commit hooks (optionnel)

```bash
# Installer pre-commit
pip install pre-commit

# Copier la config
cp /tmp/python-dev-toolkit/configs/.pre-commit-config.yaml .

# Installer les hooks
pre-commit install

# Les hooks s'exécuteront automatiquement à chaque commit
```

## 📁 Structure du projet

```
python-dev-toolkit/
├── README.md                      # Ce fichier
├── LICENSE                        # Licence MIT
├── install.sh                     # Script d'installation
├── configs/
│   ├── .flake8                   # Configuration flake8
│   ├── pyproject.toml.template   # Template pyproject.toml
│   └── .pre-commit-config.yaml   # Pre-commit hooks
├── Makefile.template              # Template Makefile
└── examples/
    └── sample-project/            # Exemple d'utilisation
```

## 🔍 Configurations incluses

### Flake8

- Longueur de ligne : 88 caractères (compatible Black)
- Ignore E203, W503 (incompatibles avec Black)
- Ignore E501, F401, F841 (configurable)

### Black

- Longueur de ligne : 88 caractères
- Target Python 3.9+
- Format uniforme et déterministe

### isort

- Profile "black" (compatible)
- Tri automatique des imports
- Groupes : stdlib → third-party → local

### Bandit

- Analyse de sécurité du code
- Détection des vulnérabilités communes
- Exclut les dossiers de tests

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à :

1. Fork le projet
2. Créer une branche (`git checkout -b feature/amelioration`)
3. Commit vos changements (`git commit -m 'Ajout fonctionnalité'`)
4. Push vers la branche (`git push origin feature/amelioration`)
5. Ouvrir une Pull Request

## 📝 Licence

MIT License - voir le fichier [LICENSE](LICENSE)

## 🙏 Crédits

Créé par [@ClaraVnk](https://github.com/ClaraVnk)

Inspiré par les meilleures pratiques de la communauté Python.

## 📚 Ressources

- [Black Documentation](https://black.readthedocs.io/)
- [isort Documentation](https://pycqa.github.io/isort/)
- [flake8 Documentation](https://flake8.pycqa.org/)
- [Bandit Documentation](https://bandit.readthedocs.io/)
- [Pre-commit Documentation](https://pre-commit.com/)
