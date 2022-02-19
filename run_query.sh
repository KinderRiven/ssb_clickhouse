#!/bin/bash
QUERY_DIR=query
ip=10.10.1.8
port=9000

date && time -o Q1_1.time cat $QUERY_DIR/Q1_1.sql | clickhouse-client -h $ip --port $port
date && time -o Q1_2.time cat $QUERY_DIR/Q1_2.sql | clickhouse-client -h $ip --port $port
date && time -o Q1_3.time cat $QUERY_DIR/Q1_3.sql | clickhouse-client -h $ip --port $port
date && time -o Q2_1.time cat $QUERY_DIR/Q2_1.sql | clickhouse-client -h $ip --port $port
date && time -o Q2_2.time cat $QUERY_DIR/Q2_2.sql | clickhouse-client -h $ip --port $port
date && time -o Q2_3.time cat $QUERY_DIR/Q2_3.sql | clickhouse-client -h $ip --port $port
date && time -o Q3_1.time cat $QUERY_DIR/Q3_1.sql | clickhouse-client -h $ip --port $port
date && time -o Q3_2.time cat $QUERY_DIR/Q3_2.sql | clickhouse-client -h $ip --port $port
date && time -o Q3_3.time cat $QUERY_DIR/Q3_3.sql | clickhouse-client -h $ip --port $port
date && time -o Q3_4.time cat $QUERY_DIR/Q3_4.sql | clickhouse-client -h $ip --port $port
date && time -o Q4_1.time cat $QUERY_DIR/Q4_1.sql | clickhouse-client -h $ip --port $port
date && time -o Q4_2.time cat $QUERY_DIR/Q4_2.sql | clickhouse-client -h $ip --port $port
date && time -o Q4_3.time cat $QUERY_DIR/Q4_3.sql | clickhouse-client -h $ip --port $port
