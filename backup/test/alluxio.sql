CREATE TABLE test_alluxio
(
    ID UInt32,
    V1 UInt32,
    V2 UInt32
)
ENGINE = MergeTree
PRIMARY KEY(ID)
SETTINGS storage_policy = 'only_alluxio'

INSERT INTO test_alluxio  VALUES(1, 2, 3), (2, 2, 3), (3, 2, 3)