CREATE TABLE test_seaweed
(
    ID UInt32,
    V1 UInt32,
    V2 UInt32
)
ENGINE = MergeTree
PRIMARY KEY(ID)
SETTINGS storage_policy = 'only_seaweed'

INSERT INTO test_seaweed  VALUES(1, 2, 3), (2, 2, 3), (3, 2, 3)