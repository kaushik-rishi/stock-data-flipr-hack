const db = require('../db-config/db-config');
const {selectall, getHeighest, getLowest} = require('../model/table-model');

// const gettabledata = (tablename) => {
//     return query(tablename);
// }

const tableController = (req, res) => {
    return new Promise((resolve, reject) => {
        db.query(selectall(req.tablename),(err, result) => {
            if(err) return reject(err)
            resolve(result)
        })
    })
};

const heighest = (req, res) => {
    return new Promise((resolve, reject) => {
        db.query(getHeighest(req.tablename), (err, result) => {
            if(err) return reject(err)
            console.log(res)
            resolve(result)
        })
        // console.log(b)
        // return b;
    })
};

const highnlow = (req, res) => {
    const high = new Promise((resolve, reject) => {
        db.query(getHeighest(req.tablename), (err, result) => {
            if(err) return reject(err)
            resolve(result)
        })
    })
    const low = new Promise((resolve, reject)=> {
        db.query(getLowest(req.tablename), (err, result) => {
            if(err) return reject(err)
            resolve(result)
        })
    })
}

module.exports = {
    tableController,
    heighest
};