#!/bin/bash

# Text color variables
red=$'\e[0;91m'
grn=$'\e[0;92m'
yel=$'\e[0;93m'
blu=$'\e[0;94m'
mag=$'\e[0;95m'
cyn=$'\e[0;96m'
end=$'\e[0m'

echo ""
echo "======================================="
echo "  MyLibrary Pods Repo Push Script"
echo "              created by JosephNK"
echo "======================================="

while true; do
    read -p "${yel}Continue?${end} " yn
    case $yn in
        [Yy]* ) echo ""; break;;
        [Nn]* ) echo ""; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true; do
    read -p "${red}Do you want to run it?${end} " yn
    case $yn in
        [Yy]* ) echo ""; break;;
        [Nn]* ) echo ""; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

pod repo push MyLibrary MyLibrary.podspec --verbose
