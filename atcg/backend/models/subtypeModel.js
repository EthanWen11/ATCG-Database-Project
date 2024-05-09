const pool = require('../database');

const subTypeModel = {
    getAllSubtypes: function (callback) {
        pool.query('SELECT subtype FROM Subtype', function (error, results, fields) {
            if (error) throw error;
            callback(results);
        });
    },
}

module.exports = subTypeModel;