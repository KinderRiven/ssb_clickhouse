DROP TABLE kv_test

CREATE TABLE kv_test
(
    ID UInt32,
    V1 UInt32,
    V2 UInt32xw
)
ENGINE = StorageMemoryKV
PRIMARY KEY(ID)

INSERT INTO kv_test VALUES (1, 2, 3), (2, 2, 3), (3, 2, 3)