#!/bin/bash

sf=10
LOAD_DIR=/mnt/data/ssb-$sf
CREATE_DIR=load/single_in_s3
ip=127.0.0.1
port=9000

echo 'drop table customer/part/supplier/lineorder'
clickhouse-client -h $ip --port $port --query="DROP TABLE IF EXISTS customer"
clickhouse-client -h $ip --port $port --query="DROP TABLE IF EXISTS lineorder"
clickhouse-client -h $ip --port $port --query="DROP TABLE IF EXISTS part"
clickhouse-client -h $ip --port $port --query="DROP TABLE IF EXISTS supplier"

echo 'create table customer/part/supplier/lineorder'
cat $CREATE_DIR/create_customer_into_single.sql | clickhouse-client -h $ip --port $port
cat $CREATE_DIR/create_lineorder_into_single.sql | clickhouse-client -h $ip --port $port
cat $CREATE_DIR/create_part_into_single.sql | clickhouse-client -h $ip --port $port
cat $CREATE_DIR/create_supplier_into_single.sql | clickhouse-client -h $ip --port $port

echo 'load customer'
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO customer FORMAT CSV" < $LOAD_DIR/customer.tbl
clickhouse-client -h $ip --port $port --query "SELECT COUNT(*) FROM customer" >> log.txt

echo 'load part'
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO part FORMAT CSV" < $LOAD_DIR/part.tbl
clickhouse-client -h $ip --port $port --query "SELECT COUNT(*) FROM part" >> log.txt

echo 'load supplier'
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO supplier FORMAT CSV" < $LOAD_DIR/supplier.tbl
clickhouse-client -h $ip --port $port --query "SELECT COUNT(*) FROM supplier" >> log.txt

echo 'load lineorder'
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO lineorder FORMAT CSV" < $LOAD_DIR/lineorder.tbl
clickhouse-client -h $ip --port $port --query "SELECT COUNT(*) FROM lineorder" >> log.txt
