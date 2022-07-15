#!/bin/bash 


ARCHIVO=$1


#funcion que devuelve la cantidad de lineas que el archivo NO tiene en blanco
function lineas_con_algo {
	echo $(grep -v '^\s*$' $1 | wc -l )



}

#funcion que devuelve la cantidad de lineas que tiene un archivo en total

function lineas {
	echo $(cat $1 | wc -l)

}

LINEAS_NO_EN_BLANCO=$(lineas_con_algo $ARCHIVO)
TODAS_LAS_LINEAS=$(lineas $ARCHIVO)

#restamos el total de lineas y la cantidad de lineas NO en blanco, y como resultado nos dara cuantas lineas en blanco tiene el archivo


LINEAS_BLANCO=$(($TODAS_LAS_LINEAS - $LINEAS_NO_EN_BLANCO))
echo "La cantidad de lineas en blanco que tiene el archivo es: $LINEAS_BLANCO"
