
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
insert into customers (title, firstname, surname, email) values ('Mr', 'Caleb', 'Tump', 'donald.trump@whitehouse.gov');
insert into customers (title, firstname, surname, email) values ('Mr', 'Ibra', 'Moha', 'ibramoha@gmail.com');
insert into customers (title, firstname, surname, email) values ('Mr', 'German', 'Benicci', 'colm.oconner.github@gmail.com');
insert into customers (title, firstname, surname, email) values ('Mr', 'Dona', 'Truman', 'donald.trump@whitehouse.gov');
insert into customers (title, firstname, surname, email) values ('Mr', 'Amir', 'Moha', 'ibramoha@gmail.com');
insert into customers (title, firstname, surname, email) values ('Mr', 'Calum', 'OConner', 'colm.oconner.github@gmail.com');
insert into customers (title, firstname, surname, email) values ('Mr', 'Liza', 'Trump', 'donald.trump@whitehouse.gov');



create table room_types(
	id 				integer primary key,
	type_name		varchar,
	original_price	real,
	current_Price	real
);


insert into room_types (type_name, original_price, current_price) values ('Two-Bedroom', 600.01, 700.05);
insert into room_types (type_name, original_price, current_price) values ('Three-Bedroom', 739.05, 800.05);
insert into room_types (type_name, original_price, current_price) values ('One-Bedroom', 200.04, 350);
insert into room_types (type_name, original_price, current_price) values ('Two-Bedroom', 600.01, 700.05);
insert into room_types (type_name, original_price, current_price) values ('Three-Bedroom', 739.05, 800.05);
insert into room_types (type_name, original_price, current_price) values ('One-Bedroom', 200.04, 350);
insert into room_types (type_name, original_price, current_price) values ('Two-Bedroom', 600.01, 700.05);
insert into room_types (type_name, original_price, current_price) values ('Three-Bedroom', 739.05, 800.05);
insert into room_types (type_name, original_price, current_price) values ('One-Bedroom', 200.04, 350);
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

insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (1, 1, '2017/01/02', '2017/02/02', 100);
insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (2, 3, '2017/01/06', '2017/02/02', 101);
insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (3, 2, '2017/07/01', '2017/08/02', 102);
insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (1, 5, '2017/08/01', '2017/09/02', 103);
insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (5, 6, '2017/09/01', '2017/10/02', 104);
insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (6, 4, '2017/04/01', '2017/06/02', 105);
insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (7, 7, '2017/05/02', '2017/07/02', 106);
insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (8, 8, '2017/01/02', '2017/09/02', 107);
insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (9, 9, '2017/03/02', '2017/05/02', 108);
insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (10,10,'2017/01/02', '2017/05/02', 109);
insert into reservations (customerId, roomId, checkInDate, checkOutDate, roomPrice) values (4,10, '2017/01/02', '2017/03/02', 109);






create table invoices (
	id 				    integer primary key,
	reservation_id 		integer not null,
    total               number,
    invoice_date_time   datetime not null,
    paid                boolean default false,
	foreign key(reservation_id)  references reservations(id)
    
);

insert into invoices (reservation_id, total, invoice_date_time, paid) values (1, 1000.00, '2018/01/01',1);
insert into invoices (reservation_id, total, invoice_date_time, paid) values ( 8, 3444.50, '2017/01/01', 1);
insert into invoices (reservation_id, total,  invoice_date_time, paid) values ( 7, 3445.50, '2017/05/05', 0);
insert into invoices (reservation_id, total,  invoice_date_time, paid) values ( 9, 143.50, '2017/06/04', 1);
insert into invoices (reservation_id, total, invoice_date_time) values ( 2, 250.50, '2017/01/09');
insert into invoices (reservation_id, total,  invoice_date_time) values ( 5, 431.50, '2017/06/02');
insert into invoices (reservation_id, total,  invoice_date_time, paid) values ( 3, 300.50, '2017/06/04', 1);
insert into invoices (reservation_id, total,  invoice_date_time, paid) values ( 6, 284.35, '2017/07/09', 1);
insert into invoices (reservation_id, total,  invoice_date_time, paid) values ( 10, 284.35, '2017/01/05', 1);
insert into invoices (reservation_id, total,  invoice_date_time, paid) values ( 4, 284.35, '2017/01/03', 1);












