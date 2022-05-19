ip=10.10.1.8
port=9000

time & clickhouse-client -h $ip --port $port --queries-config=workload_all.sql