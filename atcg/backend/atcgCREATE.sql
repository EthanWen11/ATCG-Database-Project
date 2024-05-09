drop database if exists atcg;
create database atcg;
use atcg;

CREATE TABLE CardSet
(
setID			VARCHAR (255),
setName			VARCHAR (255),
designer		VARCHAR (255),
logo			VARCHAR (255),

PRIMARY KEY (setID)
);

CREATE TABLE Image
(
imageID			VARCHAR (255),
fileURL			VARCHAR (255),
artist			VARCHAR (255),

PRIMARY KEY (imageID)
);

CREATE TABLE Card
(
cardID			VARCHAR (255),
setID			VARCHAR (255),
cardName		VARCHAR (255),
cardType		VARCHAR (255),
cardtext		TEXT,
imageID			VARCHAR (255),

PRIMARY KEY (cardID, setID),
FOREIGN KEY (setID) REFERENCES CardSet(setID) ON DELETE CASCADE,
FOREIGN KEY (imageID) REFERENCES Image(imageID) ON DELETE CASCADE
);

CREATE TABLE Subtype
(
cardID			VARCHAR(255),
setID			VARCHAR(255),
subtype			VARCHAR(255),

PRIMARY KEY (cardID, setID),
FOREIGN KEY (cardID, setID) REFERENCES Card(cardID, setID) ON DELETE CASCADE
);

CREATE TABLE CharacterCard
(
cardID			VARCHAR(255),
setID			VARCHAR(255),
attack			INTEGER,
health			INTEGER,
cost			INTEGER,

PRIMARY KEY (cardID, setID),
FOREIGN KEY (cardID, setID) REFERENCES Card(cardID, setID) ON DELETE CASCADE	
);

CREATE TABLE SpellCard
(
cardID			VARCHAR(255),
setID			VARCHAR(255),
cost			INTEGER,

PRIMARY KEY (cardID, setID),
FOREIGN KEY (cardID, setID) REFERENCES Card(cardID, setID) ON DELETE CASCADE	
);

CREATE TABLE ItemCard
(
cardID			VARCHAR(255),
setID			VARCHAR(255),
cost			INTEGER,

PRIMARY KEY (cardID, setID),
FOREIGN KEY (cardID, setID) REFERENCES Card(cardID, setID) ON DELETE CASCADE	
);

CREATE TABLE DistrictCard
(
cardID			VARCHAR(255),
setID			VARCHAR(255),
tier			VARCHAR(255),

PRIMARY KEY (cardID, setID),
FOREIGN KEY (cardID, setID) REFERENCES Card(cardID, setID) ON DELETE CASCADE	
);

CREATE TABLE Orb
(
cardID			VARCHAR(255),
setID			VARCHAR(255),
orb				VARCHAR(255),

PRIMARY KEY (cardID, setID),
FOREIGN KEY (cardID, setID) REFERENCES Card(cardID, setID) ON DELETE CASCADE
);

CREATE TABLE Color
(
cardID			VARCHAR(255),
setID			VARCHAR(255),
color			VARCHAR(255),

PRIMARY KEY (cardID, setID),
FOREIGN KEY (cardID, setID) REFERENCES Card(cardID, setID) ON DELETE CASCADE
);


CREATE TABLE Deck
(
deckID			INTEGER,

PRIMARY KEY (deckID)
);

CREATE TABLE DeckContains
(
deckID			INTEGER,
cardID			VARCHAR(255),
setID			VARCHAR(255),

PRIMARY KEY (deckID, cardID, setID),
FOREIGN KEY (deckID) REFERENCES Deck(deckID) ON DELETE CASCADE,
FOREIGN KEY (cardID, setID) REFERENCES Card(cardID, setID) ON DELETE CASCADE
);

CREATE TABLE Keyword
(
keyword		VARCHAR(255),
cardID			VARCHAR (255),
setID			VARCHAR (255),

PRIMARY KEY (keyword, cardID, setID),
FOREIGN KEY (cardID, setID) REFERENCES Card(cardID, setID) ON DELETE CASCADE
);
