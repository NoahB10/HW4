#!/bin/bash

grep -E -o  "https://www.ynetnews.com/article/.{9}" 3082 | sort -u > output.txt 

while read  -r line;do
  wget "$line"
  x=0
  y=0
  x=$(grep -o "Netanyahu" ${line: -9} | wc -l)
  y=$(grep -o "Gantz" ${line: -9}| wc -l)
  if [[ $x -eq 0 && $y -eq 0 ]]; then
  echo "$line""," "-" >> output2.txt
  else
  echo "$line""," Netanyahu"," $x"," Gantz"," $y >> output2.txt
  fi
done < "/home/mamat/Documents/HW4/output.txt"
	
