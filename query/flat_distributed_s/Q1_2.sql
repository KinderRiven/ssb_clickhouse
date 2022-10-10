SELECT sum(LO_EXTENDEDPRICE * LO_DISCOUNT) AS revenue
FROM s_lineorder_flat
WHERE toYYYYMM(LO_ORDERDATE) = 199401 AND LO_DISCOUNT BETWEEN 4 AND 6 AND LO_QUANTITY BETWEEN 26 AND 35;