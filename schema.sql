-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it
-- Represent students information
CREATE TABLE "students" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "student_number" INTEGER UNIQUE,
    PRIMARY KEY("id")
);

-- Represent which books are borrowed by who, check-in and check-out date
CREATE TABLE "loans" (
    "id" INTEGER,
    "book_id" INTEGER,
    "student_id" INTEGER,
    "check_in_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "check_out_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("book_id") REFERENCES "books"("id"),
    FOREIGN KEY("student_id") REFERENCES "students"("id")
);

-- Represent books information
CREATE TABLE "books" (
    "id" INTEGER,
    "title" TEXT NOT NULL,
    "category_id" INTEGER,
    "author_id" INTEGER,
    "publisher_id" INTEGER,
    "pages" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("category_id") REFERENCES "category"("id"),
    FOREIGN KEY("author_id") REFERENCES "authors"("id"),
    FOREIGN KEY("publisher_id") REFERENCES "publishers"("id")
);

-- Represent category information
CREATE TABLE "category" (
    "id" INTEGER,
    "genres" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Represent authors information
CREATE TABLE "authors" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY "id"
)

-- Represent publishers information
CREATE TABLE "publishers" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    PRIMARY KEY "id"
)

-- Create indexes to boost up on commom query
CREATE INDEX "student_name_search" ON "students"("first_name", "last_name")
CREATE INDEX "student_number_search" ON "students"("student_number")
CREATE INDEX "book_title" ON "books"("title")
CREATE INDEX "book_category" ON "category"("genres")
CREATE INDEX "author_name" ON "authors"("first_name", "last_name")
CREATE INDEX "publisher_name" ON "publishers"("name")
