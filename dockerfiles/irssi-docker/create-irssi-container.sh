docker build -t irssi:1.4.5 < Dockerfile
#docker compose build
docker image save irssi:1.4.5 -o irssi-image

