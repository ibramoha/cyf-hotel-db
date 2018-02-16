
const express = require('express');
const sqlite3 = require('sqlite3').verbose();

const filename = './database/database.sqlite3';
let db = new sqlite3.Database(filename);

const router = express.Router();


router.get('/customers', function (req, res) {

  var sql = 'select * from customers';

  db.all(sql, [], (err, rows) => {
    res.status(200).json({
      customers: rows
    });
  });
});


router.get('/customers/:id', function (req, res) {
  // TODO: add code here
  var num = Number(req.params.id);
  var sql = 'select * from customers where id =' + num;
  console.log(typeof num);

  if (isNaN(num)) {
    res.status(400);
    res.send('400 - BAD REQUEST');
  }
  else {
    db.all(sql, [], (err, rows) => {
      res.status(200).json({
        customers: rows
      });
    });
  }
});


router.get('/customers/name/:surname', function (req, res) {
  // TODO: add code here
  const id = req.params.surname;
  var sql = 'select * from customers where surname like ' + "'%" + id + "%'";
  console.log(sql)
  db.all(sql, [], (err, rows) => {
    if (err) {
      console.log(err);
    }
    res.status(200).json({
      customers: rows
    });
  });
});


router.post('/customers/', function (req, res) {
  // EXPECTED JSON Object:
  // {
  //   title: 'Mr',
  //   firstname: 'Laurie',
  //   surname: 'Ainley',
  //   email: 'laurie@ainley.com'
  // }
  // TODO: add code here
  if(req.body.title.length != 0 && req.body.firstname.length != 0 && req.body.surname.length != 0 && req.body.email.length != 0){
    db.run(`insert into customers (title, firstname, surname, email) 
            values ('${req.body.title}', 
                    '${req.body.firstname}', 
                    '${req.body.surname}', 
                    '${req.body.email}')`
    );
  } else {
    res.status(400);
    console.log("BAD REQUEST");
  }

});


router.put('/customers/:id', function (req, res) {
  // EXPECTED JSON Object:
  // {
  //   title: 'Mr',
  //   firstname: 'Laurie',
  //   surname: 'Ainley',
  //   email: 'laurie@ainley.com'
  // }

  // TODO: add code here
  let sql = `update customers 
  set title     = '${req.body.title}',
      firstname = '${req.body.firstname}', 
      surname   = '${req.body.surname}', 
      email     = '${req.body.email}'
  where id = ${req.params.id}`

  db.run(sql,function (err) {
      if (err) {
        return console.error(err.message);
      }
      console.log(`Row(s) updated: ${this.changes}`);
    })
});


// get '/reservations'
// TODO: add code here


// get '/reservations/:id'
// TODO: add code here


// delete '/reservations/:id'
// TODO: add code here


// get '/reservations/starting-on/:startDate'
// TODO: add code here


// get '/reservations/active-on/:date'
// TODO: add code here


// post '/reservations'
// EXPECTED JSON Object:
// {
//   customer_id: 1,
//   room_id: 1,
//   check_in_date: '2018-01-20',
//   check_out_date: '2018-01-22',
//   room_price: 129.90
// }
// TODO: add code here


// get `/detailed-invoices'
// TODO: add code here


// get `/reservations/details-between/:from_day/:to_day`
// TODO: add code here

module.exports = router;
