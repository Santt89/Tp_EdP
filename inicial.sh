#!/bin/bash


PS3="Introduzca la opcion que desea utilizar: "

echo "Scripts para filtrado: "

select opcion in "statsWords.sh" "statsUsageWords.sh" "findNames.sh" "statsSentences.sh" "blankLinesCounter.sh"
do
        case $opcion in
        "statsWords.sh")
                echo " statsWords.sh en ejecucion. "
                break
                ;;
        "statsUsageWords.sh")
                echo " statsUsageWords.sh en ejecucion. "
                break
                ;;
        "findNames.sh")
                echo "findNames.sh en ejecucion"
                break
                ;;
        "statsSentences.sh")
                echo "statsSentences.sh en ejecucion"
                break
                ;;
	"blankLinesCounter.sh.sh")
                echo "blankLinesCounter.sh en ejecucion"
                break
                ;;

        esac
done





      
