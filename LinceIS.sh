#!/bin/sh

#Lince HASH 1.0
#Author: José C. García Gamero.
#Date: 2017-01-14
#E-Mail: josecarlos@ims4c.com

directorio=$(pwd)
cd /dev
zenity --info --text="A continuación se mostrarán los discos y particiones de su equipo. Apunte o recuerde la ruta del disco al que quiere crear la imagen" 
sudo fdisk -l > "$directorio/Discos.txt"
zenity --title="Si deseas hacer la imagen de un disco, recuerda la ruta del disco al que quieres crear la imagen" --text-info --filename="$directorio/Discos.txt"
var8=$(echo $?) 

if [ $var8 = 1 ]; then
	cd "$directorio"
	"$directorio/LinceHash.sh" 
	else ruta=$(zenity --file-selection --title="Seleccione la ruta del disco al que quiere crear la imagen")
	var3=$(echo $?)
 		if [ $var3 = 1 ]; then
 		cd "$directorio" 
		"$directorio/LinceHash.sh" 
		else ruta2=$(zenity --file-selection --directory --title="Seleccione la ruta donde quiere guardar la imagen")
		var4=$(echo $?)
				
				if [ $var4 = 1 ]; then 
				cd "$directorio"
				"$directorio/LinceHash.sh" 
				else zenity --info --text="El proceso tardará un poco, dependiendo del tamaño de la imagen. Le avisaremos cuando hayamos acabado." 
   				sudo dd if="$ruta" of="$ruta2/ImagenDisco.iso"   			
				zenity --info --text="¡El proceso se ha llevado a cabo con exito!. Vamos a proceder a realizar el hash de la imagen" 
				zenity --info --text="El proceso tardará un poco. Le avisaremos, cuando hayamos acabado." 
				hash=$(zenity --width=360 --height=320 --list --title "Seleccione el hash a aplicar" --column Descripción "Sha1" "Sha256" "Sha512")
				var5=$(echo $?)   			   	
   					if [ $var5 = 1 ]; then
   					cd "$directorio"
   					"$directorio/LinceHash.sh" 
 					elif [ $hash = "Sha1" ]; then
	 				sudo sha1sum "$ruta2/ImagenDisco.iso" > "$ruta2/Hash.txt"

					elif [ $hash = "Sha256" ]; 
					then sudo sha256sum "$ruta2/ImagenDisco.iso" > "$ruta2/Hash.txt"

					elif [ $hash = "Sha512" ]; then
					sudo sha512sum "$ruta2/ImagenDisco.iso" > "$ruta2/Hash.txt"
					fi
 				
 				cd "$directorio"
 				zenity --title="Este es el hash de la imagen realizada" --text-info --filename="$ruta2/Hash.txt"
 				zenity --question --text="¿Quiere realizar otro tipo de hash?"
 				var2=$(echo $?)
 	
 					if [ $var2 = 1 ]; then
 					"$directorio/LinceHash.sh"  
 					else "$directorio/Linceh.sh"
 					fi
 					
 				fi
 			
 		fi
fi				



