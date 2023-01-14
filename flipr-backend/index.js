const express = require('express');
const app = express();
const cors = require('cors');
const dotenv = require('dotenv');
const bodyParser = require('body-parser');

dotenv.config();
const PORT = process.env.PORT || 80;

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(express.json())
app.use(cors());

require('./db-config/db-config');
const dataRouter = require('./routes/table-router');
const userRouter = require('./routes/user-router');


app.use('/',dataRouter);
app.use('/users/', userRouter);

app.get('/', (req, res) => {
    res.send('Hello There! We are team ____');
})

app.listen(PORT, () => {
    console.log(`Backend Server started on http://localhost:${PORT}`);
})
