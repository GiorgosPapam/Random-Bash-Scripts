#!/bin/bash


declare -A array1
declare -A array2
declare -A array3
cat_count=0
c1=0
c2=0
c3=0
c4=0
c5=0
c6=0
read -p  "Thelete na Xekinisete ?(Y,N): " apanthsh
while [ "$apanthsh" != "Y" ] && [ "$apanthsh" != "y" ] && [ "$apanthsh" != "N" ] && [ "$apanthsh" != "n" ];
do
	read -p  "Dose swsth apanthsh Y or N: " apanthsh
done
while [ "$apanthsh" == "Y" ] || [ "$apanthsh" == "y" ];
do
	read -p "Dose ton proto arithmo (0-7): " num1

	while [ $num1 -gt 7 ] || [ $num1 -lt 0 ];
	do
		read -p "Prepei na einai metaxei tou 0 kai tou 7: " num1
	done
	array2[$cat_count]=$num1
	 
	read -p "Dose ton deytero arithmo: " num2
	array3[$cat_count]=$num2
	cd
	echo "Dose to onoma tou katalogou (default " $(pwd) ")" 
	read onoma
	if [ "$onoma" == "" ] 
	then
		array1[$cat_count,0]=$PWD
	else
		array1[$cat_count,0]=$onoma
	fi
	cd $onoma
	echo
	echo
	echo
	echo
	
	echo "                                    1"
	echo " Ta arxeia tou dentrou me permission" $num1 " einai: " $(find $PWD . \( ! -regex '.*/\..*' \) -perm /$num1 | wc -l) " kai ta arxeia einai ta : "
	find $PWD -perm /$num1
	c1=$((c1+$(find $PWD . \( ! -regex '.*/\..*' \) -perm /$num1 | wc -l)))
	array1[$cat_count,1]=$(find $PWD . \( ! -regex '.*/\..*' \) -perm /$num1 | wc -l)
	echo
	echo
	echo
	echo
	echo
	
	echo "                                    2"
	echo "Ta arxeia tou katalogou pou allaxan tis teleytaies" $num2 "meres einai: " $(find $PWD . \( ! -regex '.*/\..*' \) -mtime -$num2 -ls | wc -l) "kai einai ta : "
	
	find $PWD . \( ! -regex '.*/\..*' \) -mtime -$num2 -ls
	c2=$((c2+$(find $PWD . \( ! -regex '.*/\..*' \) -mtime -$num2 -ls | wc -l)))
	array1[$cat_count,2]=$(find $PWD . \( ! -regex '.*/\..*' \) -mtime -$num2 -ls | wc -l)
	echo
	echo
	echo
	echo
	echo
	echo "                                    3"
	echo "Tis teleytaies " $num2 " meres prospelasthkan " $(find $PWD . \( ! -regex '.*/\..*' \) -atime -1 -type f | wc -l) "arxeia kai einai ta: "
	
	find $PWD . \( ! -regex '.*/\..*' \) -atime -1 -type f
	c3=$((c3+$(find $PWD . \( ! -regex '.*/\..*' \) -atime -1 -type f | wc -l)))
	array1[$cat_count,3]=$(find $PWD . \( ! -regex '.*/\..*' \) -atime -1 -type f | wc -l)
	echo
	echo
	echo
	echo
	echo
	echo "                                    4"
	echo "Ta arxeia typou socket einai :" $(find $PWD . \( ! -regex '.*/\..*' \) -type s | wc -l ) " kai einai ta :"
	find $PWD . \( ! -regex '.*/\..*' \) -type s
	c4=$((c4+$(find $PWD . \( ! -regex '.*/\..*' \) -type s | wc -l)))
	array1[$cat_count,4]=$(find $PWD . \( ! -regex '.*/\..*' \) -type s | wc -l ) 
	echo
	echo
	echo "Ta arxeia typou pipe einai :" $(find $PWD . \( ! -regex '.*/\..*' \) -type p | wc -l ) " kai einai ta : "
	find $PWD . \( ! -regex '.*/\..*' \) -type p
	c5=$((c5+$(find $PWD . \( ! -regex '.*/\..*' \) -type p | wc -l)))
	array1[$cat_count,5]=$(find $PWD . \( ! -regex '.*/\..*' \) -type p | wc -l ) 
	echo
	echo
	echo
	echo
	echo
	echo "                                    5"
	echo "Oi kenoi katalogoi einai : " $(find $PWD . \( ! -regex '.*/\..*' \)  -type d -empty | wc -l ) " kai einai oi : "
	find $PWD . \( ! -regex '.*/\..*' \)  -type d -empty 
	c6=$((c6+$(find $PWD . \( ! -regex '.*/\..*' \)  -type d -empty | wc -l)))
	array1[$cat_count,6]=$(find $PWD . \( ! -regex '.*/\..*' \)  -type d -empty | wc -l ) 

	read -p  "Thelete na sunexisete ?(Y,N): " apanthsh
	while [ "$apanthsh" != "Y" ] && [ "$apanthsh" != "y" ] && [ "$apanthsh" != "N" ] && [ "$apanthsh" != "n" ];
	do
		read -p  "Dose swsth apanthsh Y or N: " apanthsh
	done
	cat_count=$((cat_count+1))




done
echo "To synolo twn eurethentwn arxeiwn einai: "
echo " (1) " $c1
echo " (2) " $c2
echo " (3) " $c3
echo " (4) " "socket: "$c4 "pipe: "$c5
echo " (5) " $c6

echo
echo
echo
echo
echo

c=`expr $cat_count - 1 `

for i in $(seq 0 1 $c)
do
        for j in 0 1 2 3 4 6
        do
                if [ "$j" -eq "0" ]
                then
                	echo -n "${array1[$i,$j]} "
                	echo
                elif [ $j -eq 1 ]
                then
                	echo -n "Ta arxeia me perimission " ${array2[i]} "htan: " "${array1[$i,$j]} "
                	echo
                elif [ $j -eq 2 ]
                then
                	echo -n "Ta arxeia pou allaxan tis  teleytaies" ${array3[i]} "meres htan: " "${array1[$i,$j]} "
                	echo
                elif [ $j -eq 3 ]
                then
                	echo -n "Ta arxeia pou prospelasthkan tis teleytaies" ${array3[i]} "meres htan: " "${array1[$i,$j]} "
                	echo
                elif [ $j -eq 4 ]
                then
                	echo -n "Ta socket arxeia htan: " "${array1[$i,$j]} "
                	echo
                	echo -n "Ta pipe arxeia htan: " "${array1[$i,5]} "
                	echo
                elif [ $j -eq 6 ]
                then
                	echo -n "Ta kena directories htan: " "${array1[$i,$j]} "
                	echo
                fi
        done
        echo
done






