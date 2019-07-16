#!/bin/bash
VAR=$(date +"%Y-%m-%d")
find . -type f -printf "%s\t%p\n" | sort -rn | head -5
LARGEST_FILE=$(find . -type f -printf "%s\t%p\n" | sort -rn | head -1 | awk '{print $2}')
echo "largest file is ${LARGEST_FILE}"
mydir=$(echo $(dirname $LARGEST_FILE))
myfile=$(echo $(basename $LARGEST_FILE))
myfile=${VAR}_${myfile}
filetosend=$mydir/$myfile
cp $LARGEST_FILE $filetosend
mv $filetosend /tmp/

