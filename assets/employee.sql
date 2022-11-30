-- Make sure no error with existing database
DROP DATABASE IF EXISTS employees;

-- Create employee database
CREATE DATABASE employees;

-- Use employee database
USE employees;

-- Create table for departments
CREATE TABLE department(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL
);

-- Create table for roles
CREATE TABLE role (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(30) UNIQUE NOT NULL,
    salary DECIMAL UNSIGNED NOT NULL,
    department_id INT UNSIGNED NOT NULL,
    INDEX dep_ind (department_id),
    CONSTRAINT department_key FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE CASCADE
);

-- Create table for employees
CREATE TABLE employee (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role_id INT UNSIGNED NOT NULL,
    INDEX role_ind (role_id),
    CONSTRAINT role_fk FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE,
    manager_id INT UNSIGNED,
    INDEX manager_ind (manager_id),
    CONSTRAINT manager_fk FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL,
);

-- Use employees
USE employees

-- Insert departments
INSERT INTO department
    (name)

VALUES
    ('Engineering'),
    ('Finance'),
    ('Legal'),
    ('Sales');

-- Insert details into role
INSERT INTO role
    (title, salary, department_id)

VALUES
    ('Sales Lead', 100000, 4),
    ('Salesperson', 80000, 4 ),
    ('Lead Engineer', 150000, 1),
    ('Software Engineer', 120000, 1),
    ('Account Manager', 160000, 2),
    ('Accountant', 125000, 2),
    ('Legal Team Lead', 250000, 3),
    ('Lawyer', 190000, 3);

-- Insert details for employee
INSERT INTO employee
    (first_name, last_name, role_id, manager_id)

VALUES
    ('John', 'Doe', 1, NULL),
    ('Mike', 'Chan', 2, 1),
    ('Ashley', 'Rodriguez', 3, NULL),
    ('Kevin', 'Tupik', 4, 3),
    ('Kunal', 'Singh', 5, NULL),
    ('Malia', 'Brown', 6, 5),
    ('Sarah', 'Lourd', 7, NULL),
    ('Allen', 'Allen', 8, 7);
