DROP TABLE "dep_manager";
DROP TABLE "dep_emp";
DROP TABLE "salaries";
DROP TABLE "titles";
DROP TABLE "departments"
Drop TABLE "employees";

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Inspect the CSVs
-- and sketch out an ERD of the tables

CREATE TABLE "departments" (
    -- department_id INT PK
    "dep_no" VARCHAR   NOT NULL,
    "dep_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dep_no"
     )
);

CREATE TABLE "dep_manager" (
    "dep_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL
);

CREATE TABLE "dep_emp" (
    "emp_no" INT   NOT NULL,
    "dep_no" VARCHAR   NOT NULL
);

CREATE TABLE "employees" (
    -- employee_id INT PK
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "emp_title" VARCHAR   NOT NULL
);

ALTER TABLE "dep_manager" ADD CONSTRAINT "fk_dep_manager_dep_no" FOREIGN KEY("dep_no")
REFERENCES "departments" ("dep_no");

ALTER TABLE "dep_manager" ADD CONSTRAINT "fk_dep_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dep_emp" ADD CONSTRAINT "fk_dep_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dep_emp" ADD CONSTRAINT "fk_dep_emp_dep_no" FOREIGN KEY("dep_no")
REFERENCES "departments" ("dep_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

