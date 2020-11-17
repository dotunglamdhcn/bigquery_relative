#!/usr/bin/bash
cd /home/glitsy/pvn-infra-snapshot

echo "Nhap vao year: "
read
var1="$REPLY"

echo "Nhap vao month: "
read
 var2="$REPLY"

echo -n "Nhap vao start-day: "
read a

echo -n "Nhap vao end_day: "
read b

for ((i=$a;i<=$b;i++))
do

	echo "$var1-$var2-$i"
	if [ $i != [0-9] ]; then

		echo '--------------------- snapshot data theo thu tu tung ngay --------------------------------------'
		python snapshot.py --table bank_tran_status --format csv --with_header --date "$var1-$var2-$i";
	fi
		echo '--------------------- snapshot data theo thu tu tung ngay --------------------------------------'
		python snapshot.py --table bank_tran_status --format csv --with_header --date "$var1-$var2-0$i";
done