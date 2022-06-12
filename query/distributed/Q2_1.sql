SELECT 
    sum(LO_REVENUE), 
    toYear(LO_ORDERDATE) AS year, 
    P_BRAND
FROM lineorder
GLOBAL JOIN part ON P_PARTKEY = LO_PARTKEY
GLOBAL JOIN supplier ON LO_SUPPKEY = S_SUPPKEY
WHERE (P_CATEGORY = 'MFGR#12') AND (S_REGION = 'AMERICA')
GROUP BY
    year,
    P_BRAND
ORDER BY
    year ASC, 
    P_BRAND ASC