---
layout: page
title: PG Versions
permalink: /versions/
---

### 17 (2024-09-26 : 2029-11-08)  
	* Json_table function
	* WAL perf enhancements (setting up more IO gains / streaming IO gains)
	* vacuum improvements - new memory datastructure
	* logical replication - no longer have to drop slots for upgrades
	* incremental backups
	* sslnegotiation=direct = no more roundtrip negotiation
	* btree's work better with IN clauses

### 16 (2023-09-11 : 2028-11-09)  
	* Query planner improvements (aggregates, incremental sorts, etc)
	* Large performance gains in bulk loading (COPY)
	* vacuum improvements 
	* logical replication - start of bi-directional foundation, logical repl from standby
	* pg_stat_io

### 15 (2022-10-10 : 2027-11-11)  
	* large connection count improvements
	* in-memory/on-disk sorting improvements
	* logical replication - specify column lists/row filters
	* WAL compression options
	* partition table performance fixes
	* note: Public schema permissions change with this release

### 14 (2021-09-30 : 2026-11-12)  
	* large connection count improvements
	* indexing data structure improvements
	* query parallelism improvements
	* vacuum performance improvements
	* Stored procedures can now return data via OUT parameters.

### 13 (2020-09-24 : 2025-11-13)  
	* Improved performance for aggregates or partitioned tables
	* Space savings and performance gains in B-tree indexes
	* Extended statistics for query planning
	* Parallelized vacuuming of indexes
	* Incremental sorting

### 12 (2019-10-03 : 2024-11-14)
    * Support for SQL/JSON path language
    * B-tree indexes performance improvements, rebuild indexes concurrently.
    * Inline common table expressions
    * General performance improvements
    * Enhancements to administrative functionality(REINDEX CONCURRENTLY, pg_checksums Progress reporting statistics)
    * Support for the SQL/JSON path language
	* Stored generated columns
    * New authentication features


### 11 (2018-10-18 : 2023-11-09)  
	* Improvements to partitioning functionality
	* Improvements to parallelism, including:
	* SQL stored procedures that support embedded transactions
	* Optional Just-in-Time (JIT) compilation for some SQL code, speeding evaluation of expressions
	* Covering indexes can now be created, using the INCLUDE clause of CREATE INDEX

### 10 (2017-10-05 : 2022-11-10)
    * Logical replication using publish/subscribe
	* Declarative table partitioning
	* Improved query parallelism
	* Significant general performance improvements
	* Stronger password authentication based on SCRAM-SHA-256
	* Improved monitoring and control

### 9.6 (2016-09-29 : 2021-11-11)
	* Parallel execution of sequential scans, joins and aggregates
	* Avoid scanning pages unnecessarily during vacuum freeze operations
	* Synchronous replication now allows multiple standby servers for increased reliability
	* Full-text search can now search for phrases (multiple adjacent words)
	* postgres_fdw now supports remote joins, sorts, UPDATEs, and DELETEs
	* Substantial performance improvements, especially in the area of scalability on multi-CPU-socket servers


### 9.5 (2016-01-07 : 2021-02-11)
    * Allow INSERTs that would generate constraint conflicts to be turned into UPDATEs or ignored
    * Add GROUP BY analysis features GROUPING SETS, CUBE and ROLLUP
	* Add row-level security control
	* Create mechanisms for tracking the progress of replication, including methods for identifying the origin of individual changes during logical replication
    * Add Block Range Indexes (BRIN)
    * Substantial performance improvements for sorting
    * Substantial performance improvements for multi-CPU machines

### 9.4 (2014-12-18 : 2020-02-13)
	* Add jsonb, a more capable and efficient data type for storing JSON data
	* Add new SQL command ALTER SYSTEM for changing postgresql.conf configuration file entries
	* Reduce lock strength for some ALTER TABLE commands
	* Allow materialized views to be refreshed without blocking concurrent reads
	* Add support for logical decoding of WAL data, to allow database changes to be streamed out in a customizable format
	* Allow background worker processes to be dynamically registered, started and terminated

### 9.3 (2013-09-09 : 2018-11-08)
### 9.2 (2012-09-10 : 2017-11-09)
### 9.1 (2011-09-12 : 2016-10-27)
### 9.0 (2010-09-20 : 2015-10-08)
  
  
Links:  
[Why Upgrade](https://why-upgrade.depesz.com/show?from=12.5&to=16.2&keywords=)  
[pgtune](https://pgtune.leopard.in.ua/)  
[pgconfigurator](https://pgconfigurator.cybertec-postgresql.com/)  
[pg feature matrix](https://www.postgresql.org/about/featurematrix/)  

[pgmustard](https://www.pgmustard.com/)  
[pganalyze](https://pganalyze.com/)  
[crunchybridge](https://www.crunchydata.com/products/crunchy-bridge)  
