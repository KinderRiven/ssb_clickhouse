ip=127.0.0.1
port=9000
CLIENT=/mnt/ebs/ClickHouse/build/programs/clickhouse-client

# time ($CLIENT -h $ip --port $port --queries-file=workload_A.sql)
# time ($CLIENT -h $ip --port $port --queries-file=workload_B.sql)
time ($CLIENT -h $ip --port $port --queries-file=workload_C.sql)
