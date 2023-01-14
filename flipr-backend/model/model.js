const query = (tablename) => {
    return `SELECT * FROM ${tablename}`;
}

module.exports = query;