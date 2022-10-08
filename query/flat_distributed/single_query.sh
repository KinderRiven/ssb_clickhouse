#!/bin/bash
QUERIES=(Q1_1.sql Q1_2.sql Q1_3.sql Q2_1.sql Q2_2.sql Q2_3.sql Q3_1.sql Q3_2.sql Q3_3.sql Q3_4.sql Q4_1.sql Q4_2.sql Q4_3.sql)
COUNT=${#QUERIES[*]}

/mnt/ebs/ClickHouse_code_reading/ClickHouse/build/programs/clickhouse-client --time --format=Null --queries-file=drop_cache.sql
for((i=0; i < $COUNT; i++))
do
# echo 3 > /proc/sys/vm/drop_caches
for((j=0; j < 3; j++))
do
echo 3 > /proc/sys/vm/drop_caches
RES=$(/mnt/ebs/ClickHouse_code_reading/ClickHouse/build/programs/clickhouse-client --time --format=Null --queries-file=${QUERIES[$i]} 2>&1)
echo "${QUERIES[$i]}, $j, ${RES}" >> result.txt
done
done