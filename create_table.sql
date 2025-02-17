CREATE TABLE IF NOT EXISTS toronto_bike_stations (
    station_id INTEGER PRIMARY KEY,
    station_name TEXT,
    physical_configuration TEXT,
    latitude FLOAT,
    longitude FLOAT,
    altitude FLOAT,
    address TEXT,
    capacity INTEGER,
    rental_methods TEXT,
    groups TEXT,
    obcn TEXT,
    nearby_distance FLOAT,
    num_bikes_available INTEGER,
    mechanical_bikes_available INTEGER,
    electric_bikes_available INTEGER,
	num_bikes_disabled INTEGER,
    num_docks_available INTEGER,
    num_docks_disabled INTEGER,
    is_installed INTEGER,
    is_renting INTEGER,
    is_returning INTEGER,
    last_reported TIMESTAMP,
    is_charging_station INTEGER,
    status TEXT,
    last_update TIMESTAMP
);
