set -x
env
HOSTNAME=$( uname -n )
perl -i -pe "s/^(127.0.0.1 .*)/\1 $HOSTNAME/" /etc/hosts

apt-get update

apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update
apt-get install -y docker-ce
usermod -aG docker ubuntu
#apt upgrade -y
shutdown -r now
