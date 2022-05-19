ip=10.10.1.8
port=9000

# time (clickhouse-client -h $ip --port $port --queries-file=workload_A.sql)
time (clickhouse-client -h $ip --port $port --queries-file=workload_C.sql)