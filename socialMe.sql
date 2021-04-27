create schema SocialMe;

create database if not exists socialme;

use SocialMe;

drop table if exists user;
drop table if exists posts;
drop table if exists comments;

create table user (
	id int(10) not null auto_increment,
	username varchar(50) not null,
	email varchar(255) not null,
	password varchar(255) not null,
	dob date,
	primary key (id)
);

create table posts (
	id int(10) not null auto_increment,
	title text not null,
	created datetime default current_timestamp,
	body text not null,
	user_id int not null,
	primary key (id),
	foreign key (user_id) references user (id)
);

create table comments (
	id int(10) not null auto_increment,
	post_id int not null,
	user_id int not null,
	created datetime default current_timestamp,
	primary key (id),
	foreign key (post_id) references posts (id),
	foreign key (user_id) references user (id)
);