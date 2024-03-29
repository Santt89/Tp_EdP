## Menu de mini aplicaciones para el analisis de texto.

Este menu será ejecutado mediante scripts de Bash.

## Que nos ofrece ?

En el actual repositorio encontraremos un Dockerfile, y una carpeta llamada scripts.

El Dockerfile será el encargado de generar un contenedor con una imagen Ubuntu que al ejecutarse presente un menu de opciones de filtrado de un texto dado.
En la carpeta llamada scripts se encontrarán los siguientes scripts de Bash:


`statsWords.sh` : Indicador estadístico de longitud de palabras (la más corta, la más larga y el
promedio de longitud).

`statsUsageWords.sh`: Indicador estadístico de uso de palabras de al menos 4(cuatro)
letras. Muestra un Top Ten de estas palabras ordenadas desde la que tiene
más apariciones a la que tiene menos.

`findNames.sh`: Identificación de nombres propios (se identifican sólo si están en este formato
Nnnnnnnnn), aunque la palabra no sea un nombre propio realmente.
Ejemplos: Mateo, Estonoesunnombre, Ana.

`statsSentences.sh`: Indicador estadístico de longitud de oraciones (la más corta, la más larga y el
promedio de longitud).

`blankLinesCounter.sh`: Contador de líneas en blanco.

`inicial.sh`: Es el encargado de presentar el menu para escojer y luego ejecutar el script seleccionado.

Además, se encontrará un archivo llamado `texto` que será el texto a analizar.

## Como funciona ?

En primer lugar debemos clonar el repositorio en nuestro equipo.



    $ git clone https://github.com/Santt89/Tp_EdP.git
    Clonando en 'Tp_EdP'...
    remote: Enumerating objects: 93, done.
    remote: Counting objects: 100% (93/93), done.
    remote: Compressing objects: 100% (80/80), done.
    remote: Total 93 (delta 41), reused 33 (delta 10), pack-reused 0  
    Desempaquetando objetos: 100% (93/93), 22.25 KiB | 615.00 KiB/s, listo.
    
    
Una vez clonado el repositorio en nuestro equipo, obtendremos el directorio Tp_EdP. Adentro del mismo se encontraran los siguientes archivos: Dockerfile, README.md, y el directorio scripts.



    $ cd Tp_EdP/
    $ ls
    Dockerfile README.md scripts 
    
    
Ahora debemos, a traves del Dockerfile, construir una imagen de Ubuntu para ejecutar nuestro menu de aplicaciones.



    $ docker build -t tp_edp .
    Sending build context to Docker daemon  230.4kB
    Step 1/4 : FROM ubuntu
    ...
    ...
    ...
    Successfully built 912fad2ae46d
    Successfully tagged tp_edp:latest
    
    
Podemos vizualisar las imagenes que tenemos creadas

    $ docker images


Una vez creado el contenedor con nuestra imagen, lo correremos y el mismo nos presentara el menu con las opciones de filtrado.


    $ docker run -it tp_edp
    Scripts para filtrado: 
    1) statsWords.sh
    2) statsUsageWords.sh
    3) findNames.sh
    4) statsSentences.sh
    5) blankLinesCounter.sh
    Introduzca la opcion que desea utilizar:
    
    
 Por ejemplo: si escojemos la opcion 5, nos devolverá la cantidad de lineas en blanco del texto.
 
 

    Scripts para filtrado: 
    1) statsWords.sh	 3) findNames.sh	  5) blankLinesCounter.sh
    2) statsUsageWords.sh	 4) statsSentences.sh
    Introduzca la opcion que desea utilizar: 5
    
    La cantidad de lineas en blanco que tiene el archivo es: 21

 
 
 
 
    






    


  

