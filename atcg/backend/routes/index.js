const express = require('express');
const router = express.Router();
const CardModel = require('../models/cardModel');
const subTypeModel = require('../models/subtypeModel');

router.get('/cards', (req, res) => {
    CardModel.getAllCards((data) => {
        res.json(data);
    });
});

router.get('/cardName', (req, res) => {
    CardModel.getCardNames((data) => {
        res.json(data);
    });
})

router.get('/cards/:set/:id', (req, res) => {
    const setID = req.params.set;
    const cardID = req.params.id;
    CardModel.getCardById(setID, cardID, (data) => {
        if (data) {
            res.json(data);
        } else {
            res.status(404).send('Card not found');
        }
    });
});

router.get('/cards/random', (req, res) => {
    // Fetch a random card from the database
    CardModel.getRandomCard((data) => {
        if (data) {
            res.json(data);
        } else {
            res.status(404).send('Random card not found');
        }
    });
});

router.get('/search', (req, res) => {
    function convert(str) {
        let str_array = str.split(" ")
        return str_array;
    }
    const order = req.query.order;
    if (req.query.q) {
        const q = req.query.q;
        CardModel.getCardsByQuery(order, q, (data) => {
            if (data) {
                res.json(data);
            }
            else {
                console.log("did not go down");
            }
        });
    }
    else {
        // testing responses, currently just logging query request
        // console.log(req.query.order)
        const type = req.query.type;
        let cardName = req.query.cardName;
        let setID = req.query.setID;
        let color = req.query.color;
        const health = req.query.health;
        const attack = req.query.attack;
        const cost = req.query.cost;
        let subtype = req.query.subtype;
        console.log(subtype);
        let keywords = req.query.keywords;

        // if (cardName) cardName = convert(cardName);
        if (color) color = convert(color);
        if (setID) setID = convert(setID);
        if (subtype) subtype = convert(subtype);
        if (keywords) keywords = convert(setID);

        CardModel.getCardsByParams(order, cardName, setID, type, color, health, attack, cost, subtype, keywords, (data) => {
            if (data) {
                res.json(data);
            }
            else {
                res.status(404).send('Card not found');
            }
        });
    }
});

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

router.get

router.get('/subtypes', (req, res) => {
    subTypeModel.getAllSubtypes((data) => {
        res.json(data);
    });
});


module.exports = router;