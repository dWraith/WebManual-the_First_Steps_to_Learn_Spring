CREATE TABLE TESTS (
id_test int auto_increment,
name_test varchar(50) not null,

primary key(id_test)
);

CREATE TABLE ANSWERS (
id_answer int auto_increment,
answer varchar(250) not null,
id_question int,

primary key(id_answer)
);

CREATE TABLE QUESTIONS (
id_question int auto_increment,
question varchar(500) not null,
id_correct_answer int,

primary key(id_question),
foreign key(id_correct_answer) references answers(id_answer)
);

create table `completedtests` (
id int auto_increment not null,
id_test integer,
id_user integer, 
rating double not null,

PRIMARY KEY(ID),

FOREIGN KEY(id_test) REFERENCES tests(id_test),

FOREIGN KEY(id_user) REFERENCES users(id)
);

create table `language` (
id_language int auto_increment,
name varchar(20) not null,
primary key(id_language)
);

create table `toctexts` (
id_toctext int auto_increment,
name varchar(30),

primary key(id_toctext)
);

#CHANGE VALUE AUTO_INCREMENT
alter table question auto_increment = 1;
#RENAME COLUMN IN THE TABLE
alter table questions change column `corrent_answer` `correct_answer` int;
#DROP TABLE WITH FOREIGN KEY
SET FOREIGN_KEY_CHECKS=0; DROP TABLE tests; SET FOREIGN_KEY_CHECKS=1;
#RENAME TABLE
RENAME TABLE `page` to `pages`;
#INCREMENT
set @id = last_insert_id();
select @id:= @id + 1;
#SET DEFAULT VALUE
alter table users alter column users.rating set default 1;

#
SELECT * FROM answers join questions on id_answer = correct_answer where questions.id_question = 10;

#TEST

insert into tests (`name_test`) value ('CSS{...}');

set id_test = last_insert_id();

insert into questions (`question`) value('Что определяет параметр letter-spacing?');

set @id = last_insert_id();

insert into answers (`answer`,`id_question`) values ('задает межсимвольный интервал', @id);

set @correct_answer = last_insert_id();

insert into answers (`answer`,`id_question`) values ('задает межстрочный интервал', @id);

insert into answers (`answer`,`id_question`) values ('задает тень текста', @id);

insert into answers (`answer`,`id_question`) values ('задает направление текста', @id);

update questions set `id_correct_answer` = @correct_answer, id_test = @id_test where id_question = @id
