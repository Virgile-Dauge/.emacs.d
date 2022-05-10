

# Il faut installer aspell ainsi que le dictionnaire français.


# [[file:readme.org::*Orthographe][Orthographe:3]]
sudo apt install aspell aspell-fr
# Orthographe:3 ends here

# Pandoc, multi format

#       We need to install last version of pandoc from https://github.com/jgm/pandoc/releases/

# [[file:readme.org::*Pandoc, multi format][Pandoc, multi format:1]]
sudo apt install pandoc
# Pandoc, multi format:1 ends here

# Python
# Installation de la backend python
# https://github.com/python-lsp/python-lsp-server

# [[file:readme.org::*Python][Python:1]]
pip install python-lsp-server[all] pyls-mypy pyls-memestra
# Python:1 ends here

# [[file:readme.org::*Python][Python:2]]
sudo apt install libjansson-dev
# Python:2 ends here

sudo pip install pyflakes pep8
