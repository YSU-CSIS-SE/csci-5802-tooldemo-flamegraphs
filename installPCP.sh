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

# change line 21 of vector/gulp/scripts.js to : git.exec({args : 'describe --always'}, function (err, stdout) {