#!/bin/bash

# install docker
sudo apt-get update
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# pull and run the deepseek model R1 as a docker image
sudo docker run -p 5000:5000 --name deepseek-model deepseek/model-r1:latest

