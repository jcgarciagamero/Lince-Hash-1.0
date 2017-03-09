#!/bin/sh

#Lince HASH 1.0
#Author: José C. García Gamero.
#Date: 2017-01-14

directorio=$(pwd)
ruta=$(zenity --width=480 --height=320 --file-selection --title="Seleccione su fichero Checksum")
var1=$(echo $?)

if [ $var1 = 1 ]; then
"$directorio/LinceHash.sh"

	else hash=$(zenity --width=480 --height=320 --entry --entry-text="sha1 sha256 sha512" --text="Elija el tipo de hash a comparar")
	var3=$(echo $?)
		if [ $var3 = 1 ]; then
 			"$directorio/LinceHash.sh"
			else zenity --title="Copie solamente el hash, le hará falta a continuación" --text-info --filename="$ruta"
			var7=$(echo $?)
				
				if [ $var7 = 1 ]; then
					"$directorio/LinceHash.sh"
					else zenity --width=480 --height=320 --warning --text="Asegúrese que tanto la imagen como el Checksum están en el mismo directorio"
					mensaje=$(zenity --entry --entry-text="Péguelo aquí" --text="Pegue el hash copiado anteriormente")
					var6=$(echo $?)

						if [ $var6 = 1 ]; then
 							"$directorio/LinceHash.sh"
							else zenity --width=480 --height=320 --info --text="El proceso puede tardar unos minutos, le avisaremos cuando haya terminado"
							ruta3=$(zenity --file-selection --title="Seleccione la imagen a comparar")
							var5=$(echo $?)
		
								if [ $var5 = 1 ]; then
									"$directorio/LinceHash.sh"
									else echo $mensaje $ruta3 > $ruta 
									var4=sum
									ruta2=$($hash$var4 --ignore-missing -c $ruta)
									zenity --warning --text "$ruta2" 
									var8=$(echo $?)

									if [ $var8 = 0 ]; then
									"$directorio/LinceHash.sh"
									fi
								fi
						fi
				fi
		fi					
fi
