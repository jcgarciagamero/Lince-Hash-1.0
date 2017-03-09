#!/bin/sh

#Lince HASH 1.0
#Author: José C. García Gamero.
#Date: 2017-01-14

directorio=$(pwd)
sudo chmod +x "$directorio/Linceh.sh"
sudo chmod +x "$directorio/LinceIS.sh"
sudo chmod +x "$directorio/LinceComp.sh"

file=$(zenity --width=480 --height=320 --list --title "Lince Hash 1.0" --column Descripción "Imagen de disco Y Hash" "Calcular hash de imagen" "Comparar Hash")
var1=$(echo $?)


if [ $var1 = 1 ]; then
	exit

elif [ "$file" = "Imagen de disco Y Hash" ]; then
	"$directorio/LinceIS.sh"

elif [ "$file" = "Calcular hash de imagen" ]; then
	"$directorio/Linceh.sh"

elif [ "$file" = "Comparar Hash" ]; then
	"$directorio/LinceComp.sh"

fi
exit 
