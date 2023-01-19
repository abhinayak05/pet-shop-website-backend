const sql = require ("mysql");

const db = sql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "my_pet_store"
})
db.connect();
module.exports = db;