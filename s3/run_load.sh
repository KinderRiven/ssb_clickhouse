LOAD_DIR=/mnt/ebs/ssb-100
CLIENT=/mnt/ebs/ClickHouse/build/programs/clickhouse-client
ip=127.0.0.1
port=9000

echo 'create table'
$CLIENT -h $ip --port $port --queries-file=create.sql

echo 'load customer'
date && time $CLIENT -h $ip --port $port --query "INSERT INTO customer FORMAT CSV" < $LOAD_DIR/customer.tbl
$CLIENT-h $ip --port $port --query "SELECT COUNT(*) FROM customer" >> log.txt

echo 'load part'
date && time $CLIENT -h $ip --port $port --query "INSERT INTO part FORMAT CSV" < $LOAD_DIR/part.tbl
$CLIENT -h $ip --port $port --query "SELECT COUNT(*) FROM part" >> log.txt

echo 'load supplier'
date && time $CLIENT -h $ip --port $port --query "INSERT INTO supplier FORMAT CSV" < $LOAD_DIR/supplier.tbl
$CLIENT -h $ip --port $port --query "SELECT COUNT(*) FROM supplier" >> log.txt

echo 'load lineorder'
date && time $CLIENT -h $ip --port $port --query "INSERT INTO lineorder FORMAT CSV" < $LOAD_DIR/lineorder.tbl
$CLIENT -h $ip --port $port --query "SELECT COUNT(*) FROM lineorder" >> log.txt
