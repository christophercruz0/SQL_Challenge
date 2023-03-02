-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employees" (
    "Emp_no" integer  NOT NULL,
    "empl_title_id" varchar(15)   NOT NULL,
    "birth_date" date,
    "first_name" varchar(255) NOT NULL,
    "last_name" varchar(255) NOT NULL,
    "sex" varchar(10) NOT NULL,
    "hire_date" date NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Emp_no"
     )
);

CREATE TABLE "Titles" (
    "title_id" varchar(15)   NOT NULL,
    "title" varchar(150)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Dept_Mgr" (
    "dept_no" varchar(15)   NOT NULL,
    "emp_no" integer   NOT NULL
);

CREATE TABLE "Dept_emp" (
    "emp_no" integer   NOT NULL,
    "dept_no" varchar(15)   NOT NULL
);

CREATE TABLE "Departments" (
    "dept_no" varchar(15)   NOT NULL,
    "deparment_name" varchar(100)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" integer   NOT NULL,
    "salary" integer   NOT NULL
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_empl_title_id" FOREIGN KEY("empl_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Dept_Mgr" ADD CONSTRAINT "fk_Dept_Mgr_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Mgr" ADD CONSTRAINT "fk_Dept_Mgr_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("Emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("Emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("Emp_no");

