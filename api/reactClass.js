const express = require('express')
const sqlite3 = require('sqlite3').verbose()
const cors = require('cors')
const filename = './database/database.sqlite3'
let db = new sqlite3.Database(filename)

const router = express.Router()
router.use(cors())
router.get('/reactclass', function (req, res) {
  var sql = `select customers.id,
  customers.title, 
  customers.firstname, 
  customers.surname, 
  customers.email, 
  reservations.roomId, 
  reservations.checkInDate, 
  reservations.checkOutDate from reservations JOIN customers ON reservations.customerId = customers.id `

  db.all(sql, [], (err, rows) => {
    if (err) {
      res.status(500).end()
      console.log(err)
    } else {
      res.status(200).json({
        rows
      })
    }
  })
})

module.exports = router
