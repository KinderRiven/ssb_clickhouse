#!/bin/bash

QUERY_DIR=query
ip=10.10.1.8
port=9000

time cat $QUERY_DIR/Q1_1.sql | clickhouse-client -h $ip --port $port
