#!/bin/bash


PS3="Introduzca la opcion que desea utilizar: "

echo "Scripts para filtrado: "

select opcion in "statsWords.sh" "statsUsageWords.sh" "findNames.sh" "statsSentences.sh" "blankLinesCounter.sh"
do
        case $opcion in
        "statsWords.sh")
                bash /root/scripts/statsWords.sh /root/scripts/texto
                break
                ;;
        "statsUsageWords.sh")
                bash /root/scripts/statsUsageWords.sh.sh /root/scripts/texto
                break
                ;;
        "findNames.sh")
                bash /root/scripts/findNames.sh /root/scripts/texto
                break
                ;;
        "statsSentences.sh")
                bash /root/scripts/statsSentences.sh /root/scripts/texto
                break
                ;;
	"blankLinesCounter.sh")
                bash /root/scripts/blankLinesCounter.sh /root/scripts/texto
                break
                ;;

        esac
done





      
