#!/bin/bash

while true
do
	echo "enter the directory path"
	read path
	if [ -d ${path} ]:
	then
		break
	else
		echo "Invalid directory"
	fi
done

for file in `ls ${path}`
do
	if [ -f ${path}/${file} ]
	then
	file_cheksum=`md5sum ${path}/${file} | cut -d ' ' -f1`
	echo ${file_cheksum}
	for f in `ls ${path}`
	do
		echo "entering into second for loop"
		if [ -f ${path}/${f} ]
		then
		var_check_sum=`md5sum ${path}/${f} | cut -d ' ' -f1`
		echo ${var_check_sum}
			if [ ${file_cheksum} = ${var_check_sum} -a ${path}/${file} != ${path}/${f} ]
			then
			echo "Removing one duplicate file"
			rm -rf ${path}/${f}
			fi
		fi
	done
	fi

done
