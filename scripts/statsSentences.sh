#!/bin/bash




#definimos variables
ORACION_MAS_CORTA=""
ORACION_MAS_LARGA=""
PROMEDIO_DE_LONGITUD=0
ARCHIVO=$1


#funcion que toma dos cadenas y las concatena dejando un especio entre ellas.
function concatenar {
	CADENA1=$1
	CADENA2=$2

	CADENA_UNIDA=$1" "$2
	echo $CADENA_UNIDA

}

#funcion que devuelve que recibe una cadena y devuelve su longitud.
function largo {
       CADENA=$1
       LARGO=${#CADENA}
       echo $LARGO

}



#esta funcion recibe una palabra y en caso de tener tildes, devuelve la misma sin tildes y con el caracter que lo tenia duplicado (no afectara en nada al uso que le daremos)
function elimina_tildes {
       PALABRA=$1
       PAL_SIN_TILDES=$(echo $PALABRA | tr '[áÁ]' '[a]' | tr '[éÉ]' 'e' | tr '[íÍ]' 'i' | tr '[óÓ]' 'o' | tr '[úÚ]' 'u')
	echo $PAL_SIN_TILDES


}



#funcion que checkea si el ultimo caracter de una cadena es un punto. En caso de serlo devuelve True, en caso contrario False
function es_punto {
       	CADENA=$1
       	LARGO_CADENA=${#CADENA}
       	ULTIMO=$(echo $CADENA | cut -c ${#CADENA})
       	if [[ $ULTIMO == [.?!] ]]
       	then
       		echo "True"
       	else
       		echo "False"
       	fi

}


#funcion que compara dos longitudes de cadenas. Devuelve True si la primera cadena pasada como argumento tiene mayor o igual longitud que la segunda.

function compara_longitud {
       CADENA1=$1
       CADENA2=$2

       LONGITUD_1=${#CADENA1}
       LONGITUD_2=${#CADENA2}

       if [[ $LONGITUD_1  -ge $LONGITUD_2 ]]
       then
	       echo "True"
       else
	       echo "False"
       fi
       	


}

 

#funcion que utiliza las funciones definidas anteriormente y calcula cual es la oracion mas larga, la mas corta y cual es el promedio de caracteres.
function principal {
	SUMA=0
	CANT_ORACIONES=0
	ORACION=""

	for PALABRA in $(cat $1)
	do
		PALABRA_SIN_TILDES=$(elimina_tildes $PALABRA)

		if [[ $(es_punto $PALABRA_SIN_TILDES) == "False" ]]
       		then
		       ORACION=$ORACION" "$PALABRA
	       	else	
	       		ORACION=$ORACION" "$PALABRA
			
			LONGITUD_1=${#ORACION}
		       	LONGITUD_2=${#ORACION_MAS_LARGA}
			LONGITUD_3=${#ORACION_MAS_CORTA}

      			if [ $LONGITUD_1  -ge $LONGITUD_2 ]
			then
				ORACION_MAS_LARGA=$ORACION
       			fi

			#hacemos esto para que la viariable ORACION_MAS_LARGA tome como primer valor la primer oracion.
			if [[  $CANT_ORACIONES == 1 ]]
			then
				ORACION_MAS_CORTA=$ORACION
			fi

			if [ $LONGITUD_3  -ge $LONGITUD_1 ]
			then
       				ORACION_MAS_CORTA=$ORACION
       			fi

       			#sumamos todas las longitudes de las oraciones
       			SUMA=$(($SUMA + ${#ORACION}))

       			#contamos la cantidad de oraciones
       			((CANT_ORACIONES++))

       			#volvemos a inicializar vacia la variable oracion	
			ORACION=""
       	fi

	done




	#calculamos el promedio de longitud 
	PROMEDIO_DE_LONGITUD=$(($SUMA / $CANT_ORACIONES))

	echo "La oracion mas larga es: $ORACION_MAS_LARGA"
	echo " ------------------------"
	echo "La oracion mas corta es: $ORACION_MAS_CORTA"
	echo "-------------------------"
	echo "El promedio de longitud de oraciones es: $PROMEDIO_DE_LONGITUD"

}

principal $ARCHIVO
