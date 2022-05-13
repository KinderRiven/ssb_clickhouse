DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS lineorder;
DROP TABLE IF EXISTS part;
DROP TABLE IF EXISTS supplier;

CREATE TABLE customer                                                                                         
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

CREATE TABLE lineorder
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

CREATE TABLE part 
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

CREATE TABLE supplier 
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