CREATE TABLE ebs_lineorder
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
SETTINGS storage_policy = 'only_ebs'