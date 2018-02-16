
PRAGMA foreign_keys = 1;
create table customers (
	id 	  		integer primary key,
    title 		varchar,
    firstname 	varchar,
    surname 	varchar,
    email 		varchar
);

insert into customers (title, firstname, surname, email) values ('Mr', 'Donald', 'Trump', 'donald.trump@whitehouse.gov');
insert into customers (title, firstname, surname, email) values ('Mr', 'Ibrahim', 'Moha', 'ibramoha@gmail.com');
insert into customers (title, firstname, surname, email) values ('Mr', 'Colm', 'oconnor', 'colm.oconner.github@gmail.com');
insert into customers (title, firstname, surname, email) values ('Mr', 'Donald', 'Trump', 'donald.trump@whitehouse.gov');
insert into customers (title, firstname, surname, email) values ('Mr', 'Ibrahim', 'Moha', 'ibramoha@gmail.com');
insert into customers (title, firstname, surname, email) values ('Mr', 'German', 'Benicci', 'colm.oconner.github@gmail.com');
insert into customers (title, firstname, surname, email) values ('Mr', 'Donald', 'Trump', 'donald.trump@whitehouse.gov');
insert into customers (title, firstname, surname, email) values ('Mr', 'Ibrahim', 'Moha', 'ibramoha@gmail.com');
insert into customers (title, firstname, surname, email) values ('Mr', 'Colm', 'OConner', 'colm.oconner.github@gmail.com');
insert into customers (title, firstname, surname, email) values ('Mr', 'Donald', 'Trump', 'donald.trump@whitehouse.gov');



create table room_types(
	id 				integer primary key,
	type_name		varchar,
	original_price	real,
	current_Price	real
);


insert into room_types (type_name, original_price, current_price) values ('One-Bedroom', 200.04, 350);
insert into room_types (type_name, original_price, current_price) values ('Two-Bedroom', 600.01, 700.05);
insert into room_types (type_name, original_price, current_price) values ('Three-Bedroom', 739.05, 800.05);
insert into room_types (type_name, original_price, current_price) values ('One-Bedroom', 200.04, 350);
insert into room_types (type_name, original_price, current_price) values ('Two-Bedroom', 600.01, 700.05);
insert into room_types (type_name, original_price, current_price) values ('Three-Bedroom', 739.05, 800.05);
insert into room_types (type_name, original_price, current_price) values ('One-Bedroom', 200.04, 350);
insert into room_types (type_name, original_price, current_price) values ('Two-Bedroom', 600.01, 700.05);
insert into room_types (type_name, original_price, current_price) values ('Three-Bedroom', 739.05, 800.05);
insert into room_types (type_name, original_price, current_price) values ('One-Bedroom', 200.04, 350);





create table rooms(
	id 				integer primary key,
	room_type_id    integer not null,
	sea_View        boolean default false,
	foreign key(room_type_id)  references room_types(id)
);

insert into rooms (room_type_id, sea_View) values ( 1, 1);
insert into rooms (room_type_id, sea_View) values ( 2, 0);
insert into rooms (room_type_id, sea_View) values ( 3, 1);
insert into rooms (room_type_id, sea_View) values ( 5, 1);
insert into rooms (room_type_id, sea_View) values ( 4, 1);
insert into rooms (room_type_id, sea_View) values ( 6, 1);
insert into rooms (room_type_id, sea_View) values ( 8, 1);
insert into rooms (room_type_id, sea_View) values ( 7, 1);
insert into rooms (room_type_id, sea_View) values ( 9, 1);
insert into rooms (room_type_id, sea_View) values ( 10, 1);



create table reservations(
	id 				integer primary key,
	customerId 		integer,
	roomId			integer not null,
	checkInDate     datetime not null,
	checkOutDate	datetime ,
	roomPrice		number,
	foreign key(customerId)  references customers(id),
	foreign key(roomId)  references rooms(id)
	);

insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (1, 1, '01/01/2018', '06/01/2017', 100);
insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (2, 3, '01/01/2018', '06/01/2017', 101);
insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (3, 2, '01/01/2018', '06/01/2017', 102);
insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (4, 5, '01/01/2018', '06/01/2017', 103);
insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (5, 6, '01/01/2018', '06/01/2017', 104);
insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (6, 4, '01/01/2018', '06/01/2017', 105);
insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (7, 7, '01/01/2018', '06/01/2017', 106);
insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (8, 8, '01/01/2018', '06/01/2017', 107);
insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (9, 9, '01/01/2018', '06/01/2017', 108);
insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (10,56, '01/01/2018', '06/01/2017', 109);






create table invoices (
	id 				    integer primary key,
	reservation_id 		integer not null,
    total               number,
    invoice_date_time   datetime not null,
    paid                boolean default false,
	foreign key(reservation_id)  references reservations(id)
    
);

insert into invoices (reservation_id, total, invoice_date_time, paid) values (1, 1000.00, '01/01/2018',1);
insert into invoices (reservation_id, total, invoice_date_time, paid) values ( 8, 3444.50, '01/01/2017', 1);
insert into invoices (reservation_id, total,  invoice_date_time, paid) values ( 7, 3445.50, '01/01/2017', 0);
insert into invoices (reservation_id, total,  invoice_date_time, paid) values ( 9, 143.50, '01/01/2017', 1);
insert into invoices (reservation_id, total, invoice_date_time) values ( 2, 250.50, '02/01/2017');
insert into invoices (reservation_id, total,  invoice_date_time) values ( 5, 431.50, '03/01/2017');
insert into invoices (reservation_id, total,  invoice_date_time, paid) values ( 11, 300.50, '04/01/2017', 1);
insert into invoices (reservation_id, total,  invoice_date_time, paid) values ( 6, 284.35, '04/01/2017', 1);
insert into invoices (reservation_id, total,  invoice_date_time, paid) values ( 10, 284.35, '04/01/2017', 1);
insert into invoices (reservation_id, total,  invoice_date_time, paid) values ( 15, 284.35, '04/01/2017', 1);












