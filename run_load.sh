sf=10
DIR=/mnt/data/ssb-$sf
ip=10.10.1.8
port=9000

clickhouse-client -h $ip --port $port --query="DROP TABLE IF EXISTS customer"
clickhouse-client -h $ip --port $port --query="DROP TABLE IF EXISTS lineorder"
clickhouse-client -h $ip --port $port --query="DROP TABLE IF EXISTS part"
clickhouse-client -h $ip --port $port --query="DROP TABLE IF EXISTS supplier"

cat load/single/create_customer_into_single.sql | clickhouse-client -h 10.10.1.8 --port 9000
cat load/single/create_lineorder_into_single.sql | clickhouse-client -h 10.10.1.8 --port 9000
cat load/single/create_part_into_single.sql | clickhouse-client -h 10.10.1.8 --port 9000
cat load/single/create_supplier_into_single.sql | clickhouse-client -h 10.10.1.8 --port 9000

date && time clickhouse-client -h $ip --port $port --query "INSERT INTO customer FORMAT CSV" < $DIR/customer.tbl
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO part FORMAT CSV" < $DIR/part.tbl
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO supplier FORMAT CSV" < $DIR/supplier.tbl
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO lineorder FORMAT CSV" < $DIR/lineorder.tbl