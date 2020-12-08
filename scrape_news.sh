#!/bin/bash

wget https://www.ynetnews.com/category/3082

grep -E -o  "https://www.ynetnews.com/article/.{9}" 3082 | sort -u > list.txt 
wc -l list.txt | awk '{ print $1 }' > results.csv
while read  -r line;do
  wget "$line"
  count_netanyahu=0
  count_gantz=0
  count_netanyahu=$(grep -o "Netanyahu" ${line: -9} | wc -l)
  count_gantz=$(grep -o "Gantz" ${line: -9}| wc -l)
  if [[ $count_netanyahu -eq 0 && $count_gantz -eq 0 ]]; then
  echo "$line""," "-" >> results.csv
  else
  echo "$line""," Netanyahu"," $count_netanyahu"," Gantz"," $count_gantz >> results.csv
  fi
  rm ${line: -9}
done < "/home/mamat/Documents/HW4/list.txt"
rm list.txt
rm 3082

	
