# Project: Building MySQL Database for Film Rental Store

From data cleaning to MySQL database building 

![vhs](https://raw.githubusercontent.com/cristianecarneiro/sql-data-base-building/main/img/VHS.jpg)


## Objectives

The goal of this project is to build a database to support the operations of a film rental store.

To achieve that, we were given 7 .csv 'dirty' files with records of the store operations in the previous years (e.g., data on the inventory, rental records, etc.). 

In this project, I cleaned the different files, structured their information according to their interrelations, and loaded them into a MySQL database. Lastly, I have built some queries to get relevant insights to the business from the data. 

## Deliverables  

The output of this project is stored in this repository, as follows: 

<li> DATA: Both the raw CSV data provided and the cleaned CSV tables 
<li> NOTEBOOKS: Jupyter notebooks with a step-by-step cleaning process of each CSV file
<li> SQL: Script for the final MySQL database 
<li> EER: Database EER diagram  

## Key insights from databases exploration/cleaning 

These are the most relevant insights from the cleaning process that have supported 1) database cleaning decisions 2) MYSQL databased structure/interelations. 

The Jupyter notebooks with the full detail can be found [HERE](./data) 

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
        <li>table 'actors' in a 'many-to-many- relationship (fk = actor_id, film_id)</li>
        <li>table 'language' in a 'one-to-many- relationship (fk = language_id)</li>
        <li>table 'categories' in a 'one-to-many- relationship (fk = category_id)</li>
        <li>table 'inventory' in a 'one-to-many- relationship (fk = film_id)</li>
    </ul>
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
        <li> table 'rental' in a 'one-to-many' relationship (fk = inventory_id). We will see shortly the rental table contained logs of films that were not registered in the inventory (IDs >1000). Those were removed from the dataset. </li>
        <li> table 'films' in a 'one-to-many' relationship (fk = film_id) </li>
    </ul>
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

## Some challenges and solutions 

<details>
<summary>HOW TO LINK TABLES 'ACTORS' AND 'FILMS'</summary>
<br>
<li> Luckly, the rental shop's owners were nice enough to find the old sheet 'OLD_HDD.CSV' which related actors and the different films they have stared. 
<li> Thefore, I have used a table with columns actor_id and film_id to link tables 'actors' and 'films' in a 'many-to'many' relationship
</details>
<br>
<details>
<summary>HOW TO LINK TABLES 'INVENTORY' AND 'RENTAL'</summary>
<br>
<li> Both tables 'inventory' and 'rental' had a column named inventory_id 
<li> However, while the data in that field contained in table 'inventory' ranged from 1 to 1000, the data contained in the table 'rental' ranged from 2 to 4581 
<li> This indicates that some rentals referred to physical films that were not registered in the inventory (or we lost them)
<li> To be able to use 'inventory_id' as a foreign key in table rental, I have decided to remove the rental records that refered to IDs > 1000. 
</details>
<br>
<details>
<summary>HOW TO LINK TABLES 'FILMS' AND 'CATEGORIES'</summary>
<br>
<li> The old sheet 'OLD_HDD.CSV' also presented information that linked the films to different categories 
<li> However, that information was not available to every movie.  
<li> Thefore, I have created category 99 = Unknown, which I attributed to those films (hopefully someone will be able to categorize while there are no clients at the store!)
</details>


## Database Creation 

The final database was loaded into MYSQL following the relationships described above.

CREATE DATABASE: The code for database creation can be found [HERE](./sql)

EER DIAGRAM: The EER diagram can be found [HERE](./eer) 

## SQL tables to support business 

<details>
<summary>WHAT HAVE BEEN MY MOST DEMANDED FILMS?</summary>
<br>

```
SELECT f.film_id, f.title, count(rental_id)
FROM rental as r
INNER JOIN inventory as i
ON r.inventory_id = i.inventory_id
INNER JOIN films as f
ON f.film_id = i.film_id
GROUP BY film_id, title
ORDER BY count(rental_id) DESC
;
```  
</details>
<br>
<details>
<summary>WHAT HAVE BEEN MY MOST DEMANDED ACTORS?</summary>
<br>

```
SELECT a.actor_id, a.full_name, count(r.rental_id)
FROM rental as r
INNER JOIN inventory as i
ON r.inventory_id = i.inventory_id
INNER JOIN films as f
ON f.film_id = i.film_id
INNER JOIN actorsfilms AS af
ON af.film_id = f.film_id
INNER JOIN actors AS a
ON a.actor_id = af.actor_id
GROUP BY actor_id, full_name
ORDER BY count(rental_id) DESC
;
```  
</details>
<br>
<details>
<summary>HOW HAVE MY STAFF BEEN PERFORMING IN TERMS OF #RENTALS ?</summary>
<br>

```
SELECT staff_id, count(rental_id)
FROM RENTAL
GROUP BY staff_id
ORDER BY count(rental_id) DESC
;
```  
</details>
<br>
<details>
<summary>WHICH RETURNS ARE DELAYED</summary>
<br>

```
SELECT rental_id, customer_id, f.title
FROM rental as r
INNER JOIN inventory as i
ON r.inventory_id = i.inventory_id
INNER JOIN films as f
ON f.film_id = i.film_id
WHERE (r.return_date - r.rental_date) > rental_duration
;
```  
</details>
<br>
<details>
<summary>WHEN MY INTERN HAS SOME EXTRA TIME...</summary>
<br>

```
SELECT title, category_name
FROM films as f 
LEFT JOIN categories as c
ON f.category_id = c.category_id
WHERE category_name = 'Unknown'
;
```  
</details>