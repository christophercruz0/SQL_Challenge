-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "employees" (
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

CREATE TABLE "titles" (
    "title_id" varchar(15)   NOT NULL,
    "title" varchar(150)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "dept_Mgr" (
    "dept_no" varchar(15)   NOT NULL,
    "emp_no" integer   NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" integer   NOT NULL,
    "dept_no" varchar(15)   NOT NULL
);

CREATE TABLE "departments" (
    "dept_no" varchar(15)   NOT NULL,
    "department_name" varchar(100)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" integer   NOT NULL,
    "salary" integer   NOT NULL
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_Employees_empl_title_id" FOREIGN KEY("empl_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_Mgr" ADD CONSTRAINT "fk_Dept_Mgr_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_Mgr" ADD CONSTRAINT "fk_Dept_Mgr_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("Emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_Dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("Emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_Dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("Emp_no");

