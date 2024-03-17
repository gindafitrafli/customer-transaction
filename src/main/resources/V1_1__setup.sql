create table master_user (
	id int primary key,
	username varchar(30) unique  not null,
	email varchar (50) unique not null,
	role_id int not null,
);

create table user_info (
	user_id int primary key,
	name varchar(300) not null,
	birthdate date,
	birthplace varchar(30),
	created_by varchar(30) not null,
	created_at timestamptz not null,
	updated_by varchar(30),
	updated_at timestamptz,
);

create table user_login (
	user_id int primary key,
	user_password varchar(512) not null
)

create table product (
	id int primary key,
	name varchar(300) unique,
	price decimal not null,
	tax decimal not null
);

create table master_order (
	id int primary key,
	payment_method_id int not null,
	payment_status_id int not null,
	actor_username varchar(30) not null
);

create table order_details(
	order_id int not null,
	product_id int not null,
	qty int not null,
	net_price decimal not null,
	tax_amount decimal not null,
	total_price decimal not null,
	primary key (order_id, product_id)
);

create table transactions (
	id int primary key,
	order_id int not null,
	net_paid_amount decimal not null,
	tax_paid_amount decimal not null,
	total_paid_amount decimal not null,
	trx_date timestamptz not null,
	actor_username varchar(30) not null
);

create table payment_method (
	id int primary key,
	name varchar (30) not null
);

create table payment_status (
	id int primary key,
	name varchar (30) not null
);

create table user_role (
	id int primary key,
	name varchar (30) not null
);

create sequence user_id_sequence;
create sequence product_id_sequence;
create sequence order_id_sequence;
create sequence transaction_id_sequence;
