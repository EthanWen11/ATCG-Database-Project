const pool = require('../database');

const CardModel = {
    getAllCards: function (callback) {
        pool.query('SELECT * FROM Card', function (error, results, fields) {
            if (error) throw error;
            callback(results);
        });
    },

    getCardById: function (setID, cardID, callback) {
        pool.query('SELECT * FROM Card WHERE setID = ? AND cardID = ?', [setID, cardID], function (error, results, fields) {
            if (error) throw error;
            callback(results[0]);
        });
    },

    getCharCardById: function (setID, cardID, callback) {
        let q = "SELECT * FROM Card\n";
        q += "JOIN characterCard USING (cardID, setID)\n";
        q += "JOIN Color USING (cardID, setID)\n";
        q += "LEFT JOIN Keyword USING (cardID, setID)\n";
        q += "LEFT JOIN Subtype USING (cardID, setID)\n";
        q += "WHERE setID = ? AND cardID = ?";
        pool.query(q, [setID, cardID], function (error, results, fields) {
            if (error) throw error;
            callback(results[0]);
        });
    },

    getSpellCardById: function (setID, cardID, callback) {
        let q = "SELECT * FROM Card\n";
        q += "JOIN spellCard USING (cardID, setID)\n";
        q += "JOIN Color USING (cardID, setID)\n";
        q += "LEFT JOIN Keyword USING (cardID, setID)\n";
        q += "LEFT JOIN Subtype USING (cardID, setID)\n";
        q += "WHERE setID = ? AND cardID = ?";

        pool.query(q, [setID, cardID], function (error, results, fields) {
            if (error) throw error;
            callback(results[0]);
        });
    },

    getItemCardById: function (setID, cardID, callback) {
        let q = "SELECT * FROM Card\n";
        q += "JOIN itemCard USING (cardID, setID)\n";
        q += "JOIN Color USING (cardID, setID)\n";
        q += "LEFT JOIN Keyword USING (cardID, setID)\n";
        q += "LEFT JOIN Subtype USING (cardID, setID)\n";
        q += "WHERE setID = ? AND cardID = ?";

        pool.query(q, [setID, cardID], function (error, results, fields) {
            if (error) throw error;
            callback(results[0]);
        });
    },

    getDistrictCardById: function (setID, cardID, callback) {
        let q = "SELECT * FROM Card\n";
        q += "JOIN districtCard USING (cardID, setID)\n";
        q += "JOIN Color USING (cardID, setID)\n";
        q += "LEFT JOIN Keyword USING (cardID, setID)\n";
        q += "LEFT JOIN Subtype USING (cardID, setID)\n";
        q += "WHERE setID = ? AND cardID = ?";

        pool.query(q, [setID, cardID], function (error, results, fields) {
            if (error) throw error;
            callback(results[0]);
        });
    },

    getCardNames: function (callback) {
        pool.query('SELECT cardName FROM Card', function (error, results, fields) {
            if (error) throw error;
            callback(results);
        });
    },

    getCardsByQuery: function (order = "id", query = undefined, callback) {
        let q = 'SELECT * FROM Card\n'
        let values = []

        if (query) {
            q += 'LEFT JOIN CardSet USING(setID)\n';
            q += 'LEFT JOIN Subtype USING(cardID, setID)\n';
            q += 'LEFT JOIN Keyword USING(cardID, setID)\n';
            q += "WHERE 1 = 1\n";
            q += 'AND cardName like ?\n';
            q += 'OR cardID like ?\n';
            q += 'OR setID like ?\n';
            q += 'OR setName like ?\n';
            q += 'OR cardText like ?\n';
            q += 'OR designer like ?\n';
            q += 'OR subtype like ?\n';
            q += 'OR keyword like ?\n';

            for (let i = 0; i < 8; i++) {
                values.push('%' + query + '%');
            }
        }

        if (order === "id") {
            q += 'ORDER BY cardID, setID\n'
        }
        else if (order === "set") {
            q += 'ORDER BY setID, cardID\n'
        }
        else if (order === "name") {
            q += 'ORDER BY cardName, cardID\n'
        }
        console.log(q)
        pool.query(q, values, function (error, results, fields) {
            if (error) throw error;
            callback(results);
        });
    },

    getRandomCard: function (callback) {
        // Fetch a random card from the database
        pool.query('SELECT * FROM Card ORDER BY RAND() LIMIT 1', (error, results, fields) => {
            if (error) {
                throw error;
            }
            // Pass the random card data to the callback function
            callback(results[0]);
        });
    },

    getCardsByParams: function (order = "id",
        cardName = undefined,
        setID = undefined,
        type = undefined,
        color = undefined,
        health = undefined,
        attack = undefined,
        cost = undefined,
        subtype = undefined,
        keywords = undefined,
        callback) {

        let q = 'SELECT * FROM Card\n';
        let values = [];

        if (type) {
            if (type === "character") {
                q += 'JOIN characterCard USING(cardID, setID)\n';
            }
            else if (type === "spell") {
                q += 'JOIN spellCard USING(cardID, setID)\n';
            }
            else if (type === "item") {
                q += 'JOIN itemCard USING(cardID, setID)\n';
            }
            else if (type === "district") {
                q += 'JOIN districtCard USING(cardID, setID)\n';
            }
        }
        else {
            q += 'LEFT JOIN characterCard USING(cardID, setID)\nLEFT JOIN spellCard USING(cardID, setID)\nLEFT JOIN itemCard USING(cardID, setID)\nLEFT JOIN districtCard USING(cardID, setID)\n';
        }
        if (subtype) {
            q += 'LEFT JOIN Subtype USING(cardID, setID)\n';
        }
        if (keywords) {
            q += 'LEFT JOIN Keyword USING(cardID, setID)\n';
        }
        if (color) {
            q += 'LEFT JOIN Color USING(cardID, setID)\n';
        }

        q += "WHERE 1 = 1\n";

        if (cardName) {
            q += 'AND cardName like ?\nOR cardName in (?)\n';
            values.push('%' + cardName + '%');
            values.push(cardName);
        }
        if (setID) {
            let inlist = '';
            for (let i in setID) {
                inlist += '?,';
                values.push(setID[i]);
            }
            inlist = inlist.substring(0, inlist.length - 1);
            q += 'AND setID in (' + inlist + ')\n'
        }
        if (subtype) {
            let inlist = '';
            for (let i in subtype) {
                inlist += '?,';
                values.push(subtype[i]);
            }
            console.log(inlist)
            inlist = inlist.substring(0, inlist.length - 1);
            q += 'AND subtype in (' + inlist + ')\n'
        }
        if (keywords) {
            let inlist = '';
            for (let i in keywords) {
                inlist += '?,';
                values.push(keywords[i]);
            }
            inlist = inlist.substring(0, inlist.length - 1);
            q += 'AND keywords in (' + inlist + ')\n'
        }
        if (health) {
            q += 'AND health = ?\n'
            values.push(health)
        }
        if (attack) {
            q += 'AND attack = ?\n'
            values.push(attack)
        }
        if (color) {
            let inlist = '';
            for (let i in color) {
                inlist += '?,';
                values.push(color[i]);
            }
            inlist = inlist.substring(0, inlist.length - 1);
            q += 'AND color in (' + inlist + ')\n';
        }
        if (type !== undefined && cost !== undefined) {
            q += 'AND cost = ?\n'
            values.push(cost)
        }
        else if (cost) {
            q += 'AND (characterCard.cost = ? OR itemCard.cost = ? OR spellCard.cost = ?)'
            values.push(cost)
            values.push(cost)
            values.push(cost)
        }
        if (order === "id") {
            q += 'ORDER BY cardID, setID\n'
        }
        else if (order === "set") {
            q += 'ORDER BY setID, cardID\n'
        }
        else if (order === "name") {
            q += 'ORDER BY cardName, cardID\n'
        }
        console.log(q)
        pool.query(q, values, function (error, results, fields) {
            if (error) throw error;
            callback(results);
        });
    },

    createCard: function (cardData, imageData, callback) {
        pool.getConnection(function (err, connection) {
            if (err) throw err; // not connected!
            connection.beginTransaction(function (err) {
                if (err) { // Transaction Error (Rollback and release connection)
                    connection.rollback(function () {
                        connection.release();
                        // Failure
                    });
                } else {
                    connection.query('INSERT INTO Image SET ?', imageData, function (error, results, fields) {
                        if (error) {
                            return connection.rollback(function () {
                                connection.release();
                                callback(null, error);
                            });
                        }

                        const imageID = results.insertId;
                        const newCardData = { ...cardData, imageID: imageID };

                        connection.query('INSERT INTO Card SET ?', newCardData, function (error, results, fields) {
                            if (error) {
                                return connection.rollback(function () {
                                    connection.release();
                                    callback(null, error);
                                });
                            }
                            connection.commit(function (err) {
                                if (err) {
                                    return connection.rollback(function () {
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