const express = require('express');
const router = express.Router();
const {userController, addNewUser, authUser, authUserWithToken} = require('../controllers/user-controller');
const db = require('../db-config/db-config');
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken');


const isLoggedIn = (req, res, next) => {
    try{
        const token = req.headers.authorization.split(' ')[1];
        if(!token){
            console.log("No Token");
            return res.send()
        }
        const decoded = jwt.verify(token, 'DishantSecretkey');
        console.log(decoded);
        req.userData = decoded
        next();
    }catch(e){
        // console.log(e);
        return res.status(401).send({
            "Error": "Invalid Token"
        })
    }
}

router.get('/all-users', async(req, res, next) =>{
    try{
        let result = await userController(req, res);
        res.json(result);
    }catch(e){
        console.log(e);
        res.sendStatus(500)
    }
})

router.post('/login-user', async(req, res, next) =>{
    try{
        console.log(req.body)
        let result = await authUser(req, res);
        res.json()
        // res.json(result);
    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }
})

router.post('/login-with-token',  isLoggedIn, async(req, res, next) =>{
    try{
        console.log(req.body)
        let result = await authUserWithToken(req, res, ()=>{});
        res.json()
        // res.json(result);
    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }
})

router.post('/register-user', async(req, res, next) =>{
    try{
        let result = await addNewUser(req, res);
        res.json(result);
    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }
})


module.exports = router;
