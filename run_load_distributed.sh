sf=100
LOAD_DIR=/mnt/data/ssb-$sf
# CREATE_DIR=load/distributed_in_local
# CREATE_DIR=load/distributed_in_local
CREATE_DIR=load/distributed_in_seaweed
ip=10.10.1.8
port=9000

echo 'drop table customer/part/supplier/lineorder'
clickhouse-client -h $ip --port $port --query="DROP TABLE IF EXISTS customer ON cluster cluster_3shards"
clickhouse-client -h $ip --port $port --query="DROP TABLE IF EXISTS lineorder ON cluster cluster_3shards"
clickhouse-client -h $ip --port $port --query="DROP TABLE IF EXISTS part ON cluster cluster_3shards"
clickhouse-client -h $ip --port $port --query="DROP TABLE IF EXISTS supplier ON cluster cluster_3shards"

clickhouse-client -h $ip --port $port --query="DROP TABLE IF EXISTS t_customer ON cluster cluster_3shards"
clickhouse-client -h $ip --port $port --query="DROP TABLE IF EXISTS t_lineorder ON cluster cluster_3shards"
clickhouse-client -h $ip --port $port --query="DROP TABLE IF EXISTS t_part ON cluster cluster_3shards"
clickhouse-client -h $ip --port $port --query="DROP TABLE IF EXISTS t_supplier ON cluster cluster_3shards"

echo 'create table customer/part/supplier/lineorder'
cat $CREATE_DIR/create_customer_into_single.sql | clickhouse-client -h $ip --port $port
cat $CREATE_DIR/create_lineorder_into_single.sql| clickhouse-client -h $ip --port $port
cat $CREATE_DIR/create_part_into_single.sql     | clickhouse-client -h $ip --port $port
cat $CREATE_DIR/create_supplier_into_single.sql | clickhouse-client -h $ip --port $port

clickhouse-client -h $ip --port $port --query "CREATE TABLE customer AS t_customer ENGINE = Distributed(cluster_3shards, default, t_customer, rand());"
clickhouse-client -h $ip --port $port --query "CREATE TABLE part AS t_part ENGINE = Distributed(cluster_3shards, default, t_part, rand());"
clickhouse-client -h $ip --port $port --query "CREATE TABLE lineorder AS t_lineorder ENGINE = Distributed(cluster_3shards, default, t_lineorder, rand());"
clickhouse-client -h $ip --port $port --query "CREATE TABLE supplier AS t_supplier ENGINE = Distributed(cluster_3shards, default, t_supplier, rand());"

echo 'load customer'
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO customer FORMAT CSV" < $LOAD_DIR/customer.tbl

echo 'load part'
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO part FORMAT CSV" < $LOAD_DIR/part.tbl

echo 'load supplier'
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO supplier FORMAT CSV" < $LOAD_DIR/supplier.tbl

echo 'load lineorder'
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO lineorder FORMAT CSV" < $LOAD_DIR/lineorder.tbl

clickhouse-client -h $ip --port $port --query "SELECT COUNT(*) FROM customer" >> log.txt
clickhouse-client -h $ip --port $port --query "SELECT COUNT(*) FROM part" >> log.txt
clickhouse-client -h $ip --port $port --query "SELECT COUNT(*) FROM supplier" >> log.txt
clickhouse-client -h $ip --port $port --query "SELECT COUNT(*) FROM lineorder" >> log.txt