#!/bin/bash

OUTPUT_NAME="sauerbraten_2020_12_27_linux.tar.bz2"
URL="https://downloads.sourceforge.net/project/sauerbraten/sauerbraten/2020_11_29/sauerbraten_2020_12_27_linux.tar.bz2?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fsauerbraten%2Ffiles%2Flatest%2Fdownload&ts=1613343089"

echo "installiere pakete..."
yum install SDL2 SDL2_mixer SDL2_image zlib libpng libjpeg libGL

cd ~
echo "erstelle Verzeichnis SB für sauerbraten..."
mkdir -p ~/SB/
cd ~/SB/

echo "Lade sauerbraten herunter..."
curl -L -s -C - $URL -o $OUTPUT_NAME

if [ -e "./sauerbraten/sauerbraten_unix" ]; then
        echo "überspringe entpacken, da es schon extrahiert ist..."
else
        echo "entpacke sauerbraten..."
        tar xjf $OUTPUT_NAME
fi

cd ~/SB/sauerbraten

echo "starte sauerbraten..."
./sauerbraten_unix
