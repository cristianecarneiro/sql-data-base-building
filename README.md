# Project: Building MySQL Database for VHS Rental Store

From data cleaning to MySQL database building 

![vhs](https://github.com/cristianecarneiro/sql-data-base-building/tree/main/img/VHS.jpg)

## Intro and Objectives 

The goal of this project is to build a database from several 'dirty' CSV files. I was given six 'dirty' CSV files with no further context. The objective was to create a MySQL database for a VHS rental store that is already operational, i.e., with existing operational data. To achieve this, I cleaned all the files, structured them according to their interrelations, and loaded them into a MySQL database. Lastly, I have built some queries to get relevant insights from the data. 


## Output 

The output of this project is stored in this repository, as follows: 

- **data:** Both the raw CSV data provided and the cleaned CSV tables 
- **notebooks:** Jupyter notebooks with a step-by-step cleaning process of each CSV file
- **sql:** Script for the final MySQL database 


## Data Cleaning and Exploration Process 

### actor.cvs

+ The full cleaning process can be found in the notebooks folder in THIS file 
+ Key notes: 
    - There is more than one actress named Suzan Davis (which seems correct based on lit search)
    
### category.cvs

+ The full cleaning process can be found in the notebooks folder in THIS file 

### language.cvs

+ The full cleaning process can be found in the notebooks folder in THIS file 
+ Relationships
    - This table is linked to 'film' table through the language_id

### film.cvs

+ The full cleaning process can be found in the notebooks folder in THIS file 
+ Relationships
    - This table is linked to 'language' table through the language_id
    - This table is linked to 'inventory' table through the film_id
+ Key notes: 
    - All movies where released in 2006 (release_year = 2006)
    - All moves are in English (language_id = 1)
    - One can keep the movie for 3 through 4 days (rental_duration = [3,4,5,6,7])
    - There are three different types of rates for the movies [0.99, 2.99, 4.99]
    - There are five different ratings for the movies ['PG', 'G', 'NC-17', 'PG-13', 'R']    

### inventory.cvs

+ The full cleaning process can be found in the notebooks folder in THIS file 
+ Relationships
    - This table is linked to 'film' table through the film_id
+ Key notes: 
    - There are two stores (store_id = [1,2])
    
 
### rental.cvs

+ The full cleaning process can be found in the notebooks folder in THIS file 
+ Relationships
    - x
+ Key notes: 
    - x


## Database Creation 

+ a


## Final Database 


### Table A
+ a

### Table B 
+ a

## Queries 

### Query 1

### Query 2 

### Query 3

### Query 4

### Query 2 

### Query 3
