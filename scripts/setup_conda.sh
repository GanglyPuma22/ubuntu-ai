#!/bin/bash
set -e

cd /tmp
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda
ln -s /opt/miniconda/bin/conda /usr/local/bin/conda
echo 'export PATH="/opt/miniconda/bin:$PATH"' >> /etc/skel/.bashrc
