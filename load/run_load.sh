#!/bin/bash

sf=10
LOAD_DIR=/mnt/ebs/ssb-$sf
CREATE_DIR=single_in_s3_s
ip=127.0.0.1
port=9000

TABLE_CUSTOMER="s_customer"
TABLE_PART="s_part"
TABLE_SUPPLIER="s_supplier"
TABLE_LINEORDER="s_lineorder"
CLIENT=/mnt/ebs/ClickHouse/build/programs/clickhouse-client

echo 'drop table customer/part/supplier/lineorder'
$CLIENT -h $ip --port $port --query="DROP TABLE IF EXISTS ${TABLE_CUSTOMER}"
$CLIENT -h $ip --port $port --query="DROP TABLE IF EXISTS ${TABLE_PART}"
$CLIENT -h $ip --port $port --query="DROP TABLE IF EXISTS ${TABLE_SUPPLIER}"
$CLIENT -h $ip --port $port --query="DROP TABLE IF EXISTS ${TABLE_LINEORDER}"

echo 'create table customer/part/supplier/lineorder'
cat $CREATE_DIR/create_customer_into_single.sql | $CLIENT -h $ip --port $port
cat $CREATE_DIR/create_lineorder_into_single.sql | $CLIENT -h $ip --port $port
cat $CREATE_DIR/create_part_into_single.sql | $CLIENT -h $ip --port $port
cat $CREATE_DIR/create_supplier_into_single.sql | $CLIENT -h $ip --port $port

echo 'load customer'
date && time $CLIENT -h $ip --port $port --query "INSERT INTO ${TABLE_CUSTOMER} FORMAT CSV" < $LOAD_DIR/customer.tbl
$CLIENT -h $ip --port $port --query "SELECT COUNT(*) FROM ${TABLE_CUSTOMER}" >> log.txt

echo 'load part'
date && time $CLIENT -h $ip --port $port --query "INSERT INTO ${TABLE_PART} FORMAT CSV" < $LOAD_DIR/part.tbl
$CLIENT -h $ip --port $port --query "SELECT COUNT(*) FROM ${TABLE_PART}" >> log.txt

echo 'load supplier'
date && time $CLIENT -h $ip --port $port --query "INSERT INTO ${TABLE_SUPPLIER} FORMAT CSV" < $LOAD_DIR/supplier.tbl
$CLIENT -h $ip --port $port --query "SELECT COUNT(*) FROM ${TABLE_SUPPLIER}" >> log.txt

echo 'load lineorder'
date && time $CLIENT -h $ip --port $port --query "INSERT INTO ${TABLE_LINEORDER} FORMAT CSV" < $LOAD_DIR/lineorder.tbl
$CLIENT -h $ip --port $port --query "SELECT COUNT(*) FROM ${TABLE_LINEORDER}" >> log.txt
