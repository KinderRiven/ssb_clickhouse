CREATE TABLE s_supplier
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