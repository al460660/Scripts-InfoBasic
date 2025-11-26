#!/bin/bash
if [ $# != 2 -a $# != 3 ]; then
	echo "Modo de uso: ./mySpace.sh umbral unidad [ directorio ]"
	exit 0
	
fi

case $1 in
	*[!0-9]*)
		echo "Se requiere un número entero, pero se ha proporcionado: $1"
		exit 1 ;;
esac

case $2 in
	k|K)
	mult=1024 ;;
	b|B)
	mult=1 ;;
	m|M)
	mult=1048576 ;;
	*)
	echo "Unidad de medida no válida: By. Se requiere b, B, k, K, m o M"
	exit 2;;
esac

if [ $# = 3 ]; then
	if [ -d "$3" ]; then
		carpeta="$3"
	else
		echo "Directorio $3 no existe o bien no es un directorio"
		exit 3
	fi
else 
	carpeta=.
fi

