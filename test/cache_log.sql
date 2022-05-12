SELECT (SELECT COUNT(*) FROM system.filesystem_cache_log WHERE query_id='86b7b727-8d7d-47e9-8924-c013ad11625c' AND read_type='READ_FROM_CACHE') / (SELECT COUNT(*) FROM system.filesystem_cache_log WHERE query_id='86b7b727-8d7d-47e9-8924-c013ad11625c') AS CACHE_HIT

SELECT event_time, query_id, file_segment_range, read_type FROM system.filesystem_cache_log WHERE remote_file_path='official_data/nldihswewvjcmodcnjbyaxwkpdiamyjs'

CREATE TABLE test1 (key UInt32, value String) Engine=MergeTree() ORDER BY key SETTINGS storage_policy='test_s3_1';
CREATE TABLE test2 (key UInt32, value String) Engine=MergeTree() ORDER BY key SETTINGS storage_policy='test_s3_2';

INSERT INTO test1 SELECT * FROM generateRandom('key UInt32, value String') LIMIT 10000;
INSERT INTO test2 SELECT * FROM generateRandom('key UInt32, value String') LIMIT 10000;

