const selectall = (tablename) => {
    return `SELECT * FROM ${tablename}`;
}

const getHeighest = (tablename) => {
    return `SELECT MAX(high) FROM ${tablename}`;
}

const getLowest = (tablename) => {
    return `SELECT MIN(low) FROM ${tablename}`;
}


module.exports ={selectall, getHeighest, getLowest};