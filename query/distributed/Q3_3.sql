SELECT 
    C_CITY, 
    S_CITY, 
    toYear(LO_ORDERDATE) AS year, 
    SUM(LO_REVENUE) AS revenue
FROM lineorder
GLOBAL JOIN customer ON C_CUSTKEY = LO_CUSTKEY
GLOBAL JOIN supplier ON LO_SUPPKEY = S_SUPPKEY
WHERE ((C_CITY = 'UNITED KI1') OR (C_CITY = 'UNITED KI5')) AND ((S_CITY = 'UNITED KI1') OR (S_CITY = 'UNITED KI5')) AND (year >= 1992) AND (year <= 1997)
GROUP BY 
    C_CITY, 
    S_CITY, 
    year
ORDER BY 
    year ASC, 
    revenue DESC