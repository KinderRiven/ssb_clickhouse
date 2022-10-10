CREATE TABLE ebs_part 
(
 P_PARTKEY       UInt32,
 P_NAME          String,
 P_MFGR          String,
 P_CATEGORY      String,
 P_BRAND         String,
 P_COLOR         String,
 P_TYPE          String,
 P_SIZE          UInt8,
 P_CONTAINER     String
)
ENGINE = MergeTree ORDER BY P_PARTKEY
SETTINGS storage_policy = 'only_ebs'