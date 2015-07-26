apt-get update
apt-get dist-upgrade -qy

echo "deb http://packages.erlang-solutions.com/debian jassie contrib" | sudo tee /etc/apt/sources.list.d/erlang.list
wget -q -O- "http://packages.erlang-solutions.com/debian/erlang_solutions.asc" | sudo apt-key add -
apt-get update
apt-get install erlang git build-essential -qy

curl -OL https://nodejs.org/dist/v0.12.7/node-v0.12.7-linux-x64.tar.gz
mkdir /opt/nodejs
tar -xzvf node-v0.12.7-linux-x64.tar.gz -C /opt/nodejs
rm node-v0.12.7-linux-x64.tar.gz
ln -s /opt/nodejs/node-v0.12.7-linux-x64/bin/node /usr/bin/node
ln -s /opt/nodejs/node-v0.12.7-linux-x64/bin/npm /usr/bin/npm

npm install --global elm
