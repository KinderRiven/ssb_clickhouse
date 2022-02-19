#!/bin/bash
QUERY_DIR=query
RESULT_DIR=result
ip=10.10.1.8
port=9000

date && time cat $QUERY_DIR/Q1_1.sql | clickhouse-client -h $ip --port $port
date && time cat $QUERY_DIR/Q1_2.sql | clickhouse-client -h $ip --port $port
date && time cat $QUERY_DIR/Q1_3.sql | clickhouse-client -h $ip --port $port
date && time cat $QUERY_DIR/Q2_1.sql | clickhouse-client -h $ip --port $port
date && time cat $QUERY_DIR/Q2_2.sql | clickhouse-client -h $ip --port $port
date && time cat $QUERY_DIR/Q2_3.sql | clickhouse-client -h $ip --port $port
date && time cat $QUERY_DIR/Q3_1.sql | clickhouse-client -h $ip --port $port
date && time cat $QUERY_DIR/Q3_2.sql | clickhouse-client -h $ip --port $port
date && time cat $QUERY_DIR/Q3_3.sql | clickhouse-client -h $ip --port $port
date && time cat $QUERY_DIR/Q3_4.sql | clickhouse-client -h $ip --port $port
date && time cat $QUERY_DIR/Q4_1.sql | clickhouse-client -h $ip --port $port
date && time cat $QUERY_DIR/Q4_2.sql | clickhouse-client -h $ip --port $port
date && time cat $QUERY_DIR/Q4_3.sql | clickhouse-client -h $ip --port $port
