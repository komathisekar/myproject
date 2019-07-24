##################################################################################################
#Purpose - Simple shell script to find the largest file ,rename and copy to /tmp folder		  #
												  #									  							
# Author - Komathi Sekar									  #
#Date/Time - 22/07/2019 10:30									  #
#Modified Date : 22/07/2019 : Reason : Adding proper commands					  #
###################################################################################################
							  							
#!/bin/bash

#variable to find the current date
SYS_DATE=$(date +"%Y-%m-%d")  
echo "Current date : ${SYS_DATE}"

SYS_TIME=$(date +"%T")
echo "Current time : ${SYS_TIME}"

MY_CURRENT_FILE=$(basename -- "$0")
echo "${MY_CURRENT_FILE}"

MY_CURRENT_FILE_NAME=$(basename -- "$0" | awk '{print $2}')
echo "${MY_CURRENT_FILE_NAME}"

function find_move_largest_file() {
#Finding the top 5 largest file in the root directory ordered based on file size descendingly, excluding the current file
find /root -type f -printf "%s\t%p\n" | sort -rn | head -5 | grep -v "$0"   
LARGEST_FILE=$(find . -type f -printf "%s\t%p\n" | sort -rn |grep -v "$0" | head -1 | awk '{print $2}')  
echo "largest file is ${LARGEST_FILE}"

#Getting the directory of the largest file in a variable
MYDIR=$(echo $(dirname $LARGEST_FILE))  
echo "${MYDIR}"

#getting the filename og largest file(excluding path)
MYFILE=$(echo $(basename $LARGEST_FILE))  
echo "${MYFILE}"

#New file name
NEW_FILE=${SYS_DATE}_${SYS_TIME}_${MYFILE}
echo "New file : ${NEW_FILE}" 

FILE_TO_SEND=$MYDIR/$NEW_FILE
echo "${FILE_TO_SEND}"

#copying the largest file to current_date file
cp $LARGEST_FILE $FILE_TO_SEND 

#moving the file to tmp folder and removing the current file
mv $FILE_TO_SEND /tmp/ 
#rm $LARGEST_FILE 
}

#finding the user
USER=$(whoami)
echo "$USER"
if [ "$USER" = "root" ]
then
 echo "user : root. Having permission to edit /tmp"
 find_move_largest_file
else
 echo "you don't enough have permissions to edit /tmp"
fi

