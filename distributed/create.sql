-- rm disributed table
DROP TABLE IF EXISTS lineorder_flat ON cluster cluster_3shards;
DROP TABLE IF EXISTS customer ON cluster cluster_3shards;
DROP TABLE IF EXISTS lineorder ON cluster cluster_3shards;
DROP TABLE IF EXISTS part ON cluster cluster_3shards;
DROP TABLE IF EXISTS supplier ON cluster cluster_3shards;

-- rm local table
DROP TABLE IF EXISTS l_customer ON cluster cluster_3shards;
DROP TABLE IF EXISTS l_lineorder ON cluster cluster_3shards;
DROP TABLE IF EXISTS l_part ON cluster cluster_3shards;
DROP TABLE IF EXISTS l_supplier ON cluster cluster_3shards;

-- customer
CREATE TABLE l_customer ON cluster cluster_3shards                                                                                                  
(                                                                                                                                         
 C_CUSTKEY      	UInt32,                                                                                                                   
 C_NAME           	String,                                                                                                                   
 C_ADDRESS      	String,                                                                                                                   
 C_CITY             String,                                                                                                                   
 C_NATION       	String,                                                                                                                   
 C_REGION        	String,                                                                                                                   
 C_PHONE         	String,                                                                                                                   
 C_MKTSEGMENT    	String                                                                                                                    
)                                                                                                            
ENGINE = MergeTree ORDER BY (C_CUSTKEY)
SETTINGS storage_policy = 'only_s3';

-- create local table
-- lineorder
CREATE TABLE l_lineorder ON cluster cluster_3shards 
(
 LO_ORDERKEY            UInt32,
 LO_LINENUMBER          UInt8,
 LO_CUSTKEY       	    UInt32,
 LO_PARTKEY             UInt32,
 LO_SUPPKEY             UInt32,
 LO_ORDERDATE           Date,
 LO_ORDERPRIORITY       String,
 LO_SHIPPRIORITY        UInt8,
 LO_QUANTITY            UInt8,
 LO_EXTENDEDPRICE       UInt32,
 LO_ORDTOTALPRICE       UInt32,
 LO_DISCOUNT            UInt8,
 LO_REVENUE             UInt32,
 LO_SUPPLYCOST          UInt32,
 LO_TAX                 UInt8,
 LO_COMMITDATE          Date,
 LO_SHIPMODE            String
)
ENGINE = MergeTree PARTITION BY toYear(LO_ORDERDATE) ORDER BY (LO_ORDERDATE, LO_ORDERKEY)
SETTINGS storage_policy = 'only_s3';

-- part
CREATE TABLE l_part ON cluster cluster_3shards 
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
SETTINGS storage_policy = 'only_s3';

-- supplier
CREATE TABLE l_supplier ON cluster cluster_3shards 
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
SETTINGS storage_policy = 'only_s3';

-- create disrtibured table
CREATE TABLE customer AS l_customer ENGINE = Distributed(cluster_3shards, default, l_customer, rand());
CREATE TABLE part AS l_part ENGINE = Distributed(cluster_3shards, default, l_part, rand());
CREATE TABLE lineorder AS l_lineorder ENGINE = Distributed(cluster_3shards, default, l_lineorder, rand());
CREATE TABLE supplier AS l_supplier ENGINE = Distributed(cluster_3shards, default, l_supplier, rand());
