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
    }
};

module.exports = CardModel;
