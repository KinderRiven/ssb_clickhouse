# 查询所有请求的cache信息
select query_id, SUM(hit_count), SUM(miss_count),  SUM(hit_count) / SUM(miss_count) as hit_ratio from system.cache_log group by query_id

# 查询一个请求的cache信息
select SUM(hit_count), SUM(miss_count), SUM(hit_count) / SUM(miss_count) as hit_ratio from system.cache_log where query_id='09ef4661-c1fd-493d-a718-e6979c3de6dc'

# 查询某个文件的访问情况
select query_id, event_time, hit_count, miss_count from system.cache_log where remote_file_path='official_data/ulbjruvpcgesekvobrynvsrqhazwoddb'

# 清空表格
alter table system.cache_log delete where 1=1