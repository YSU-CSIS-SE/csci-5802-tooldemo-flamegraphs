git clone --depth=1 git://git.pcp.io/pcp
cd pcp
sudo apt-get install bison -y
sudo apt-get install flex -y
udo apt-get install libmicrohttpd10 -y
sudo apt-get install libmicrohttpd-dev -y
sudo apt-get install qt4-dev-tools -y
./configure --prefix=/usr --libexecdir=/usr/lib --sysconfdir=/etc --localstatedir=/var --with-rcdir=/etc/init.d --with-webapi
make
sudo make install
sudo systemctl daemon-reload
sudo service pcp start
sudo service pmwebd start

cd ..

git clone --depth=1 https://github.com/jvm-profiling-tools/perf-map-agent
cd perf-map-agent
cmake .
make

# will create links to run scripts in <somedir>
sudo bin/create-links-in /usr/local/bin/perf-map-agent

cd ..

currentDir=$(pwd)
git clone --depth=1 https://github.com/spiermar/generic-pmda.git
sudo cp ./generic-pmda /var/lib/pcp/pmdas/generic -r
cd /var/lib/pcp/pmdas/generic
sudo ./Install

# change line 41 of vector/src/app/index.config.js to: 'enableCpuFlameGraph': true,

cd $currentDir


git clone --depth=1 https://github.com/Netflix/vector
cd vector/
sudo apt-get install nodejs -y
sudo apt-get install nodejs-dev -y
sudo apt-get install npm -y
sudo npm install -g bower
sudo ln -s /usr/bin/nodejs /usr/bin/node
bower install
npm install
sudo npm install --global gulp
git fetch -t
gulp
if [ $? -neq 0 ]
then
    exit 1
fi

# change line 21 of vector/gulp/scripts.js to : git.exec({args : 'describe --always'}, function (err, stdout) {

cd ..

mkdir -p vectorData
cd vectorData
wget https://dl.bintray.com/netflixoss/downloads/1.1.0/vector.tar.gz
tar xvzf vector.tar.gz
sudo service pmwebd stop
/usr/lib/pcp/bin/pmwebd -R . -p 8080 &

cd ..
