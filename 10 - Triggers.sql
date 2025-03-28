-- creating a new database school
create database school;
use school;

-- Questions -------------------------------------------------------------------------------------------------
-- 1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows. 
create table teachers ( id int not null PRIMARY KEY, 
name varchar(25), 
subject varchar(25), 
experience int, 
salary decimal(10,2));

insert into teachers ( id, name, subject, experience, salary )
values 
(1, 'Rajesh Kumar', 'Mathematics', 5, 50000),
(2, 'Priya Sharma', 'Science', 3, 45000),
(3, 'Amitha S', 'English', 7, 55000),
(4, 'Neha Warrior', 'History', 12, 65000),
(5, 'Suresh S', 'Geography', 9, 60000),
(6, 'Anjali Patel', 'Physics', 4, 47000),
(7, 'Vaisakh P', 'Chemistry', 11, 62000),
(8, 'Sita Das', 'Biology', 8, 59000);

select * from teachers;

-- 2. Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative” if the salary inserted to the table is less than zero. 
delimiter $$
create trigger before_insert_teacher
before insert on teachers for each row
begin
	if new.salary < 0 then
		signal sqlstate '45000' set message_text = "salary cannot be negative";
	end if;
end $$
delimiter ;
show triggers;

insert into teachers (id, name, subject, experience, salary)
values 
(9, "Aparna C", "Computer Science", 3, -2 );

-- 3. Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, timestamp to a table called teacher_log when a new entry gets inserted to the teacher table. tecaher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted. 
-- creating a new table teacher_log
create table teacher_log (
teacher_id int PRIMARY KEY,
action varchar(50),
timestamp TIMESTAMP default current_timestamp);

delimiter $$
create trigger after_insert_teacher
after insert on teachers for each row
begin
	insert into teacher_log (teacher_id, action, timestamp)
    values (NEW.id, 'INSERT', NOW());
end $$
delimiter ;

insert into teachers (id, name, subject, experience, salary)
values 
(9, "Sonakshi", "Computer Science", 3, 65000);

select * from teachers;
select * from teacher_log;


-- 4. Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years. 
delimiter $$
create trigger before_delete_trigger
before delete on teachers for each row
begin
	if old.experience > 10 then
		signal sqlstate '45000' set message_text = "Cannot delete a row that has experience greater than 10 years";
	end if;
end $$
delimiter ;

delete from teachers where id = 4; 

-- 5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.
delimiter $$
create trigger after_delete_teacher
after delete on teachers for each row
begin
	insert into teacher_log (teacher_id, action, timestamp)
    values 
    (OLD.id, "DELETE", now());
end $$
delimiter ;

insert into teachers (id, name, subject, experience, salary)
values 
(10, "Sidh Madhav", "Maths", 5, 70000);

select * from teachers;
select * from teacher_log;

delete from teachers where id = 10;

select * from teachers;
select * from teacher_log;
