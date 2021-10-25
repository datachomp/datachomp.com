---
layout: page
title: PG Versions
permalink: /versions/
---

### 14 (September 30, 2021 	November 12, 2026)  
	* large connection count improvements
	* indexing data structure improvements
	* query parallelism improvements

### 13 (September 24, 2020 	November 13, 2025)  
	* Improved performance for aggregates or partitioned tables
	* Space savings and performance gains in B-tree indexes
	* Extended statistics for query planning

### 12 (October 3, 2019 	November 14, 2024)
    * Support for SQL/JSON path language
    * B-tree indexes performance improvements, rebuild indexes concurrently.
    * Inline common table expressions

### 11 (October 18, 2018 	November 9, 2023)  
	* Stored procedures
	* Covering indexes

### 10 (October 5, 2017 	November 10, 2022) 
    * Logical replication using publish/subscribe
	* Declarative table partitioning
	* Improved query parallelism
	* Significant general performance improvements
	* Stronger password authentication based on SCRAM-SHA-256
	* Improved monitoring and control

### 9.6 (September 29, 2016 	November 11, 2021) 
	* Parallel execution of sequential scans, joins and aggregates
	* Avoid scanning pages unnecessarily during vacuum freeze operations
	* Synchronous replication now allows multiple standby servers for increased reliability
	* Full-text search can now search for phrases (multiple adjacent words)
	* postgres_fdw now supports remote joins, sorts, UPDATEs, and DELETEs
	* Substantial performance improvements, especially in the area of scalability on multi-CPU-socket servers


### 9.5 (January 7, 2016 	February 11, 2021)  
    * Allow INSERTs that would generate constraint conflicts to be turned into UPDATEs or ignored
    * Add GROUP BY analysis features GROUPING SETS, CUBE and ROLLUP
	* Add row-level security control
	* Create mechanisms for tracking the progress of replication, including methods for identifying the origin of individual changes during logical replication
    * Add Block Range Indexes (BRIN)
    * Substantial performance improvements for sorting
    * Substantial performance improvements for multi-CPU machines

### 9.4 (December 18, 2014 	February 13, 2020)
	* Add jsonb, a more capable and efficient data type for storing JSON data
	* Add new SQL command ALTER SYSTEM for changing postgresql.conf configuration file entries
	* Reduce lock strength for some ALTER TABLE commands
	* Allow materialized views to be refreshed without blocking concurrent reads
	* Add support for logical decoding of WAL data, to allow database changes to be streamed out in a customizable format
	* Allow background worker processes to be dynamically registered, started and terminated

### 9.3 (September 9, 2013 	November 8, 2018)
### 9.2 (September 10, 2012 	November 9, 2017)
### 9.1 (September 12, 2011 	October 27, 2016)
### 9.0 (September 20, 2010 	October 8, 2015)