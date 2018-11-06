---
layout: post
title: "aws rds and pg_repack"
date: 2018-03-18 10:49:12 -0500
comments: false
categories:
---

Database bloat is something that only the rarest of postgres databases can get away with. As more and more people give us control of their databases for something like AWS RDS (Amazon Web Service's Recursive Disappointment Service), using extensions like [pg_repack](http://reorg.github.io/pg_repack/) can get a little trickier.

# let's get started
Since you have no server to access the local binaries, and because AWS RDS provides no binaries for the versions they are using, you're going to have to build your own. This isn't as hard as one might think because it is an open source project with directions: http://reorg.github.io/pg_repack/
  
While you can adopt and manage the docker ecosystem to get the pg_repack binary, you also have the option that people have been using the past 42 years and just type `make;sudo make install`.

While you were reading the above, I was spinning up a postgres 10.5 db on RDS. I started it yesterday so that it would be ready by the time you got to this part of the post. Lets create some data:
```
-- let's create the table
CREATE TABLE burritos (
id SERIAL UNIQUE NOT NULL primary key,
title VARCHAR(10) NOT NULL,
toppings TEXT NOT NULL,
thoughts TEXT,
code VARCHAR(4) NOT NULL,
UNIQUE (title, toppings)
);

--disable auto vacuum
important=> ALTER TABLE burritos SET (autovacuum_enabled = false, toast.autovacuum_enabled = false);
ALTER TABLE


-- orders up
INSERT INTO  burritos (title, toppings, thoughts, code)
SELECT
  left(md5(i::text), 10),
  md5(random()::text),
  md5(random()::text),
  left(md5(random()::text), 4)
FROM GENERATE_SERIES(1, 1000000) s(i);
INSERT 0 1000000


UPDATE burritos SET toppings = md5(random()::text) WHERE id < 250;
UPDATE burritos SET toppings = md5(random()::text) WHERE id between 250 and 500;
UPDATE burritos SET code = left(md5(random()::text), 4) WHERE id between 2050 and 5000;
UPDATE burritos SET thoughts = md5(random()::text) WHERE id between 10000 and 20000;
UPDATE burritos SET thoughts = md5(random()::text) WHERE id between 800000 and 900000;
UPDATE burritos SET toppings = md5(random()::text) WHERE id between 600000 and 700000;
```

Much like a human that has had that much interaction with burritos... our [database now is quite bloaty](http://www.databasesoup.com/2014/10/new-table-bloat-query.html). Let's get repack in place:
```
-- list our extensions
important=> \dx
                 List of installed extensions
  Name   | Version |   Schema   |         Description
---------+---------+------------+------------------------------
 plpgsql | 1.0     | pg_catalog | PL/pgSQL procedural language
(1 row)

-- create our extension
important=> CREATE EXTENSION pg_repack;
CREATE EXTENSION

-- show it is installed
important=> \dx
                                  List of installed extensions
   Name    | Version |   Schema   |                         Description
-----------+---------+------------+--------------------------------------------------------------
 pg_repack | 1.4.3   | public     | Reorganize tables in PostgreSQL databases with minimal locks
 plpgsql   | 1.0     | pg_catalog | PL/pgSQL procedural language
(2 rows)
```

pg_repack has [a lot of options](http://reorg.github.io/pg_repack/#usage). Feel free to check them out, but I'm going to start packing:
```
rob@squid ~ :( $/usr/local/bin/pg_repack -U greataccounthere -h bloatsy.csbv99zxhbsh.us-east-2.rds.amazonaws.com -d important -t burritos -j 4
NOTICE: Setting up workers.conns
ERROR: pg_repack failed with error: You must be a superuser to use pg_repack
```
This might feel like game over because of how broken superuser is on RDS, but the trick is to take a leap of faith and add another flag (-k) that skips the superuser check:
```
rob@squid ~ :( $/usr/local/bin/pg_repack -U greataccounthere -h bloatsy.csbv99zxhbsh.us-east-2.rds.amazonaws.com -d important -k -t burritos -j 4
NOTICE: Setting up workers.conns
ERROR: pg_repack failed with error: program 'pg_repack 1.4.4' does not match database library 'pg_repack 1.4.3'
```

Great... now you can either check out the  1.4.3 tag  in the repo you cloned, or download 1.4.3 from their releases and run a make.
I thought I would be clever and try to namespace my binaries:
```
rob@squid ~ :( $/usr/local/bin/pg_repack-1.4.3 -U greataccounthere -h bloatsy.csbv99zxhbsh.us-east-2.rds.amazonaws.com -k -d important -t burritos -j 4
NOTICE: Setting up workers.conns
ERROR: pg_repack-1.4.3 failed with error: program 'pg_repack-1.4.3 1.4.3' does not match database library 'pg_repack 1.4.3'
```

sigh... so directory namespacing it is:
```
rob@squid ~ :( $/usr/local/bin/pg_repack-1.4.3/pg_repack -U greataccounthere -h bloatsy.csbv99zxhbsh.us-east-2.rds.amazonaws.com -k -d important -t burritos -j 4
NOTICE: Setting up workers.conns
INFO: repacking table "public.burritos"
LOG: Initial worker 0 to build index: CREATE UNIQUE INDEX index_16449 ON repack.table_16442 USING btree (id) TABLESPACE pg_default
LOG: Initial worker 1 to build index: CREATE UNIQUE INDEX index_16451 ON repack.table_16442 USING btree (title, toppings) TABLESPACE pg_default
LOG: Command finished in worker 0: CREATE UNIQUE INDEX index_16449 ON repack.table_16442 USING btree (id) TABLESPACE pg_default
LOG: Command finished in worker 1: CREATE UNIQUE INDEX index_16451 ON repack.table_16442 USING btree (title, toppings) TABLESPACE pg_default
```

It works. Now to just wrap it in a little alias and get back to dealing with my heartburn from lunch.
`function repack-rds { /usr/local/bin/pg_repack-1.4.3/pg_repack -U ops -h bloatsy.csbv99zxhbsh.us-east-2.rds.amazonaws.com -k -d $1 --table=$2 -j 4; }`
