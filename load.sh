clickhouse-client -h 10.10.1.8 --port 9000 --query="DROP TABLE IF EXISTS customer"

clickhouse-client -h 10.10.1.8 --port 9000 --query="DROP TABLE IF EXISTS lineorder"

clickhouse-client -h 10.10.1.8 --port 9000 --query="DROP TABLE IF EXISTS part"

clickhouse-client -h 10.10.1.8 --port 9000 --query="DROP TABLE IF EXISTS supplier"

cat load/single_create.sql | clickhouse-client -h 10.10.1.8 --port 9000