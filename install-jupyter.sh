#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

password=$1

if [ -z "$1" ]
  then
    echo "${RED}Provide a password for your notebook as an argument!${NC}\n"
    exit
fi

# Updates
sudo apt update

# Installs pip3
sudo apt install python3-pip

# Installs Jupyter notebooks
pip3 install --no-input jupyterlab

# Configures Jupyter
echo -e "c.NotebookApp.ip = '*'" >> /.jupyter/jupyter_notebook_config.py
echo -e "c.NotebookApp.port = 80" >> /.jupyter/jupyter_notebook_config.py
echo -e "c.NotebookApp.allow_root=True" >> /.jupyter/jupyter_notebook_config.py
echo -e "c.NotebookApp.notebook_dir = './tp-sessions'" >> /.jupyter/jupyter_notebook_config.py

# Creates a login password for the notebook
printf "${password}\n${password}\n" | jupyter notebook password

# Runs jupyter notebook
nohup jupyter notebook  2>&1  &

echo "Your notebook is ready. Access your notebook using your machine's public IP address..."
echo "Your login password is ${password} do not forgot your password!"