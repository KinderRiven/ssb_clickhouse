DROP TABLE test_rocksdb

CREATE TABLE test_rocksdb
(
    ID UInt32,
    V1 UInt32,
    V2 UInt32
)
ENGINE = EmbeddedRocksDB 
PRIMARY KEY(ID)

INSERT INTO test_rocksdb  VALUES(1, 2, 3), (2, 2, 3), (3, 2, 3) 