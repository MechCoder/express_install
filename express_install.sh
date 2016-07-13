apt-get install git-all
git config --global user.name "MechCoder"
git config --global user.email "mks542@nyu.edu"
apt-get install python3-setuptools python3-pip
apt-get install libblas-dev liblapack-dev libatlas-base-dev gfortran
pip3 install ipython numpy scipy cython==0.21.0
apt-get install libfreetype6-dev libpng-dev libjpeg8-dev
pip3 install matplotlib pandas

git clone https://github.com/MechCoder/scikit-learn
cd scikit-learn
python3 setup.py install
git remote add upstream https://github.com/scikit-learn/scikit-learn
cd ..

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
apt-get update
apt-get install spotify-client
