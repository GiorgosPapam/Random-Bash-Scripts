
#!/bin/bash
read -p "Dwse to onoma tou arxeiou: " file_name


echo " My username is : " $(whoami) >> $file_name
echo " My operating system is : " $(cat /etc/os-release | grep -w Ubuntu | head -n 5) >> $file_name
echo " My home directory is" $(echo $HOME) " and contains " $(ls $HOME -p | egrep -v /$ | wc -l) " files and "  $(ls $HOME -l | grep "^d" | wc -l) "directories" >> $file_name
echo " And here is my tree of my home directory " >> $file_name
echo $(ls $HOME -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/') >> $file_name

