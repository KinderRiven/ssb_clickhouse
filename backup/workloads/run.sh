ip=127.0.0.1
port=9000
CLIENT=/mnt/ebs/ClickHouse/build/programs/clickhouse-client

startTime0_s=`date +%s`

time ($CLIENT -h $ip --port $port --queries-file=workload_A.sql)
endTime1=`date +%Y%m%d-%H:%M:%S`
endTime1_s=`date +%s`
sumTime1=$[ $endTime1_s - $startTime0_s ]

time ($CLIENT -h $ip --port $port --queries-file=workload_B.sql)
endTime2=`date +%Y%m%d-%H:%M:%S`
endTime2_s=`date +%s`
sumTime2=$[ $endTime2_s - $endTime1_s ]

time ($CLIENT -h $ip --port $port --queries-file=workload_C.sql)
endTime3=`date +%Y%m%d-%H:%M:%S`
endTime3_s=`date +%s`
sumTime3=$[ $endTime3_s - $endTime2_s ]

echo "Workload A" "Total:$sumTime1 seconds"
echo "Workload B" "Total:$sumTime2 seconds"
echo "Workload C" "Total:$sumTime3 seconds"
