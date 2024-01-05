# Design Document

By Loc Dang

## Scope

The database covers fundamental entities essential to the library process, illustrating how students borrow books, along with related data linking students to their borrowed books. The database includes:

* Students, including basic identifying information
* Publishers, including basic identifying information
* Authors, including basic identifying information
* Category, including basic information about the genres to which books belong.
* Books, including basic information of books and including connections to authors, publishers, and categories.
* Loans, records of book borrowers, including check-in and check-out dates.

Out of scope are elements like fine when overdue, lost books, avalability stocks and other attributes.

## Functional Requirements

This database is designed to facilitate:

* Managing basic operations (Create, Read, Update, Delete) for student records.
* Recording all details of borrowed books, including check-in and check-out dates.
* Retrieving comprehensive information about books, such as publisher, author, or category through queries.

## Representation

Entities are captured in SQLite tables with the following schema.

### Entities

#### Students

The `students` table includes:

* `id`, which is the unique ID for the student as an `INTEGER`. Because this is unique thus it has the `PRIMARY KEY` constraint applies.
* `first_name`, which illustrates the student's first name as `TEXT`. And `TEXT` is approriate for name fields. Also the `NOT NULL` contraint applies to make sure first name must not be empty
* `last_name`, which illustrates the student's last name as `TEXT`. The constraint and type choice are the same as first name column
* `student_number`, which illustrates the student's number as `INTEGER`. Using `UNIQUE` constrain to make sure no student has the same student number

#### Loans

The `loans` table includes:

* `id`, which is the unique ID for each loan as an `INTEGER`. Because this is unique thus it has the `PRIMARY KEY` constraint applies.
* `book_id`, which illustrates the id of the book to whom student make a loan as an `INTEGER`. This column has `FOREIGN KEY` constraint applies, referencing the `id` column in the `books` table to ensure data integrity.
* `student_id`, which illustrates the id of the student who make a loan associate to which book as an `INTEGER`. This column has `FOREIGN KEY` constraint applies, referencing the `id` column in the `students` table to ensure data integrity.
* `check_in_date`, which illustrates the date when student make a loan. Timestamps in SQLite can be conveniently stored as `NUMERIC` and the default value is set as the current timestamp using 'DEFAULT CURRENT_TIMESTAMP'
* `check_out_date`, which illustrates the date when student return the book. The constraint and type choice are the same as `check_in_date`

#### Books

The `books` table includes:

* `id`, which is the unique ID for each book as an `INTEGER`. Because this is unique thus it has the `PRIMARY KEY` constraint applies.
* `title`, which illustrates the title of the book as `TEXT`. It must not be empty so it has `NOT NULL` contraint applies
* `category_id`, which illustrates the id of genres of the book as an `INTEGER`. This column has `FOREIGN KEY` constraint applies, referencing the `id` column in the `category` table to ensure data integrity.
* `author_id`, which illustrates the id of author who wrote the book as an `INTEGER`. This column has `FOREIGN KEY` constraint applies, referencing the `id` column in the `authors` table to ensure data integrity.
* `publisher_id`, which illustrates the id of publisher which published the book as an `INTEGER`. This column has `FOREIGN KEY` constraint applies, referencing the `id` column in the `publishers` table to ensure data integrity.
* `pages`, which illustrates pages of the book as `INTEGER`. It must not be empty so it has `NOT NULL` contraint applies

#### Category

* `id`, which is the unique ID for each genres as an `INTEGER`. Because this is unique thus it has the `PRIMARY KEY` constraint applies.
* `genres`, which illustrates genres as `TEXT`. It must not be empty so it has `NOT NULL` contraint applies

#### Authors

* `id`, which is the unique ID for each author as an `INTEGER`. Because this is unique thus it has the `PRIMARY KEY` constraint applies.
* `first_name`, which illustrates the author's first name as `TEXT`. And `TEXT` is approriate for name fields. Also the `NOT NULL` contraint applies to make sure first name must not be empty
* `last_name`, which illustrates the author's last name as `TEXT`. The constraint and type choice are the same as first name column

#### Publishers

* `id`, which is the unique ID for each author as an `INTEGER`. Because this is unique thus it has the `PRIMARY KEY` constraint applies.
* `name`, which illustrates the publisher's name as `TEXT`. And `TEXT` is approriate for name fields. Also the `NOT NULL` contraint applies to make sure name must not be empty
* `address`, which illustrates the publisher's address as `TEXT`. The constraint and type choice are the same as name column

### Relationships

The following diagram illustrates the relationships among the entities in the database through an Entity Relationship Diagram.

![ER Diagram](https://github.com/LDangDev/CS50-SQL-Final-Project/blob/main/library%20management%20diagram.png)

To be more specific:

* A student can make 0 or many loans from the library. 0 if they dont borrow any book from library and many if they borrow more than one book. At the same time, a loan is associated with one and only one student
* A loan associates with book could be one and many. One if student make a loan of only one book and many if student make a loan with more than one book. At the same time, a book is associated with one and only one loan
* A publisher can publish one or many books. One if they publish only one book and many if they publish more than one book. At the same time, assume that in this project the book could only be published by one and only one publisher
* A author can write one or many books. One if an author writes only one book and many if he/she writes more than one book. At the same time, a book could be written by one author or could be written by many authors
* A category can be one or many to the book. One if only one book has that kind of genres and many if many books have the same kind of category. At the same time, assume that in this project the book could only have one and only one category


## Optimizations

Users frequently query the database to retrieve information about books borrowed by specific students. To enhance the efficiency of these queries, indexes have been established on the `first_name`, `last_name`, and `student_number` columns within the `students` table. Similarly, an index has been created on the `title` column of the `books` table to speed up searches based on book titles.

Similarly, for swift identification of publishers, authors, and book categories, indexes have been implemented on the `genres`, `first_name`, and `last_name` columns of the `authors` table, as well as on the `name` column of the `publishers` table.

## Limitations

The current schema is simple for library management. It lacks of other entities to manage cases such as fine, overdue borrowed, availability of the books etc

