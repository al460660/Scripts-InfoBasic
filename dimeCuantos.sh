#!/bin/bash
if [ $# = 0 ]; then
	echo "Modo de uso: ./dimeCuantos.sh extension [ directorio_1 ] ... [ directorio_n ]"
	exit 0
fi

ficheros=0
bytes=0

for dir in "${@:2}"; do
	if [ -d "$dir" ]; then
		temp=$(mktemp)
		ls -l "$dir" > $temp
		while IFS=" " read a b c d e f g h i; do
			if [ -f "$dir/$i" ] && [[ "$i" == *."$1" ]];then
				let ficheros=ficheros+1
				#echo "ficheros = $ficheros"
				let bytes=bytes+e
				#echo "bytes = $bytes"
			fi   
		done < $temp
		rm $temp
	fi
done

if [ $ficheros = 0 ]; then 
	echo "No hay ficheros con la extensión: $1 en ninguno de los directorios indicados"
else
	echo -e "Se han encontrado $ficheros ficheros con extension: $1"
        echo -e "\tOcupan $(echo "scale=4; $bytes/1024/1024" | bc) MiB en disco"
fi

