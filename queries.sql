-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database
-- Find all books are borrowed by student first name and last name
SELECT "title"
FROM "books"
INNER JOIN "loans" ON "loans"."book_id" = "books"."id"
INNER JOIN "students" ON "loans"."student_id" = "students"."id"
WHERE "first_name" = 'Loc'
AND "last_name" = 'Dang';

-- Find all books which are written by author first name and last name
SELECT "title"
FROM "books"
INNER JOIN "authors" ON "authors"."id" = "books"."author_id"
WHERE "first_name" = 'Stephen'
AND "last_name" = 'King';

-- Find all books which are published by a publisher
SELECT "title"
FROM "books"
INNER JOIN "publishers" ON "publishers"."id" = "books"."publisher_id"
WHERE "name" = 'HarperCollins';

-- Find the most recent borrowed books belongs to whose student number
SELECT "student_number", "title", "check_out_date"
FROM "students"
INNER JOIN "loans" ON "loans"."student_id" = "students"."id"
INNER JOIN "books" ON "books"."id" = "loans"."book_id"
ORDER BY "check_out_date" DESC
LIMIT 1;

-- Add a new student
INSERT INTO "students"("first_name", "last_name", "student_number")
VALUES ('Loc', 'Dang', '73827262');

-- Add a new book
INSERT INTO "books"("title", "category_id", "author_id", "publisher_id", "pages")
VALUES ('Suomen Mestari', '153', '745', '6422', '234');

-- Add a new author
INSERT INTO "authors"("first_name", "last_name")
VALUES ('Stephen', 'King');

-- Add a new category
INSERT INTO "category"("genres")
VALUES ('Friction');

-- Add a new publisher
INSERT INTO "publishers"("name", "address")
VALUES ('HarperCollins', '195 Broadway New York, NY 10007');
