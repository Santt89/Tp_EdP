#!/bin/bash


#definimos variables
PALABRA_MAS_CORTA=""
PALABRA_MAS_LARGA=""
PROMEDIO_DE_LONGITUD=0

ARCHIVO=$1



#funcion que compara dos longitudes de cadenas de strings. Devuelve True si la primera cadena pasada como argumento tiene mayor o igual longitud que la segunda.
function compara_longitud {
	PALABRA1=$1
	PALABRA2=$2

	LONGITUD_1=${#PALABRA1}
	LONGITUD_2=${#PALABRA2}

	[ $LONGITUD_1  -ge $LONGITUD_2 ]
		
}




#funcion que recibe un archivo de texto. Hace uso de la funcion compara_longitud definida anteriormente, e imprime la palabra mas larga, mas corta y el promedio de longitud.
function principal {
	#Utilizaremos las variables SUMA Y CANT_PALABRAS para calcular el promedio de longitud
	SUMA=0
	CANT_PALABRAS=0

	for PALABRA in $(cat $1)
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

}

principal $ARCHIVO
