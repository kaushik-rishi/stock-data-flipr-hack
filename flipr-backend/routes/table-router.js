const express = require('express');
const router = express.Router();
const {tableController, heighest} = require('../controllers/table-controller')


router.get('/data/NSE',async(req, res) => {
    req.tablename = 'nse';
    try{
        const result = await tableController(req, res);
        
        res.json(result);
    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }
})

router.get('/data/BSE/highest',async(req, res) => {
    req.tablename = 'bse';
    try{
        const result = await heighest(req, res);
        res.json(result);
    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }
})

router.get('/data/BSE',async(req, res) => {
    req.tablename = 'bse';
    try{
        const result = await tableController(req, res);
        res.json(result);
    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }
})


router.get('/data/Cipla',async(req, res) => {
    req.tablename = 'cipla';
    try{
        const result = await tableController(req, res);
        res.json(result);
    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }
})


router.get('/data/AshokLeyLand',async(req, res) => {
    req.tablename = 'ashokley';
    try{
        const result = await tableController(req, res);
        res.json(result);
    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }
})

router.get('/data/TataSteel',async(req, res) => {
    req.tablename = 'tatasteel';
    try{
        const result = await tableController(req, res);
        res.json(result);
    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }
})

router.get('/data/EicherMotors',async(req, res) => {
    req.tablename = 'eichermotors';
    try{
        const result = await tableController(req, res);
        res.json(result);
    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }
})

router.get('/data/Reliance',async(req, res) => {
    req.tablename = 'reliance';
    try{
        const result = await tableController(req, res);
        res.json(result);
    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }
})


module.exports = router;