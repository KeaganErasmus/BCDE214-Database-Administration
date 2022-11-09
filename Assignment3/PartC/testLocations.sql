USE zips;

SELECT country, state, latitude, longitude FROM zip
WHERE latitude and longitude != 0;

-- Firts test distance
SET @firstLat = 7.11;
SET @firstLong = 171.18;
SET @firstLat2 = -14.27;
SET @firstLong2 = -170.7;
SELECT ( GLength( LineString(( PointFromWKB( POINT( @firstLat, @firstLong ))), ( PointFromWKB( POINT( @firstLat2, @firstLong2 ) ))))) * 100 AS distanceInKMs;

-- Second test distance
SET @secondLat = -44.25;
SET @secondLon = 33.53;
SET @secondLat2 = 5.29;
SET @secondLon2 = 162.97;
SELECT ( GLength( LineString(( PointFromWKB( POINT( @secondLat, @secondLon ))), ( PointFromWKB( POINT( @secondLat2, @secondLon2 ) ))))) * 100 AS distanceInKMs;

-- Third test distance
SET @thirdLat = 7.51;
SET @thirdLon = 134.58;
SET @thirdLat2 = 8.78;
SET @thirdLon2 = 167.73;
SELECT ( GLength( LineString(( PointFromWKB( POINT( @thirdLat, @thirdLon ))), ( PointFromWKB( POINT( @thirdLat2, @thirdLon2 ) ))))) * 100 AS distanceInKMs;

-- Forth test distance
SET @forthLat = 18.0002;
SET @forthLon = -66.0429;
SET @forthLat2 = 18.0013;
SET @forthLon2 = -66.2521;
SELECT ( GLength( LineString(( PointFromWKB( POINT( @forthLat, @forthLon ))), ( PointFromWKB( POINT( @forthLat2, @forthLon2 ) ))))) * 100 AS distanceInKMs;

-- Fith test distance
SET @fithLat = 26.9105;
SET @fithLon = -81.7671;
SET @fithLat2 = 26.911;
SET @fithLon2 = -97.7737;
SELECT ( GLength( LineString(( PointFromWKB( POINT( @fithLat, @fithLon ))), ( PointFromWKB( POINT( @fithLat2, @fithLon2 ) ))))) * 100 AS distanceInKMs;