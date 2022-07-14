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




#funcion que retorna la cantidad de veces que aparece una palabra en un texto.Recibe dos argumentos, Una palabra y un texto
function cuantas_veces {
	PALABRA=$1
	TEXTO=$(elimina_especiales $2)
	CONTADOR=0

	for PALABRAS in $TEXTO
	do
		#pasamos las palabras a minusculas para no tenes inconvenientes

		PALABRA=$(echo $PALABRA | tr '[:upper:]' '[:lower:]')
		PALABRAS=$(echo $PALABRAS | tr '[:upper:]' '[:lower:]')
	
		if [ $PALABRA == $PALABRAS ]
		then
			((CONTADOR ++))
		fi
	done

	echo $CONTADOR

}





#funcion que crea una lista ordenada(de mayor a menor) con las cantidades de veces que aparecen las palabras de longitud mayoro o igual a 4 en el texto
function cantidad_veces { 
	declare -a apariciones=()
	PALABRAS_USADAS="s"
	CANTIDAD=0
	TEXTO=$(elimina_especiales $1)

	for PALABRA in $TEXTO
	do
		if (mas_de_4 $PALABRA)
		then
			if [[ ! "$PALABRAS_USADAS" =~ "$PALABRA" ]]
			then
				PALABRAS_USADAS=$PALABRAS_USADAS$PALABRA


				CANTIDAD=$(cuantas_veces $PALABRA $ARCHIVO)
				apariciones=("${apariciones[@]}" "$CANTIDAD")
			fi
		fi
	done

		 apariciones_sorted=$(for i in ${apariciones[@]} ; do echo $i; done | sort -r)
        	echo ${apariciones_sorted[@]}

	
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



#la funcion dira cuantas veces se utilizo cada palabra en orden
function cuantas_veces_se_uso {
	PUESTO=1

	CANTIDAD_PALABRAS="s"
	PALABRAS_USADAS="s"

	PALABRAS_LARGAS=$(mayores_a_4 $1)
	LISTA_PALABRAS=$(elimina_especiales $1)
	CANTIDAD=$(cantidad_veces $1)

	for NUMERO in $CANTIDAD
	do
		CANTIDAD_PALABRAS="a"
		for PALABRA in $LISTA_PALABRAS
		do
			#para que solo imprima los primeros 10 lugares
			if [ $PUESTO -le 10 ]
			then
				CHECK_PALABRA_USADA=$(esta_dentro $PALABRAS_USADAS $PALABRA)
				if [[  $CHECK_PALABRA_USADA == "False" ]]
				then
					CHECK_PALABRA=$(esta_dentro $CANTIDAD_PALABRAS $PALABRA)
					if [[ $CHECK_PALABRA == "False" ]]
					then
						CANTIDAD_PALABRAS=$CANTIDAD_PALABRAS$PALABRA
						VECES=$(cuantas_veces $PALABRA $1)      
                                		if [ $VECES -eq $NUMERO ]
                                		then
                                    			echo "Top $PUESTO: $PALABRA. Apariciones: $NUMERO"
				    			PALABRAS_USADAS=$PALABRAS_USADAS$PALABRA
							((PUESTO++))
					
                         	   		fi
					fi
				fi
			fi
		done		
	done	

}

cuantas_veces_se_uso $ARCHIVO	





