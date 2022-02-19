SELECT 
    C_CITY, 
    S_CITY, 
    toYear(LO_ORDERDATE) AS year, 
    SUM(LO_REVENUE) AS revenue
FROM lineorder
INNER JOIN customer ON C_CUSTKEY = LO_CUSTKEY
INNER JOIN supplier ON LO_SUPPKEY = S_SUPPKEY
WHERE (C_NATION = 'UNITED STATES') AND (S_NATION = 'UNITED STATES') AND (year >= 1992) AND (year <= 1997)
GROUP BY 
    C_CITY, 
    S_CITY, 
    year
ORDER BY 
    year ASC, 
    revenue DESC