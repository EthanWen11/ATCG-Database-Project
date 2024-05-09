const pool = require('../database');

const CardModel = {
    getAllCards: function(callback) {
        pool.query('SELECT * FROM Card', function(error, results, fields) {
            if (error) throw error;
            callback(results);
        });
    },

    getCardById: function(setID, cardID, callback) {
        pool.query('SELECT * FROM Card WHERE setID = ? AND cardID = ?', [setID, cardID], function(error, results, fields) {
            if (error) throw error;
            callback(results[0]);
        });
    },

    getCardsByParams: function(order="cardName", 
        cardName=undefined, 
        setID=undefined, 
        type=undefined, 
        health=undefined, 
        attack=undefined, 
        subtype=undefined, 
        keywords=undefined, 
        callback) {
        if(order)
        {
            
        }
        pool.query('SELECT * FROM Deck', function(error, results, fields) {
            if (error) throw error;
            callback(results);
        });
    },

    createCard: function(cardData, imageData, callback) {
        pool.getConnection(function(err, connection) {
            if (err) throw err; // not connected!
            connection.beginTransaction(function(err) {
                if (err) { // Transaction Error (Rollback and release connection)
                    connection.rollback(function() {
                        connection.release();
                        // Failure
                    });
                } else {
                    connection.query('INSERT INTO Image SET ?', imageData, function (error, results, fields) {
                        if (error) {
                            return connection.rollback(function() {
                                connection.release();
                                callback(null, error);
                            });
                        }

                        const imageID = results.insertId;
                        const newCardData = {...cardData, imageID: imageID};

                        connection.query('INSERT INTO Card SET ?', newCardData, function (error, results, fields) {
                            if (error) {
                                return connection.rollback(function() {
                                    connection.release();
                                    callback(null, error);
                                });
                            }
                            connection.commit(function(err) {
                                if (err) {
                                    return connection.rollback(function() {
                                        connection.release();
                                        callback(null, err);
                                    });
                                }
                                connection.release();
                                callback(results.insertId, null);
                            });
                        });
                    });
                }
            });
        });
    }
};

module.exports = CardModel;