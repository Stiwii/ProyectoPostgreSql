CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int8,
  "role_id" int
);

CREATE TABLE "user_course" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid,
  "course_id" uuid
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" varchar,
  "categories_id" int,
  "level_id" int,
  "teacher_id" uuid
);

CREATE TABLE "levels" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "teachers" (
  "id" uuid PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "video_curse" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "url" varchar,
  "curse_id" uuid
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "user_course" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_course" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "video_curse" ADD FOREIGN KEY ("curse_id") REFERENCES "courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_id") REFERENCES "levels" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_id") REFERENCES "teachers" ("id");

insert into roles(name)
values('student'),('teacher'),('admin') ;

insert into categories("name")
values('Desarrollo Web'),('Marketing');

insert into levels("name") 
values('beginner'),('intermediate'),('advanced');

insert
	into
	users(id,
	name,
	email,
	"password" ,
	age ,
	role_id)
values('1bae1a61-39c6-4d02-b302-3e70f4395491', 'Steeven', 'ste@academlo.com', '123',  25,  1),
('bf3ae432-d86f-48cd-87bd-05d19c4eff8b', 'Sahid', 'sahid@academlo.com', '123', 27, 2);

insert into teachers(id, name)
values('bf3ae432-d86f-48cd-87bd-05d19c4eff8b','Sahid'),
('f0a0a214-c663-4b02-b4c6-754b75267591','Benjamin');

insert into courses (id, title,description,categories_id, level_id, teacher_id)
values('c25f7a30-958c-4c83-b897-2f52b86bd1d4','FronEnd','Manejo de Reactjs',1,1, 'f0a0a214-c663-4b02-b4c6-754b75267591'),
('3e5df905-570c-4a0e-8c01-bbd47eb7abc9','Backend','Creacion de Base de datos',1,2,'bf3ae432-d86f-48cd-87bd-05d19c4eff8b');

insert into video_curse (id, title, url, curse_id)
values('5f1bf1b1-e0f3-4ce7-9bd8-411d4049b032','Manejo de Hooks','https://localhost:900/front','c25f7a30-958c-4c83-b897-2f52b86bd1d4'),
('c44f8b00-6a67-4b90-b0f0-edaa43d2189c','Revision de Dase de Datos','https://localhost:900/back','3e5df905-570c-4a0e-8c01-bbd47eb7abc9');

insert into user_course (id, user_id,course_id)
values('86fab65e-cf06-4a37-9fed-4a6656d2ae6f','1bae1a61-39c6-4d02-b302-3e70f4395491','c25f7a30-958c-4c83-b897-2f52b86bd1d4'),
('b14d8e03-734f-4824-bb3f-bc43ed27b073','1bae1a61-39c6-4d02-b302-3e70f4395491','3e5df905-570c-4a0e-8c01-bbd47eb7abc9');