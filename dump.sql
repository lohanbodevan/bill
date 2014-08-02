create database bill;
use bill;
create table account_types(
	id int not null auto_increment,
	name varchar(150) not null,
	primary key(id)
);

create table accounts(
	id int not null auto_increment,
	account_types_id int not null,
	description text,
	month int not null,
	year int not null,
	value decimal(12,2) not null,
	paid int not null default '0',
	due_date date,
	date_time timestamp not null,
	primary key(id),
	constraint fk_accounts_account_types foreign key (account_types_id) references account_types(id)
	on delete restrict on update restrict
);

create table payments(
	id int not null auto_increment,
	accounts_id int,
	description text,
	value decimal(12,2) not null,
	date_time timestamp not null,
	primary key(id),
	constraint fk_payments_accounts foreign key (accounts_id) references accounts(id)
	on delete restrict on update restrict
);