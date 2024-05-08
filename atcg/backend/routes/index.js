const express = require('express');
const router = express.Router();
const CardModel = require('../models/cardModel');

router.get('/cards', (req, res) => {
    CardModel.getAllCards((data) => {
        res.json(data);
    });
});

router.get('/cards/:id', (req, res) => {
    const cardID = req.params.id;
    CardModel.getCardById(cardID, (data) => {
        if (data) {
            res.json(data);
        } else {
            res.status(404).send('Card not found');
        }
    });
});

module.exports = router;