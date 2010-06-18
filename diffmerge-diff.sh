#!/bin/sh

path="$(cygpath $2)"

if [ "/dev/null" == $1 ]
then
    old="$(cygpath --mixed --absolute ~/diffmerge-empty)"
else
    old="$(cygpath --mixed --absolute "$1")"
fi

if [ "/dev/null" == $2 ]
then
    new="$(cygpath --mixed --absolute ~/diffmerge-empty)"
else
    new="$(cygpath --mixed --absolute "$2")"
fi

#echo -e "path\n$path"
#echo -e "old\n$old"
#echo -e "new\n$new"
 
"/cygdrive/e/Program Files (x86)/DiffMerge/DiffMerge.exe" "$old" "$new" --title1="Old" --title2="New $path"
