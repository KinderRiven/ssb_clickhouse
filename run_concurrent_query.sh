#!/bin/bash

QUERY_DIR=query/flat_distributed
RESULT_FILE=run.res
ip=10.10.1.8
port=9000

(time (cat $QUERY_DIR/Q2_1.sql | clickhouse-client -h $ip --port $port) >> $RESULT_FILE) & 
(time (cat $QUERY_DIR/Q2_1.sql | clickhouse-client -h $ip --port $port) >> $RESULT_FILE) & 
(time (cat $QUERY_DIR/Q2_1.sql | clickhouse-client -h $ip --port $port) >> $RESULT_FILE) & 
(time (cat $QUERY_DIR/Q2_1.sql | clickhouse-client -h $ip --port $port) >> $RESULT_FILE)
