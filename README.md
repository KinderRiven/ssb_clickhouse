# Star Schema Benchmark for Clickhouse

start schema benchmark paper : https://www.cs.umb.edu/~poneil/StarSchemaB.PDF

clickhouse-ssb documennt : https://clickhouse.com/docs/zh/getting-started/example-datasets/star-schema/

clickhouse-ssb github: https://github.com/vadimtk/ssb-dbgen

In the official documentation, all tables need to be joined as wide tables before all queries are performed. This evaluation method is beneficial to clickhouse. In order to better evaluate the performance of clickhouse in different query scenarios, we use the join query method for the query instead of generating a wide table first and then performing a single table query.
