
#!/bin/bash
yum -y update
yum -y install epel-release
yum install -y python3 python3-pip git

#Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker vagrant
#Install Docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose



if [ $1 == "master" ]
then
  curl -sS https://bootstrap.pypa.io/get-pip.py | sudo python3
  /usr/local/bin/pip3 install ansible
  
  git https://github.com/Pintademijote/jenkins-training.git
  cd jenkins-training
  #lancement Jenkins
  docker-compose up -d
fi
echo "For this Stack, you will use $(ip -f inet addr show enp0s8 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p') IP Address"
