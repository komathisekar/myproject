#!/bin/bash
#shell script to find the largest file ,rename and copy to /tmp folder
VAR=$(date +"%Y-%m-%d")  #to find the sysdate
find . -type f -printf "%s\t%p\n" | sort -rn | head -5    #To find the top 5 large files
LARGEST_FILE=$(find . -type f -printf "%s\t%p\n" | sort -rn | head -1 | awk '{print $2}')  # Printing the Largest file in the current dirctory
echo "largest file is ${LARGEST_FILE}"
mydir=$(echo $(dirname $LARGEST_FILE))  #Getting the directoruy of largest file in a variable
myfile=$(echo $(basename $LARGEST_FILE))  #getting the filename og largest file(excluding path)
myfile=${VAR}_${myfile}  
filetosend=$mydir/$myfile
cp $LARGEST_FILE $filetosend   #copying the largest file to current_date file
mv $filetosend /tmp/  #moving to /tmp folder

