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


export GOOGLE_APPLICATION_CREDENTIALS=/home/glitsy/pvn-infra-snapshot/pvn-tkjp-analysis.json

cd ~/pvn-infra-snapshot/

for ((i=$a;i<=$b;i++))
do
	echo "$var1-$var2-$i"
	if [ $i != [0-9] ]; then
		echo "############################ Thuc hien qua trinh TRANSFER len Bigquery ########################"
		python bigquery_transfer.py -b tkjp_analysis -t bank_tran_status -d "$var1-$var2-$i"
	else
		echo "########################   Thuc hien qua trinh TRANSFER len Bigquery ###########################"
		python bigquery_transfer.py -b tkjp_analysis -t bank_tran_status -d "$var1-$var2-0$i"
	fi
done