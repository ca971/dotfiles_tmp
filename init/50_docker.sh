# sudo caches the password for a few minutes
sudo true

# Install Docker
sudo apt-get update -y
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo groupadd docker
sudo usermod -aG docker $USER


# Install Docker Compose
compose_release() {
  curl --silent "https://api.github.com/repos/docker/compose/releases/latest" |
  grep -Po '"tag_name": "\K.*?(?=")'
}

if ! [ -x "$(command -v docker-compose)" ]; then
  curl -L https://github.com/docker/compose/releases/download/$(compose_release)/docker-compose-$(uname -s)-$(uname -m) \
  -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
fi
