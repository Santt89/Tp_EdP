#!/bin/bash

#definimos variables
PALABRA_MAS_CORTA=""
PALABRA_MAS_LARGA=""
PROMEDIO_DE_LONGITUD=0

ARCHIVO_DE_TEXTO=$1



#funcion que compara dos longitudes de palabras. Devuelve True si la primera palabra pasada como argumento tiene mayor o igual longitud que la segunda.

function compara_longitud {
	PALABRA1=$1
	PALABRA2=$2

	LONGITUD_1=${#PALABRA1}
	LONGITUD_2=${#PALABRA2}

	[ $LONGITUD_1  -ge $LONGITUD_2 ]
		
}


#Utilizaremos las variables SUMA Y CANT_PALABRAS para calcular el promedio de longitud
SUMA=0
CANT_PALABRAS=0

for PALABRA in $(cat $ARCHIVO_DE_TEXTO)
do
	if ( compara_longitud $PALABRA $PALABRA_MAS_LARGA )
	then
		PALABRA_MAS_LARGA=$PALABRA
	fi

	if ( compara_longitud $PALABRA_MAS_CORTA $PALABRA )
	then
		PALABRA_MAS_CORTA=$PALABRA
	fi

	#sumamos todas las longitudes de las palabras
	SUMA=$(($SUMA + ${#PALABRA}))

	#contamos la cantidad de palabras 
	((CANT_PALABRAS++))
					
done

#calculamos el promediod de longitud 
PROMEDIO=$(($SUMA / $CANT_PALABRAS))


echo "La palabra mas larga es: $PALABRA_MAS_LARGA"
echo "La palabra mas corta es: $PALABRA_MAS_CORTA"
echo "El promedio de longitud de palabras es: $PROMEDIO"

