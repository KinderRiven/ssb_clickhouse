#!/bin/bash
BS=(512B 1KB 4KB 16KB 64KB 256KB 1MB 4MB 16MB 64MB 256MB)
COUNT=${#BS[*]}
FIO_PATH=/mnt/ebs/fio

mkdir -p $FIO_PATH
fio -rw=write -direct=1 -directory=$FIO_PATH -ioengine=libaio -iodepth=8 -size=40GB -filesize=40GB -name=test -thread -numjobs=1 -nrfiles=1 -bs=64MB

for ((i=0; i<${COUNT}; i++))
do
fio  -rw=randwrite -direct=1 -directory=$FIO_PATH -ioengine=libaio -iodepth=8 -size=40GB -filesize=40GB -time_based -runtime=60 -name=test -thread -numjobs=1 -nrfiles=1 -bs=${BS[$i]} > ${BS[$i]}_wr.result
fio  -rw=randread  -direct=1 -directory=$FIO_PATH -ioengine=libaio -iodepth=8 -size=40GB -filesize=40GB -time_based -runtime=60 -name=test -thread -numjobs=1 -nrfiles=1 -bs=${BS[$i]} > ${BS[$i]}_rd.result
done
