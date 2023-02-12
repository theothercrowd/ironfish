#!/bin/bash
echo "=================================================="
echo "############### DOWNLOADING UPDATE ###############"
echo "=================================================="
docker pull ghcr.io/iron-fish/ironfish:latest
echo "=================================================="
echo "################# STOPPING NODE ##################"
echo "=================================================="
docker stop iron_fish_node
echo "=================================================="
echo "############### REMOVING CONTAINER ###############"
echo "=================================================="
docker rm iron_fish_node
echo "=================================================="
echo "################ MIGRATIONS START ################"
echo "=================================================="
docker run -dit --name node --restart no --network host -v $HOME/.ironfish:/root/.ironfish ghcr.io/iron-fish/ironfish:latest migrations:start
echo "=================================================="
echo "################### SLEEP NOW ####################"
echo "=================================================="
sleep 6
echo "############ RM MIGRATIONS CONTAINER #############"
echo "=================================================="
docker rm node
echo "=================================================="
echo "################## START NODE ####################"
echo "=================================================="
docker run -dit --name iron_fish_node --restart always --network host -v $HOME/.ironfish:/root/.ironfish ghcr.io/iron-fish/ironfish:latest
echo "=================================================="
echo "################## ALL DONE ######################"
echo "=================================================="
