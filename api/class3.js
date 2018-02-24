const express = require('express');
const sqlite3 = require( 'sqlite3' ).verbose();

const filename = './database/database.sqlite3';
let db = new sqlite3.Database(filename);

const router = express.Router();

// get '/reservations-and-invoices/'
// TODO: add code here

router.delete('/reservations/:id/', function(req, res) {
  const id = req.params.id;
  const sql = 'delete from reservations where id = ' + id;

  db.run(sql, [id], (err, rows) => {
    res.status(200).json({
      customers: rows
    });
  });
});




router.get('/reservations-and-invoices/', function (req, res) {
  var sql = 'select reservations.id,reservations.checkInDate, checkOutDate, invoices.total , invoices.paid from reservations JOIN invoices ON invoices.reservation_Id = reservations.id';

  db.all(sql, [], (err, rows) => {
    res.status(200).json({
      invoices: rows
    });
  });
});


// get `/reservations-per-customer/`
// TODO: add code here

router.get('/reservations-per-customer/', function (req, res) {
  const id = req.params.id;
  // var sql = 'select customers.title,firstname,surname,reservations.id,checkInDate,checkOutDate,count(*) from reservations join customers on reservations.customerId =' + id;
  var sql = `select customers.id,customers.title,firstname,surname,checkInDate,checkOutDate,count(*) as "No_of_reservations" from reservations as reservations  join customers as customers on (reservations.customerId = customers.id) group by customers.id`;
  db.all(sql, [], (err, rows) => {
    res.status(200).json({
      reservations: rows
    });
  });
});



// get `/reservations-per-room/`
// TODO: add code here

router.get('/reservations-per-room/', function (req, res) {
  // var sql = 'select customers.title,firstname,surname,reservations.id,checkInDate,checkOutDate,count(*) from reservations join customers on reservations.customerId =' + id;
  var sql = `select rooms.id,sea_view,room_types.type_name,checkInDate,checkOutDate,original_price,current_price,count(*) as 'No_of_reservations' from reservations as reservations join rooms as rooms on (reservations.roomId = rooms.id) join room_types as room_types on (room_types.id = rooms.room_type_id)group by rooms.id`;
  db.all(sql, [], (err, rows) => {
    res.status(200).json({
      reservations: rows
    });
  });
});


router.get('/rooms-served-once/times/:count/', function (req, res) {
  const count = req.params.count;
  // var sql = 'select customers.title,firstname,surname,reservations.id,checkInDate,checkOutDate,count(*) from reservations join customers on reservations.customerId =' + id;
  var sql = `select rooms.id,reservations.checkInDate, checkOutDate, sea_view, count(*) as No_Of_Services from reservations JOIN rooms ON reservations.roomId = rooms.id group by rooms.id having No_Of_Services >=${count} and sea_view = 1`;
  db.all(sql, [], (err, rows) => {
    res.status(200).json({
      rooms: rows
    });
  });
});

// HOMEWORK
// get '/reservations/details-between/:from_day/:to_day'
// TODO: add for code here

// HOMEWORK
// get '/reservations-per-customer/'
// TODO: add code here

// HOMEWORK
// get `/stats-price-room/`
// TODO: add code here

// HOMEWORK
// get `/rooms/available-in/:from_day/:to_day`
// TODO: add code here


module.exports = router;
