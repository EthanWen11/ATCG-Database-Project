const pool = require('../database');

const subTypeModel = {
    getAllSubtypes: function(callback) {
        pool.query('SELECT * FROM Subtype', function(error, results, fields) {
            if (error) throw error;
            callback(results);
        });
    },
}

module.exports =  subTypeModel;