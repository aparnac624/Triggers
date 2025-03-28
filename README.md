# Triggers

# Project: Triggers 

## Overview:
This project demonstrates the creation of triggers on a database. The following operations are implemented through MySQL triggers:

1. **Before Insert Trigger** (`before_insert_teacher`):
   - Prevents the insertion of a teacher if their salary is less than 0.
   - Raises a custom error message: "Salary cannot be negative".

2. **After Insert Trigger** (`after_insert_teacher`):
   - Logs every insertion of a new teacher in the `teacher_log` table.
   - The log includes the teacher's ID, the action (`INSERT`), and the timestamp of insertion.

3. **Before Delete Trigger** (`before_delete_teacher`):
   - Prevents the deletion of any teacher who has more than 10 years of experience.
   - Raises a custom error message: "Cannot delete teacher with more than 10 years of experience".

4. **After Delete Trigger** (`after_delete_teacher`):
   - Logs every deletion of a teacher in the `teacher_log` table.
   - The log includes the teacher's ID, the action (`DELETE`), and the timestamp of deletion.

## Steps to Run:

1. **Create Tables**: 
   - Create `teachers` and `teacher_log` tables using the provided SQL scripts.
   
2. **Insert Sample Data**:
   - Insert 8 rows into the `teachers` table as demonstrated.

3. **Create Triggers**:
   - Use the SQL statements for creating the triggers to enforce business logic on the database.

## Trigger Details:

- `before_insert_teacher`: Ensures that the salary cannot be negative during insertion.
- `after_insert_teacher`: Logs the insertion of a new teacher.
- `before_delete_teacher`: Prevents deletion of teachers with over 10 years of experience.
- `after_delete_teacher`: Logs the deletion of a teacher.

## Note : Have attached the screenshots of ouputs.
