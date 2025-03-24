# run this on each node when starting an experiment

sudo apt-get update
sudo apt-get install htop dstat python3-pip
echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

pip install torch==2.5.0 torchvision==0.20.0 torchaudio==2.5.0 --index-url https://download.pytorch.org/whl/cpu
pip install numpy scipy scikit-learn tqdm pytorch_transformers apex

export WORK="/proj/cos568proj2-PG0/groups/hh2605/COS568-DistLM-SP25/"