const express = require('express');
const app = express();
const cors = require('cors');
const dotenv = require('dotenv');
const bodyParser = require('body-parser');

dotenv.config();
const PORT = process.env.PORT || 5000;

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(express.json())
app.use(cors());

require('./db-config/db-config');


app.get('/', (req, res) => {
    res.send('Hello There! We are team ____');
})

app.listen(PORT, () => {
    console.log(`Backend Server started on http://localhost:${PORT}`);
})