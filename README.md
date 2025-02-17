# Toronto Bike Stations Data Pipeline

This repository provides the code and scripts to fetch, process, and load bike station data into a Postgres database, followed by running some analytics queries.

## 1. Fetching and Generating CSV

- **File**: `notebook_generate_csv.ipynb`
- **Description**: 
  This Jupyter notebook fetches bike station information from the Open Data API and generates a CSV file named `stations.csv` containing the data. 

## 2. Create Table Script for Postgres

- **File**: `create_table.sql`
- **Description**: 
  This SQL script creates the table `toronto_bike_stations` in Postgres to store the bike station data. 

## 3. Insert CSV Records into Postgres

- **File**: `notebook_table_insert.ipynb`
- **Description**: 
  This Jupyter notebook provides the script to insert the records from the generated `stations.csv` into the `toronto_bike_stations` table in Postgres. 


## 4. Analytics Queries

- **File**: `queries.sql`
- **Description**: 
  This SQL script contains queries for generating analytics on the toronto_bike_stations table in Postgres.

## 5. Dependencies

- **File**: `requirements.txt`
- **Description**: 
  This file contains the list of Python libraries required to run the code in this repository.
