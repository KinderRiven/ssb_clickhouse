CREATE TABLE t_supplier ON cluster cluster_3shards 
(
 S_SUPPKEY       UInt32,
 S_NAME          String,
 S_ADDRESS       String,
 S_CITY          String,
 S_NATION        String,
 S_REGION        String,
 S_PHONE         String
 )
ENGINE = MergeTree ORDER BY S_SUPPKEY
SETTINGS storage_policy = 'only_s3'