#!/bin/bash


# script takes in 2 arguments :
# 	folder to find blender files & 
# 	correction factor for frame (eg 50)

# making sure we enforce right number of arguments 
if [ $# -ne 2 ]
then
  echo "Invalid number of arguments! Current Arguments: $#"
  exit
fi
# Echo file names in current folder

find $1 -name '*' | while read -r line ; do
	# do some line by line computation 
  #echo $line

  # extracting only numbering part
  extract_digit_str=$(echo $line | tr -cd '[[:digit:]]') 

  ## fixing the number
  extract_digit=$((10#$extract_digit_str - $2));

  # fill with corrected frame number and padding
  extracted_str=$(printf "%06d" $extract_digit)

  final_filename=$(echo "${line/$extract_digit_str/$extracted_str}")

  # rename file 
  mv $line $final_filename
done