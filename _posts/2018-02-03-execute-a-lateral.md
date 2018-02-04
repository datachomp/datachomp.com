---
layout: post
title: "Execute a Lateral"
date: 2018-02-02 10:49:12 -0500
comments: false
categories:
---

I know a lot of readers come here for photography or cooking content, but I'm going to actually talk about something technical: SQL Joins.  
  
Now, I know if you're a modern developers and doing stuff like kafka, boltdb, redis, or whatever, you might be asking yourself "what is a join? is that when you add more latency to a cluster by spinning up more nodes?" and you would be wise to ask yourself that. However, I'm talking about relational database joins so feel free to just close the tab.

The request was pretty simple on the surface - "Someone in marketing wants to know the the first rating associated with our burrito sales". Cool. So, being a SQL dinogator, I instantly went to a CTE to accomplish this:
```
WITH oldest_rating AS (
    SELECT id, burrito_id, rating
        , ROW_NUMBER() OVER(PARTITION BY burrito_id ORDER BY created_at) AS seq
    FROM burrito_ratings
    ) 
SELECT c.id, title, sale_price, old.rating
FROM burrito_sales c
    INNER JOIN oldest_rating old ON c.id = old.burrito_id and old.seq = 1
WHERE c.id in (1,2,3);
```

This works. I sent it back to marketing team and went back to browsing newegg. An hour or so later, I was paged for a performance problem. This wasn't for a report or a one off query... marketing wanted to put this on a public page and let customers look up ratings over a date range - this query was running slower than the JVM starting up and starting to buckle the available worker processes. 

I run a quick explain:  
`(cost=7383.98..8439.45 rows=1 width=44)`

rows = 1... that's not good. Actually, it is just fine for a one off query like I thought this would be, but it is quite bad for where reality ended up. The good news here is that since almost all technical business problems have been solved, I don't have to run the company into the ground trying to force a new architecture... I can just rewrite the query. This looks like a perfect excuse to use a [lateral join](https://www.postgresql.org/docs/current/static/queries-table-expressions.html).
```
SELECT b.id, title, sale_price, old.rating
FROM burrito_sales b
		CROSS JOIN LATERAL 
		(
			SELECT rating 
			FROM burrito_ratings
			WHERE burrito_id = b.id
			ORDER BY created_at
			LIMIT 1
		) old
WHERE b.id IN (1,2,3);
```
Results look good, lets check out execution plan:  
`Nested Loop  (cost=0.83..10.27 rows=3 width=44)`  

Hey! Much better. Hell, we could put this on the landing page. Ok, time to hand this query off and get back to surfing - uh oh, just got paged again:  

'OUR ORM DOESNT KNOW WHAT A CROSS JOIN IS. PLEASE PUT RESULTS IN KAFKA'