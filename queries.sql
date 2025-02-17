-- 1. How many bike stations are available in Toronto?

SELECT COUNT(DISTINCT station_id) AS count_stations
FROM toronto_bike_stations;

-- Output: 863 



-- 2. How many bikes are available in all stations?

SELECT SUM(num_bikes_available) AS total_bikes_available
FROM toronto_bike_stations;

-- Output: 5764 



-- 3. What is the average bike availability?

SELECT AVG(num_bikes_available) AS avg_bikes_available
FROM toronto_bike_stations


-- Output: 6.6790266512166860



-- 4. What are the 3 largest bike stations in the city?

SELECT station_id, station_name, capacity
FROM toronto_bike_stations
ORDER BY capacity DESC
LIMIT 3;

/*
Output:

7021	"Bay St / Albert St"	                            63
7514	"Humber Bay Shores Park / Marine Parade Dr"	        62
7076	"York St / Queens Quay W"	                        56
*/



-- 5. What are the 3 smallest bike stations in the city?

SELECT station_id, station_name, capacity
FROM toronto_bike_stations
ORDER BY capacity ASC
LIMIT 3;


/*
Output:

7930	"Dunn Ave / Queen St W"             	7
7654	"Bloor St W / Pacific Ave"	            7
7368	"Lisgar St / Dundas St W - SMART"   	8
*/




-- 6. 

/*
Imagine you are at this location in the Toronto City. Using your preferred tool, indicate the closest five stations to your position:
Latitude = 43.661896
Longitude = -79.396160.
*/


-- We can use PostGIS extension of Postgres to get the closest stations
-- PostGIS is selected here owing to its efficient geospacial querying and indexing capabilities.



CREATE EXTENSION IF NOT EXISTS postgis;

ALTER TABLE toronto_bike_stations
ADD COLUMN geo_location GEOGRAPHY(POINT, 4326);


UPDATE toronto_bike_stations
SET geo_location = ST_SetSRID(ST_MakePoint(longitude, latitude), 4326);


SELECT station_id, station_name, latitude, longitude,
       ST_Distance(geo_location, ST_SetSRID(ST_MakePoint(-79.396160, 43.661896), 4326)) AS distance_meters
FROM toronto_bike_stations
ORDER BY distance_meters ASC
LIMIT 5;


/*
station_id   station_name                                    latitude            longitude           distance_meters
7066	    "Willcocks St / St. George St"	                43.662085	        -79.397735	        128.76351651
7913	    "St. George St / Willcocks St"	                43.662452744495575	-79.3978384219513	148.84369922
7358	    "Galbraith Rd / King's College Rd"	            43.6603874468082	-79.39537831814152	179.07590032
7250	    "Ursula Franklin St / St. George St - SMART"	43.660296	        -79.397107	        193.48561137
7600	    "Ursula Franklin St / Huron St - SMART"	        43.660274	        -79.398049	        235.99415075
*/

