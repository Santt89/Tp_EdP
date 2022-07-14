#!/bin/bash


#PALABRA=$1" "$2
#echo $PALABRA
#substring=$(echo $PALABRA | tr [:lower:] [:upper:] )
#echo $substring

PALABRA=$1


PALABRA=$(echo $PALABRA | tr 'á' 'a' )
echo $PALABRA


