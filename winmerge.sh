#!/bin/sh
# using winmerge with git
# replaces unix style null files with a newly created empty windows temp file

fileStatus="Modified"
fileName=$4

file1=$3
if [ "$file1" == '/dev/null' ] || [ "$file1" == '\\.\nul' ] || [ ! -e "$file1" ]
    then 
       file1="/tmp/gitnull"
	   fileStatus="Added"
       `echo "">$file1`
fi
file2=$4
if [ "$file2" == '/dev/null' ] || [ "$file2" == '\\.\nul' ] || [ ! -e "$file2" ]
    then 
       file2="/tmp/gitnull"
	   fileStatus="Deleted"
	   fileName=$3
       `echo "">$file2`
fi
echo diff: [$fileStatus] $fileName
"C:\Program files (x86)\WinMerge\WinMergeU.exe" -e -u -dl "Base" -dr "Mine" "$file1" "$file2"
