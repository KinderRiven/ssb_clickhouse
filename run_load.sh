sf=10
LOAD_DIR=/mnt/data/ssb-$sf
CREATE_DIR=load/single
ip=10.10.1.8
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

echo 'load part'
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO part FORMAT CSV" < $LOAD_DIR/part.tbl

echo 'load supplier'
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO supplier FORMAT CSV" < $LOAD_DIR/supplier.tbl

echo 'load lineorder'
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO lineorder FORMAT CSV" < $LOAD_DIR/lineorder.tbl