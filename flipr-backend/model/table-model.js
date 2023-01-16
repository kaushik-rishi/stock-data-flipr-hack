const selectall = (tablename) => {
    return `SELECT * FROM ${tablename}`;
}

const getHeighest = (tablename) => {
    return `SELECT MAX(high) FROM ${tablename}`;
}

const getLowest = (tablename) => {
    return `SELECT MIN(low) FROM ${tablename}`;
}

const getWithLimit = (tablename, lim) => {
    return  `SELECT * FROM ${tablename} ORDER BY dated LIMIT ${lim}`;
}


module.exports ={selectall, getHeighest, getLowest, getWithLimit};