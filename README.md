# Project: Building MySQL Database for Film Rental Store

From data cleaning to MySQL database building 

![vhs](https://raw.githubusercontent.com/cristianecarneiro/sql-data-base-building/main/img/VHS.jpg)

## Intro and Objectives 

The goal of this project is to build a database to support the operations of a VHS rental store.

We were given 7 .csv files with records of the store operations in the previous years (e.g., data on the inventory, rental records, etc.)

To build that database, I cleaned the different files, structured their information according to their interrelations, and loaded them into a MySQL database. Lastly, I have built some queries to get relevant insights from the data. 

## Output 

The output of this project is stored in this repository, as follows: 

- **data:** Both the raw CSV data provided and the cleaned CSV tables 
- **notebooks:** Jupyter notebooks with a step-by-step cleaning process of each CSV file
- **sql:** Script for the final MySQL database 

## Key insights from databases exploration/cleaning 

These are the most relevant insights from the cleaning process that have supported 1) database cleaning decisions 2) MYSQL databased structure/interelations 

<details>
<summary>ACTORS.CSV</summary>
<br>
<li> This is a database that contains a list of actors with their respective IDs
<li> There are 200 actors listed (IDs 1 through 200)
<li> By looking into their full names, we could observe that the name 'Susan Davis' appears twice (although different IDs). Based on some research, it appears that there are two actresses with that name. Therefore, I have kept both. 
<li> Primary key: actor_id
<li> Interrelations: this table will be associated with table films in a 'many-to-many' relationship (fk = actor_id and film_id)
</details>
<br>
<details>
<summary>CATEGORY.CSV</summary>
<br>
<li> This is a database that contains a list of film genres with their respective IDs
<li> There are 16 different genres recorded (IDs 1 through 16)
<li> Primary key: category_id
<li> Interrelations: this table could be associated with table films in a 'one-to-many' relationship (although the information to link both tables is present in a third .csv file) (fk = category_id)
</details>
<br>
<details>
<summary>LANGUAGE.CSV</summary>
<br>
<li> This is a database that contains a list of languages with their respective IDs
<li> There are 6 different languages (IDs 1 through 6) (we will see in other table all moves are in fact in English)
<li> Primary key: language_ID
<li> Interrelations: this table is associated with table 'films' in a 'one-to-many- relationship (fk = language_id)
</details>
<br>
<details>
<summary>FILMS.CSV</summary>
<br>
<li> This is a database that contains a list of films with info on them (e.g., release year, language, rental fees)
<li> There are 1000 titles listed (IDs 1 through 1000) 
<li> Primary key: films_ID
<li> Interrelations: this table is associated with: 
    <ul>
        <il>table 'actors' in a 'many-to-many- relationship (fk = actor_id, film_id)
        <il>table 'language' in a 'one-to-many- relationship (fk = language_id)
        <il>table 'categories' in a 'one-to-many- relationship (fk = category_id)
</details>
<br>
<details>
<summary>INVENTORY.CSV</summary>
<br>
<li> This is a database that contains a log of inventory records of VHS/DVDs and their respective store
<li> There are 1000 records listed (IDs 1 through 1000) 
<li> Primary key: inventory_ID
<li> Interrelations: this table is associated with: 
    <ul>
        <il> table 'rental' in a 'one-to-many' relationship (fk = inventory_id). We will see shortly the rental table contained logs of films that were not registered in the inventory (IDs >1000). Those were removed from the dataset. 
        <il> table 'films' in a 'one-to-many' relationship (fk = film_id)
</details>
<br>
<details>
<summary>RENTAL.CSV</summary>
<br>
<li> This is a database that contains a log of film's rental
<li> There are 1000 rental records listed (IDs 1 through 1001, indicating there is one ID missing) 
<li> Primary key: rental_id
<li> Interrelations: this table is associated with 'inventory ID' in a 'one-to-many' relationship (fk = inventory_id); given the table rental's primary key inventory_id had logs from 1 through 1000, any logs with ID's beyond 1000 were removed.
</details>
<br>
<details>
<summary>OLD_HDD.CSV</summary>
<br>
<li> This table contains data relating actors with movies they have starred, as well the movie's categories
<li> This information will be useful to 1) connect the tables 'actors' and 'films' and 2) connect the tables 'films' and 'categories' 
<li> Columns 'actor_id' and 'film_id' will be kept as a standalone table that will connect tables 'actors' and 'films'
<li> Interrelations: this table is associated with 'actors' and 'films' (fk = actor_id and film_id).
</details>

## Database Creation 

+ The final database was loaded into MYSQL following the relationships described above.

<details>
<summary>CODE</summary>
<br>
PUT CODE HERE USING '''  
</details>
<br>
<details>
<summary>CHART</summary>
<br>
PUT CODE HERE USING '''  
</details>

## SQL tables to support business 

<details>
<summary>QUESTION 1</summary>
<br>
PUT CODE HERE USING '''  
</details>
<br>
<details>
<summary>QUESTION 2</summary>
<br>
PUT CODE HERE USING '''  
</details>
<br>
<details>
<summary>QUESTION 3</summary>
<br>
PUT CODE HERE USING '''  
</details>
<br>
<details>
<summary>QUESTION 4</summary>
<br>
PUT CODE HERE USING '''  
</details>
<br>
<details>
<summary>QUESTION 5</summary>
<br>
PUT CODE HERE USING '''  
</details>