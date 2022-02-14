#!/bin/bash
cd
echo "Dose to katalogos tou katalogou (default " $(pwd) ")" 
read katalogos
sleep 2

cd $katalogos

echo "Ston katalogo" $(pwd) " ta arxeia pou exoun permission apo ton xristh" $(whoami) " read kai write einai: " $(ls -l | grep -E "^drw-------" | wc -l)
echo "Ston katalogo" $(pwd) " ta arxeia pou exei permission to Group  read and write einai: " $(ls -l | grep -E "^d---rw----" | wc -l)
echo "Ston katalogo" $(pwd) " ta arxria pou den exoun oi upoloipoi permission einai: " $(ls -l | grep -E "^drwxrwx---" | wc -l)

