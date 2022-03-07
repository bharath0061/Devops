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

for file in `find ${path} -type f`
do
	if [ -f ${file} ]
	then
	file_cheksum=`md5sum ${file} | cut -d ' ' -f1`
	echo ${file_cheksum}
	for f in `find ${path} -type f`
	do
		echo "entering into second for loop"
		if [ -f ${f} ]
		then
		var_check_sum=`md5sum ${f} | cut -d ' ' -f1`
		echo ${var_check_sum}
			if [ ${file_cheksum} = ${var_check_sum} -a ${file} != ${f} ]
			then
			echo "select number to delete the file"
			echo "1 ${file}"
			echo "2 ${f}"
			read delete_file
				if [ ${delete_file} = 1 ]
				then
				rm -rf ${file}
				else [ ${delete_file} = 2 ]
				rm -rf ${f}
				fi
			rm -rf ${delete_file}
			fi
		fi
	done
	fi

done
