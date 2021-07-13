while read i;
do
	echo ""
	ip=`echo $i|awk '{print $1}'`
	pass=`echo $i|awk '{print $2}'`
	echo "------------------  Now Checking $ip  -----------------"
	expect <<EOF
	set timeout 10
	spawn ssh $ip "ps -ef |grep java"
	expect {
		"yes/no" { send "yes\r";exp_continue}
		"password" { send "$pass\r"}
	}
	expect eof
	echo ""
EOF
done < ip.txt

echo ""
echo "--------------------------------------------------------"


