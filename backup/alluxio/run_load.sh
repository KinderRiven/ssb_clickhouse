sf=100
LOAD_DIR=/mnt/data/ssb-$sf
ip=10.10.1.8
port=9000

echo 'create table'
clickhouse-client -h $ip --port $port --queries-file=create.sql

echo 'load customer'
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO alluxio_customer FORMAT CSV" < $LOAD_DIR/customer.tbl
clickhouse-client -h $ip --port $port --query "SELECT COUNT(*) FROM alluxio_customer" >> log.txt

echo 'load part'
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO alluxio_part FORMAT CSV" < $LOAD_DIR/part.tbl
clickhouse-client -h $ip --port $port --query "SELECT COUNT(*) FROM alluxio_part" >> log.txt

echo 'load supplier'
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO alluxio_supplier FORMAT CSV" < $LOAD_DIR/supplier.tbl
clickhouse-client -h $ip --port $port --query "SELECT COUNT(*) FROM alluxio_supplier" >> log.txt

echo 'load lineorder'
date && time clickhouse-client -h $ip --port $port --query "INSERT INTO alluxio_lineorder FORMAT CSV" < $LOAD_DIR/lineorder.tbl
clickhouse-client -h $ip --port $port --query "SELECT COUNT(*) FROM alluxio_lineorder" >> log.txt
