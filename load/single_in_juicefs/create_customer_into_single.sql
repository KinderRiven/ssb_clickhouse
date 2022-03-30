CREATE TABLE j_customer                                                                                                       
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
SETTINGS storage_policy = 'only_juicefs'