#!/bin/bash

#definimos variables
ARCHIVO=$1
MOSTRAR_ARCHIVO=$(cat $ARCHIVO)



#funcion que recibe un archivo de texto e imprime cada palabra, en caso que tenga simbolos de puntuacion se los quitara. 
function elimina_especiales {
      	LISTADO_PALABRAS=$(cat $1)

        for PALABRA in $LISTADO_PALABRAS
        do
                SIN_ESPECIALES=$(echo $PALABRA | tr  "[:punct:]"  "\n" | tr "“" "\n" )
                echo "$SIN_ESPECIALES"
        done

}



#funcion que recibe una cadena y la transforma en minusculas.
function minusculas {
	CADENA=$1
	CADENA_MINUSCULA=$(echo $CADENA | tr  [:upper:] [:lower:])
	echo $CADENA_MINUSCULA

}

#funcion que recibe una letra y verifica si es mayuscula.
function mayuscula {
        STRING=$1
       	if [[ $STRING == [A-Z] ]]
	then
		echo "True"
	else
		echo "False"
	fi

}




#funcion que recibe dos cadenas y las compara. Devuelve True si son iguales, False en caso contrario.
function son_iguales {
	CADENA1=$1
	CADENA2=$2

	if [ $CADENA1 == $CADENA2 ]
	then
		echo "True"
	else
		echo "False"
	fi
}



#funcion que recibe una cadena y la devuelve sin el primer caracter.
function sacar_primer {
	CADENA=$1
	CADENA_SIN_PRIMERA=$(echo $CADENA | sed -e 's/^.//')
	echo $CADENA_SIN_PRIMERA

}



#funcion que recibe una cadena y devuelve el primer caracter
function primer_caracter {
	
	CADENA=$1
	PRIMER=$(echo $CADENA | cut -c 1)
	echo $PRIMER

}


#la funcion usara las funciones definidas anteriormente y en base a ellas imprimira solo las cadenas que comienzen con una letra en mayuscula y el resto sean minusucula
function empieza_con_mayus {
	LISTADO_PALABRAS=$(elimina_especiales $1)
	for PALABRA in $LISTADO_PALABRAS
	do
		if [ ${#PALABRA} -gt 2 ]
		then
		
			PRIMER_CARACTER=$(primer_caracter $PALABRA)
			PRIMER_CARACTER_MAY=$(mayuscula $PRIMER_CARACTER)

			if [[ $PRIMER_CARACTER_MAY == "True" ]]
			then
				CADENA_SIN_PRIMER=$(sacar_primer $PALABRA)
				CADENA_MAYUS=$(minusculas $CADENA_SIN_PRIMER)
				SON_IGUALES=$(son_iguales $CADENA_SIN_PRIMER $CADENA_MAYUS)
				if [[ $SON_IGUALES == "True" ]]
				then
					echo $PALABRA
				fi
			fi
		fi
	done


}

echo "Nombres Propios:"
empieza_con_mayus $ARCHIVO

