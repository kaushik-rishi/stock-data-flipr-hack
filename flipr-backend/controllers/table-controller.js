const db = require('../db-config/db-config');
const query = require('../model/model');

// const gettabledata = (tablename) => {
//     return query(tablename);
// }

const tableController = (req, res) => {
    return new Promise((resolve, reject) => {
        db.query(query(req.tablename),(err, result) => {
            if(err) return reject(err)
            resolve(result)
        })
    })
};

module.exports = tableController;