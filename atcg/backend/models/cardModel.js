const pool = require('../database');

const CardModel = {
    getAllCards: function(callback) {
        pool.query('SELECT * FROM Card', function(error, results, fields) {
            if (error) throw error;
            callback(results);
        });
    },

    getCardById: function(cardID, callback) {
        pool.query('SELECT * FROM Card WHERE cardID = ?', [cardID], function(error, results, fields) {
            if (error) throw error;
            callback(results[0]);
        });
    },

    createCard: function(cardData, callback) {
        pool.query('INSERT INTO Card SET ?', cardData, function(error, results, fields) {
            if (error) {
                callback(null, error);
            } else {
                callback(results.insertId, null);
            }
        });
    }
};

module.exports = CardModel;
