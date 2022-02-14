#!/bin/bash

tameio=5000
time=0
orio=-5000
pelates=0

while [ $tameio -gt 0 ] && [ $time -lt 300 ];
do
	pelates=$((pelates+1))
	read -p " Dose ton xrono tou epomenoy pelath: " time_pelati
	read -p " Dose to poso pou tha plhrwsei o pelaths: " poso
	if [ $poso -lt  $orio ]
	then
		error=$((poso*-1))
		echo " To tameio adynatei na plhrwsei " $error
		tameio=$poso
	fi
	time=$((time+time_pelati))
	tameio=$((tameio+poso))
done

echo "To tameio doulepse" $time "lepta"
echo "To tameio to episkeptikan" $pelates "pelates"
