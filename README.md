
https://pganalyze.com/blog/introducing-pganalyze-index-advisor

https://www.2ndquadrant.com/en/blog/postgresql-vacuum-and-analyze-best-practice-tips/

https://gocardless.com/blog/debugging-the-postgres-query-planner/

https://dba.stackexchange.com/questions/35814/how-to-view-the-current-settings-of-autovacuum-in-postgres

https://www.postgresql.org/docs/14/sql-analyze.html

The extent of analysis can be controlled by adjusting the default_statistics_target configuration variable, or on a column-by-column basis by setting the per-column statistics target with ALTER TABLE ... ALTER COLUMN ... SET STATISTICS. The target value sets the maximum number of entries in the most-common-value list and the maximum number of bins in the histogram. The default target value is 100, but this can be adjusted up or down to trade off accuracy of planner estimates against the time taken for ANALYZE and the amount of space occupied in pg_statistic.


https://www.postgresql.org/docs/current/routine-vacuuming.html
Tip
Although per-column tweaking of ANALYZE frequency might not be very productive, you might find it worthwhile to do per-column adjustment of the level of detail of the statistics collected by ANALYZE. Columns that are heavily used in WHERE clauses and have highly irregular data distributions might require a finer-grain data histogram than other columns. See ALTER TABLE SET STATISTICS, or change the database-wide default using the default_statistics_target configuration parameter.

Also, by default there is limited information available about the selectivity of functions. However, if you create a statistics object or an expression index that uses a function call, useful statistics will be gathered about the function, which can greatly improve query plans that use the expression index.
