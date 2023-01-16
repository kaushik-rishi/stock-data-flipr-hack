const express = require('express');
const router = express.Router();
const {tableController, heighest, tableLimitter} = require('../controllers/table-controller')


router.get('/data/NSE',async(req, res) => {
    req.tablename = 'nse';
    const page = req.query.page || 1;
    const limit = req.query.limit || 0;
    try{
        const result = await tableController(req, res);
        if(limit!==0){
            const len = result.length
            const start = (page-1) * limit;
            const endIndex = page*limit;
            const resulttrim = result.slice(len-endIndex, len-start);
            res.json(resulttrim);
            return
        }
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
    const page = req.query.page || 1;
    const limit = req.query.limit || 0;
    try{
        const result = await tableController(req, res);
        if(limit!==0){
            const len = result.length
            const start = (page-1) * limit;
            const endIndex = page*limit;
            const resulttrim = result.slice(len-endIndex, len-start);
            res.json(resulttrim);
            return
        }
        res.json(result);
    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }
})


router.get('/data/Cipla',async(req, res) => {
    req.tablename = 'cipla';
    const page = req.query.page || 1;
    const limit = req.query.limit || 0;
    try{
        const result = await tableController(req, res);
        if(limit!==0){
            const len = result.length
            const start = (page-1) * limit;
            const endIndex = page*limit;
            const resulttrim = result.slice(len-endIndex, len-start);
            res.json(resulttrim);
            return
        }
        res.json(result);
    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }
})


router.get('/data/AshokLeyLand',async(req, res) => {
    req.tablename = 'ashokley';
    const page = req.query.page || 1;
    const limit = req.query.limit || 0;
    try{
        const result = await tableController(req, res);
        if(limit!==0){
            const len = result.length
            const start = (page-1) * limit;
            const endIndex = page*limit;
            const resulttrim = result.slice(len-endIndex, len-start);
            res.json(resulttrim);
            return
        }
        res.json(result);
    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }
})

router.get('/data/TataSteel',async(req, res) => {
    req.tablename = 'tatasteel';
    const page = req.query.page || 1;
    const limit = req.query.limit || 0;
    try{
        const result = await tableController(req, res);
        if(limit!==0){
            const len = result.length
            const start = (page-1) * limit;
            const endIndex = page*limit;
            const resulttrim = result.slice(len-endIndex, len-start);
            res.json(resulttrim);
            return
        }
        res.json(result);
    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }
})

router.get('/data/EicherMotors',async(req, res) => {
    req.tablename = 'eichermotors';
    const page = req.query.page || 1;
    const limit = req.query.limit || 0;
    try{
        const result = await tableController(req, res);
        if(limit!==0){
            const len = result.length
            const start = (page-1) * limit;
            const endIndex = page*limit;
            const resulttrim = result.slice(len-endIndex, len-start);
            res.json(resulttrim);
            return
        }
        res.json(result);
    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }
})

router.get('/data/Reliance',async(req, res) => {
    req.tablename = 'reliance';
    const page = req.query.page || 1;
    const limit = req.query.limit || 0;
    try{
        const result = await tableController(req, res);
        if(limit!==1){
            const len = result.length
            const start = (page-1) * limit;
            const endIndex = page*limit;
            const resulttrim = result.slice(len-endIndex, len-start);
            res.json(resulttrim);
            return
        }
        res.json(result);
    }catch(e){
        console.log(e);
        res.sendStatus(500);
    }
})


module.exports = router;