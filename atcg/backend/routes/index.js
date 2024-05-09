const express = require('express');
const router = express.Router();
const CardModel = require('../models/cardModel');
const subTypeModel = require('../models/subtypeModel');

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

router.get('/search', (req, res) => {
    // testing responses, currently just logging query request
    console.log(req.query)
})

router.post('/cards', (req, res) => {
    const newCard = req.body;
    console.log(newCard);  // Log the incoming card data

    CardModel.createCard(newCard, (result, err) => {
        if (err) {
            console.error(err);  // Log any SQL errors
            res.status(500).send('Error creating the card: ' + err.message);
        } else {
            res.status(201).send(`Card created successsfully with ID: ${result}`);
        }
    });
});

router.get('/subtypes', (req, res) => {
    subTypeModel.getAllSubtypes((data) => {
        res.json(data);
    });
});


module.exports = router;