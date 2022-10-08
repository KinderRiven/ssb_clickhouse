#!/bin/bash
# CACHE_PATH=/mnt/ebs/cache
# CACHE_PATH=/mnt/ebs2/cache
# CACHE_PATH=/mnt/ssd/cache

# worklaod A
echo 3 > /proc/sys/vm/drop_caches
WORKLOAD_A=(Q1_1.sql Q1_2.sql Q1_3.sql Q1_1.sql Q1_2.sql Q1_3.sql Q1_1.sql Q1_2.sql Q1_3.sql Q1_1.sql Q1_2.sql Q1_3.sql)
COUNT_A=${#WORKLOAD_A[*]}

/mnt/ebs/ClickHouse_code_reading/ClickHouse/build/programs/clickhouse-client --time --format=Null --queries-file=drop_cache.sql
for((j=0; j < 3; j++))
do
for((i=0; i < $COUNT_A; i++))
do
RES=$(/mnt/ebs/ClickHouse_code_reading/ClickHouse/build/programs/clickhouse-client --time --format=Null --queries-file=${WORKLOAD_A[$i]} 2>&1)
echo "$j, ${WORKLOAD_A[$i]}, ${RES}" >> result_A.txt
done
done

# worklaod B
echo 3 > /proc/sys/vm/drop_caches
WORKLOAD_B=(Q2_1.sql Q2_2.sql Q2_3.sql Q2_1.sql Q2_2.sql Q2_3.sql Q2_1.sql Q2_2.sql Q2_3.sql Q2_1.sql Q2_2.sql Q2_3.sql)
COUNT_B=${#WORKLOAD_B[*]}

/mnt/ebs/ClickHouse_code_reading/ClickHouse/build/programs/clickhouse-client --time --format=Null --queries-file=drop_cache.sql
for((j=0; j < 3; j++))
do
for((i=0; i < $COUNT_B; i++))
do
RES=$(/mnt/ebs/ClickHouse_code_reading/ClickHouse/build/programs/clickhouse-client --time --format=Null --queries-file=${WORKLOAD_B[$i]} 2>&1)
echo "$j, ${WORKLOAD_B[$i]}, ${RES}" >> result_B.txt
done
done

# worklaod C
echo 3 > /proc/sys/vm/drop_caches
WORKLOAD_C=(Q1_1.sql Q1_2.sql Q1_3.sql Q2_1.sql Q2_2.sql Q2_3.sql Q3_1.sql Q3_2.sql Q3_3.sql Q3_4.sql Q4_1.sql Q4_2.sql Q4_3.sql)
COUNT_C=${#WORKLOAD_C[*]}

/mnt/ebs/ClickHouse_code_reading/ClickHouse/build/programs/clickhouse-client --time --format=Null --queries-file=drop_cache.sql
for((j=0; j < 3; j++))
do
for((i=0; i < $COUNT_C; i++))
do
RES=$(/mnt/ebs/ClickHouse_code_reading/ClickHouse/build/programs/clickhouse-client --time --format=Null --queries-file=${WORKLOAD_C[$i]} 2>&1)
echo "$j, ${WORKLOAD_C[$i]}, ${RES}" >> result_C.txt
done
done

# worklaod D
echo 3 > /proc/sys/vm/drop_caches
WORKLOAD_D=(Q1_1.sql Q1_2.sql Q1_3.sql Q2_1.sql Q2_2.sql Q2_3.sql Q1_1.sql Q1_2.sql Q1_3.sql Q2_1.sql Q2_2.sql Q2_3.sql)
COUNT_D=${#WORKLOAD_D[*]}

/mnt/ebs/ClickHouse_code_reading/ClickHouse/build/programs/clickhouse-client --time --format=Null --queries-file=drop_cache.sql
for((j=0; j < 3; j++))
do
for((i=0; i < $COUNT_D; i++))
do
RES=$(/mnt/ebs/ClickHouse_code_reading/ClickHouse/build/programs/clickhouse-client --time --format=Null --queries-file=${WORKLOAD_D[$i]} 2>&1)
echo "$j, ${WORKLOAD_D[$i]}, ${RES}" >> result_D.txt
done
done