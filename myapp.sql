drop table if exists posts;
create table posts (
  id int unsigned primary key auto_increment,
  title varchar(255),
  body text,
  created datetime default current_timestamp,
  updated datetime default current_timestamp on update current_timestamp
);





-- drop table if exists logs;
-- create table logs (
--   id int unsigned primary key auto_increment,
--   msg varchar(255)
-- );

-- drop trigger if exists posts_update_trigger;
-- delimiter //
-- create trigger posts_update_trigger after update on posts for each row
--   begin
--     insert into logs (msg) values ('post updated!');
--     insert into logs (msg) values (concat(old.title, '->', new.title));
--   end;
-- //
-- delimiter ;

-- drop table if exists comments;
-- create table comments (
--   id int unsigned primary key auto_increment,
--   post_id int unsigned not null,
--   title varchar(255),
--   body text
-- );

-- drop table if exists comments;
-- create table comments (
--   id int unsigned primary key auto_increment,
--   post_id int unsigned not null,
--   title varchar(255),
--   body text
-- );

-- alter table comments add constraint fk_comments foreign key (post_id) references posts (id);

-- insert into posts (title, body) values ('title 1', 'body 1');
-- insert into posts (title, body) values ('title 2', 'body 2');
-- insert into posts (title, body) values ('title 3', 'body 3');

-- update posts set created = '2016-12-31 10:00:00' where id = 2;
-- update posts set title = 'title 2 updated' where id = 2;

-- select created, date_format(created, '%W %M %Y') from posts;

-- select created, date_add(created, interval 14 day) from posts;
-- select created, date_add(created, interval 2 week) from posts;
-- select * from posts where created > '2017-01-01';
-- select * from posts;

-- select * from logs;

-- show triggers;
-- show triggers \G;

-- insert into comments (post_id, body) values (1, 'first comment for post 1');
-- insert into comments (post_id, body) values (1, 'second comment for post 1');
-- insert into comments (post_id, body) values (3, 'first comment for post 3');

-- delete from posts where id = 2;
-- insert into posts (title, body) values ('new title', 'new body');
-- insert into comments (post_id, body) values (4, 'first comment for new post');
-- insert into comments (post_id, body) values (last_insert_id(), 'first comment for new post');

-- select * from posts;
-- select * from comments;


-- insert into comments (post_id, body) values (4, 'first comment for post 4');

--  inner join
-- outer join

-- select * from posts left outer join comments on posts.id = comments.post_id;
-- select * from posts right outer join comments on posts.id = comments.post_id;
-- select * from posts left join comments on posts.id = comments.post_id;
-- select * from posts right join comments on posts.id = comments.post_id;

-- select * from posts inner join comments on posts.id = comments.post_id;
-- select * from posts join comments on posts.id = comments.post_id;
-- select posts.id, posts.title, posts.body, comments.body from posts join comments on posts.id = comments.post_id;

-- select * from posts;
-- select * from comments;


/*
number:
- int
- float
- double
- int unsigned 正の数のみ

string:
- char(4)
- varchar(255)
- text

date/time:
- date
- time
- datetime '2017-07-22 17:22:33'

true/false:
- boolean -> tinyint(1)
  true -> 1
  false -> 0
*/

-- drop table if exists users;
-- create table users (
--   id int unsigned primary key auto_increment,
--   -- name varchar(20) unique,
--   name varchar(20),
--   -- score float not null
--   -- score float default 0.0
--   score float
-- );


-- drop table if exists users;
-- create table users (
--   id int unsigned primary key auto_increment,
--   name varchar(20),
--   score float,
--   coins set('gold', 'silver', 'bronze')
-- );


-- drop table if exists users;
-- create table users (
--   id int unsigned primary key auto_increment,
--   name varchar(20),
--   score float
-- );

-- 索引を作成
-- alter table users add index index_score(score);
-- show index from users;
-- explain select * from users where score > 5.0;
-- explain select * from users where name = 'taguchi';

-- 索引を削除
-- alter table users drop index index_score;
-- 索引の一覧を表示
-- show index from users;

-- insert into users (name, score) values ('taguchi', 5.8);
-- insert into users (name, score) values ('fkoji', 8.2);
-- insert into users (name, score) values ('dotinstall', 6.1);
-- insert into users (name, score) values ('Tanaka', 4.2);
-- insert into users (name, score) values ('yamada', null);
-- insert into users (name, score) values ('tashiro', 7.9);

-- start transaction;
-- update users set score = score - 1.2 where name = 'fkoji';
-- update users set score = score + 1.2 where name = 'taguchi';
-- -- commit;
-- rollback;

-- select * from users;

-- drop view if exists top3;
-- create view top3 as select * from users order by score desc limit 3;
-- -- select * from top3;

-- show tables;
-- show create view top3;

-- select
--   name,
--   score,
--   if (score > 5.0, 'OK', 'NG') as result
-- from
--   users;

-- select
--   name,
--   score,
--   case floor(score) % 2
--     when 0 then 'even'
--     when 1 then 'odd'
--     else null
--   end as type
-- from
--   users;


-- drop table if exists users_with_team;
-- create table users_with_team as
-- select
--   id,
--   name,
--   score,
--   case
--     when score > 8.0 then 'Team-A'
--     when score > 6.0 then 'Team-B'
--     else 'Team-C'
--   end as team
-- from
--   users;


-- サブクエリ
-- select
--   sum(t.score),
--   t.team
-- from
--   (select
--   id,
--   name,
--   score,
--   case
--     when score > 8.0 then 'Team-A'
--     when score > 6.0 then 'Team-B'
--     else 'Team-C'
--   end as team
-- from
--   users) as t
-- group by t.team;

-- select sum(score), team from users_with_team group by team;
-- select sum(score), team from users_with_team group by team having sum(score) > 10.0;
-- select sum(score), team from users_with_team where id > 3 group by team;

-- select count(distinct team) from users_with_team;


-- select sum(score) from users_with_team;
-- select min(score) from users_with_team;
-- select max(score) from users_with_team;
-- select avg(score) from users_with_team;


-- select count(score) from users_with_team;
-- select count(id) from users_with_team;
-- select count(*) from users_with_team;

-- select * from users_with_team;


-- create table users_copy select * from users;
-- select * from users_copy;

-- create table users_empty like users;
-- desc users_empty;
-- select * from users_empty;

-- select * from users where coins = 'gold,silver';
-- select * from users where coins like '%gold%';
-- select * from users where runk = 2;
-- select * from users where coins = 3;

-- select length('Hello'); -- 5
-- select substring('Hello', 2); -- ello 2文字目い以降を抽出
-- select substring('Hello', 2, 3); -- ell 2文字目から3文字を抽出
-- select upper('Hello'); -- HELLO 大文字に
-- select lower('Hello'); -- hello 小文字に
-- select concat('hello', 'world'); -- helloworld 文字列の連結

-- select length(name), name from users order by length(name); -- 文字の長さ順に抽出
-- select length(name) as len, name from users order by len; -- カラムを別名にして文字の長さ順に抽出


-- update users set score = score * 1.2 where id % 2 = 0;

-- select round(5.355); -- 5 四捨五入
-- select round(5.355, 1); -- 5.4　小数点１桁で四捨五入
-- select floor(5.833); -- 5　小数点以下の切り捨て
-- select ceil(5.833); -- 6　小数点以下の切り上げ
-- select rand(); -- 0以上1未満のランダムな数を生成

-- select * from users order by rand() limit 1; --抽選



-- select * from users;

-- update users set score = 5.9;
-- update users set score = 5.9 where id = 1;
-- update users set name = 'sasaki', score = 2.9 where name = 'tanaka';

-- delete from users;
-- delete from users where score < 5.0;


-- select * from users order by score;
-- select * from users where score is not null order by score desc;
-- select * from users limit 3;
-- select * from users limit 3 offset 3;
-- select * from users order by score desc limit 3;


-- select * from users where name = 'taguchi';
-- select * from users where name like 't%';
-- select * from users where name like '%a%';
-- select * from users where name like '%a';
-- select * from users where name like 'T%';
-- select * from users where name like binary 'T%';
-- select * from users where name like '______';
-- select * from users where name like '_a%';


-- select * from users;
-- select id, name from users;
--  < > <= >= = <> !=
-- is null, is not null
-- and or not
-- select * from users where score >= 6.0;
-- select * from users where score >= 3.0 and score <= 6.0;
-- select * from users where score between 3.0 and 6.0;
-- select * from users where name = 'taguchi' or name = 'fkoji';
-- select * from users where name in ('taguchi', 'fkoji');

-- alter table users add column email varchar(255);
-- alter table users add column email varchar(255) after name;
-- alter table users drop column score;
-- alter table users change name user_name varchar(80) default 'nobody';

-- desc users;

-- alter table users rename persons;
-- show tables;
-- drop table if exists persons;

-- desc users;


-- insert into users (name, score) values ('taguchi', 5.8);
-- insert into users (name, score) values ('fkoji', 8.2);
-- insert into users (name, score) values ('dotinstall', 6.1);


-- insert into users (id, name, score) values (1, 'taguchi', 5.8);
-- insert into users (id, name, score) values (2, 'fkoji', 8.2);
-- insert into users (id, name, score) values (3, 'dotinstall', 6.1);
-- insert into users (id, name, score) values (4, 'yamada', null);
-- insert into users (id, name) values (5, 'tanaka');
-- insert into users (id, name) values (6, 'tanaka');


-- insert into users (id, name, score) values
--   (1, 'taguchi', 5.8),
--   (2, 'fkoji', 8.2),
--   (3, 'dotinstall', 6.1),
--   (4, 'yamada', null);

-- select * from users;