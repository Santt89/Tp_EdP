#!/bin/bash


ARCHIVO=$1
MOSTRAR_ARCHIVO=$(cat $ARCHIVO)



#Recibe como argumento una cadena. devuelve True si la cadena tiene 4 o mas caracteres. En caso contrario, devolvera False.
function mas_de_4 {
	PALABRA=$1
	[ ${#PALABRA} -ge 4 ]

}




#funcion que muestra solo las palabras de longitud mayor o igual a 4 de un archivo y ademas las convierte a todas en minusculas.
function mayores_a_4 {
	for PALABRA in $(cat $1)
	do
		PALABRA=$(echo $PALABRA | tr '[:upper:]' '[:lower:]')

		if (mas_de_4 $PALABRA)
		then
			echo $PALABRA
		fi
	done
}




#funcion que elimina los caracteres de puntuacion y las comillas de un texto
function elimina_especiales {
	LISTADO_PALABRAS=$(mayores_a_4 $1)
	
	for PALABRA in $LISTADO_PALABRAS
	do
        	SIN_ESPECIALES=$(echo $PALABRA | tr  "[:punct:]"  "\n" | tr "“" "\n" ) 
		echo "$SIN_ESPECIALES"
	done

}

#variable en la que se guardan las palabras recibidas de la funcion elimina_especiales en forma ordenada.
ORDENADAS=$(elimina_especiales $ARCHIVO | sort )


#funcion que retorna la cantidad de veces que aparece una palabra en un texto.Recibe dos argumentos, Una palabra y un texto
function cuantas_veces {
	PALABRA=$1
	TEXTO=$ORDENADAS
	CONTADOR=0

	for PALABRAS in $TEXTO
	do
		if [ $PALABRA == $PALABRAS ]
		then
			((CONTADOR ++))
		fi
	done

	echo $CONTADOR

}





#esta funcion devovlera el numero de la palabra que mas veces se repite en el texto
function mayor_repeticion {
	MAYOR=0
	CONTADOR=0
	for PALABRA in $ORDENADAS
	do
		for PALABRITA in $ORDENADAS
		do
			
			if [[ $PALABRA == $PALABRITA ]]
			then
				((CONTADOR++))
				
			fi

		done

		if [[ $MAYOR -le $CONTADOR ]]
		then
			MAYOR=$CONTADOR
		fi

		CONTADOR=0
	done

	echo $MAYOR

}

#funcion para comprobar si una cadena esta dentro de otra. Recibe dos argumentos, la cedena y la subcadena.
function esta_dentro { 
        if [[ $1 =~ "$2" ]]
        then
                echo "True"
        else
                echo "False"
        fi
 }

 


#funcion que imprimira un top 10 de las palabras mas usadas
function top_10 {
	MAYOR=$(mayor_repeticion)
	PALABRAS_USADAS="."
	TOP=1
	while [[ $MAYOR -ge 0 ]]
	do
		for PALABRA in $ORDENADAS
		do
			if [[ $TOP -gt 10 ]]
			then
				break
			else
				CHECK=$(esta_dentro $PALABRAS_USADAS $PALABRA)
				if [[ $CHECK == "False" ]]
				then
					PALABRAS_USADAS=$PALABRAS_USADAS$PALABRA

					REPETICION=$(cuantas_veces $PALABRA $ORDENADAS)

					if [[ $REPETICION == $MAYOR ]]
					then
						echo "Top $TOP: $PALABRA con $REPETICION apariciones."
						((TOP++))
					fi
				fi
			fi
		done
	
		MAYOR=$(($MAYOR - 1))
		PALABRAS_USADAS="."
	done
	
}

top_10

