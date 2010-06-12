#!/bin/sh

path="$(cygpath $2)"
old="$(cygpath --mixed --absolute "$1")"
new="$(cygpath --mixed --absolute "$2")"

#echo -e "path\n$path"
#echo -e "old\n$old"
#echo -e "new\n$new"
 
"/cygdrive/e/Program Files (x86)/DiffMerge/DiffMerge.exe" "$old" "$new" --title1="Old" --title2="New $path"
