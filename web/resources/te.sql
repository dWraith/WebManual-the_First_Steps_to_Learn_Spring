
alter table questions auto_increment = 3;

update tests set `third_question` = 3 where id_test = 1;

insert into answers (`answer`) value ('задает размер шрифта');

insert into answers (`answer`) value ('задает стиль шрифта');

insert into answers (`answer`) value ('задает семейство шрифта');

insert into answers (`answer`) value ('задает толщину шрифта');

set @id = last_insert_id() - 4;

insert into questions (`question`,`first_answer`,`second_answer`,`third_answer`,`fourth_answer`,`correct_answer`)
values ('Что определяет параметр font-style?', @id:= @id + 1, @id:= @id + 1, @id:= @id + 1, @id:= @id + 1, 14);

update tests set `fourth_question` = 4 where id_test = 1;

insert into answers (`answer`) value ('определяет размер шрифта');

insert into answers (`answer`) value ('определяет толщину шрифта');

insert into answers (`answer`) value ('определяет семейство шрифта');

insert into answers (`answer`) value ('определяет стиль шрифта');

set @id = last_insert_id() - 4;

insert into questions (`question`,`first_answer`,`second_answer`,`third_answer`,`fourth_answer`,`correct_answer`)
values ('Что определяет параметр font-family?', @id:= @id + 1, @id:= @id + 1, @id:= @id + 1, @id:= @id + 1, 19);

update tests set `fifth_question` = 5 where id_test = 1;

insert into answers (`answer`) value ('задает горизонтальное выравнивание');

insert into answers (`answer`) value ('задает характер отображения пробелов между словами');

insert into answers (`answer`) value ('задает размер пробелов между словами');

insert into answers (`answer`) value ('задает преобразование регистра символов');

set @id = last_insert_id() - 4;

insert into questions (`question`,`first_answer`,`second_answer`,`third_answer`,`fourth_answer`,`correct_answer`)
values ('Что определяет параметр white-space?', @id:= @id + 1, @id:= @id + 1, @id:= @id + 1, @id:= @id + 1, 22);

update tests set `sixth_question` = 6 where id_test = 1;

insert into answers (`answer`) value ('определяет горизонтальное выравнивание');

insert into answers (`answer`) value ('определяет межстрочный интервал');

insert into answers (`answer`) value ('определяет межсимвольный интервал');

insert into answers (`answer`) value ('определяет направление текста');

set @id = last_insert_id() - 4;

insert into questions (`question`,`first_answer`,`second_answer`,`third_answer`,`fourth_answer`,`correct_answer`)
values ('Что определяет параметр line-height?', @id:= @id + 1, @id:= @id + 1, @id:= @id + 1, @id:= @id + 1, 26);

update tests set `seventh_question` = 7 where id_test = 1;

insert into answers (`answer`) value ('задает цвет фона');

insert into answers (`answer`) value ('задает цвет рамок');

insert into answers (`answer`) value ('задает цвет текста элемента');

insert into answers (`answer`) value ('задает цвет подсветки');

set @id = last_insert_id() - 4;

insert into questions (`question`,`first_answer`,`second_answer`,`third_answer`,`fourth_answer`,`correct_answer`)
values ('Что определяет параметр color?', @id:= @id + 1, @id:= @id + 1, @id:= @id + 1, @id:= @id + 1, 31);

update tests set `eighth_question` = 8 where id_test = 1;

insert into answers (`answer`) value ('задает свойства рамок');

insert into answers (`answer`) value ('задает свойства таблицы');

insert into answers (`answer`) value ('задает свойства списка');

insert into answers (`answer`) value ('задает свойства шрифта');

set @id = last_insert_id() - 4;

insert into questions (`question`,`first_answer`,`second_answer`,`third_answer`,`fourth_answer`,`correct_answer`)
values ('Что определяет параметр font?', @id:= @id + 1, @id:= @id + 1, @id:= @id + 1, @id:= @id + 1, 36);

update tests set `nine_question` = 9 where id_test = 1;

insert into answers (`answer`) value ('определяет размер шрифта');

insert into answers (`answer`) value ('определяет толщину шрифта');

insert into answers (`answer`) value ('определяет стиль шрифта');

insert into answers (`answer`) value ('определяет семейство шрифта');

set @id = last_insert_id() - 4;

insert into questions (`question`,`first_answer`,`second_answer`,`third_answer`,`fourth_answer`,`correct_answer`)
values ('Что определяет параметр font-weight?', @id:= @id + 1, @id:= @id + 1, @id:= @id + 1, @id:= @id + 1, 38);

update tests set `tenth_question` = 10 where id_test = 1;
