#!/bin/sh

#Lince HASH 1.0
#Author: José C. García Gamero.
#Date: 2017-01-14

directorio=$(pwd)

ruta=$(zenity --file-selection --title="Seleccione la ruta de la imagen")
var1=$(echo $?)

if [ $var1 = 1 ]; then
	"$directorio/LinceHash.sh"
	else ruta2=$(zenity --file-selection --directory --title="Seleccione la ruta donde quiere guardar el archivo de texto")
	var3=$(echo $?)
		if [ $var3 = 1 ]; then
		"$directorio/LinceHash.sh"
		else file=$(zenity --width=360 --height=320 --list --title "Seleccione el hash a aplicar" --column Descripción "Sha1" "Sha256" "Sha512")
		var2=$(echo $?)

			if [ $var2 = 1  ]; then
			"$directorio/LinceHash.sh"

			elif [ $file = "Sha1" ]; then
	 		sudo sha1sum $ruta > "$ruta2/NuevoHash.txt"

			elif [ $file = "Sha256" ]; 
			then sudo sha256sum $ruta > "$ruta2/NuevoHash.txt"

			elif [ $file = "Sha512" ]; then
			sudo sha512sum $ruta > "$ruta2/NuevoHash.txt"
			fi
		cd "$directorio"
		zenity --title="Este es el hash realizado a tu imagen" --text-info --filename="$ruta2/NuevoHash.txt"
		zenity --question --text="¿Quiere realizar otro tipo de hash?"
 		var4=$(echo $?)
	
			if [ $var4 = 0  ]; then
			"$directorio/Linceh.sh"

			else "$directorio/LinceHash.sh"
			fi
			
			
		
		fi

fi

	

	