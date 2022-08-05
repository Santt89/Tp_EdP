#!/bin/bash


PS3="Introduzca la opcion que desea utilizar: "

echo "Scripts para filtrado: "

select opcion in "statsWords.sh" "statsUsageWords.sh" "findNames.sh" "statsSentences.sh" "blankLinesCounter.sh" "salir"
do
        case $opcion in
        "statsWords.sh")
                bash /root/scripts/statsWords.sh /root/scripts/texto
            
                ;;
        "statsUsageWords.sh")
                bash /root/scripts/statsUsageWords.sh /root/scripts/texto
               
                ;;
        "findNames.sh")
                bash /root/scripts/findNames.sh /root/scripts/texto
                
                ;;
        "statsSentences.sh")
                bash /root/scripts/statsSentences.sh /root/scripts/texto
                
                ;;
	"blankLinesCounter.sh")
                bash /root/scripts/blankLinesCounter.sh /root/scripts/texto
                
                ;;
	"salir")
		break
		;;

        esac
done





      
