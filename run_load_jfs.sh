sf=10
LOAD_DIR=/mnt/data/ssb-$sf
CREATE_DIR=load/single_in_juicefs
ip=10.10.1.8
port=9000

echo 'drop table customer/part/supplier/lineorder'
clickhouse-client -h $ip --port $port --query="DROP TABLE IF EXISTS j_customer"
clickhouse-client -h $ip --port $port --query="DROP TABLE IF EXISTS j_lineorder"
clickhouse-client -h $ip --port $port --query="DROP TABLE IF EXISTS j_part"
clickhouse-client -h $ip --port $port --query="DROP TABLE IF EXISTS j_supplier"

echo 'create table customer/part/supplier/lineorder'
cat $CREATE_DIR/create_customer_into_single.sql | clickhouse-client -h $ip --port $port
cat $CREATE_DIR/create_lineorder_into_single.sql | clickhouse-client -h $ip --port $port
cat $CREATE_DIR/create_part_into_single.sql | clickhouse-client -h $ip --port $port
cat $CREATE_DIR/create_supplier_into_single.sql | clickhouse-client -h $ip --port $port

echo 'load customer'
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO j_customer FORMAT CSV" < $LOAD_DIR/customer.tbl
clickhouse-client -h $ip --port $port --query "SELECT COUNT(*) FROM j_customer" >> log.txt

echo 'load part'
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO j_part FORMAT CSV" < $LOAD_DIR/part.tbl
clickhouse-client -h $ip --port $port --query "SELECT COUNT(*) FROM j_part" >> log.txt

echo 'load supplier'
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO j_supplier FORMAT CSV" < $LOAD_DIR/supplier.tbl
clickhouse-client -h $ip --port $port --query "SELECT COUNT(*) FROM j_supplier" >> log.txt

echo 'load lineorder'
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO j_lineorder FORMAT CSV" < $LOAD_DIR/lineorder.tbl
clickhouse-client -h $ip --port $port --query "SELECT COUNT(*) FROM j_lineorder" >> log.txt
