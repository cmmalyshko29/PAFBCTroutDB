-- Christina Malyshko
-- Milestone 4 : Analysis and Optimization
-- PA Trout Stream Data Spatial Queries 


SET search_path TO term_project, public;

 
--  1. Count the Number of trails heads that are in within 1 miles of a stream section 

-- no index: 5 seconds 
-- with index: 0.121 seconds
EXPLAIN ANALYZE
SELECT DISTINCT ON (t.gid, st.stream_name)
	t.name01 AS trail, t.gid AS trailhead_id, t.geom_2 AS trail_geom, st.stream_name AS stream, s.gid AS stream_section_id, 
	s.geom AS section_geom, (st_distance(t.geom_2, s.geom)/1609.34) AS trail_stream_distance_mi
FROM trail_heads t
JOIN section s 
ON ST_DWithin(t.geom_2, s.geom, 1609.34)
JOIN stream st
ON (st.stream_id = s.stream_id);



ALTER TABLE trail_heads
ADD COLUMN 
	geom_2 geometry(POINT, 2272)
	GENERATED ALWAYS AS (
		ST_Transform(geom, 2272)
	)STORED
;	



-- 2. Do any of the stream sections overlap with best fishing stream data? Of those streams is there any stream naming inconsistencies? 

-- disclaimer: overlap produces no results 

-- no index: 1 minute 41 seconds
-- with index: 0.807 seconds

EXPLAIN ANALYZE
select b.wtrname as best_fishing_stream, b.geom_2 as best_geom, st.stream_name as stream,
	s.gid as stream_section_id, s.geom as section_geom
from best_fishing_waters b 
join section s
on st_intersects (b.geom_2, s.geom)
join stream st
ON (st.stream_id = s.stream_id)
WHERE b.wtrname != st.stream_name;

ALTER TABLE best_fishing_waters
ADD COLUMN 
	geom_2 geometry(multilinestringm, 2272)
	GENERATED ALWAYS AS (
		ST_Transform(geom, 2272)
	)STORED
;

-- 3. What are the three closest stocked sections to each natural producing sections

-- no index: 3 seconds
-- with index: 0.670 seconds
EXPLAIN ANALYZE
select a.gid as natural_producing, a.geom as natural_geom, r.gid as three_closest_stocked, r.geom as stocked_geom
from section as a 
	CROSS JOIN LATERAL 
	(
		select b.gid, b.geom
		from section as b
		where fish_source = 2
		order by b.geom <-> a.geom 
		limit 3
	) as r
where fish_source = 1;




-- Create Indexes 

CREATE INDEX index_section
ON "section" (gid, fish_source);

CREATE INDEX index_section_geom
ON "section"
USING GIST (geom);

CREATE INDEX index_stream
ON stream 
USING HASH (stream_id);


CREATE INDEX index_trail
ON trail_heads (gid, name01);

CREATE INDEX index_trail_geom
ON trail_heads
USING GIST (geom_2);


CREATE INDEX index_best_fish
ON best_fishing_waters (wtrname);

CREATE INDEX index_best_fish_geom
ON best_fishing_waters
USING GIST (geom_2);
