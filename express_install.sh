export CURRENT_DIR=$(pwd)
export HOME="/home/manoj"

echo "Installing git"
apt-get install git-all
git config --global user.name "MechCoder"
git config --global user.email "mks542@nyu.edu"

echo "Installing python3-pip"
apt-get install python3-setuptools python3-pip

echo "Installing numpy dependencies"
apt-get install libblas-dev liblapack-dev libatlas-base-dev gfortran
pip3 install ipython numpy scipy cython==0.21.0

echo "Installing matplotlib dependencies"
apt-get install libfreetype6-dev libpng-dev libjpeg8-dev
pip3 install matplotlib pandas

cd $HOME
echo "Installing sklearn from source."
git clone https://github.com/MechCoder/scikit-learn
cd scikit-learn
python3 setup.py install
git remote add upstream https://github.com/scikit-learn/scikit-learn
cd $CURRENT_DIR

echo "Installing spotify"
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
apt-get update
apt-get install spotify-client

echo "Installing atom"
wget https://github.com/atom/atom/releases/download/v1.8.0/atom-amd64.deb
dpkg --install atom-amd64.deb
rm atom-amd64.deb

echo "Installing scala"
export SCALA_VERSION="scala-2.11.6"
wget "http://www.scala-lang.org/files/archive/$SCALA_VERSION.tgz"
tar xvf $SCALA_VERSION.tgz -C /usr/local/src
rm $SCALA_VERSION.tgz

# Add to .bashrc afterwards
export SCALA_HOME="/usr/local/src/$SCALA_VERSION/bin"
export PATH=$SCALA_HOME:$PATH

echo "Installing sbt"
echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
apt-get update
apt-get install sbt

cd $HOME
git clone https://github.com/MechCoder/spark
cd spark
build/sbt package
cd $CURRENT_DIR
