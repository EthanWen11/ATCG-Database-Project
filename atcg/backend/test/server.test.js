const chai = require('chai');
const chaiHttp = require('chai-http');
const server = require('../index');
const should = chai.should();

chai.use(chaiHttp);

describe('Cards', () => {
    // Test to get all cards
    describe('/GET cards', () => {
        it('it should GET all the cards', (done) => {
            chai.request(server)
                .get('/cards')
                .end((err, res) => {
                    res.should.have.status(200);
                    res.body.should.be.a('array');
                    done();
                });
        });
    });

    // Test to get a single card by ID
    describe('/GET/:id card', () => {
        it('it should GET a card by the given id', (done) => {
            let cardId = 101; // Change cardId to what you want
            chai.request(server)
                .get('/cards/' + cardId)
                .end((err, res) => {
                    res.should.have.status(200);
                    res.body.should.be.a('object');
                    res.body.should.have.property('cardID').eql(cardId);
                    done();
                });
        });
    });
});
