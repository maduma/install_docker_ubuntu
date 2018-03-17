set -x

perl -i -pe 's/^(127.0.0.1 .*)/\1 docker/' /etc/hosts

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
docker run --rm hello-world
usermod -aG docker ubuntu
shutdown -r now
