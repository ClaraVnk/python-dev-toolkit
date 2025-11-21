#!/bin/bash
# Script d'installation du Python Dev Toolkit
# Usage: curl -sSL https://raw.githubusercontent.com/ClaraVnk/python-dev-toolkit/main/install.sh | bash

set -e

echo "🛠️  Python Dev Toolkit - Installation"
echo ""

# Couleurs
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Vérifier si on est dans un projet Python
if [ ! -f "pyproject.toml" ] && [ ! -f "setup.py" ]; then
    echo -e "${YELLOW}⚠️  Attention: Aucun fichier pyproject.toml ou setup.py trouvé.${NC}"
    echo "Êtes-vous dans un projet Python ?"
    read -p "Continuer quand même ? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Télécharger les fichiers
echo -e "${BLUE}📥 Téléchargement des configurations...${NC}"

REPO_URL="https://raw.githubusercontent.com/ClaraVnk/python-dev-toolkit/main"

# Créer les dossiers si nécessaire
mkdir -p .github/workflows

# Télécharger .flake8
if [ ! -f ".flake8" ]; then
    curl -sSL "$REPO_URL/configs/.flake8" -o .flake8
    echo -e "${GREEN}✅ .flake8 créé${NC}"
else
    echo -e "${YELLOW}⚠️  .flake8 existe déjà, ignoré${NC}"
fi

# Télécharger Makefile
if [ ! -f "Makefile" ]; then
    curl -sSL "$REPO_URL/Makefile.template" -o Makefile
    echo -e "${GREEN}✅ Makefile créé${NC}"
else
    echo -e "${YELLOW}⚠️  Makefile existe déjà, ignoré${NC}"
fi

# Télécharger .pre-commit-config.yaml (optionnel)
read -p "Installer pre-commit hooks ? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    curl -sSL "$REPO_URL/configs/.pre-commit-config.yaml" -o .pre-commit-config.yaml
    echo -e "${GREEN}✅ .pre-commit-config.yaml créé${NC}"
fi

# Ajouter les configurations au pyproject.toml
if [ -f "pyproject.toml" ]; then
    echo ""
    echo -e "${BLUE}📝 Ajout des configurations au pyproject.toml...${NC}"
    
    # Vérifier si la section dev existe déjà
    if ! grep -q "\[project.optional-dependencies\]" pyproject.toml; then
        echo "" >> pyproject.toml
        curl -sSL "$REPO_URL/configs/pyproject.toml.template" >> pyproject.toml
        echo -e "${GREEN}✅ Configurations ajoutées à pyproject.toml${NC}"
    else
        echo -e "${YELLOW}⚠️  [project.optional-dependencies] existe déjà${NC}"
        echo "Ajoutez manuellement les dépendances dev depuis:"
        echo "$REPO_URL/configs/pyproject.toml.template"
    fi
fi

echo ""
echo -e "${GREEN}✅ Installation terminée !${NC}"
echo ""
echo "📚 Prochaines étapes:"
echo "  1. Installer les outils: make dev-install"
echo "  2. Formater le code: make format"
echo "  3. Vérifier le code: make check"
echo ""
echo "Pour plus d'infos: https://github.com/ClaraVnk/python-dev-toolkit"
