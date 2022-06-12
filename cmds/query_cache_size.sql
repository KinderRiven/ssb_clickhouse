set max_query_cache_size=1073741824;

set skip_download_if_exceeds_query_cache=0;
set enable_filesystem_use_query_cache_limit=1;

ninja unit_tests_dbms
./src/unit_tests_dbms --gtest_filter='LRUFileCache*' --gtest_brief=0 --gtest_throw_on_failure=1