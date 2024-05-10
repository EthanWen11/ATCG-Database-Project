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

INSERT INTO CardSet (setID,setName,designer,logo)
VALUES
('COR','Core Set','Shub Takkorath','logo-core'),
('HOE','Hell on Earth','Aedriaus Olive',''),
('ELM','Elementary','Elaina Synranelt',''),
('WHV','Shadows of Waterhaven','Shub Takkorath','logo-whv'),
('DEP','Depths of Triton','Shub Takkorath','logo-dep'),
('QIL','The Qil''kuoth War','Shub Takkorath','logo-qil'),
('CLA','Mizuki & Caerula Arbor','Shub Takkorath','logo-cla'),
('KGD','Kyros'' Guide to Dragons','Shub Takkorath','logo-kgd'),
('NIN','Murder on Nexus Nine','Shub Takkorath','logo-nin'),
('JGK','Escape from Jigoku','Shub Takkorath','logo-jgk'),
('FAL','Starfall','Shub Takkorath','logo-fal');


INSERT INTO Image (imageID,fileURL,artist)
VALUES
('000','','Shub Takkorath'),
('001','','Shub Takkorath'),
('002','','Shub Takkorath'),
('003','','Shub Takkorath'),
('004','','Shub Takkorath'),
('005','','Shub Takkorath'),
('006','','Shub Takkorath'),
('007','','Shub Takkorath'),
('008','','Shub Takkorath'),
('009','','Shub Takkorath'),
('010','','Shub Takkorath'),
('011','','Shub Takkorath'),
('012','','Shub Takkorath'),
('013','','Shub Takkorath'),
('014','','Shub Takkorath'),
('015','','Shub Takkorath'),
('016','','Elaina Synranelt'),
('017','','Shub Takkorath'),
('018','','Elaina Synranelt'),
('019','','Shub Takkorath'),
('020','','Shub Takkorath'),
('021','','Elaina Synranelt'),
('022','','Elaina Synranelt'),
('023','','Shub Takkorath'),
('024','','Shub Takkorath'),
('025','','Shub Takkorath'),
('026','','Shub Takkorath'),
('027','','Shub Takkorath'),
('028','','Shub Takkorath'),
('029','','Shub Takkorath'),
('030','','Shub Takkorath'),
('031','','Shub Takkorath'),
('032','','Shub Takkorath'),
('033','','Shub Takkorath'),
('034','','Shub Takkorath'),
('035','','Shub Takkorath'),
('036','','Elaina Synranelt'),
('037','','Elaina Synranelt'),
('038','','Shub Takkorath'),
('039','','Elaina Synranelt'),
('040','','Shub Takkorath'),
('041','','Shub Takkorath'),
('042','','Elaina Synranelt'),
('043','','Shub Takkorath'),
('044','','Shub Takkorath'),
('045','','Shub Takkorath'),
('046','','Shub Takkorath'),
('047','','Shub Takkorath'),
('048','','Shub Takkorath'),
('049','','Shub Takkorath'),
('050','','Shub Takkorath'),
('051','','Elaina Synranelt'),
('052','','Shub Takkorath'),
('053','','Shub Takkorath'),
('054','','Shub Takkorath'),
('055','','Shub Takkorath'),
('056','','Shub Takkorath'),
('057','','Elaina Synranelt'),
('058','','Shub Takkorath'),
('059','','Shub Takkorath'),
('060','','Shub Takkorath'),
('061','','Shub Takkorath'),
('062','','Elaina Synranelt'),
('063','','Shub Takkorath'),
('064','','Shub Takkorath'),
('065','','Shub Takkorath'),
('066','','Shub Takkorath'),
('067','','Shub Takkorath'),
('068','','Shub Takkorath'),
('069','','Shub Takkorath'),
('070','','Shub Takkorath'),
('071','','Elaina Synranelt'),
('072','','Shub Takkorath'),
('073','','Shub Takkorath'),
('074','','Shub Takkorath'),
('075','','Shub Takkorath'),
('076','','Shub Takkorath'),
('077','','Shub Takkorath'),
('078','','Shub Takkorath'),
('079','','Shub Takkorath'),
('080','','Shub Takkorath'),
('081','','Shub Takkorath'),
('082','','Shub Takkorath'),
('083','','Shub Takkorath'),
('084','','Shub Takkorath'),
('085','','Shub Takkorath'),
('086','','Elaina Synranelt'),
('087','','Shub Takkorath'),
('088','','Shub Takkorath'),
('089','','Shub Takkorath'),
('090','','Shub Takkorath'),
('091','','Shub Takkorath'),
('092','','Shub Takkorath'),
('093','','Shub Takkorath'),
('094','','Shub Takkorath'),
('095','','Shub Takkorath'),
('096','','Shub Takkorath'),
('097','','Shub Takkorath'),
('098','','Shub Takkorath'),
('099','','Shub Takkorath'),
('100','','Aedriaus Olive'),
('10002','','Arknights'),
('10003','','Arknights'),
('10004','','Shub Takkorath'),
('10005','','Shub Takkorath'),
('10006','','Shub Takkorath'),
('10007','','Shub Takkorath'),
('10008','','Shub Takkorath'),
('10009','','Shub Takkorath'),
('10010','','Shub Takkorath'),
('10011','','Shub Takkorath'),
('10012','','Shub Takkorath'),
('10014','','Shub Takkorath'),
('10015','','Shub Takkorath'),
('10016','','Shub Takkorath'),
('10017','','Shub Takkorath'),
('10018','','Shub Takkorath'),
('10019','','Shub Takkorath'),
('10020','','Shub Takkorath'),
('10022','','Shub Takkorath'),
('10023','','Shub Takkorath'),
('10024','','Shub Takkorath'),
('10025','','Shub Takkorath'),
('10026','','Shub Takkorath'),
('10027','','Shub Takkorath'),
('10028','','Shub Takkorath'),
('10029','','Shub Takkorath'),
('10030','','Shub Takkorath'),
('10031','','Shub Takkorath'),
('10032','','Shub Takkorath'),
('10033','','Shub Takkorath'),
('10034','','Shub Takkorath'),
('10035','','Shub Takkorath'),
('10036','','Shub Takkorath'),
('10037','','Shub Takkorath'),
('10039','','Arknights'),
('10042','','Arknights'),
('10044','','Arknights'),
('10045','','Arknights'),
('10046','','Arknights'),
('10047','','Arknights'),
('10048','','Elaina Synranelt'),
('10049','','Arknights'),
('10050','','Arknights'),
('10052','','Arknights'),
('10053','','Arknights'),
('10054','','Arknights'),
('10055','','Arknights'),
('10056','','Arknights'),
('10057','','Elaina Synranelt'),
('10058','','Arknights'),
('10059','','Arknights'),
('10060','','Arknights'),
('10061','','Arknights'),
('10062','','Arknights'),
('10063','','Arknights'),
('10064','','Arknights'),
('10065','','Arknights'),
('10066','','Arknights'),
('10067','','Arknights'),
('10068','','Arknights'),
('10069','','Arknights'),
('10070','','Arknights'),
('10071','','Arknights'),
('10072','','Arknights'),
('10074','','Arknights'),
('10075','','Arknights'),
('10076','','Arknights'),
('10077','','Arknights'),
('10078','','Arknights'),
('10079','','Arknights'),
('10080','','Arknights'),
('10081','','Arknights'),
('10082','','Arknights'),
('10083','','Arknights'),
('10084','','Arknights'),
('10085','','Arknights'),
('10086','','Arknights'),
('10087','','Arknights'),
('10088','','Arknights'),
('10089','','Arknights'),
('10090','','Arknights'),
('10091','','Arknights'),
('10092','','Arknights'),
('10093','','Arknights'),
('10094','','Elaina Synranelt'),
('10095','','Arknights'),
('10096','','Arknights'),
('10097','','Arknights'),
('10098','','Arknights'),
('10099','','Arknights'),
('101','','Shub Takkorath'),
('10100','','Arknights'),
('10101','','Elaina Synranelt'),
('10102','','Arknights'),
('10103','','Arknights'),
('10104','','Arknights'),
('10106','','Arknights'),
('10107','','Arknights'),
('10108','','Arknights'),
('10109','','Elaina Synranelt'),
('10110','','Arknights'),
('10111','','Arknights'),
('10112','','Arknights'),
('10113','','Arknights'),
('10114','','Arknights'),
('10115','','Arknights'),
('10116','','Arknights'),
('10117','','Arknights'),
('10118','','Elaina Synranelt'),
('10119','','Elaina Synranelt'),
('10120','','Elaina Synranelt'),
('10121','','Elaina Synranelt'),
('10122','','Elaina Synranelt'),
('10123','','Elaina Synranelt'),
('10124','','Shub Takkorath'),
('10125','','Elaina Synranelt'),
('10126','','Shub Takkorath'),
('10127','','Aedriaus Olive'),
('10128','','Shub Takkorath'),
('10129','','Shub Takkorath'),
('10130','','Shub Takkorath'),
('10131','','Shub Takkorath'),
('10132','','Shub Takkorath'),
('10133','','Elaina Synranelt'),
('10134','','Shub Takkorath'),
('10135','','Shub Takkorath'),
('10136','','Shub Takkorath'),
('10137','','Shub Takkorath'),
('10138','','Shub Takkorath'),
('10139','','Shub Takkorath'),
('10140','','Shub Takkorath'),
('10141','','Shub Takkorath'),
('10142','','Shub Takkorath'),
('10143','','Shub Takkorath'),
('10144','','Shub Takkorath'),
('10145','',''),
('10146','',''),
('10147','','Shub Takkorath'),
('10148','','Shub Takkorath'),
('10149','','Elaina Synranelt'),
('10150','','Shub Takkorath'),
('10151','','Elaina Synranelt'),
('10152','','Shub Takkorath'),
('10153','','Shub Takkorath'),
('10154','','Shub Takkorath'),
('10155','','Shub Takkorath'),
('10156','','Shub Takkorath'),
('10157','','Shub Takkorath'),
('10158','','Shub Takkorath'),
('10159','','Shub Takkorath'),
('10160','','Shub Takkorath'),
('10161','','Shub Takkorath'),
('10162','','Shub Takkorath'),
('10163','','Shub Takkorath'),
('10164','','Elaina Synranelt'),
('10165','','Shub Takkorath'),
('10166','','Shub Takkorath'),
('10167','','Shub Takkorath'),
('10168','','Shub Takkorath'),
('10169','','Shub Takkorath'),
('10170','',''),
('10171','','Shub Takkorath'),
('10172','','Shub Takkorath'),
('10173','','Shub Takkorath'),
('10174','','Aedriaus Olive'),
('10175','','Shub Takkorath'),
('10177','','Shub Takkorath'),
('10179','','Elaina Synranelt'),
('10180','','Shub Takkorath'),
('10181','','Shub Takkorath'),
('10182','','Shub Takkorath'),
('10184','','Shub Takkorath'),
('10185','','Shub Takkorath'),
('10186','','Shub Takkorath'),
('10187','','Shub Takkorath'),
('10188','','Shub Takkorath'),
('10189','','Shub Takkorath'),
('10190','','Elaina Synranelt'),
('10191','','Elaina Synranelt'),
('10192','','Shub Takkorath'),
('10193','','Shub Takkorath'),
('10194','','Shub Takkorath'),
('10195','',''),
('10196','','Shub Takkorath'),
('10197','','Shub Takkorath'),
('10198','','Shub Takkorath'),
('10199','','Shub Takkorath'),
('102','','Shub Takkorath'),
('10200','','Shub Takkorath'),
('10201','','Shub Takkorath'),
('10202','','Shub Takkorath'),
('10203','',''),
('10204','','Shub Takkorath'),
('10205','','Shub Takkorath'),
('10206','','Shub Takkorath'),
('10207','','Shub Takkorath'),
('10208','','Elaina Synranelt'),
('10209','','Shub Takkorath'),
('10210','','Elaina Synranelt'),
('10211','','Shub Takkorath'),
('10212','','Shub Takkorath'),
('10213','','Shub Takkorath'),
('10214','','Shub Takkorath'),
('10215','','Shub Takkorath'),
('10216','',''),
('10217','','Shub Takkorath'),
('10218','','Elaina Synranelt'),
('10219','','Elaina Synranelt'),
('10220','','Aedriaus Olive'),
('10221','','Shub Takkorath'),
('10222','','Shub Takkorath'),
('10223','','Shub Takkorath'),
('10224','','Shub Takkorath'),
('10225','','Aedriaus Olive'),
('10226','','Shub Takkorath'),
('10227','','Shub Takkorath'),
('10228','','Shub Takkorath'),
('10229','','Shub Takkorath'),
('10230','','Shub Takkorath'),
('10231','','Shub Takkorath'),
('10232','','Shub Takkorath'),
('10233','',''),
('10234','','Shub Takkorath'),
('10235','','Shub Takkorath'),
('10236','','Shub Takkorath'),
('10237','','Shub Takkorath'),
('10238','',''),
('10239','','Shub Takkorath'),
('10240','','Shub Takkorath'),
('10241','','Shub Takkorath'),
('10242','','Aedriaus Olive'),
('10243','','Shub Takkorath'),
('10244','','Aedriaus Olive'),
('10245','','Shub Takkorath'),
('10246','','Shub Takkorath'),
('10247','','Shub Takkorath'),
('10248','','Shub Takkorath'),
('10249','',''),
('10250','','Shub Takkorath'),
('10251','','Shub Takkorath'),
('10252','','Shub Takkorath'),
('10253','','Shub Takkorath'),
('10254','','Shub Takkorath'),
('10255','','Shub Takkorath'),
('10256','','Shub Takkorath'),
('10257','','Shub Takkorath'),
('10258','',''),
('10259','','Shub Takkorath'),
('10260','','Shub Takkorath'),
('10261','','Shub Takkorath'),
('10262','','Shub Takkorath'),
('10263','','Shub Takkorath'),
('10264','','Shub Takkorath'),
('10265','','Aedriaus Olive'),
('10266','','Shub Takkorath'),
('10267','','Shub Takkorath'),
('10268','','Shub Takkorath'),
('10269','','Shub Takkorath'),
('10270','','Shub Takkorath'),
('10271','',''),
('10272','','Elaina Synranelt'),
('10273','','Shub Takkorath'),
('10274','','Arknights'),
('10275','','Arknights'),
('10276','','Arknights'),
('10277','','Arknights'),
('10278','','Arknights'),
('10279','','Arknights'),
('10280','','Shub Takkorath'),
('10281','','Shub Takkorath'),
('10282','','Shub Takkorath'),
('10283','','Shub Takkorath'),
('10284','','Shub Takkorath'),
('10286','','Shub Takkorath'),
('10287','','Elaina Synranelt'),
('10288','','Shub Takkorath'),
('10289','','Shub Takkorath'),
('10290','','Shub Takkorath'),
('10291','','Shub Takkorath'),
('10292','','Shub Takkorath'),
('10293','','Shub Takkorath'),
('10294','',''),
('10295','','Shub Takkorath'),
('10296','','Shub Takkorath'),
('10297','','Shub Takkorath'),
('10298','',''),
('10299','','Shub Takkorath'),
('103','','Shub Takkorath'),
('10300','','Shub Takkorath'),
('10301','','Shub Takkorath'),
('10302','','Shub Takkorath'),
('10303','','Elaina Synranelt'),
('10304','','Shub Takkorath'),
('10305','','Elaina Synranelt'),
('10306','','Shub Takkorath'),
('10307','','Shub Takkorath'),
('10308','','Shub Takkorath'),
('10309','','Shub Takkorath'),
('10310','','Shub Takkorath');

INSERT INTO Card(setID,cardID,cardName,cardType,cardtext,imageID) VALUES
 ('COR','001','Typoyoyo, the Cleaner','Character','Haste. Legend: End of Turn: Trash the top card of each Discard pile.','10291')
,('COR','002','Ribbon of Purity','Character','Legend: Start of Turn: If you have no Nexus Orbs, Summon a Token Ribbon of Purity.','036')
,('COR','003','Bishop, Arms Dealer','Character','Invest: 3 {L}. Legend: Start of District Phase: Search your deck for an Item that costs 3 or less, and put it in your hand. If Invested, search for an Item instead.','003')
,('COR','012','Basement Bargainer','Character','When played: Mill 3 cards, then choose one to Reclaim. (Mill - Put the top card of your deck into your discard pile || Reclaim - Shuffle a card from your discard pile into your deck).','10144')
,('COR','013','Quickdraw Sheriff','Character','When played: Deal 1 damage. If you drew Quickdraw Sheriff this turn, it has Reaction. (You can play it outside of your Field Phase).','10248')
,('COR','014','Rrat Pack','Character','When attacking: Gain +1/+0 for each other attacking Rrat Pack you control.','10057')
,('COR','015','Fast Food Fowl','Character','Haste. Invest: 1 {L}. When killed: Restore 2 Health, or 5 Health if this is Invested.','021')
,('COR','016','Elite Art Dealer','Character','Start of Turn: You may Exhaust: Gain 1 Nexus Orb of any color this turn.','019')
,('COR','017','Seiso Police','Character','When played: If you have no Nexus Orbs, this has Haste. (It is played rested and can attack on the turn it was played).','10263')
,('COR','018','Avatar of Humble Omnipresence','Character',NULL,NULL)
,('COR','019','Emergency Protectors','Character','Reaction. When played: Put 1 Barrier counter on a Character you control.','10181')
,('COR','020','ACPD Soldier','Character','Blockade. When played: Restore 2 City Control.','10130')
,('COR','021','Scavenger Scraptruck','Character','Armored 1. (Damage this takes is reduced by the Armored value).',NULL)
,('COR','022','Adventrix Gangsters','Character','When played: Attack a Character you don''t control.','10134')
,('COR','023','Immense Bread Dog','Character',NULL,'10205')
,('COR','024','Festival of Idols','Spell','You may transmute 1 SP of any color to Natural SP if you control a Natural Orb. Repeat for Tech, Magic, and Corrupt.','10188')
,('COR','025','Reactive Fire','Spell','Reaction. Deal 3 damage to a Character.','10251')
,('COR','026','Redeploy','Spell','Reposition up to two Characters in your Field.',NULL)
,('COR','027','Administrator''s Smite','Spell','Reaction. Destroy a Character.','10132')
,('COR','028','Soba Dynastic Decree','Spell','Each player draws 1 card for each Character they control that is across from a Character.',NULL)
,('COR','029','Tempting Trap','Item','Deploy. When another player plays a Character with 3 or more attack, put 1 Restrain counter on it, then destroy this. (Restrain - Exhaust a Character. If it rests, remove a restrain counter instead).','10281')
,('COR','030','Blank Nexus Orb','Item','Choose one. If you have no Nexus Orbs, you may choose two: Put a +1/+1 counter on a Character | deal 2 damage | draw a card.','10150')
,('COR','031','Iridescent Telescope','Item','Attach to a District. When this is attached, declare a Nexus Orb type attached District has. Attached District is treated as if it has 1 more Nexus Orb of that type.','086')
,('COR','032','Blunt Force Hammer','Item','Equip. Attached Character has +2/+2. As a Reaction: Detach this to destroy an Item.','10153')
,('COR','033','Silver Statuette','Item','Deploy. When you play your third card each turn, you may return it to your hand. Do so after resolving its "when played" effects/triggers, if it''s a Character.','100')
,('COR','034','Onion Field','District','When played, or when your Nexus Phase begins and you have no Orbs: Summon a 1/1 Onion Token.','10240')
,('COR','035','Outlander''s Field','District','When played: Declare a Character subtype. When you play a Character of that subtype, you may change one colored SP of its cost to {L}.',NULL)
,('COR','036','Administrator''s Tower','District','Start of District Phase: You may pay 4 {L} to destroy a Character that costs 3 or less.','10133')
,('COR','037','Defense Center','District','Characters in the center space of your Field have Reach.',NULL)
,('COR','150','Bridge of Progress','District','Once during your District Phase, you may pay 3 {L} to draw a card.',NULL)
,('COR','151','Bridge of Ley','District','Once during your District Phase, you may pay 3 {L} to draw a card.','10156')
,('COR','152','Bridge of Flesh','District','Once during your District Phase, you may pay 3 {L} to draw a card.',NULL)
,('COR','153','Bridge of Mind','District','Once during your District Phase, you may pay 3 {L} to draw a card.',NULL)
,('COR','154','Bridge of Virus','District','Once during your District Phase, you may pay 3 {L} to draw a card.','10157')
,('COR','155','Bridge of Heresy','District','Once during your District Phase, you may pay 3 {L} to draw a card.',NULL)
,('COR','T01','Onion','Character','Start of Nexus Phase: Sacrifice this: Gain 1 Nexus Orb of any color this turn.','10239')
,('COR','T02','Ribbon of Purity','Character',NULL,NULL)
,('COR','004','Treechat, the Tree','Character','When played: Put 3 Mastery counters on this. Legend: Start of each Combat Phase: You may spend 1 Mastery counter to give chosen Character +1/+0 and Quick Strike this turn.','051')
,('COR','005','Eresh, Blood and Skulls','Character','Whenever a Character dies while this is in your hand, put a Blood counter in your CC zone. Costs 1 {L} less per Blood counter in your CC zone. Legend: Once per round, spend a Blood counter. A Character you control attacks a Character you don''t control.','10184')
,('COR','038','Apostle of the Kirin','Character','Invest: 1 {L} 1 {N}: Restore 8 Health split between Characters you control.','10139')
,('COR','039','Deathspitter Scorpion','Character','Invest 2 {L} 2 {N}: Gain Lethal. When played: Deal 2 damage to a Character.','012')
,('COR','040','Giant Crab','Character',NULL,NULL)
,('COR','041','Oaken Shieldmaster','Character','Blockade. (This may block even when exhausted).','10237')
,('COR','042','Watamelon Farmer','Character','Exhaust: Gain 1 {N} SP.','10300')
,('COR','043','Ancient Guardian','Character','Can''t Attack unless you Overhealed this turn.','10136')
,('COR','044','Reckless Barbarian','Character','Haste. When played: Deal 4 damage to itself.','034')
,('COR','045','Avatar of Wild Strength','Character','Breakthrough. (Excess combat damage carries over to City Control).',NULL)
,('COR','046','Stormbike Shaman','Character','Reaction. Overpass.',NULL)
,('COR','047','Acorn Theropod','Character','Breakthrough. When played: Put a Barrier counter on this.','10128')
,('COR','048','Tidal Elemental','Character','Breakthrough. Start of your Combat Phase: You may pay {N}{N}: Exhaust a Character.','10288')
,('COR','049','Ley Life','Spell','Restore X Health, where X is twice the amount of {N} SP you have as you cast this.','10217')
,('COR','050','Bonk','Spell','Chosen character you control attacks a character you don''t control.','10154')
,('COR','051','Nothing Personnel','Spell','Reaction. Reposition a Character you control. Destroy a damaged Character you don''t control.','10094')
,('COR','052','Wear Down','Spell','Destroy an Item. Invest 4 {L}: Destroy all Items','10302')
,('COR','053','Carcinization','Spell','Transform a Character into a 2/3 Giant Crab Token.','10161')
,('COR','054','Wildfire','Spell','Deal 4 damage to all Characters.','10305')
,('COR','055','Invocation of The Tower','Spell','Destroy all cards in the Field except for cards in your centermost space of the Field. If that card is a Character, put X +1/+1 counters on it, where X is the number of non-Character cards destroyed.','10211')
,('COR','056','Deadly Venom','Item','Equip. Attached Character has Lethal. (Characters that take damage from this are killed.)',NULL)
,('COR','057','Elixir of Evolution','Item','Equip. As a Reaction, you may sacrifice this to restore 3 CC. During your Field Phase you may sacrifice this and pay 3 {L} to give a Character +4/+4 this turn.','10101')
,('COR','058','Pungent Mackerel','Item','Afflict. Attached Character has -2/-0.',NULL)
,('COR','059','Growth Stimulant','Item','Distribute two +1/+1 counters among Characters you control. Invest 3 {L}. Distribute two more.','10199')
,('COR','060','Sturdy Polearm','Item','Equip. Attached Character has +0/+1 and Quick Strike. (It deals its combat damage before combat begins).','10269')
,('COR','061','Verdant Field','District','When played: Give up to two Characters +0/+1.','068')
,('COR','062','Meadhall Manor','District','Whenever a Character enters your Field, restore 2 Health to a Character you control.','10223')
,('COR','063','Arboreal Tower','District','Start of Field Phase: You may pay 3 {L} to give a Character you control +2/+2 until the start of your next turn.','10109')
,('COR','064','Conservation Center','District','If there is a Beast or Plant in the center of your Field, Beasts and Plants in your Field have +1/+1 and Breakthrough.','10169')
,('COR','065','Nexus to Gilded Sea-Forest','District','Start of District Phase: You may search your deck for a Natural Character and put it in your hand. During your Nexus Phase, you may sacrifice this to gain 5 {N} SP.','10235')
,('COR','T03','Giant Crab','Character',NULL,'10194')
,('COR','006','Saki, En La Dun Vera','Character','Legend: During your Field Phase you may pay 2 {T}: Summon a Lar''Eg Operative Token. Give it +1/+1 OR Haste.','037')
,('COR','007','XanRail, the Conductor','Character','Legend: 2 of your Vehicles'' {T} cost becomes {L}. 1 of your non-Vehicle Machines'' {T} cost becomes {L}','10307')
,('COR','066','Surveillance Drone Swarm','Character','Overpass. When played: Spy 1: All.','10272')
,('COR','067','Apostle of the Civilized','Character','Invest 1 {L}: Play a District from your hand, or discard a District to draw a card.','10138')
,('COR','068','Mobile Turret','Character',NULL,NULL)
,('COR','069','Platesmith','Character','Reaction. When played: Give a Character Armored 2 this turn.',NULL)
,('COR','070','Hoverbike Hooligan','Character','Haste. This has Overpass if there is no Character across from it.','023')
,('COR','071','Avatar of Inquisitive Process','Character','Echo 4 {L} 2 {T}. (You can play this from your discard pile for its Echo cost).',NULL)
,('COR','072','Shielder Mech','Character','Blockade. Armored 1. This has Armored 3 when in combat with the Character across from it.',NULL)
,('COR','073','Engine of War','Character','Breakthrough. When played: Deal Ruins X damage split between any number of non-player targets. (X is the number of Districts in your discard pile.)','10182')
,('COR','074','Junker Mech','Character','This costs Ruins X {L} less. (X is the number of districts in your discard pile).','10215')
,('COR','075','Factory Recall','Spell','Reaction. Name a card. Return all cards with that name to their owner''s hand.','10185')
,('COR','076','Saki Constructions','Spell','Add a Construction Zone Token to your hand. You can play and Allocate an additional District during your District Phase this turn.','10259')
,('COR','077','Chemical Explosion','Spell','Deal 5 damage to a Character, and 1 damage to all other Characters.','10165')
,('COR','078','Invocation of The Wheel','Spell','You have no hand size limit until the end of your next turn. For each card in your Discard Pile, roll a d6. On a 3 or 4, shuffle it back into your deck. On a 5 or 6, add it to your hand.',NULL)
,('COR','079','Bypass Protocol','Item','Reaction. Afflict. Reposition it. Draw a card, then discard a card.',NULL)
,('COR','080','Cybernetic Cat Ears','Item','Each player may choose to restore 5 CC. If they do, shuffle a Cybercat Token into their deck.',NULL)
,('COR','081','Cleansing Protocol','Item','Reaction. Afflict. Return all cards attached to this Character not named Cleansing Protocol to their owners'' hands.','076')
,('COR','082','Disco Laser Field','Item','Reaction. Deploy. Attacking Characters across from this have -2/-0 and lose Haste and Quick Strike. Destroy this if a Character across from this deals 4 or more CC damage.',NULL)
,('COR','083','Elixir of Concentration','Item','Equip. As a Reaction, you may sacrifice this to restore 3 CC. During your Field Phase you may sacrifice this and pay X {L} to Sift X.','10118')
,('COR','084','Fragility Protocol','Item','Afflict. Attached Character''s max Health is 1.','10192')
,('COR','085','Retreat Protocol','Item','Reaction. Return a Character to its owner''s hand. If you controlled that Character, gain 1 {T} SP.','10255')
,('COR','086','City Blueprints','Item','Choose one: Search your deck for a District and add it to your hand OR add a Construction Zone Token to your hand.','075')
,('COR','087','Metal Detector.','Item','Sift 3. If any are Items, you can add them to your hand instead of milling them.','10226')
,('COR','088','Scramble Protocol','Item','All players shuffle their hands into their decks, then draw cards equal to the number they had before. Echo 4 {L} 2 {T}',NULL)
,('COR','089','Abandoned Scrapfield','District','When played: Sift 2. (Look at the top 2 cards of your deck. You may mill any by putting them in your discard pile.)','054')
,('COR','090','Abstract Manor','District','Whenever a Character enters your Field, give Armored 1 to a Character you control.','10126')
,('COR','091','Illuminated Skytower','District','Start of Field Phase: You may pay 3 {L} to give a Character you control Overpass until the start of your next turn.','10204')
,('COR','092','Recycling Center','District','If there is a card in the center of your Field at the end of your turn, Reclaim the bottom 5 cards of your discard pile. (Shuffle them back into your deck).','10252')
,('COR','093','Nexus to En Vara La Dun','District','Whenever a Character you control attacks, put an Education counter on it. At the start of the round, declare whether your Education counters give +1 Attack or +1 Health this round. During your Nexus Phase, you may sacrifice this to gain 5 {T} SP.','061')
,('COR','T04','Cybercat','Character','Can''t Attack players with Tech Orb Districts. While this is in your hand, your hand size decreases by 1.',NULL)
,('COR','T05','Lar''Eg Operative','Character',NULL,NULL)
,('COR','T06','Construction Zone','District','When played or discarded: If you haven''t gained SP from a Construction Zone this turn, gain 1 {T} SP this turn.','058')
,('COR','008','Aedriaus Olive','Character','Haste. Legend: You may play Characters from your discard pile for 2 {L} more than their original cost. They have Haste, 1 Max Health, Ephemeral (They are Trashed if they are destroyed), and are sacrificed at the end of your turn.','10048')
,('COR','009','Elaina, Schreibenprinzessin','Character','Start of Field Phase: Pay 2 {L}: Spy 2: Your deck. Legend: If you looked at the top card of your deck this turn or last, you can play it for 2 {M} more as if it had Reaction until the start of your next turn.','018')
,('COR','094','Owl Familiar','Character','Overpass. When played: Put a Silence counter on this or another Character you control. (It loses all non-damage counters and all card text).','10241')
,('COR','095','Apostle of the Witch','Character','Invest: 2 {L} 1 {M}: Draw a card for each Token you control, then draw a card.','10140')
,('COR','096','Luknight Templar','Character',NULL,NULL)
,('COR','097','Secretive Oracle','Character','Ward 2. Whenever you Spy, put a +1/+1 counter on this.','039')
,('COR','098','Avatar of Indomitable Faith','Character','Ward 3. (Other players must pay an additional 3 {L} to play cards targeting this).',NULL)
,('COR','099','Acrobike Juggler','Character','Overpass. When played: Draw 2 cards, then Spy 1: Your deck.','10131')
,('COR','100','Benevolent Priest','Character','When played: Restore 2 Health to other Characters in your Field and give them Ward 1 until the start of your next turn.','10147')
,('COR','101','Iridescent Shark','Character','Ward 1. When played: Summon two Token copies of Iridescent Shark.','10212')
,('COR','102','Mana Circuit Overload','Spell','Reaction. Gain two {M} Orbs this turn. Draw a card.','10219')
,('COR','103','Create Golems','Spell','Summon a 2/2 Earth Golem Token. Invest 2 {L}: Repeat. Invest 2 {M}: If this is already Invested, repeat.','079')
,('COR','104','Mana Shield','Spell','Reaction. Put a Barrier counter on a Character. (It prevents the next damage instance or destroy effect.)','10119')
,('COR','105','Ball Lightning','Spell','Breakthrough. Deal 3 damage to a Character and 1 damage to adjacent Characters.','071')
,('COR','106','Harness the Elements','Spell','Summon a 4/4 Fire Elemental Token. Invest 3 {M}: Give all Elementals in your Field +2/+2 and Haste this turn.','10120')
,('COR','107','Banish','Spell','Trash a card in the Field. (Remove it from play. Do not resolve its when killed effect if it has one).','10143')
,('COR','108','World Order, Celine Enigmata','Spell','Spy 5: Your deck. Pick up to two spells or items, and add them to your hand.','10121')
,('COR','109','Wall of Ice','Spell','Choose a Character you control. Summon Ice Wall Tokens in spaces adjacent, across and peripheral to it, if those spaces are empty','10122')
,('COR','110','Cold Snap','Spell','Exhaust all non-Token Characters. Echo: 4 {L} 4 {M}','10167')
,('COR','111','Invocation of The Star','Spell','Spy 17: Your deck. Secretly sort them into five piles of at least one card. Starting from your left, each player (including yourself) picks a pile to put back on the top your deck. Put the remaining piles on the bottom.',NULL)
,('COR','112','Elixir of Restoration','Item','Equip. As a Reaction, you may sacrifice this to restore 3 CC. During your Field Phase you may sacrifice this and pay 2 {L} to draw 2 cards.','10123')
,('COR','113','Golem''s Heart','Item','Summon a 2/2 Earth Golem Token. Invest 2 {L}: Put two +1/+1 counters on it.','10124')
,('COR','114','Relic of the Apostate','Item','Choose One: Restore a Character to max Health, or increase it''s max Health by 2. Invest 1 {M}: Choose both.','10254')
,('COR','115','Spellcraft Urn','Item','Draw 2 cards.',NULL)
,('COR','116','Warding Staff','Item','Untargetable. Equip. Attached Character has Ward 2.',NULL)
,('COR','117','Bleak Snowfield','District','When played: Summon an Ice Wall Token.','057')
,('COR','118','Wizardry Manor','District','Whenever a Character enters your Field, reduce the cost of your next Spell by 1 {L} this turn.','10306')
,('COR','119','Dilapidated Clocktower','District','Start of any Field Phase: You may pay 3 {L} to Exhaust a Character.','10174')
,('COR','120','Reverent Holy Center','District','If there is a Character with full Health in the center of your Field, Characters in your Field have Ward 2.','10256')
,('COR','121','Nexus to The Cliff on the Edge of the World','District','When played: Summon a Hinian Eidolon Token. Whenever you Spy, you may pay 5 {L} to Summon a Hinian Eidolon Token. During your Nexus Phase, you may sacrifice this to gain 5 {M} SP.','062')
,('COR','T07','Ice Wall','Character','Can''t Attack. Blockade. When Summoned: Put a Barrier counter on this.',NULL)
,('COR','T08','Earth Golem','Character',NULL,'016')
,('COR','T09','Fire Elemental','Character',NULL,'10190')
,('COR','T10','Hinian Eidolon','Character','When Summoned: Transform into a Token copy of chosen Character in a Field.','022')
,('COR','T11','Iridescent Shark','Character','Ward 1.','10213')
,('COR','010','Mara the Ever-Changing','Character','When played: Gain +1 Health for each card a player milled this turn. Legend: Start of End Phase: Each player mills cards equal to Mara''s current Health (minimum 1).','10221')
,('COR','011','Shub Takkorath','Character','Legend: Whenever you mill a card, If it was a Character, Summon a Child of the Woods Token. Triggers once per turn.','042')
,('COR','122','Sacrificial Sheep','Character','This counts as two Characters for the purpose of Sacrifice costs.','10257')
,('COR','123','Hooded Cultist','Character',NULL,NULL)
,('COR','124','Apostle of the Priestess','Character','Invest 1 {C}: Chosen Character you control gets Convert while you control this.','10004')
,('COR','125','Project Lune','Character','This has Overpass if you discarded a card this turn.',NULL)
,('COR','126','Tithe Collector','Character','Whenever a player discards one or more cards, put a +1/+1 counter on this.',NULL)
,('COR','127','Avatar of Shaken Perspective','Character','Convert. (Damage this deals recovers your City Control by the same amount).','10142')
,('COR','128','Cosmos Whale','Character','Additional cost: Discard 4 cards. Discard one less for each Nexus Orb type you have.',NULL)
,('COR','129','Insane Arsonist','Character','Breakthrough. When killed: Each player mills 1 card and loses 1 CC.',NULL)
,('COR','130','Motorbike Nightfang','Character','Overpass. When dealing CC damage: Restore that much CC.','10232')
,('COR','131','Eater of Worlds','Character','Pay 4 CC: This gains +2/+2 this turn for each Nexus Orb type you have. Activate only once per round.','017')
,('COR','132','Ancient One','Character','Convert. When played: Sacrifice any number of Characters other than this one. Each opponent must sacrifice an equal number.','10137')
,('COR','133','Dark Ritual','Spell','Additional cost: Sacrifice a Character. Transmute 5 SP into {C} SP.','10172')
,('COR','134','Denounce','Spell','Give a Character -3/-3 this turn. Invest 1 {C}: Put three -1/-1 counters on that Character instead.','10173')
,('COR','135','Nexus Domination','Spell','Draw a card for each Nexus Orb type you have. At the end of your turn, discard any you didn''t play.',NULL)
,('COR','136','Void Leakage','Spell','Give all Characters in the Field -2/-2 this turn','10297')
,('COR','137','Corrupting Influence','Spell','Attach to a District. Convert. Start of controlling player''s turn: They lose 1 CC.',NULL)
,('COR','138','Invocation of The Hanged','Spell','Sacrifice any number of Characters. All other players lose that much CC. Pay up to half of your current of CC, rounded down. All other players mill that many cards. Mill up to half your remaining deck, rounded down. All other players'' Characters take that much damage.','10209')
,('COR','139','Bloodied Blade','Item','Equip. When played: Pay up to 2 CC, and put that many Blood counters on this. Attached Character gets +X/+0, where X is the number of Blood counters on this.','10152')
,('COR','140','Elixir of Hallucination','Item','Equip. As a Reaction, you may sacrifice this to restore 3 CC. During your Field Phase you may sacrifice this and pay 4 CC to gain 2 {C} SP.','10125')
,('COR','141','Symbol of Madness','Item','Deploy. Pay 2 {L} 1 {C}: Chosen player mills 3 cards. They can choose to pay up to 3 CC to mill 1 less per CC paid.','10273')
,('COR','142','Altar of Souls','Item','Deploy. Whenever a Character dies, put a Souls counter on this. When this reaches 7 Souls counters, destroy this and restore 7 CC.','10135')
,('COR','143','Detective''s Stopwatch','Item','Discard your hand, then draw 7 cards.',NULL)
,('COR','144','Mask of Conversion','Item','Attach this to a Character. You control attached Character. Reposition it to your Field.',NULL)
,('COR','145','Creeping Voidfield','District','Convert. When played: Deal 1 CC damage to each opponent.','059')
,('COR','146','Haunted Manor','District','Whenever a Character enters your Field, put a -1 Attack or -1 Health counter on a Character you don''t control.','10202')
,('COR','147','Seabeacon Tower','District','Start of Field Phase: You may pay 3 {L} OR 5 CC to make an opponent discard a card.',NULL)
,('COR','148','Pulsating Hive-Center','District','If there is a card with three or more counters in the center of your Field during your Nexus Phase, copy up to 1 counter on each card you control.','066')
,('COR','149','Nexus to the Black Woods','District','Once during your Field Phase, you may Sacrifice four Characters, which cannot be your Character(s) with the highest Attack. If you do, chosen opponent mills 11 cards. During your Nexus Phase, you may sacrifice this to gain 5 {C} SP.','10025')
,('COR','T12','Child of the Woods','Character','When killed: If during Combat, defending player mills 2 cards, otherwise each player mills 1 card.',NULL)
,('HOE','001','Crab','Character',NULL,NULL)
,('HOE','002','Mr. Misfortune','Character',NULL,NULL)
,('HOE','003','Brad from Accounting','Character',NULL,NULL)
,('HOE','004','Pure Imagination','Character',NULL,NULL)
,('HOE','005','The Mightiest Sand Castle','Character','Frailty 2. you can tuck up to two Characters under this card and any damage they would take in combat is instead dealt to this card unless the opponent has Quick Strike',NULL)
,('HOE','006','Sand Spade','Item','add the top card of your discard to your hand',NULL)
,('HOE','007','Plastic Pail','Item','attach to a character on the field, they gain one Stealth token','10244')
,('HOE','008','Funny Triangle Hat','Item','attach to a character on the field, they gain 1 Silence token and after combat with a target apply 1 Silence to them',NULL)
,('HOE','009','Crab with a Knife','Character',NULL,NULL)
,('HOE','010','Hermit Crab','Character','Blockade','10203')
,('HOE','011','Mantis Shrimp','Character','when resolving combat with this card flip 3 coins, if the coins land as all heads or all tails this card gains Quick Strike and +3/+0 for this combat','10220')
,('HOE','012','Shuffling Crab','Character','you can Exhaust this card to Reposition it and one other card you control and when you do shuffle one discarded card into your deck','10265')
,('HOE','013','Seaside Barnacles','Character','Blockade. Armored 1.',NULL)
,('HOE','014','Giant Roly-Poly Pill Bug','Character','Breakthrough.','10195')
,('HOE','015','Remipede Swarm','Character','Lethal.',NULL)
,('HOE','016','King Crab','Character','when you summon this Character you may send one Character on your side of the field with an [N] cost to the Discard and subtract their [N] cost from this card','10216')
,('HOE','017','Replacer Crab','Character','when you summon this Character you may target one other "Crustacean" or "Crab" on the field and shuffle them into the owners deck beforing summoning Replacer Crab in their place',NULL)
,('HOE','018','Supreme Emperor, Cancer','Character','Breakthrough. this Character gains +1/+1 for every "Crustacean" and "Crab" on the field that isn''t itself (maximum of +6/+6)','10271')
,('HOE','019','Crab Stack','Character','This Token counts as the number of Crab cards under it +1 (ie. if there are 3 crabs under it then it counts as 4 crabs on the field)',NULL)
,('HOE','020','Karkalicious','Spell','Return every card back to their respective deck, shuffle and have both players draw 7. pretend this never happened.',NULL)
,('HOE','021','Pile of Crabage','Spell','stack all "Crab" characters on your side of the field then summon an X/X Crab Stack Token on top, where X equals the combined attack and health of all characters tucked beneath it.',NULL)
,('HOE','022','Crab Rave','Spell','Select any number of "Crab" Type cards on your side of the field, then shuffle them and an equal amount of your opponents Characters on the field into your respective decks','10170')
,('HOE','023','Quick Pinch','Spell','Target one character on your Opponents side of the field, deal damage to them equal to the attack of 1 "Crab" on your side of the field','10249')
,('HOE','024','Abra-Crab-Dabra','Spell','search your deck for a "Crab" card, add it to your hand','10127')
,('HOE','025','Chitin Nutrients','Item','target a "Crustacean" or "Crab" on the field, they gain +0/+2 and Armored 1 until they leave the field',NULL)
,('HOE','026','New Shell New Hell','Item','attach to a "Crustacean" or "Crab" on the field, they gain +0/+2 and Blockade',NULL)
,('HOE','027','Oddly Shaped Knife','Item','attach to a character on the field, they gain +1/+0 and if they are a "Crab" gain an extra +3/+0','10238')
,('HOE','028','Highly Nutritious Coco-Not-Nut','Item','Deploy. this card is deployed with 3 counters, each turn you can remove 1 counter to heal all characters on your side of the field for 1 HP each. discard this card once it has 0 counters',NULL)
,('HOE','029','Low Tide','District','once per turn, this District can be placed in addition to your normal District construction but all your characters gain Frailty 2 until the end of this round',NULL)
,('HOE','030','High Tide','District','once per turn, this District can be placed in addition to your normal District construction but randomly shuffle 2 of your characters or items on the field into your deck',NULL)
,('HOE','031','Beach''s Harsh Sunlight','District','add a Frailty counter to each of your opponents characters at end of each round.','10145')
,('HOE','032','Beginning of the End','District','all characters on the field are considered the "Crustacean" Species Type in addition to their original Type','10146')
,('HOE','033','Volumetric God Rays','District','can only be played as an upgrade to "Beach''s Harsh Sunlight." Silence any oppenents with Frailty counters on your Opponents side of the field and grant characters on your side of the field Untargetable: Spells','10298')
,('HOE','034','Nature''s Horrific Conclusion','District','can only be played as an Upgrade to "Beginning of the End." all Characters in play are now considered the "Crab" Species Type. any characters that were originally the "Crab" or "Crustacean" Species Type instead gain +2/+3','10233')
,('HOE','035','Sadistic Benefactor','Character','Legend: cards that target characters but doesn''t attach cost 2 less [L]',NULL)
,('HOE','036','Devilish Practitioner','Character','Your cards that deal damage to spaces or Characters in your Field cost 1 {L} less',NULL)
,('HOE','037','Disheveled Noble','Character','Armored 1. if this card destroys a Character you can add a discarded card back into your deck',NULL)
,('HOE','038','Unrefined Knight','Character','Armored 2. if this Character reduces damage taken to 0 draw a card',NULL)
,('HOE','039','King''s Consort','Character','Frailty 1. if this Character is destroyed search your deck for a District and add it to your hand',NULL)
,('HOE','040','Masked Beauty','Character','if this Character takes damage (even if it''s 0) but isn''t destroyed immediately activate the effect of a Character in your hand as if it were this card''s effect',NULL)
,('HOE','041','Loyal Executioner','Character','Convert. when this Character takes damage deal 1 CC damage to an opponent',NULL)
,('HOE','042','Toothpick Insertion','Spell','Target a character, they take 1 damage and all opponents take 1 CC damage',NULL)
,('HOE','043','Laughing Tongues','Spell','Target a character, if they have 1 or less HP return them to the owners deck',NULL)
,('HOE','044','Gleeful Tears','Spell','Target a damaged Character, fully restore HP and gain +2 attack',NULL)
,('HOE','045','Broken Visage','Spell','Reaction: apply Frailty 2 to a character for one round',NULL)
,('HOE','046','Horrendous Downtime','Spell','Reaction: apply Armored 2 to a character',NULL)
,('HOE','047','Hate to Heart','Spell','all characters with Frailty or Armored take 1 damage',NULL)
,('HOE','048','Wooden Straddle','Item','Deploy. you can deploy this card on any field. Characters can be played on top of this card but they take 1 damage at the end of each round',NULL)
,('HOE','049','Low-Burning Candle','Item','Reaction: Rest an Exhausted Character',NULL)
,('HOE','050','Rubber Clamps','Item','Attach to a character. If attached Character would be exhausted and this isn''t exhausted, exhaust this instead. If attached Character would rest and this isn''t rested, rest this instead.',NULL)
,('HOE','051','Worn Ropes','Item','Apply Restrain 2 to a character',NULL)
,('HOE','052','Hot Prod','Item','Target and give them a Brand counter, when that character is destroyed or otherwise removed from the field instead place it on the top of owners deck',NULL)
,('HOE','053','Lashing Wand','Item','Target a character, deal 1 damage and Exhaust it',NULL)
,('HOE','054','High-Grade Handcuffs','Item','Link together 2 adjacent characters, when one takes damage it is split evenly between the two. once both targets are destroyed or otherwise removed from the field return this card to your hand',NULL)
,('HOE','055','Low-Grade Handcuffs','Item','Link together 2 adjacent characters, when one takes damage it is split evenly between the two and then destroy this card',NULL)
,('HOE','056','Bejeweled Collar','Item','Reaction: Attach to a character, if this card defends all attacking cards attack this character',NULL)
,('HOE','057','Metal Maiden','Item','Deploy. Hoard. Pay 1 {L}: Trash all cards this is Hoarding.',NULL)
,('HOE','058','Safety Playroom','District','when a Character you control takes damage you can check the top card(s) of your deck equal to the damage taken',NULL)
,('HOE','059','Coarse Cage','District','when a Character you control reduces damage with Armored during combat reflect that damage to the attack',NULL)
,('HOE','060','Glass Room; Shattered Floors','District','when a Character with Frailty takes damage you can draw a card or return a discarded card to the deck',NULL)
,('HOE','061','Conflicting Ideal Scenarios','District','when a Character negates damage with Armored or take increased damage with Frailty place a counter on this card. during the Nexus Phase you may remove counters and gain 1[T] for every 2 removed',NULL)
,('HOE','062','Miki, People''s Icon','Character','Leader. Legend: spend 3 [L] to summon 2 Crowd Tokens to anywhere on the field',NULL)
,('HOE','063','Expert Parroter','Character','Invest 2[L]: copy the Keyword of one other card on the field',NULL)
,('HOE','064','Life of the Party','Character','Leader.',NULL)
,('HOE','065','Chatterboxes','Character','Crowd 2. Twin Strike.',NULL)
,('HOE','066','Toxic Talker','Character','when entering and leaving the Field deal 2 damage to a Character',NULL)
,('HOE','067','Popular Drunkard','Character','Crowd 4. when attacking flip a coin, if tails attack yourself',NULL)
,('HOE','068','Preoccupied People Persons','Character','Exhaust to shuffle into the deck and draw two cards',NULL)
,('HOE','069','Introverted Party-Goer','Character','Leader. if not adjacent to a Character at the start of your turn gains Stealth',NULL)
,('HOE','070','Crowd Token','Character','Crowd 3: 3 +1/+1 counters, without Leader cannot attack or defend and loses a counter every turn.',NULL)
,('HOE','071','Party Rocking','Spell','if you have 5 or more Characters on your side of the field grant them all +1/+1',NULL)
,('HOE','072','Party Crasher','Spell','if your opponent has more Characters on the Field than you you can destroy 1 Character on the Field',NULL)
,('HOE','073','Forced Queue','Spell','Reaction. Choose a player. If they have at least one Reaction they can play or activate, they must choose one to do so. They must be able to pay its cost, but need not meet any other conditions to activate or play it. If they can''t play or activate any Reaction in this way, they instead take 3 CC damage.',NULL)
,('HOE','074','Over The Table','Spell','all players make their hand visible for 3 rounds',NULL)
,('HOE','075','Open Topic','Spell','summon a Crowd Token to every Field',NULL)
,('HOE','076','Chance Encounters','Spell','if your opponent has more Characters on the Field than you search your deck for a Character that costs 3 or less and summon it',NULL)
,('HOE','077','Uninvited Invitation','Spell','if you control a Leader add 2 +1/+1 to any Crowd on the Field',NULL)
,('HOE','078','Miraculous Escape','Spell','Target a Character next to a Crowd and return them to the owners hand',NULL)
,('HOE','079','Vacant Lifeline','Spell','Target a Crowd and move any number of tokens on them to another Character on the Field',NULL)
,('HOE','080','Single Cup','Item','Equip to a Character, they can Reposition to either edge of your Field once per turn',NULL)
,('HOE','081','Keys to Freedom','Item','Equip to a Character, they gain Breakthrough Invest 2L: they also gain Overpass',NULL)
,('HOE','082','Solitary Lock','Item','Deploy to an opponents field. cards on one side do not trigger or benefit from effects of cards on the other side and cannot Reposition to the other side. can be attacked and destroyed by an adjacent character during the combat phase',NULL)
,('HOE','083','Unopened Letter','Item','Attach to a Character, they gain Reaction: return to the owners hand',NULL)
,('HOE','084','Sign-up Form','Item','Invest XL: Targeted Character gains Crowd X (X being the invested amount)',NULL)
,('HOE','085','Meal Coupon','Item','Reaction: if you have 5 or more Characters on your side of the Field rest them all and remove any damage counters',NULL)
,('HOE','086','Rooftop Get-Together','District','when played summon a Crowd Token to any Field',NULL)
,('HOE','087','Gathering of the Social Council','District','during your Nexus Phase you may grant Leader to one card without a Keyword',NULL)
,('HOE','088','Imperfection Made With Love','District','you no longer need Leaders to control and Maintain Crowds and any Leaders you control gain +3/+3',NULL)
,('HOE','089','Greatest Wrath','Character','Breakthrough. Legend: at the end of the Combat Phase half of the damage you dealt to an opposing CIty Control is dealt to yourself as Scarcity Damage',NULL)
,('HOE','090','Late-Night Daze','Character','on summon, gain one Stealth token.',NULL)
,('HOE','091','Abstraction of Self: A','Character','Invest: 3[C]: summon tokens Abstraction of Self: B and Abstraction of Self: C',NULL)
,('HOE','092','Killer Headache','Character','gains +1/+0 for every 2 City Control you''ve lost',NULL)
,('HOE','093','Vivid Dissociation','Character','when this card is sent to the discard immediately summon it but when it''s destroyed Trash it','10294')
,('HOE','094','Make Believe Maker','Character','when played: copy the stats and counters of the character across from it. if the Character across from it is Repositioned or destroyed: destroy this card',NULL)
,('HOE','095','Dream Dregs','Character','the round after being destroyed: gain 2 extra [C]',NULL)
,('HOE','096','Nightmare Catcher','Character','when this Character deals CC damage: draw a card',NULL)
,('HOE','097','Brain Digger','Character','Overpass. when this character attacks flip a coin: if tails add a card from your Discard to your hand',NULL)
,('HOE','098','Nostalgic Sense','Character','when this character attacks heal 1 CC damage',NULL)
,('HOE','099','Imaginative Freedom','Character','when this character attacks heal 2 CC damage',NULL)
,('HOE','100','Abstraction of Self: B','Character',NULL,NULL)
,('HOE','101','Abstraction of Self: C','Character',NULL,NULL)
,('HOE','102','Trauma Burst','Spell','gain [C] equal to the amount of Scarcity Damage you''ve taken this match',NULL)
,('HOE','103','Memory Suppression','Spell','Gain 3[C] and take Scarcity Damage',NULL)
,('HOE','104','Past Reflections','Spell','Target a card in your discard and add it to your hand and take Scarcity Damage','10242')
,('HOE','105','Greatest Envy','Spell','Target a card in your opponents Discard and return this card to your hand as a copy of that card where all cost is now [L]',NULL)
,('HOE','106','Greatest Greed','Spell','Draw 2 cards and take Scarcity Damage',NULL)
,('HOE','107','Greatest Sloth','Spell','Apply Restrain 2 and +2/+2 to all Characters currently on your field',NULL)
,('HOE','108','Old Roulette','Item','roll a die, on an odd number draw 2 cards and on an even number discard 1 card',NULL)
,('HOE','109','Worn Wallet','Item','gain an extra 3[C] at the start of your next turn',NULL)
,('HOE','110','Memory Album','Item','Search your deck for a Character that costs 3 or less total SP, play it','10225')
,('HOE','111','Greatest Lust','Item','Exhaust any number of your Characters on the field and recover 1 CC from the Scarcity pile for each one',NULL)
,('HOE','112','Greatest Gluttony','Item','Deploy. you can Exhaust a Character to heal 2 CC, after 5 uses destroy this card',NULL)
,('HOE','113','Greatest Pride','Item','Deploy. the first Character you summon on your turn has Haste',NULL)
,('HOE','114','Safe Space','District','when played: grant +0/+2 to all Characters on your field','10258')
,('HOE','115','Soothing Promenade','District','During the Nexus Phase you can choose to recover 2 CC from the Scarcity pile instead of converting SP with this district',NULL)
,('HOE','116','Where Time Refuses to Flow','District','when played: place 3 counters on this card. while this card has counters the SP counter does not increase and the Draw Phase is skipped. remove 1 counter at the end of each round, at 0 counters destroy this card and carry out any actions it prevented.',NULL)
,('ELM','001','Thunderstorm','Spell','Breakthrough. roll 5d12 and pick another field. The number rolled on each die is the number of the space targeted (numbered starting from your left going to your right) exempting the center spaces, and starting at your field. Deal 3 damage to the target spaces. If there is not a character on the space, deal 3 cc damage','10287')
,('ELM','002','Lightning Fan','Spell','Breakthrough. The spaces adjacent to the center take 2 damage, and the edge spaces take 1 damage.','10218')
,('ELM','003','Chain Lightning','Spell','Breakthrough. Deal 3 damage to the center space. All spaces to either the right or left take 1 damage.','10164')
,('ELM','004','True Ball Lightning','Spell','Breakthrough. Deals 3 damage to a target and 1 damage to adjacent spaces. Ignores barrier and ward.',NULL)
,('ELM','005','Invocation of Storm','Spell','Breakthrough. Deal two damage to all spaces on a field.','10208')
,('ELM','006','Earth Blade','Character','For every other Earth Blade, +1/+1','10179')
,('ELM','007','Blade Swarm','Spell','Summon two Earth Blades. Invest 1L 2M: Repeat','10149')
,('ELM','008','Symbol of the Bladesinger','Spell','Summon a White token with +X attack, where X is the number of Elementals on your field',NULL)
,('ELM','009','All Out Attack','Spell','Destroy X Elementals and deal damage to CC equal to X.',NULL)
,('ELM','010','Invocation of Tremors','Spell','Downgrade one of your districts and summon five Earth Blades',NULL)
,('ELM','011','White','Character','When this character takes damage, summon Earth Blades equal to the damage taken.','10303')
,('ELM','012','Incineration Pillar','Spell','Deal 5 damage to a target. If they die, they are trashed',NULL)
,('ELM','013','Firebolt','Spell','Deal 4 damage to a target. Invest 1L 1N: Repeat. Invest 1L 1N: Repeat.','10191')
,('ELM','014','Blast Sphere','Spell','Trash a target and deal 1 damage to all other cards on that field.','10151')
,('ELM','015','Green-Flame Blade','Item','Attach to a character, they gain Lethal and +1/+1',NULL)
,('ELM','016','Invocation of the Sun','Spell','Trashes all cards on a field','10210')
,('ELM','017','Wind Blade','Spell','Attach to a target character and destroy after your next turn. The character gains -2/-2. Invest 3L: Repeat.',NULL)
,('ELM','018','Windwall','Spell','-1/-1 and Silence a target',NULL)
,('ELM','019','Air Spear','Spell','-7/0 to a target. Any excess is converted to damage',NULL)
,('ELM','020','Vortex','Spell','all creatures on a field gain -2/-2',NULL)
,('ELM','021','Invocation of Azure Wind','Spell','Deploy. Whenever a character loses attack, deal equivalent damage (max of 3 damage).',NULL)
,('ELM','022','Flowrider','Spell','Reposition 3 of the cards in your field.',NULL)
,('ELM','023','Riptide','Spell','Choose a Character. Adjacent characters gain +1/+0. For each character adjacent to those Characters (including chosen Character), give chosen Character +1/+0.',NULL)
,('ELM','024','Parted Seas','Spell','Target a creature. Create two water walls adjacent to them if available.',NULL)
,('ELM','025','Charybdis','Character','All of your characters not adjacent to this gain +2/+1 until this dies.',NULL)
,('ELM','026','Invocation of the Moon-Dewller','Spell','All characters on your field who are adjacent to another character gain +3/+1 permanently.',NULL)
,('ELM','027','Water Wall','Character','Can''t attack. Adjacent characters gain +1/+1 until this dies',NULL)
,('ELM','028','Crystalline Empowerment','Spell','Reaction. Unexhaust a card and grant it first strike until the end of the next combat.',NULL)
,('ELM','029','Crystal Tower','Spell','Grant a character Overpass and Armored until the next turn ends',NULL)
,('ELM','030','Shield','Spell','Reaction. Grant a target Armored 2 until this turn ends',NULL)
,('ELM','031','Metamorphosis','Spell','Grant a target Armored 3 and Overpass permanently.',NULL)
,('ELM','032','Invocation of Genesis','Spell','Restrain up to four cards on a field and grant all of your cards Armored X+1 where X is their current armored level.',NULL)
,('WHV','001','Issei, the Loaded Dice','Character','When played: Roll 2d6 and look at that many cards on the top of your deck. Legend: Whenever you roll a dice, you may roll two and take either result.','10214')
,('WHV','002','Argel, Sword of Waterhaven','Character','Armored 3. When played: Chosen Character attacks this. Legend: Whenever Armored reduces damage, restore 1 CC.','10141')
,('WHV','011','Spirit of the Kitchen','Character','When played: Put a Stealth counter on this. Spirit of the Kitchen can''t be blocked if you played a District this turn.',NULL)
,('WHV','012','City Watch Guard','Character','Blockade. Can''t Attack unless this attacks with at least 2 other Characters.',NULL)
,('WHV','013','Griffon Watch Rider','Character','Overpass. When played: Look at the top card of an opponent''s deck.','10198')
,('WHV','014','Churro Vendor','Character','Armored 1. Characters in your Field have +1/+0.',NULL)
,('WHV','015','Kindly Baker','Character','When played: Give +0/+1 to up to three Characters.',NULL)
,('WHV','016','Night Patrol','Spell','Look at the bottom of another player''s deck. You may shuffle it.',NULL)
,('WHV','017','Defend the City!','Spell','Reaction. Your City Control has Ward 3 until start of your next turn. If this is cast outside of your Combat Phase, Reposition up to three Characters you control.',NULL)
,('WHV','018','Backdoor Escape','Spell','Return a Character to the top of it''s owner''s deck.',NULL)
,('WHV','019','Fall Into the Depths','Spell','Depth 10. Give a Character -2/-2 [until end of turn]. If it is destroyed, put it on the bottom of its owner''s deck.','10186')
,('WHV','020','Edible Spoon','Item','Choose one: Deal 1 damage || Give a Character +0/+1. Your opponent may choose the other.',NULL)
,('WHV','021','Paper Copies','Item','Each player draws 1 card.',NULL)
,('WHV','022','Piano of the Finale','Item','Look at the bottom of your deck. If it''s an Item, deal 4 damage to up to one Character.',NULL)
,('WHV','023','Bead of Fireball','Item','Attach to a Character. When attached Character deals CC damage, sacrifice this and deal 2 damage to all Characters in the Field.',NULL)
,('WHV','024','Dock Ward','District','Your Depth is X deeper, where X is the number of Characters in your Field.',NULL)
,('WHV','025','Refurbished Manor','District','Invest 5 {L}. Refurbished Manor has 1 Orb of the same Nexus color as a card in your Legend Zone, or 3 Orbs if Invested (If the Legend card is multicolored, you choose the Orb color as either it or this enters a Zone).',NULL)
,('WHV','026','Neverember Vault','District','Depth 25. [Whenever a Character deals CC damage to you, you take 1 more.] If you took less than 4 CC damage since your last turn, this has 3 Orbs of each color.',NULL)
,('WHV','027','Blackstaff Tower','District','Items in your hand cost 3 {L} less if you have a Legend in your Legend Zone (to a minimum of 1).','10148')
,('WHV','084','Brawl Street','District','Depth 5. [When played: This has no orbs until your next District Phase unless you mill 2 cards.]','10155')
,('WHV','085','Extravagant Villa','District','Depth 5. [When played: This has no orbs until your next District Phase unless you mill 2 cards.]','10012')
,('WHV','003','Torii, Bane of Chickens //','Character','Pay 2 {T}: Transform this into Torii, Kebab Vendor. Legend: Whenever a Bird or Beast dies, restore 2 Health.',NULL)
,('WHV','004','Skullsplitter','Character','When played: If another player has a Legend in their Legend Zone, Skullsplitter fights a Character. Legend: Whenever a Character survives combat, it gets +2/+0.',NULL)
,('WHV','028','Xob-Goblin Gang','Character','Breakthrough. Invest 2 {L} up to twice: Summon a Token Xob-Goblin Gang adjacent to this.','10308')
,('WHV','029','Conclave Druid','Character','Depth 5. When attacking: Restore 2 Health to another [attacking] Character.','10168')
,('WHV','030','Wild Gazer','Character','Overpass. Invest 2 {L}: Deal 1 damage to up to 4 Characters.','10304')
,('WHV','031','Duergar Sentry','Character','Depth 5. When attacking: This has Quick Strike [if no Character blocking it has 3 or more Attack].',NULL)
,('WHV','032','Swole Nature Spirit','Character','When attacking: You may pay 1 {N} up to three times. This gets +1/+0 until end of turn for each {N} paid in this way.',NULL)
,('WHV','033','Tavern Brawler','Character','When attacking with at least two other Characters: This and one other attacking Character have Breakthrough.',NULL)
,('WHV','034','Living Winds','Spell','Reaction. Attach to a Character and Reposition it. Attached Character has Ward 1.',NULL)
,('WHV','035','Blow the Doors','Spell','Deal 2 damage to all Characters. If you dealt at least 4 CC damage to another player this round, you may cast this at the end of your Combat Phase for 2 {L} less.',NULL)
,('WHV','036','Deface the Tavern','Spell','Attach to a District. Attached District is Silenced while this is attached (Silenced Districts still produce Orbs and can be upgraded). It''s owner may remove this by paying 3 {L}.',NULL)
,('WHV','037','Spike Growth','Spell','Attach to a District. Whenever a Character enters the Field, deal 1 damage to it.',NULL)
,('WHV','038','Potato //','Item','Restore 1 Health. Overheal: Transform this into Orbital Tato Array and play it in the Field.',NULL)
,('WHV','039','Child''s Dented Helm','Item','Attach to a Character. Attached Character has +2 Health and if it costs 3 SP or less it has Armored 1.','10166')
,('WHV','040','Unidentified Sprig','Item','Draw the bottom card of your deck. If it''s a District, restore 4 CC. Otherwise, restore 5 Health and give that Character Lethal until end of turn.','10293')
,('WHV','041','Undercity Fight Club','District','Start of End Phase: If you attacked with at least three Characters this turn, put a Prize counter on this. As a Reaction, spend a Prize Counter to gain +1 {N} Orb until end of turn and give a Character +1/+0.',NULL)
,('WHV','T01','Xob-Goblin Gang','Character','Breakthrough.','10309')
,('WHV','T08','// Torii, Kebab Vendor','Character','Legend: Whenever a Bird, Beast, or Machine dies, restore 4 Health.',NULL)
,('WHV','T09','// Orbital Tato Array','Item','Deploy. Start of your Combat Phase: Restore 1 Health to a Character.',NULL)
,('WHV','005','Yuko, Escaped Operative //','Character','Pay 3 {N}: Transform this into Yuko, Spirit Speaker. Legend: Start of Field Phase: Pay 3 {L} to put a Stealth counter on an Agent or Soldier you control and Reposition it.',NULL)
,('WHV','006','The Jack of Black','Character','When played: If another player has a Legend in their Legend Zone, put 3 Stealth counters on this. Legend: When a Character removes it''s Stealth counters, chosen opponent takes 1 CC damage per Stealth counter removed (up to 3).','10284')
,('WHV','042','Drow Sailor Gang','Character','If this is unblocked during combat, it deals 2 CC damage to defending player. Invest 2 {L} up to twice: Summon a Token Drow Sailor Gang adjacent to this.',NULL)
,('WHV','043','Genial Bartender','Character','Armored 1. When played: Put 1 Stealth counter on this.',NULL)
,('WHV','044','Night Swashbuckler','Character','Whenever this deals CC damage, put a Stealth counter on it.',NULL)
,('WHV','045','Festival Float','Character','Armored 1. Whenever a Character with Stealth attacks, they gain +1/+0 until end of turn.',NULL)
,('WHV','046','Weaver of Secrets','Character','Start of your End Phase: If you dealt CC damage this turn, put a Spider-Silk Cloak Token on the bottom of your deck.',NULL)
,('WHV','047','Infiltrate the Procession','Spell','Play or Allocate a District. If you dealt at least 4 CC damage to another player this round, you may cast this at the end of your Combat Phase for 2 {L} less.',NULL)
,('WHV','048','Nimblewright''s Ingenuity','Spell','Depth 10. Sift 2. Then [if you milled both,] draw 2 cards.','10236')
,('WHV','049','Calling Card','Item','Depth 5. [If you removed a Stealth counter this turn,] Draw a card.',NULL)
,('WHV','050','Buried Orb //','Item','Depth 15. When played, [put this at the bottom of your deck, then] draw the bottom card of your deck. If you drew an Item card not named Buried Orb, transform this into Unearthed Guardian and play it in the Field.','10159')
,('WHV','051','Unidentified Brew','Item','Draw the bottom card of your deck. If it''s an Item, Sift 2. Otherwise, restore 5 Health and give that Character Armored 2 until end of turn.',NULL)
,('WHV','052','Smokepowder Pistol','Item','Attach to a Character. Attached Character has Quick Strike. Attached Character has Twin Strike instead if they have two or more Items equipped.','10266')
,('WHV','053','Hat of Disguise','Item','Attach to a Character you control. When played: Trash a Character in your discard pile. Attached Character loses it''s card text and instead has the card text of the Trashed Character.','10201')
,('WHV','054','Melairkyn Mining Device','Item','Deploy. Depth 20. When played: Sift 2. Whenever you mill a(n) [Item] card, deal 2 damage to up to one Character.','10224')
,('WHV','055','Seven Masks Theatre','District','Start of End Phase: If at least two Districts entered your discard pile this turn, put a Prize counter on this. As a Reaction, spend a Prize Counter to gain +1 {T} Orb until end of turn and put a Stealth counter on a Character.','10264')
,('WHV','T02','Drow Sailor Gang','Character','If this is unblocked during combat, it deals 2 CC damage to defending player.',NULL)
,('WHV','T03','Spider-Silk Cloak','Item','Attach to a Character. Put 1 Stealth counter on attached Character.',NULL)
,('WHV','T10','// Yuko, Spirit Speaker','Character','Overpass. Legend: Spirits, Beasts, and Plants you control have +1/+1.',NULL)
,('WHV','T11','// Unearthed Guardian','Character','Blockade. Start of your Combat Phase: You may Exhaust this: Sift 1. If you mill that card, Unearthed Guardian gains +1/+0.','10292')
,('WHV','007','Harbor, Storm of (in)Security //','Character','Pay 5 {C}: Transform this into Harbor, Heart of Corruption. Legend: Trash a Spell from your discard pile: Character you control gets +1/-1 until end of turn. Activate up to three times per turn.','10200')
,('WHV','008','Baroness Cassalanter','Character','When played: If another player has a Legend in their Legend Zone, Silence all Invested cards in the Field. Legend: Pay 1 {L} and sacrifice a Devil: Draw a card.',NULL)
,('WHV','056','Gang of Asmodeus','Character','Sacrifice this: Reduce the cost of your next Devil by 1 {L}. Invest 2 {L} up to twice: Summon a Token Gang of Asmodeus adjacent to this.',NULL)
,('WHV','057','Butler of the Blood Quill','Character','When played: Summon 2 Imp Tokens, then Silence all Devils you control.',NULL)
,('WHV','058','Hellbound Flamesword','Character','Depth 10. When played: [Discard two cards, then] draw a card for each Devil in your Field.',NULL)
,('WHV','059','Bone Devil','Character','Overpass. Start of your End Phase: Choose One: Discard two cards || Sacrifice this.',NULL)
,('WHV','060','Attempted Communion //','Spell','Look at the top five cards of your deck. If none are Spells, transform this into Deal With the Devil and cast it.',NULL)
,('WHV','061','Misty Step','Spell','Return a Character you control to your hand. It costs 1 {L} less this turn.',NULL)
,('WHV','062','Blackstaff''s Rebuke','Spell','Reaction. Attach to a Character. When played: Attached Character gains Ward 5 until end of turn and 1 Barrier counter.',NULL)
,('WHV','063','Hellish Rebuke','Spell','Reaction: When a Character you control takes damage that doesn''t destroy it. The Character or player that dealt that damage takes the same amount of damage (up to 4).',NULL)
,('WHV','064','Shatter Sculpting','Spell','Depth 10. Choose One: Destroy up to two [adjacent] Items || Deal 1 damage to up to two [adjacent] Characters and Silence them.',NULL)
,('WHV','065','Imp-ress the Dragon','Spell','Summon 4 Imp Tokens. If you dealt at least 4 CC damage to another player this round, you may cast this at the end of your Combat Phase for 2 {L} less.','10206')
,('WHV','066','Three-Eyed Scrying Stone','Item','Look at the top 3 cards of your deck. You may move one to the bottom.','10286')
,('WHV','067','Hush Money','Item','Attach to a Character. Attached Character is Silenced and can''t attack or defend. It''s owner may sacrifice attached Character during their Field Phase to gain 2 {M} SP.',NULL)
,('WHV','068','Unidentified Card','Item','Draw the bottom card of your deck. If it''s a Spell, summon an Imp Token. Otherwise, restore 5 Health and give that Character Ward 2 until end of turn.',NULL)
,('WHV','069','Dungeon Beneath the Manor','District','Start of End Phase: If you discarded at least two cards this turn, put a Prize counter on this. As a Reaction, spend a Prize Counter to gain +1 {M} Orb until end of turn and Summon an Imp Token.',NULL)
,('WHV','T04','Imp','Character','Overpass. Can''t Block.','10207')
,('WHV','T05','Gang of Asmodeus','Character','Sacrifice this: Reduce the cost of your next Devil by 1.',NULL)
,('WHV','T12','// Harbor, Heart of Corruption','Character','This cannot be destroyed by damage or destroy effects. Legend: Trash a card from your discard pile: Put a Silence counter on a Character, then it gets +X/-X until end of turn where X is the Trashed card''s cost. Activate up to once per turn.',NULL)
,('WHV','T13','// Deal with the Devil','Spell','Discard any number of cards in your hand, and draw an equal number of cards.',NULL)
,('WHV','009','Nayakh, Bloodmancer //','Character','Pay 4 {M}: Transform this into Nayakh, the Blood-Starved. Legend: Deal 1 damage to a Character you control: It gets +1/+0. Target only one Character per round, and only twice per turn.','10234')
,('WHV','010','Alabaster Moonsprig','Character','When played: If another player has a Legend in their Legend Zone, Trash all Characters in discard piles except yours and replace them with Creeping Mold Tokens. Legend: You can play Characters on the top of any player''s discard pile as if their cost was all {C}.',NULL)
,('WHV','070','Goat Baron','Character','When played: Restore 3 CC for each Beast on the edges of your Field.',NULL)
,('WHV','071','Mold Growing Gang','Character','When played: Deal 1 CC damage to all players. Invest 2 {L} up to twice: Summon a Token Mold Growing Gang adjacent to this.','10229')
,('WHV','072','Shard Shunner Infiltrator','Character','Depth 5. When played: [Pay 2 CC to] put a Stealth counter on this.',NULL)
,('WHV','073','Roof-Runner Rogue','Character','When this enters the edge of your Field: Deal 2 CC damage.',NULL)
,('WHV','074','Draconic Butcher','Character','Whenever you Trash a card, put a +1/+1 counter on Draconic Butcher. Activates once per turn.',NULL)
,('WHV','075','Swift Linebreaker //','Character','Has Breakthrough if in the center space of the Field, and Haste if on the edge. If this doesn''t deal CC damage during your Combat Phase, transform this into Subject Forty-Eight.',NULL)
,('WHV','076','Zombie Ogre','Character','Whenever this takes damage, put a Creeping Mold Token on the top of the deck belonging to the damage''s source.',NULL)
,('WHV','077','Poison the Orchards','Spell','Shuffle a Creeping Mold Token into each player''s deck. Invest 2 {L}: Then put a Creeping Mold Token at the bottom of each player''s deck.',NULL)
,('WHV','078','Frozen in the Basement','Spell','Depth 15. Put chosen Character [that costs 2 SP or less] on the bottom of its owner''s deck.','10193')
,('WHV','079','Hijack the Fireworks','Spell','Deal 1d4 CC damage to each player. If you dealt at least 4 CC damage to another player this round, you may cast this at the end of your Combat Phase for 2 {L} less.',NULL)
,('WHV','080','Do You Trust Me?','Spell','Reaction. Choose two Characters. Remove them from the Field. At the start of your next turn, their owners may return them and their Health is reduced to 1.',NULL)
,('WHV','081','Unidentified Amulet','Item','Draw the bottom card of your deck. If it''s a Character, chosen opponent discards 1 card. Otherwise, restore 5 Health and give that Character Convert until end of turn.',NULL)
,('WHV','082','Molded Dagger','Item','Attach to a Character. When attached Character deals CC damage, put a Creeping Mold Token in any player''s hand.','10231')
,('WHV','083','Abandoned Windmill','District','Start of End Phase: If you took CC damage this turn, put a Prize counter on this. As a Reaction, spend a Prize Counter to gain +1 {C} Orb until end of turn and shuffle a Creeping Mold Token into another player''s deck.',NULL)
,('WHV','T06','Creeping Mold','Character','When drawn: Take 1 CC damage and draw a card. If this is in your hand at the start of your turn: Take 1 CC damage.','10289')
,('WHV','T07','Mold Growing Gang','Character','When summoned: Deal 1 CC damage to all players.','10230')
,('WHV','T14','// Nayakh, the Blood-Starved','Character','When Transformed, put a Stealth counter on this. Legend: Deal 2 damage to a Character you control: It gets +2/0 and Convert until end of turn. Target only one Character per round, and only three times per turn.',NULL)
,('WHV','T15','// Subject Forty-Eight','Character','Breakthrough. Whenever this takes damage, add a Creeping Mold Token to your hand.',NULL)
,('DEP','001','Finnt Hooksinker','Character','Legend: During your Field Phase, pay X+1 {L}: Reveal the top X cards of your deck. If the last card revealed is a Character, draw it. Then shuffle your deck.','10189')
,('DEP','010','Bleached Crab','Character','When played: If you have no Nexus Orbs, put two +1/+1 counters on each Crab or Crustacean you control, then deal 1 damage to each Character that got counters this way.',NULL)
,('DEP','011','Seasurface Drifter','Character','Depth 15. [Overpass.]',NULL)
,('DEP','012','Spotted Wavebreaker','Character','Echo 3 {L}.',NULL)
,('DEP','013','Admiral of the Deep','Character','Depth 25. Your Characters [with an active Depth ability] have +1/+0 and Armored 1.',NULL)
,('DEP','014','Il''sati''s Courtesan','Character','Whenever you play a Spell using it''s Echo, you may cast a copy and choose new targets for the copy.',NULL)
,('DEP','015','Dredge for Relics','Spell','Trash the top X cards of chosen player''s discard pile. If at least 2 non-Character cards were trashed, draw a card.',NULL)
,('DEP','016','Flood the Caverns','Spell','Trash all cards from each player''s discard pile. Deal X damage to all Characters in the Field, where X is the number of cards Trashed.',NULL)
,('DEP','017','Ironclad Ticket','Item','Invest: 2 {L}. Search your deck for a card with Depth and add it to your hand. If this is Invested, you may also search for two cards without Depth and put them in your discard pile.',NULL)
,('DEP','018','Snorkel','Item','Attach to a Character. Its Depth requirement is 5 less.',NULL)
,('DEP','019','Sunken Ruins','District','Whenever you play a card using it''s Echo, give it +0/+2.',NULL)
,('DEP','020','Whitereef Shelf','District','The first time a card would enter your discard pile each turn, it is instead Trashed.',NULL)
,('DEP','021','Convergence of Worlds','District','During your District Phase, you may Downgrade this to search your deck for a Tier II District and replace this. This counts as your District played for the turn.',NULL)
,('DEP','022','Cavern at the Nega Depth','District','Whenever you play a card with an active Depth ability, put an Expedition counter on this. Each opponent with fewer cards in their discard pile than the number of Expedition counters on this are considered to have no cards in their discard pile and cannot search their deck.',NULL)
,('DEP','002','Mis''qal, the Hunter','Character','Legend: When you declare three or more attackers, you may deal 2 damage to a Character.','10227')
,('DEP','023','Grasping Reef','Character','Reaction. This can block attacking Characters from any space of the Field.',NULL)
,('DEP','024','Mis''qalan Shepherd','Character','If you have the same hand size as another player, this has Exhaust: Gain 2 {N} SP.',NULL)
,('DEP','025','Luminous Jellyfish','Character','Lethal.',NULL)
,('DEP','026','Qo''dalan Interceptor','Character','When attacking with three or more Characters: This may attack a Character before blockers are declared.','10247')
,('DEP','027','Tentacle of the Deep','Character','Depth 25. When played: [If the Turn Counter is full,] Summon three Token copies of this.',NULL)
,('DEP','028','Seahorse Steed','Character','Breakthrough. When attacking: Give another attacking Character you control Breakthrough until end of turn.','10262')
,('DEP','029','Nautiloid Stonelurker','Character','Depth 10. When played: Put a Barrier counter on this. Echo [2 {L}] 2 {N}',NULL)
,('DEP','030','Reefback Drifter','Character','This does not Rest during your Draw Phase. When you attack with three or more Characters, you may Rest this and declare it as an attacker.','10253')
,('DEP','031','Subcrusher Squid','Character','Breakthrough. Whenever this deals CC damage, destroy all items in the spaces across and peripheral to this.',NULL)
,('DEP','032','Telepathy','Spell','Draw a card. If you have the same hand size as another player, you and that player draw a card.',NULL)
,('DEP','033','Crush Depth','Spell','Depth 15. Destroy a Character or Item [that costs 3 or less].','10171')
,('DEP','034','Bubble Column','Spell','Attach to a Character. Attached Character can''t attack or defend unless its controller pays 3 {L}. Echo 6 {L}','10158')
,('DEP','035','Call to Arms','Spell','If you are attacking with three or more Characters, you may cast this with Reaction. Give all Characters you control +2/+0 until end of turn.','10160')
,('DEP','036','Expedition to the Crimson Groves','Spell','Depth 15. Invest: Exhaust 3 Characters you control. Give a Character you control +4/+4 [until end of turn] and Breakthrough. If Invested, this card''s Depth is 5.',NULL)
,('DEP','037','Chitin Carapace','Item','Attach to a Character you control. It has Armored 1, or Armored 2 if it isn''t a Human and has two or more Items equipped.',NULL)
,('DEP','038','Fried Fish Kebab','Item','Rest a Character you control.',NULL)
,('DEP','039','Les''mitan Trident','Item','Deal 1 damage to three adjacent spaces in the Field.',NULL)
,('DEP','040','Sonar Conch','Item','Look at the top 3 cards of your deck. You may reveal a Character you find to add it to your hand. Echo 1 {L} 2 {N}',NULL)
,('DEP','041','The Coral Pool','Item','Deploy. Whenever a card being drawn, played, or discarded results in you having the same hand size as another player, you may look at that player''s hand.',NULL)
,('DEP','042','Gladiatorial Pits','District','At the start of your District Phase, if at least three Characters died during your Combat Phase, draw a card.','10196')
,('DEP','T01','Tentacle of the Deep','Character','Depth 25.',NULL)
,('DEP','003','Arden Glassalloy','Character','Legend: The first time each round a non-damage counter is removed from a Character you control, you may put a counter of that type on a different Character you control that has no non-damage counters.','10005')
,('DEP','043','Seafloor Biologist','Character','Whenever you look at one or more cards from a player''s deck, you may put a Stealth counter on a Character you control.',NULL)
,('DEP','044','Bronze Diver','Character','Armored 2.','10030')
,('DEP','045','Cloaking Chemist','Character','When killed: Put a Stealth counter on a Character.',NULL)
,('DEP','046','Remote Explorer','Character','Depth 20. Echo 3 {L} [2 {T}]',NULL)
,('DEP','047','CR4B-33','Character','Armored 1. Whenever this repositions, put a Stealth counter on it.',NULL)
,('DEP','048','Shark Submersible','Character','Armored 1. Breakthrough. Reaction: When a Character takes damage.',NULL)
,('DEP','049','Shell of the Deep','Character','Armored 2. Depth 25. Whenever this reduces damage, reflect the reduced damage to up to one Character [that damaged it this turn].',NULL)
,('DEP','050','Nautiloid Submarine','Character','Armored 1. When played: Put a Barrier and Stealth counter on this.',NULL)
,('DEP','051','Seafloor Sifter','Character','When played: Sift 1. Then draw a card from the bottom of your deck.',NULL)
,('DEP','052','Pressure Column','Spell','Choose left or right. Reposition each Character you control as far as possible towards that side. All opponents reposition each Character they control as far as possible towards the other side.',NULL)
,('DEP','053','Expedition to the Grave of Ships','Spell','Depth 15. Invest: Remove three non-damage counters from Characters you control. Return a [Tier I] District from your discard pile to your hand. If Invested, this card''s Depth is 5.',NULL)
,('DEP','054','Echolaser','Item','Remove all Stealth counters on the Field. Give a Character -X/-X, where X is the number of counters removed in this way. Echo 3 {L}','10180')
,('DEP','055','Echolocator','Item','Remove a Stealth counter from a Character. Draw a card.',NULL)
,('DEP','056','Floating Mine','Item','Deploy. When a Character across from this attacks or defends, destroy this and deal 3 damage to it.',NULL)
,('DEP','057','Hydraulic Ring','Item','Deploy. When played: Return a Character across from this to its owner''s hand. Destroy this when that Character is played again.',NULL)
,('DEP','058','Low Pressure Tank','Item','Depth 15. Attach to a Character. Attached Character has Armored [Equal to the sum of all Armored on attached cards plus] 1.',NULL)
,('DEP','059','Sonar Unit','Item','Look at the top 3 cards of your deck. You may reveal an Item you find to add it your hand. Echo 2 {L} 2 {T}.',NULL)
,('DEP','060','Underwater Fabricator','Item','Look at the bottom 5 cards of your deck. You may move an Item or District you find there to your hand.',NULL)
,('DEP','061','Waterproof Glass','Item','Deploy. Characters adjacent to this take 2 less damage while out of combat.',NULL)
,('DEP','062','Sterile Laboratory','District','At the start of your District Phase, if 4 or more counters were removed from the Field this turn, draw a card.','10268')
,('DEP','004','Il''sati, the Oracle','Character','Legend: Whenever a card leaves your hand without being played, you may look at the top 3 cards of your deck and move one to the top.','10016')
,('DEP','063','Venerated Lorekeeper','Character','Whenever you discard a card, you may pay 3 {L} to draw a card.','10037')
,('DEP','064','Speaker of the Council','Character','Reaction. Whenever a player pays a Ward cost, Exhaust a Character they control.',NULL)
,('DEP','065','Symmetry Squid','Character','Ward 1. When played: Summon a Token copy of Symmetry Squid for each player you have the same hand size as.',NULL)
,('DEP','066','Meditative Rock-Crab','Character','Ward 1. You can play a Character on this. While a Character is on this, it is considered a Deploy Item and that Character has Ward 1.',NULL)
,('DEP','067','Knight of Echoes','Character','Ward 2. When played: If you played a card using it''s Echo this turn, draw a card.',NULL)
,('DEP','068','Qo''dalan Shoalspeaker','Character','Depth 10. When played: Summon a Token copy of a Token [you control].','033')
,('DEP','069','Blessed Techbreaker','Character','This and adjacent Characters ignore Armored.',NULL)
,('DEP','070','Nautiloid High Chieftain','Character','When played or whenever you discard a card: Put a Barrier counter on this.',NULL)
,('DEP','071','Shaman of the Deep','Character','Depth 25. When played: The next three spells you cast this turn [that cost 3 or less] cost 2 {L} less, to a minimum of 0 {L}.',NULL)
,('DEP','072','Il''satini Soulpact','Spell','Reveal a card from your hand. If another player has a card with the same cost, they take 3 CC damage and you both discard those cards. Otherwise, you restore 3 CC.',NULL)
,('DEP','073','Shared Experience','Spell','Reaction. Draw a card for each card drawn by other players this turn.',NULL)
,('DEP','074','Elder''s Reproach','Spell','Silence a Character in the Field. Invest: 3 {L}: Silence ALL Characters in the Field.',NULL)
,('DEP','075','Hard Decision','Spell','Choose one: Draw a card || Discard a card. Echo: 1 {L} 1 {M}',NULL)
,('DEP','076','Il''sati''s Astral Fins','Spell','Attach to a Character. Attached Character has +1/+2. When played: Draw a card.',NULL)
,('DEP','077','Council of the Eight','Spell','Attach to a District you control. At the start of your End Phase, if you have the same hand size as another player, put a Council counter on this. During your Draw Phase, you instead draw cards equal to the number of Council counters on this. If you would draw zero cards, you may discard a card to draw a card from the bottom of your deck.',NULL)
,('DEP','078','Expedition to the Ancestral Peak','Spell','Depth 15. Invest: Sacrifice two Tokens you control. Draw a card for each [Spirit] Character in your Field. If Invested, this card''s Depth is 5.',NULL)
,('DEP','079','The Coral Crown','Item','Attach to a Character. Attached Character has +1/+1 for each Token in your Field.','10282')
,('DEP','080','Blastpearl Necklace','Item','Deal 1 damage to each Character in a Field.',NULL)
,('DEP','081','Sonar Staff','Item','Look at the top 3 cards of your deck. You may reveal a Spell you find to add your hand. Echo 3 {L} 2 {M}',NULL)
,('DEP','082','Cavern of Mirrors','District','At the start of your District Phase, if you Summoned three or more Tokens this turn, draw a card.','10163')
,('DEP','T02','Symmetry Squid','Character','Ward 1.',NULL)
,('DEP','005','Conet Goldscope','Character','Legend: When you play a Character on the edge of your Field for the first time each turn, put a Stealth counter on it and give it Haste.','009')
,('DEP','083','Echoes of Treachery','Character','Reaction. Convert. Echo 2 {L} 2 {C}.',NULL)
,('DEP','084','Hookhand Cultist','Character','Whenever this enters the edge of your Field, it has First Strike until the start of your next turn.',NULL)
,('DEP','085','Voice of Dissent','Character','Convert. When killed: Deal 2 CC damage to all players.','10295')
,('DEP','086','Seabream Smuggler','Character','Invest 3 {L}: Choose one: Return a card with Echo from your discard pile to your hand || Gain 3 {C} SP until the end of the turn.','10029')
,('DEP','087','Submerged Tidal Wall','Character','Depth 15. [Blockade. Can''t Attack].',NULL)
,('DEP','088','Grizzled Fishmonger','Character','When played: Draw a card from the bottom of your deck, then restore 2 Health.',NULL)
,('DEP','089','Nautiloid Gloomcrawler','Character','When played: Put a barrier counter on this. Whenever this is Repositioned, chosen opponent mills 2 cards.',NULL)
,('DEP','090','Porthole Eye','Character','Depth 10. When played: Look at the top card of a player''s deck, then [if it is a Character,] mill it.',NULL)
,('DEP','091','Cavern Inkscrawler','Character','When played: If played on the edge of your Field, deal 2 CC damage to the player in that direction.',NULL)
,('DEP','092','Maw of the Deep','Character','Depth 25. Whenever you play a card with an active Depth ability, Maw of the Deep can attack a Character [with less attack than it].',NULL)
,('DEP','093','Mass Panic','Spell','Each player mills 2 cards, then loses CC equal to the number of Characters milled.',NULL)
,('DEP','094','Sink Together','Spell','Depth 20. Deal 4 CC damage [to all players].',NULL)
,('DEP','096','The Pressure Intensifies','Spell','Depth 15. Copy three counters on a chosen card [with three or more non-damage counters].',NULL)
,('DEP','097','Expedition to the Trench of Terrors','Spell','Depth 15. Invest: Mill six cards. Give a Character -5/-5 [until end of turn]. If Invested, this card''s Depth is 5.',NULL)
,('DEP','098','Corrupted Catch','Item','Attach to a Character. It has -2/-0 and "When killed: Take 2 CC damage.',NULL)
,('DEP','099','Fisher''s Almanac','Item','Mill 3 cards. If any are Characters, draw that many cards from the bottom of your deck.',NULL)
,('DEP','100','King''s Concrete Block','Item','Shuffle a non-Legendary Character into it''s owner''s deck. While this is in your discard pile, your Depth is considered to be X deeper, where X is the number of card types in your discard pile (Character, Spell, Item, District, Legendary, and Token are card types).',NULL)
,('DEP','101','Sonar Drill','Item','Look at the top 3 cards of your deck. You may reveal a District you find to add it your hand. Echo 1 {L} 3 {C}',NULL)
,('DEP','102','Shadow Market','District','At the start of your District Phase, if you lost at least 4 CC this turn, draw a card.',NULL)
,('DEP','006','Les''mita, the Crafter','Character','All player''s Items cost 1 {L} less. Legend: When another player plays an Item, you may give an equipped Character you control +1 Attack or +1 Health.',NULL)
,('DEP','007','Reef Defender Qo''dala','Character','Blockade. Qo''dala can block up to three attackers. Legend: Your Characters have Blockade while their Health is higher than their Attack.',NULL)
,('DEP','008','Dive Leader Jonat','Character','Whenever you draw a card from the bottom of your deck, Sift 1. Legend: Once during your Field Phase, pay 2 {L}: Draw a card from the bottom of your deck.',NULL)
,('DEP','009','Taston Blackcoral','Character','Unblockable. Legend: The first time each round a Character enters another player''s discard pile, you may pay 2 {L} to Summon a Token copy of that Character, except it is a 1/1.','049')
,('DEP','103','Mother of Pearls','Character','Can''t Attack. Whenever you attack with three or more Characters, you may reveal cards from the top of your deck until you find an Item, and add it to your hand. Put the other cards on the bottom of your deck.',NULL)
,('DEP','104','Luminous Humpback','Character','This does not Rest during your Draw Phase. When your hand size becomes the same as another player, you may Rest this and set it''s Attack to that number.',NULL)
,('DEP','105','Blind Leviathan','Character','During your Field Phase, you may mill 3 cards: Blind Leviathan fights a Character.',NULL)
,('DEP','106','Mindjammer Divesuit','Character','Armored 1. Ward 1.',NULL)
,('DEP','107','Seafloor Scavenger','Character','Whenever you draw a card from the bottom of your deck, put a +1/+1 counter on this.',NULL)
,('DEP','108','Silvertooth Looter','Character','Overpass. When Silvertooth Looter enters your discard pile, chosen opponent discards a card.',NULL)
,('DEP','109','Hunter''s Altar','District','Depth 5. [When played: This has no orbs until your next District Phase unless you mill 2 cards.]','10246')
,('DEP','110','Mobile Depth Station','District','Depth 5. [When played: This has no orbs until your next District Phase unless you mill 2 cards.]','10228')
,('QIL','001','Gao, Puppet Lord','Character','Gao can declare an attack into a peripheral space. Legend: Whenever a Legendary Character attacks, you may Summon a 1/1 Marionette Token on either side, Exhausted and attacking into the same space.',NULL)
,('QIL','013','Shrimp Scuba','Character','Depth 5. When attacking: Gain +0/+1 [until end of turn] for each other attacking Shrimp Scuba you control.',NULL)
,('QIL','014','Zombily Exhumer','Character','Haste. Can''t Block. When attacking: Trash the top card of defending player''s discard pile.','10310')
,('QIL','015','ACPD Golemancer','Character','When played: Summon a Marionette Token.','10129')
,('QIL','016','AVRAE Class Submersible','Character','Depth 10. Whenever this attacks [alone], roll a 1d20. On a 1-9, this Rests and leaves combat. On a 16-20, this has Quick Strike.',NULL)
,('QIL','017','Welcome to the Big Pond','Spell','Destroy the Character in the Field with the least sum of Attack and Health.',NULL)
,('QIL','018','Drag Down','Spell','Depth 20. Destroy a Character [with Overpass]. This has Reaction if you control a Beast, Monster, or Eldritch.','10177')
,('QIL','019','Nexus Quarantine','Spell','Until the end of your next turn, Districts convert one less Nexus SP.',NULL)
,('QIL','020','Houshou Hat','Item','Attach to a Character. It is a Pirate. Draw a card, then discard a card.',NULL)
,('QIL','021','Blue Bag with Strap','Item','While this is in your hand, your maximum hand size is 2 greater.',NULL)
,('QIL','022','Watery Grave','District','When a Character dies, put it in the discard pile of the player who has the most Watery Graves in their District Zone.',NULL)
,('QIL','023','Sea of Mirror Shells','District','When a player looks at the top X cards of a deck, they look at the bottom X+1 cards instead, and may move one to the top.',NULL)
,('QIL','024','The Passage Deep','District','Depth X. This card''s Depth is equal to 5 + the number of Characters in all discard piles. [Pay 5 {L}:] Your Legendary Characters are unblockable [until end of turn].',NULL)
,('QIL','025','The Forge of Free Will','District','Characters in your Field with cards attached have Ward 5 and can only leave your Field by being destroyed.',NULL)
,('QIL','T01','Marionette','Character','Can''t block.','10222')
,('QIL','T02','Watery Grave','District','When a Character dies, put it in the discard pile of the player who has the most Watery Graves in their District Zone.','10301')
,('QIL','002','Yuko, Nature''s Agent','Character','Unblockable. When this deals CC damage to a player, put a Conquest counter in their CC Zone, then shuffle this into your deck. Legend: When a Legendary Character deals CC damage, that player also takes Scarcity damage equal to the number of Conquest counters in their CC Zone.',NULL)
,('QIL','026','Voltaic Bloomsprite','Character','When damaged: Your next Spell this turn costs 1 {M} less.',NULL)
,('QIL','027','Stoneskin Angler','Character','When a Character with 3 or less Health is played across from this, it attacks that Character.',NULL)
,('QIL','028','Kelpfold Knight','Character','Invest 1 {C}: This has Convert.',NULL)
,('QIL','029','Knight of Ocean''s Bounty','Character','When attacking, has +2/+2 for each player you share hand size with.',NULL)
,('QIL','030','Radiant Heron','Character','When damaged: Gain Overpass until end of turn.',NULL)
,('QIL','031','Pufferfish Pariah','Character','Lethal. When damaged: Deal 1 damage to all Characters in spaces adjacent, across, and peripheral to this.',NULL)
,('QIL','032','Radiant Shark','Character','Breakthrough. When this attacks, you may pay 2 {L}: This cannot be blocked unless two or more Characters are blocking it.',NULL)
,('QIL','033','Thorned Bathypelage','Character','Armored 1. Pay 1 {T}: Increase Armored to 2 and gain "When damaged: Deal 2 damage to each other player''s CC" until end of turn.',NULL)
,('QIL','034','Bristlemaw Eater','Character','As you play this, you may sacrifice any number of Plant Characters you control. This costs 1 {L} less for each Character sacrificed in this way.',NULL)
,('QIL','035','Territorial Visejaw','Character','Lethal.',NULL)
,('QIL','036','Tag Team','Spell','Reaction. Give two Characters +2/+0 until end of turn. Invest 1 {T}: Also give them Armored 1.','10280')
,('QIL','037','From the Rocks','Spell','Dramatic Entrance - When a Dragon enters your Field, you may cast one Dramatic Entrance as if it had Reaction for 2 {L}. Put a Barrier counter on a Character, then it attacks a Character you don''t control.',NULL)
,('QIL','038','Rally the Tribe','Spell','Name a Character type. Characters you control of that type have +0/+2 until end of turn. If three or more Characters entered your Field this turn, they gain +2/+2 until end of turn instead.',NULL)
,('QIL','039','Survival of the Fittest','Spell','Deal 2 damage to all Characters. Then restore 3 Health to all Characters.',NULL)
,('QIL','040','Cleanse the Depths','Spell','Choose one: Trash all cards from each player''s discard pile | Destroy all Tokens | Remove all counters from the Field.',NULL)
,('QIL','041','Subsurface Eruption','Spell','Deal 11 damage to and destroy any Items in all non-edge spaces in the Field.',NULL)
,('QIL','042','The Spirit March','Spell','Summon X Radiant Squirrel Tokens. Then give all Spirits you control Haste.',NULL)
,('QIL','043','Crown of Thorns','Item','Deploy. When a Character enters the Field, deal 1 damage to it. If this kills a Character, destroy this.',NULL)
,('QIL','044','Les''mitan Helm','Item','Attach to a Character. Attached Character has "When this blocks or is blocked, it gains +1/+1 until end of turn.',NULL)
,('QIL','045','Nexus to Tritona Centuri','District','As a Reaction, pay 5 {L} SP: Gain 5 {N} SP, search your deck for up to three Qil''oth and put them in your Field Exhausted, then Downgrade this.',NULL)
,('QIL','T03','Radiant Squirrel','Character',NULL,NULL)
,('QIL','003','Torii, Treasure Diver','Character','When played: Summon a Token Glinda''s Crabbarattus if you don''t control one. Legend: When you draw your first card during the Draw Phase or when you Sift, you must do so from the bottom of your deck.','10290')
,('QIL','046','Ostentatious Freebooter','Character','When played: Tuck the top card from another player''s discard pile under this. When killed: Put any cards this stole into your hand. You can play them as if their cost was all {L}.',NULL)
,('QIL','047','Faerie Buccaneer','Character','Overpass. When played: Deal 3 damage to a Character. Invest 1 {M}: This has Reaction.',NULL)
,('QIL','048','Mining Magnates','Character','Whenever you Invest, add a Construction Zone Token to your hand. Invest 2 {L}: You may play and cycle an additional District this turn.',NULL)
,('QIL','049','Sandshaper Mech','Character','When played: Summon 2 Construction Zone Tokens. When killed: Downgrade all uncovered Construction Zones.','10260')
,('QIL','050','Sea Ruins Surveyor','Character','When played: Return a District from your discard pile to your hand. Echo 3 {T}','10261')
,('QIL','051','Surface Technician','Character','Overpass. Whenever you play an Item, this gets +1/+0 until end of turn.',NULL)
,('QIL','052','Ironside Excavator','Character','When attacking: You may Trash a District in a discard pile to add a Construction Zone Token to your hand.','10017')
,('QIL','053','The Black Faire Fleet','Character','Pay 2 {L} and Exhaust a Character you control: Deal 3 damage to a Character.',NULL)
,('QIL','054','Rustscale Eater','Character','As you play this, you may sacrifice any number of Machine Characters you control. This costs 1 {L} less for each Character sacrificed in this way.',NULL)
,('QIL','055','Inquisitive Bronzesail','Character','When played: Sift 5.',NULL)
,('QIL','056','Aligned Shot','Spell','Reposition a Character in your Field and an opponent''s so that they are across from each other. Invest 1 {N}: They fight.',NULL)
,('QIL','057','Sly Flourish','Spell','Reaction. Give a Character -2/-0 until end of turn and Reposition it. If they die this turn, draw a card, then discard a card.',NULL)
,('QIL','058','Rally the Crew','Spell','Deal 1 damage to each Character across from a Character in your Field. If three or more Characters entered your Field this turn, repeat twice.',NULL)
,('QIL','059','Repelling Blast','Spell','Return a Character that costs 3 or less to its owner''s hand.','096')
,('QIL','060','Whole New World','Spell','Dramatic Entrance - When a Dragon enters your Field, you may cast one Dramatic Entrance as if it had Reaction for 2 {L}. Play or cycle up to two Construction Zone Tokens in your hand. Cards that didn''t start in your deck cost 2 {L} less this turn.',NULL)
,('QIL','061','Urbanization Protocol','Item','Add a Construction Zone Token to each player''s hand.',NULL)
,('QIL','062','Flag of the Coalition','Item','Deploy. Pirates in your Field have +1/+0.',NULL)
,('QIL','063','Ironside Deconstructor','Item','Return an Item to the top of its owner''s deck.',NULL)
,('QIL','064','Reefrifter Missile','Item','Each player chooses a District they control. They can pay 1 {L} to put it on top of their deck, otherwise they Downgrade it.',NULL)
,('QIL','065','Nexus to Ironside Seafloor Base','District','As a Reaction, pay 5 {L} SP: Gain 5 {T} SP, three Characters you control can''t take damage or be destroyed until the start of your next turn, then Downgrade this.','10024')
,('QIL','T04','Glinda''s Crabbarattus','Character','Depth 10. [When Summoned: Give this -2/-2]. When attacking: Sift 2.','10197')
,('QIL','T05','Construction Zone','District','When played or discarded: If you haven''t gained SP from a Construction Zone this turn, gain 1 {T} SP until end of turn.',NULL)
,('QIL','004','Nayakh, Bladecursed','Character','Depth 20. When played: Search your deck or discard pile for an attachable card [that costs 3 or less] and attach it to Nayakh. Legend: When an equipped Character you control deals CC damage, Trash that many cards from that player''s discard pile and restore that much CC (up to 3).',NULL)
,('QIL','066','Flamecrowned Devilfish','Character','When played: Discard a card, then you may draw a card.',NULL)
,('QIL','067','Ri''toqan Shellspeaker','Character','When played: The next time you play a card using its Echo, it costs 3 {L} less (does not reduce colored SP cost).','10026')
,('QIL','068','Stormsea Elemental','Character','Breakthrough. Whenever this deals combat or CC damage, it deals 1 damage to Characters in peripheral spaces.',NULL)
,('QIL','069','Illithid Nautiloid Pilot','Character','Reaction. Overpass. When played: You may put a Silence counter on this. If you do, put a +1/+1 counter on this.',NULL)
,('QIL','070','Spirit of Reverberation','Character','Ward 1. When played: Gain +1/+1 for each card in your discard pile that is a Spirit or has Echo.','10033')
,('QIL','071','Umbral Menace','Character','Breakthrough. Must be blocked by non-Token Characters. When played: You may put a Silence counter on this. If you do, put two +1/+1 counters on this.',NULL)
,('QIL','072','Guardian of Gilded Cephis','Character','Ward 3.',NULL)
,('QIL','073','Ethereal Eater','Character','As you play this, you may sacrifice any number of Spirit Characters you control. This costs 1 {L} less for each Character sacrificed in this way.',NULL)
,('QIL','074','Ancestral Cerebrum','Character','This has the card text of all cards in your Field with Silence counters (as if they didn''t have Silence counters).',NULL)
,('QIL','075','Empty the Mind','Spell','Put a Silence counter on a Character. For each keyword removed, put a +1/+1 counter on it. (Keywords are capitalized abilities)',NULL)
,('QIL','076','Grasp Identity','Spell','Remove all counters from a Character and cards attached to it. Draw a card if any were Silence counters.',NULL)
,('QIL','077','Compelled Duel','Spell','Put a Silence counter on a Character. It must attack on its owner''s next Combat Phase.',NULL)
,('QIL','078','Spirit''s Rebuke','Spell','Additional cost: Discard a card. Destroy a Character.','10034')
,('QIL','079','Assimilate Mind','Spell','Rest and gain control of a Character until end of turn. Reposition it to your Field while you control it. Invest 1 {L} 1 {C}: Gain control permanently.',NULL)
,('QIL','080','Frightening Presence','Spell','Dramatic Entrance - When a Dragon enters your Field, you may cast one Dramatic Entrance as if it had Reaction for 2 {L}. Destroy a Character with less Attack than a Character you control.',NULL)
,('QIL','081','Rally the Hive','Spell','Put a Silence counter and a +1/+1 counter on any number of unsilenced Characters in your Field. If three or more Characters entered your Field this turn, any number of players you choose discard a card.',NULL)
,('QIL','082','Hole in the Sea','Spell','Destroy all Characters with Depth.',NULL)
,('QIL','083','Symbol of Vampirism','Item','Attach to a Character. It gains the Vampire type and has "When this survives combat, restore Health to itself equal to its Attack.',NULL)
,('QIL','084','Brain Jar','Item','Attach to a Character. Attached Character''s base stats are 1/1.',NULL)
,('QIL','085','Nexus to Waterhaven''s Peak','District','As a Reaction, pay 5 {L} SP: Gain 5 {M} SP, look at the top 7 cards of your deck and choose three to add to your hand, shuffle the rest back into your deck, then Downgrade this.',NULL)
,('QIL','005','Harbor, Faithless','Character','When played: If another player has a Legend in their Legend Zone, attach a Moldcore Heart to a Character you control. Legend: Trash 6 cards from your discard pile: Draw a card and attach a Moldcore Heart to a Character you control.',NULL)
,('QIL','086','Synesthetic Clam','Character','Can''t Attack. Has +1/+1 for each Nexus Orb type you have.',NULL)
,('QIL','087','Dredging Necromancer','Character','Whenever an Undead exits your discard pile, all players mill 1 card.',NULL)
,('QIL','088','Soultrap Lantern-Bearer','Character','When played: Mill 2 cards. This gains Health equal to the total cost of the cheaper card milled. Invest 1 {M}: Instead of milling two cards, you may discard one.','10267')
,('QIL','089','Sunken Second Mate','Character','When played: Summon a Watery Grave Token in any player''s District Zone.','10270')
,('QIL','090','Basin Polluter','Character','Fungal Zombie Tokens you control have Lethal.',NULL)
,('QIL','091','Overgrown Thrall','Character','When played: Summon a Fungal Zombie Token and put one into a player''s discard pile.',NULL)
,('QIL','092','Pyrrhic Plunderer','Character','At the start of your Draw Phase, draw the bottom card of your deck and take CC damage equal to it''s Nexus cost.','10245')
,('QIL','093','Moldraiser Dracolich','Character','Convert.',NULL)
,('QIL','094','The Fungal Fleet','Character','Depth 10, [Overpass]. Trash a non-Token Character from your discard pile: Summon a Fungal Zombie Token. Activate once per round.','10283')
,('QIL','095','Marrowfin Eater','Character','As you play this, you may sacrifice any number of Undead Characters you control. This costs 1 {L} less for each Character sacrificed in this way.',NULL)
,('QIL','096','Not While My Heart Still Beats','Spell','Reaction. Attach a Moldcore Heart Token to a Character.',NULL)
,('QIL','097','Equal in Death','Spell','Dramatic Entrance - When a Dragon enters your Field, you may cast one Dramatic Entrance as if it had Reaction for 2 {L}. Choose a Character from each discard pile, and Summon an equal number of Fungal Zombie Tokens with those cards tucked under them.','10011')
,('QIL','098','Heartripper','Spell','Deal 4 damage to a Character. Invest 1 {N}: Restore 4 Health to another.',NULL)
,('QIL','099','Loot the Bodies','Spell','Draw a card for each Character that died this turn, then discard two cards. You can play this during your End Phase.',NULL)
,('QIL','100','Rally the Horde','Spell','Return any number of Tokens that cost 3 or less in your discard pile to your Field. If three or more Characters entered your Field this turn, Rest all Tokens in your Field.','10250')
,('QIL','101','Corpse Trawl Net','Item','Additional cost: Trash two cards from your discard pile. Return a Character from your discard pile to your hand.',NULL)
,('QIL','102','Rune of Retaliation','Item','Reaction. Attach to an Item. When attached Item is destroyed or moved to the discard pile, deal 4 CC damage to all players.',NULL)
,('QIL','103','Stimulating Fungus','Item','Distribute two +1 Attack and -1 Health counters among Characters you control. Invest 2 {L}: Distribute two more of each.',NULL)
,('QIL','104','Contingent Scroll','Item','Remove all counters from Items on the Field.',NULL)
,('QIL','105','Nexus to the Port of Skulls','District','As a Reaction, pay 5 {L} SP: Gain 5 {C} SP, return up to three Characters from your discard pile to your hand, then Downgrade this.','063')
,('QIL','T06','Fungal Zombie','Character','This has the card text of the Character directly underneath it.','10014')
,('QIL','T07','Moldcore Heart','Item','While you control a Moldcore Heart, you don''t lose the game when your CC drops below 1. At the start of your Draw Phase, take 5 CC damage, Summon a Fungal Zombie Token, and put a Bleed counter on this, then redistribute any Bleed counters amongst Moldcore Hearts you control. If this has 3 Bleed counters at the end of your Draw Phase, you lose the game.',NULL)
,('QIL','006','Tolum, Nexus Savant','Character','During your Nexus Phase, you may transmute {N} SP to {T} SP and vice versa. Legend: Whenever you play a card with 3 or more Nexus SP in its cost, draw a card.','050')
,('QIL','007','Qo''kilum, Ranger of Cephis','Character','Blockade. Legend: Pay 2 {L} and Exhaust if this is a Character: A Character you control with Blockade deals damage equal to it''s Attack to a Character you don''t control. Activate once per turn.',NULL)
,('QIL','008','Daoth, Crack-Shot Cannoneer','Character','When played: Attack a Character you don''t control. Legend: Your Spells and Items that deal damage to one target deal 1 more.',NULL)
,('QIL','009','Ri''toqi, Mirror Sea Spy','Character','When targeted by a Spell or Item: Shuffle this back into your deck. Legend: At the start of each other player''s End Phase, they must show you the rightmost card in their hand.',NULL)
,('QIL','010','Conet, Pirate Coalition King','Character','Pirates you control have +1/+0. Legend: Whenever you play a Pirate, put the top card from another player''s discard pile into your hand. You can play it as if its cost was all {L}.',NULL)
,('QIL','011','Il''sati, Hive''s Eye','Character','When played: Discard two cards. Legend: Whenever you look at more than one cards on top of your deck, you may put them back in any order.',NULL)
,('QIL','012','The Qil''kuoth','Character','When played: Shuffle your discard pile back into your deck. Legend: Whenever you draw a card, restore CC equal to the card''s Nexus cost.',NULL)
,('QIL','106','Bloomreef Hermit','Character','Whenever you attach an Item to a Character in your Field, give it +1 Attack.','006')
,('QIL','107','Whirlpool Riding','Spell','Reposition all Characters 3 spaces to the right. If any reach the edge of the Field, they move to the leftmost space and gain Breakthrough until end of turn.',NULL)
,('QIL','108','Bloomreef Brainsponge','Character','At the start of your End Phase, if you have the same hand size as another player, draw a card.',NULL)
,('QIL','109','Defend the Gates','Spell','Give all Characters you control +0/+X, where X is the sum of Tiers of Districts in your District Zone.',NULL)
,('QIL','110','Bloomreef Bonebobbit','Character','Trash a card in your discard pile: This gets +2/+0. Activate once per turn.',NULL)
,('QIL','111','Uncontained Growth','Spell','Give a Character +4/+4 until end of turn. Put four +1/+1 counters on it.',NULL)
,('QIL','112','Bloomreef Icthistys','Character','When cast as an Echo this has +2/+2 and Ward 1. Echo 3 {L} 1 {T} 1 {M}.',NULL)
,('QIL','113','Channeled Barrier','Spell','Put a Barrier counter on Characters you control. Until the start of your next turn, your Characters can''t attack and other players can''t attack you.',NULL)
,('QIL','114','Bloomreef Stinglurker','Character','Lethal. When you put a Stealth counter on another Character, put one on this.',NULL)
,('QIL','115','Walk the Plank','Spell','Destroy a Character with less Health than a Vehicle or Pirate you control. Echo 1 {L} 1 {T} 2 {C}.',NULL)
,('QIL','116','Bloomreef Bloodlily','Character','Whenever you sacrifice a Token, gain 1 {C} SP until end of turn. Pay {C}: Sacrifice a Token and deal 1 CC damage to a player.',NULL)
,('QIL','117','Memory Extraction','Spell','Reveal an opponent''s hand. Pick a card for them to discard, then they discard an additional one of their choice.',NULL)
,('QIL','118','Apostle''s Intervention','Spell','Search your deck for up to three Legendary Characters. Return them and up to one card in your Legend Zone to your hand. Those cards cost 4 {L} less this turn.',NULL)
,('QIL','119','Biofleet Platform','District','Depth 5. [When played: This has no orbs until your next District Phase unless you mill 2 cards.]',NULL)
,('QIL','120','Fleshburgeoning Karst','District','Depth 5. [When played: This has no orbs until your next District Phase unless you mill 2 cards.]',NULL)
,('CLA','005','Crying Thief','Character','When played: Put a Stealth counter on this. Chosen opponent plays a Character that costs 2 or less for free. When killed: Search your deck for an Item and add it to your hand.','10045')
,('CLA','006','Duck Lord','Character','Unblockable. When played: Chosen opponent plays a Character that costs 2 or less for free. When killed: Search your deck for an Item and add it to your hand.','10046')
,('CLA','007','Gopnik','Character','Can''t Block. When played: Chosen opponent plays a Character that costs 2 or less for free. When killed: Search your deck for an Item and add it to your hand.','10047')
,('CLA','008','Shell Cracking','Spell','Fate - Roll a d6. | 1-3, Summon a 1/1 Sea Terror Token for an opponent. | 4-6, draw a card. Invest 1 {L}: Repeat. Invest 1 {L}: Repeat again.','10049')
,('CLA','009','Precious Days','Spell','Restore all your Characters to max Health. Until the start of your next turn, they can''t attack and opponents can''t attack you.','10050')
,('CLA','010','Farewell','Spell','Destroy all cards in the Field. Can only be played if you have a Legendary Character in your Field.','10052')
,('CLA','011','Columbian Brew','Item','Restore 2 Health. Invest 1 {L}: Restore 4 CC.','10053')
,('CLA','012','Overgrown Stele','Item','Reveal the top card of each player''s deck. Choose One: All players: Draw a card | Mill a card | Shuffle their decks.','10054')
,('CLA','013','Sal Viento','District','Sacrifice a Character: Restore 3 CC. Activate once per round.','10055')
,('CLA','014','Hunter''s Sanctuary','District','When played: Transform any number of Legendary Characters in your Field into Sanctified Statues, then put a Silence counter on them. Opponents cannot declare Characters across from Sanctified Statues as attackers.','10056')
,('CLA','T01','Sanctified Statue','Item','Deploy. Light - While your CC is more than 20, you may Exhaust this to gain 2 {L} SP.','10274')
,('CLA','001','Laurentina, Dancer Unchained','Character','When played: Deal X damage equal to Laurentina''s Attack to all Characters. Lethal damage to Laurentina instead reduces her to 1 Health if her Health isn’t 1. Legend: Laurentina can be played from the Legend Zone with +1 Attack counter by paying CC equal to her new Attack in addition to her cost.','10039')
,('CLA','015','Deep Sea Slider','Character','Consume - Trash from discard pile and Exhaust a Character: Give it a +1/+1 counter.','10058')
,('CLA','016','Abyssal Hunter','Character','Reach. Has First Strike when in combat with a Seaborn Character (Aquatic Monsters are Seaborn).','10059')
,('CLA','017','Floating Sea Drifter','Character','Overpass. Consume - Trash from discard pile and Exhaust a Character: Give it an Overpass counter.','10060')
,('CLA','018','Pocket Sea Crawler','Character','Can''t Attack. When damaged: Give one Character in each Field -2/-0 and deal 2 damage to them.','10061')
,('CLA','019','Basin Sea Reaper','Character','Can''t Attack while undamaged. At the start of your End Phase if this is damaged, put a -1/-1 counter on a Character in each Field.','10062')
,('CLA','020','Retching Broodmother','Character','Armored 1. Exhaust: Attach a Baleful Broodling Token to a Character.','10063')
,('CLA','021','Skimming Sea Drifter','Character','Overpass and First Strike while this has no counters.','10064')
,('CLA','022','Lingering Pathshaper','Character','When attacking or damaged: Summon a 1/1 Sea Terror Token.','10065')
,('CLA','023','The First to Talk','Character','Exhaust: Choose a Character in the Field. At the start of each Combat Phase until the start of your next turn, give -2/-0 and deal 2 damage to that Character or an adjacent one.','10066')
,('CLA','024','The Last Knight','Character','When attacking: Destroy an Aquatic Character (Seaborn are Aquatic).','10067')
,('CLA','025','Shared Senses','Spell','Choose One: Pay 1 {L} || Pay 3 CC || Mill 2 cards, then Choose One: Restore 3 CC || Draw a card. Light - If your CC is more than 20 after resolving, you may repeat.','10068')
,('CLA','026','End of an Era','Spell','Destroy all Items in the Field. Each player may choose to remove a Legend from their Legend Zone to draw 2 cards.','10069')
,('CLA','027','Stella Caerula','Spell','Shuffle up to X Characters into their owner''s decks, where X is the number of Orbs on Districts you control. If X was at least 8, you may search your deck for a Character and play it without paying its SP cost.','10070')
,('CLA','028','Seaside Cliffs','District','Fate - When played: Roll a d6. | 2-5: Add an Aegirian Key Token to your hand. | 6: Search for a card in your deck and add it to your hand.','10071')
,('CLA','T02','Sea Terror','Character',NULL,'10275')
,('CLA','T03','Baleful Broodling','Character','Can''t Attack. While Attached to a Character, this is an Item that gives -1/-1 to attached Character.','10276')
,('CLA','002','Mizuki, the Coexistant','Character','Fate - Whenever Mizuki attacks, Roll a d6. | 1-3 - Exhaust a Character defending player controls. | 4-6 - Exhaust two Characters defending player controls. Legend: When a Character is Exhausted for a reason other than attacking, deal 2 damage to them.','10042')
,('CLA','029','Star-Seeking Singer','Character','Reach. Fate - When played: Roll a d6. | 1 - Transform this into a One of We Many Token.','10072')
,('CLA','030','The Last Tidewatcher','Character','When played: Restore 3 Health and 2 CC. Light - While your CC is more than 20, whenever you restore Health or CC, you restore 1 more.','10074')
,('CLA','031','Cannot Goodenough','Character','When played: Draw a card, then discard a card. Invest 2 {L} any number of times: Repeat that many times.','10075')
,('CLA','032','Stultifera Navis','Item','Deploy. Whenever a Legend enters your Legend Zone, Choose One: Give a Character +3/+3 | Deal 6 damage to a Character. Legend: Your Legendary cards cost 2 {L} less.','10076')
,('CLA','033','Tulip''s Determination','Spell','Attach to a Character. Whenever you roll a 6 on a d6, you may draw 3 cards. If you do, discard two cards.','10077')
,('CLA','034','Aegir Printer','Item','Deploy. Invest X {L}: Put X Fate counters on this. Fate - Remove a Fate counter: Roll a d6. 1 - Destroy this and gain 2 {T} SP this turn | 3 - Put a Fate counter on this | 4 - Add an Aegirian Key Token to your hand | 5 - Restore 3 CC | 6 - Your next card this turn costs 1 {L} less. Activate only once per turn.','10078')
,('CLA','035','Aegir Weapons','Item','Light - While your CC is more than 20, this costs 2 {L} more. Choose One: Until end of turn, your Characters: Cost 2 {L} more but get +2/+2 | Trigger their When Played effects twice but get -2/-2.','10079')
,('CLA','036','Dossoles Candy','Item','While this is in your hand, you have +2 Hand Size. Invest X {L} up to 3: Distribute that many +1/+1 counters among Characters you control.','10080')
,('CLA','037','Little Gran Faro','Item','Reaction: When you take CC damage. Exhaust up to three Characters you don''t control. Light - If your CC is more than 20, any Characters Exhausted in this way are removed from combat and don''t deal CC damage this phase.','10081')
,('CLA','038','Pulse of the Ocean','Item','Give Characters in your Field Haste. Light - If your CC is less than 10, Characters you don''t control lose Quick Strike this turn. Echo 2 {L} 2 {T} 4 CC.','10082')
,('CLA','039','Little Handy','Item','Deploy. When played, Choose One for each: Whenever you play an Item, destroy a Token Item in the Field | Play it a second time if it costs 2 or less. Your Characters enter the Field with +0/+2 | +2/+0.','10083')
,('CLA','040','Failed Aegir Lab','District','When played: Choose One: Whenever you play a Character, restore 1 CC | Reduce the cost of your next Character this turn by 1 {L} | Give it +1/+1 until end of turn. If you already have a Failed Aegir Lab in your District Zone, you must pick a different option each time.','10084')
,('CLA','041','Aegir Dome','District','Characters in the three center spaces of your Field have Ward 4 and can''t attack.','10085')
,('CLA','042','Caerula Animus','District','Other players must pay 1 {L} at the start of their Field Phase or remove their current Legend from the Legend Zone.','10086')
,('CLA','T04','Aegirian Key','Item','Sift 1, then draw a card.','10277')
,('CLA','003','Irene, the Last Inquisitor','Character','First Strike. Whenever Irene attacks, restore 2 CC. Legend: Light - As a Reaction, if your CC is less than 10, you may pay 1 CC to deal 4 damage to a Character. Activate once per turn.','10044')
,('CLA','043','Saint Iberia','Character','Whenever Saint Iberia would be killed, you may pay 2 {M}. If you do, it survives at 1 Health instead.','10087')
,('CLA','044','Dance Amidst Treasure','Spell','Shuffle a Sanctified Statue Token into your deck. Whenever a Character or Item is destroyed this turn, draw a card.','10088')
,('CLA','045','Defy','Spell','Reaction. Counter a Character or Spell. Fate - Roll a d6. | 1-4 - Put it on top of its owner''s deck.','10089')
,('CLA','046','Enlightenment','Spell','Light - If your CC is more than 20, gain 1 SP of each color. Otherwise, gain 2 {C} SP and restore 5 CC.','10090')
,('CLA','047','Inquisitor''s Last Stand','Spell','Sacrifice a Character. Deal damage equal to its Health to all Characters in the Field, then destroy all Items in the Field. Light - If your CC is less than 10, Trash all cards destroyed by this.','10091')
,('CLA','048','Worship the Flame','Item','Destroy a non-District card. Light - If your CC is more than 20, pay CC equal to its cost. Otherwise, gain CC equal to its cost.','10092')
,('CLA','049','Finbeast Wishstrip','Item','Name a card in your deck. Look at the top 3 cards of your deck. If the card you named is there, Fate - Roll a d6. | 1 - Shuffle your deck | 2-3 - Move it to the top of your deck | 4-6 - Put it in your hand.','10093')
,('CLA','050','Iberian Scripture','Item','Whenever you roll a dice this turn, you may roll two dice and pick one to use. Draw a card.','10003')
,('CLA','051','Inquisitor''s Lantern','Item','Look at the top 3 cards of your deck. You may add one to your hand. If you don''t, restore 5 CC.','10095')
,('CLA','052','Inquisitor''s Pistol','Item','Reaction. Deal 3 damage to a Character. Trash the Character if it is killed.','10096')
,('CLA','053','The King''s Treasure','Item','Attach to a Character. Light - While your CC is less than 10, attached Character has Blockade, Convert, and Quick Strike.','10097')
,('CLA','054','Emergency Aid Belltower','District','When played: Restore X CC, where X is the number of damaged Characters in your Field, then restore 1 Health to them.','10098')
,('CLA','055','Iberian Lighthouse','District','Your Light effects instead trigger above or below 15 CC.','10099')
,('CLA','056','The Final Bastion','District','When played: Mill 10 cards and tuck any Characters milled underneath this. Then shuffle your discard pile back into your deck. Characters in the Field that share a name with Characters tucked under this keep their card text even when Silenced.','10100')
,('CLA','004','Endspeaker, Will of We Many','Character','When played: You may Sacrifice a Character to put a +1/+1 counter on Endspeaker. Legend: Trash 5 cards from your discard pile: Remove any number of counters from Endspeaker, then Summon it to the Field.','10002')
,('CLA','057','Nethersea Predator','Character','Ward 4. Unblockable to Characters on Nethersea Brand. Consume - Trash from discard pile and Exhaust a Character: Give it a Ward counter.','10102')
,('CLA','058','Nethersea Spewer','Character','When attacking: Also deal damage to Characters peripheral to it, and to any Characters on Nethersea Brand. Consume - Trash from discard pile and Exhaust a Character: Give it a Reach counter.','10103')
,('CLA','059','Nethersea Founder','Character','When killed: Summon a Nethersea Brand Token in this space. Consume - Trash from discard pile and Exhaust a Character: Give it a Convert counter.','10104')
,('CLA','060','Heart of Corruption','Character','Convert. When 8 counters are put on this, restore all it''s Health and set its base stats to 8/8 until end of turn. At the end of this turn, remove all non-damage counters and half of all damage counters on this.','10106')
,('CLA','061','Bishop Quintus','Character','Reach. Sacrifice a Cultist: Attach up to X Baleful Broodling Tokens to Characters, where X is half the sacrificed Character''s Health, rounded up.','10107')
,('CLA','062','Nethersea Brandguider','Character','When damaged: Put an Armored and Breakthrough counter on this and Summon a Nethersea Brand Token in this space. Consume - Trash from discard pile and Exhaust a Character: Give it an Armored and Breakthrough counter.','10108')
,('CLA','063','Paranoia Illusion','Character','Overpass while this has no counters. All Characters lose Haste and Quick Strike. Echo: 6 {L} 3 {C}.','10110')
,('CLA','064','Age of the Silence','Spell','Put a Silence Counter on each Character in the Field. Legend: Light - While your CC is less than 10, whenever a Character enters the Field, Silence it.','10111')
,('CLA','065','Cycle of Consumption','Spell','Additional cost: Sacrifice a Character. Draw two cards. If either is a Character, restore 2 CC.','10112')
,('CLA','066','Devouring Dust','Spell','Downgrade a District you control. Give all Characters in a Field -X/-X, where X is that District''s Tier','10113')
,('CLA','067','Call of We Many','Spell','Choose a Character in a discard pile. Summon a One of We Many Token and tuck that card underneath. Light - If your CC is less than 10, this has Echo 2 {L}.','10114')
,('CLA','068','Luminous Corpse','Item','Attach to a Character. At the end of each Combat Phase, that player loses X CC, where X is the number of Characters that attacked and didn''t die that phase.','10115')
,('CLA','069','Church of the Deep Cavern','District','When played: Put a Sanctified Statue Token in your discard pile. Pay 5 CC: Put the bottom card of your discard pile into your hand. Activate once per turn.','10116')
,('CLA','070','Nethersea Brand Land','District','When played: Summon a Nethersea Brand Token in your Field. All Nethersea Brands give an additional -1 Health.','10117')
,('CLA','T05','Nethersea Brand','Item','Deploy. Characters can be played on this. At the start of your End Phase, if there is no Character on this, Summon a copy in a space adjacent or across from this. Otherwise, give a Character on this -1 Health. Pay 6 {L}: Destroy this.','10278')
,('CLA','T06','One of We Many','Character','This has the card text of the card underneath it.','10279')
,('KGD','001','Kyros, Dragonspeaker','Character','When killed: Until end of turn, Dragons you play have Haste. Legend: Other Dragons you control have +1/+1.',NULL)
,('KGD','006','Dragon Egg','Character','Invest X. Can''t Attack or Defend. When killed: Search your deck for a Dragon that costs X+2 and Summon it.',NULL)
,('KGD','007','Dragonrider','Character','This costs 1 less if you played a Dragon this turn. This has Overpass if you control a Dragon with Overpass.',NULL)
,('KGD','008','Chroma Keeper','Character','When played: Search your deck for a Dragon and put it in your hand. Invest {C}: Search for X dragons instead, where X is the number of Nexus Orb types you have.',NULL)
,('KGD','009','Pseudodragon','Character','Stealth. When this removes its Stealth counters, look at the top 3 cards of your deck and put one in your hand, then shuffle.',NULL)
,('KGD','010','Draco Oracle','Character','Whenever you tuck one or more cards, put a +1/+1 counter on this.','10010')
,('KGD','011','Deep Dragon','Character','Hoard. Depth 20. [If you have no Nexus Orbs,] this has +2 Attack per Hoarded card.',NULL)
,('KGD','012','Feral Whitespan','Character','Overpass. Can''t Block.','10187')
,('KGD','013','Crystal Dragon','Character','This has Armored X and Ward X, where X is the number of Nexus Orbs types you have.',NULL)
,('KGD','014','Vault Dragon','Character','Hoard.',NULL)
,('KGD','015','Dragonslayer','Character','When played: Gain +X Attack, where X is the number of cards tucked under a Dragon, then attack that Dragon.',NULL)
,('KGD','016','Aggrivated Wyvern','Character','Overpass.',NULL)
,('KGD','017','Ancient White Dragon','Character','Hoard. Overpass. Exhaust and Discard two Hoarded cards: Exhaust and Restrain three adjacent Characters.',NULL)
,('KGD','018','Behemoth Dracosaur','Character','Armored 5. Breakthrough. Reach.',NULL)
,('KGD','019','Dragon''s Tithe','Spell','Each other player can choose to discard a card. If they don''t, you draw a card.',NULL)
,('KGD','020','Hoard Heist','Spell','Choose a card tucked under a Character you control. You can play it this turn, and it can''t be Hoarded.',NULL)
,('KGD','021','Shadow Overhead','Spell','Give a Character Overpass until end of turn. Reactions cost 1 less until this resolves.',NULL)
,('KGD','022','Ballad of the Hero','Spell','You can only play this if you have a Character in your Legend Zone. This becomes another Legend Zone. Your non-legendary cards cost 2 {L} more.',NULL)
,('KGD','023','Rediscovered Treasure','Item','When this enters your discard pile, if it did so from a Hoard, draw two cards.',NULL)
,('KGD','024','Fivefold Gem','Item','Attach this to a District. During your Nexus Phase, you can transmute 1 {L} to 1 {N}, {T}, {M}, or {C}.',NULL)
,('KGD','025','Dragon Spires','District','The first Dragon you play each turn has one of its colored Nexus cost converted to {L}.',NULL)
,('KGD','026','The Great Hoard','District','Whenever a Character you control with Hoard dies, tuck all Hoarded cards under this. This has one Orb of a color for every 3 cards of that color tucked under this.',NULL)
,('KGD','002','Rasia''anlexi, the Mountain''s Rumble','Character','Hoard. Legend: Pay 6 {L}: Deal 3 damage to all Characters in the Field. Costs 1 less for each card this has Hoarded (minimum 1).',NULL)
,('KGD','027','Frostwood Squirrel','Character','Hoard.',NULL)
,('KGD','028','Pyrrhic Hatchling','Character','Hoard. Whenever this Hoards an Item, gain +1/+1 until end of turn and Trash a card from a discard pile.',NULL)
,('KGD','029','Draco Druid','Character','Whenever another Character you control Hoards, restore 3 Health to it.',NULL)
,('KGD','030','Enraged Drake','Character','When attacking: Destroy an Item in a space peripheral to it.',NULL)
,('KGD','031','Bloodbathed Acolyte','Character','Breakthrough. When played: Your next Dragon costs 2 {N} less (only reduces colored cost).',NULL)
,('KGD','032','Dragon Turtle','Character','Hoard. If this has 5 or more Hoarded cards, it has Quick Strike.',NULL)
,('KGD','033','Territorial Greenspan','Character','Lethal. Overpass.',NULL)
,('KGD','034','Verdant Dragon','Character','Hoard. Overheal: Reclaim the bottom X cards of your discard pile, where X is the number of Items this has Hoarded.',NULL)
,('KGD','035','Forest Razer','Character','When played: Destroy all Items in the Field. Allocate 3 {L}.',NULL)
,('KGD','036','Ancient Green Dragon','Character','Hoard. Overpass. Exhaust and Discard two Hoarded cards: All your Characters have Lethal this turn.',NULL)
,('KGD','037','Soporific Breath','Spell','Reaction. Exhaust a non-Machine, non-Golem non-Undead Character.',NULL)
,('KGD','038','Wyrm''s Strength','Spell','Give a Character +3/+3 until end of turn.',NULL)
,('KGD','039','Vial of Flame','Item','Deal 1 damage to all Characters. Reclaim this when a Dragon you control deals 4 or more damage.',NULL)
,('KGD','040','Ironbark Totem','Item','Deploy. Adjacent Characters have +0/+2 if you control a Dragon.',NULL)
,('KGD','003','Kamatani, the Eastern Wind','Character','Hoard. Legend: Pay 3 {L}: Deal 2 damage split among Characters you don''t control. Costs 1 less for each card this has Hoarded (minimum 1).','10019')
,('KGD','041','Junk Rat','Character','Hoard. When played: Sift 1',NULL)
,('KGD','042','Tectonic Hatchling','Character','Hoard. Whenever this Hoards a District, gain +1/+1 until end of turn and Silence a District.',NULL)
,('KGD','043','Draco Artificer','Character','Whenever another Character you control Hoards, it has Armored 2 until end of round.',NULL)
,('KGD','044','Neon City Drake','Character','When attacking: Discard a card, then draw a card.',NULL)
,('KGD','045','Bronzescale Acolyte','Character','Armored 2. When played: Your next Dragon costs 2 {T} less (only reduces colored cost).',NULL)
,('KGD','046','DR4G-0N M3CH','Character','Hoard. If this has 4 or more Hoarded cards, it has Armored 2.',NULL)
,('KGD','047','Mirage Bluespan','Character','Overpass. Echo 2 {T} 3 {L}.','10022')
,('KGD','048','Astral Dragon','Character','Hoard. At the start of your District Phase, if the number Districts this has Hoarded is greater than your total number of Orbs, Reposition this.',NULL)
,('KGD','049','City Submerger','Character','When played: Deal 11 damage split between Characters you don''t control. Allocate 3 {L}.',NULL)
,('KGD','050','Ancient Blue Dragon','Character','Hoard. Overpass. Exhaust and Discard two Hoarded cards: Put 5 Frailty counters on up to 3 adjacent Characters.',NULL)
,('KGD','051','Desiccated Breath','Spell','Give a non-Machine, non-Golem non-Undead Character -4/-0.',NULL)
,('KGD','052','Wyrm''s Cunning','Spell','Look at the top 3 cards of your deck. You may mill any of them, or move any of them to the bottom of your deck.',NULL)
,('KGD','053','Vial of Sand','Item','Remove up to two nondamage counters of the same type from a card. Reclaim this when a Dragon you control Repositions.',NULL)
,('KGD','054','Clockwork Totem','Item','Deploy. Adjacent Characters have Armored 1 if you control a Dragon.',NULL)
,('KGD','004','Xanthan, the Infallible Mind','Character','Hoard. Legend: Pay 4 {L}: Chosen opponent discards a card. Costs 1 less for each card this has Hoarded (minimum 1).',NULL)
,('KGD','055','Mind Goblin','Character','Hoard.',NULL)
,('KGD','056','Mesmeric Hatchling','Character','Hoard. Whenever this Hoards a Spell, gain +1/+1 until end of turn and your opponent''s next Spell costs 1 {L} more on their next turn.',NULL)
,('KGD','057','Draco Sorcerer','Character','Whenever another Character you control Hoards, shuffle a Token copy of it into your deck.',NULL)
,('KGD','058','Spark Drake','Character','When attacking: Add a Ryu Lightning Token to your hand.',NULL)
,('KGD','059','Affluent Acolyte','Character','Ward 2. When played: Your next Dragon costs 2 {M} less (only reduces colored cost).',NULL)
,('KGD','060','Dragon Fairie','Character','Hoard. If this has 4 or more Hoarded cards, it has Ward 3.',NULL)
,('KGD','061','Vindictive Redspan','Character','Haste. Overpass.',NULL)
,('KGD','062','Runic Dragon','Character','Hoard. Whenever you play or Summon a Token, if you have less Tokens in your Field than the number of Spells this has Hoarded, play or Summon a copy of that Token.','10027')
,('KGD','063','Tower Toppler','Character','When played: Cast a Spell from your hand that costs 5 or less without paying its cost. Allocate 3 {L}.',NULL)
,('KGD','064','Ancient Red Dragon','Character','Hoard. Overpass. Exhaust and Discard two Hoarded cards: Trash a card in the Field.',NULL)
,('KGD','065','Lightning Breath','Spell','Add three Ryu Lightning Tokens to your hand. Until end of turn, your Ryu Lightnings ignore Armored.','10020')
,('KGD','066','Wyrm''s Intellect','Spell','Draw three cards.',NULL)
,('KGD','067','Vial of Mana','Item','Gain 3 {M} SP. Reclaim this when a Dragon you control is targeted by a Spell.',NULL)
,('KGD','068','Marble Totem','Item','Deploy. Adjacent Characters have Ward 1 if you control a Dragon.',NULL)
,('KGD','T01','Ryu Lightning','Spell','Breakthrough. Deal 2 damage to a Character.','10028')
,('KGD','005','Naranmeia, Bringer of Ruin','Character','Hoard. When killed: Starting with you and moving counterclockwise, each player may play a District that was tucked under Naranmeia, so long as doing so would not make an illegal District Zone. Repeat until all Districts under Naranmeia that can legally be played have been played. Legend: Pay 8 CC: Downgrade a Tier II or III District. Costs 1 less for each card this has Hoarded (minimum 1).',NULL)
,('KGD','069','Omen Crow','Character','Hoard. Overpass.',NULL)
,('KGD','070','Caustic Hatchling','Character','Hoard. Whenever this Hoards a Character, gain +1/+1 until end of turn and chosen player mills a card.','10162')
,('KGD','071','Draco Rogue','Character','Whenever another Character you control Hoards, you may deal 1 damage to it to give it +2 Attack.',NULL)
,('KGD','072','Noxious Drake','Character','When attacking: Gain Lethal until end of turn.',NULL)
,('KGD','073','Zealous Acolyte','Character','Convert. When played: Your next Dragon costs 2 {C} less (only reduces colored cost).',NULL)
,('KGD','074','Dragon Fleshmire','Character','Hoard. If this has 3 or more Hoarded cards, it has Lethal.',NULL)
,('KGD','075','Plagued Blackspan','Character','Deathcoil. Overpass.','10243')
,('KGD','076','Void Dragon','Character','Hoard. Whenever a player mills, if the number of cards milled is less than the number of Characters this has Hoarded, they mill two more.','10296')
,('KGD','077','Undercity Upheaver','Character','When played: Each other player sacrifices their lowest and highest Attack Character. Allocate 3 {L}.',NULL)
,('KGD','078','Ancient Black Dragon','Character','Hoard. Overpass. Exhaust and Discard two Hoarded cards: Give all Characters without Overpass -2/-2.',NULL)
,('KGD','079','Corrosive Breath','Spell','Give a non-Slime Character -2/-2 until end of turn.',NULL)
,('KGD','080','Wyrm''s Presence','Spell','Return a Character to its owner''s hand. If it was an opponent''s, it costs 1 {L} more while you control a Dragon.',NULL)
,('KGD','081','Vial of Ichor','Item','Put a Barrier counter on a Character. Reclaim this when a Dragon you control is Sacrificed or dies from the effect of a card you control.',NULL)
,('KGD','082','Slimestone Totem','Item','Deploy. Adjacent Characters have +2/-1 if you control a Dragon.',NULL)
,('NIN','001','Mogunyan, the Lost','Character','Legend: Before you shuffle your deck, you may shuffle your hand into your deck. If you do, draw 4 cards after you shuffle.',NULL)
,('NIN','008','Deadbeat Gangster','Character',NULL,NULL)
,('NIN','009','Mooching Cat','Character','When played: This steals a counter from a Character or District. If it does, put a +1/+1 counter on this.',NULL)
,('NIN','010','Amp Beatmage','Character','Whenever a Character takes noncombat damage, it takes 2 more.',NULL)
,('NIN','011','Earthshaker Draco','Character','When played: Deal 2 damage to a space in the Field. Repeat if you have a Tier II District or higher.',NULL)
,('NIN','012','ACPD Distributor','Character','Reaction. When played: Shuffle your hand into your deck and draw 7 cards.',NULL)
,('NIN','013','Toll Troll','Character','Blockade, Can''t Attack. Whenever a Character repositions, Exhaust it.',NULL)
,('NIN','014','Streetsweeper Oni','Character','When played: Trash up to 5 cards from any discard piles. For each Item trashed this way, gain +1 Atack.',NULL)
,('NIN','015','Nintol Transmuter','Item','Equip to a District. During your Nexus Phase, you may transmute one {L} SP to {N} or {T} SP.',NULL)
,('NIN','016','Vel''nama Transmuter','Item','Equip to a District. During your Nexus Phase, you may transmute one {L} SP to {N} or {M} SP.',NULL)
,('NIN','017','Shini-kai Transmuter','Item','Equip to a District. During your Nexus Phase, you may transmute one {L} SP to {N} or {C} SP.',NULL)
,('NIN','018','Tamar Transmuter','Item','Equip to a District. During your Nexus Phase, you may transmute one {L} SP to {T} or {M} SP.',NULL)
,('NIN','019','Noctic Transmuter','Item','Equip to a District. During your Nexus Phase, you may transmute one {L} SP to {T} or {C} SP.',NULL)
,('NIN','020','Maitako Transmuter','Item','Equip to a District. During your Nexus Phase, you may transmute one {L} SP to {M} or {C} SP.',NULL)
,('NIN','021','Back Alley','District','At the start of your Combat Phase, you may pay 9 {L} to give a Character you control Unblockable this turn. Costs 1 less per Back Alley you control.',NULL)
,('NIN','022','Nexus Gate Shell','District','Whenever you play a multicolored card, put a Gate counter on this. If this has 5 or more Gate counters at the start of your District Phase, search your deck for a Tier III District with "Nexus" in its name and put it in your hand (only once).',NULL)
,('NIN','023','Biomechanical Bastion','Character','While equipped, this has Quick Strike. While unequipped, this has Blockade.','002')
,('NIN','024','Spoiled Brat','Character','Invest 3 {L}: Put 3 Restrain counters on a Character an opponent controls.','044')
,('NIN','025','Fight Rigger','Character','Invest 2 {N}: Another Character you control fights a Character you don''t control.',NULL)
,('NIN','026','Scrappy Sukonbu','Character','Retribution - When damaged, gain +1 Attack.','038')
,('NIN','027','Showtail Patrician','Character','Extravagance 2 - When played: If you control at least 2 Invested cards, deal 2 damage to all Characters in a player''s Field.','041')
,('NIN','028','Bronze Bullion','Character','Can''t Attack or Defend. Whenever you Invest a Character, you may swap that Character''s base stats with this one.','007')
,('NIN','029','Stardust Druid','Character','Invest 2 {M}: Add two Stardust Tokens to your hand. While Invested this has +3/+1.','046')
,('NIN','030','Combustible Cub','Character','When killed: Deal 2 damage to all Characters and City Control zones.',NULL)
,('NIN','031','Dragonfist Disciple','Character','Breakthrough. Retribution - When damaged, deal 2 damage to a Character an opponent controls.','014')
,('NIN','032','Horned Menace','Character','Breakthrough. This must be blocked by two or more Characters.',NULL)
,('NIN','033','Nintol Cruiser','Character','Haste. Intercept - As a Reaction, you may detach an Item from this to reposition it.','030')
,('NIN','034','Shini-kai Reclaimer','Character','While equipped, this has Quick Strike. Retribution - When damaged: Reclaim a Character.',NULL)
,('NIN','035','Strongarm Bouncer','Character','When played: Fight a Character. If it survives, return it to its controller''s hand.',NULL)
,('NIN','036','Stardust Colossus','Character','When killed: Deal damage equal to the number of Stardust Tokens attached to this.','045')
,('NIN','037','Hemocrush','Spell','Deal 2 damage to a Character you control. Then Destroy a Character or Item with lower cost than it''s missing Health.',NULL)
,('NIN','038','Bloody Nose','Spell','Reaction. Deal 1 damage to a Character. Deal 4 instead if it is damaged.',NULL)
,('NIN','039','Punch Out','Spell','Destroy the Character with the lowest Attack.',NULL)
,('NIN','040','Determination','Spell','This turn, Characters you control can''t be reduced below 1 Health by damage, and are reduced to 1 Health by Destroy effects.','081')
,('NIN','041','Double Team','Spell','Give a Character +2/+2. Invest 2 {N}: Repeat (you may choose new targets).',NULL)
,('NIN','042','With One Cut','Spell','Reaction. Deal 3 damage to a Character. Deal 5 if it''s an attacking Character.',NULL)
,('NIN','043','Nectar of Vitality','Item','Equip. When played: Put 3 Life counters on this. When attached Character is damaged, you may spend up to 1 counter to restore 1 Health to them.',NULL)
,('NIN','044','Riot Baton','Item','Equip. When played: Deal 1 damage to a Character. When detached: Deal 2 damage to the Character across from this, then gain 2 CC.','097')
,('NIN','045','Stardust Firework','Item','Afflict. When attached or detached: Deal 1 damage to a Character. Invest 3 {L}: Also deal 1 damage to ALL Characters when triggered.',NULL)
,('NIN','046','Crimson Dragonmark','Item','Equip. While attached Character is damaged, it has +2/+2.','080')
,('NIN','047','Blinged Brass','Item','Equip. When played: It deals damage equal to its power to a Character you don''t control. Invest X: It deals X additional damage.','073')
,('NIN','048','Stardust Trailblazer','Character','Haste. When attacking: Put a Stardust Token into defending player''s hand. Allocate 3 {L}.','047')
,('NIN','049','Adaptive Battle Armor','Character','Blockade. Intercept - As a Reaction, you may detach an Item from this to reposition it. As a Reaction, pay 1 {L}: This has +1 Attack this turn. Activate up to 4 times per turn.','001')
,('NIN','050','Defective Detective','Character','When drawn: You may reveal this. If you do, restore 4 CC. Espionage - When played, look at an opponent''s hand. Spy X: That opponent, X equals the number of Items you saw.','013')
,('NIN','051','Ghost in the Machine','Character','When killed: Shuffle an Implanted Memory into another player''s deck.',NULL)
,('NIN','052','Ramen Delivery Drone','Character','Overpass. Whenever this attacks, you may discard a card to draw a card and restore 1 CC.',NULL)
,('NIN','053','Gate Scrapper','Character','When played: Reclaim Ruins X. Allocate 2 {L}.',NULL)
,('NIN','054','Nintol Skywatch','Character','Overpass. Intercept - As a Reaction, you may detach an Item from this to reposition it.',NULL)
,('NIN','055','Virus Fly','Character','Overpass. Espionage - When played, look at an opponent''s hand. Deal CC damage to them equal to the number of Characters you saw.',NULL)
,('NIN','056','Covert Bouncer','Character','When played: Return a Character to its controller''s hand. Put a Stealth counter on this if chosen Character costed 3 or less.',NULL)
,('NIN','057','Spinwheel Spydrone','Character','When played: If you drew this card this turn, deal 3 damage to a Character. Allocate 2 {L}. Reclaim this whenever you discard a card that costs 5 or more.','043')
,('NIN','058','Reckless Railgunner','Character','Haste. Reach. When played: Discard two cards. If you discarded less than two, deal 4 damage to this.','035')
,('NIN','059','Shelled Menace','Character','Armored 2. This must be blocked by two or more Characters.',NULL)
,('NIN','060','Dispatch Officer','Character','Officers you control have Reaction. Whenever a Character you control Repositions, it has Armored 2 until the start of your next turn.','10175')
,('NIN','061','Starscrap Juggernaut','Character','This has Overpass if you have Ruins 4 or greater. Allocate 2 {L}.','048')
,('NIN','062','Swindle','Spell','Chosen player draws 2 cards, then discards 3 cards.','103')
,('NIN','063','Rooftop Retreat','Spell','Reaction. Return a Character you control to your hand. If you play it this turn, attach this to it. Attached Character has Overpass.',NULL)
,('NIN','064','Mag Dump','Spell','Deal 3 damage to a Character. Repeat any number of times by discarding an Item each time.',NULL)
,('NIN','065','Fission Mailed','Spell','Unveil all Stealthed Characters. Each player mills a card for each Character revealed in this way they don''t control.',NULL)
,('NIN','066','Double Life','Spell','Add a Token copy of a Character you control to your hand. Invest 2 {T}: Repeat (you may choose new targets).',NULL)
,('NIN','067','Memory Re:Visor','Item','Equip to a Character. Whenever it deals CC damage, shuffle an Implanted Memory Token into defending player''s deck.',NULL)
,('NIN','068','Voidtouched Schematic','Item','Create three Construction Zone Tokens in your hand. Any still in your hand at the end of your turn are Trashed.',NULL)
,('NIN','069','Nostalgic Photograph','Item','Reclaim the bottom 5 cards of your discard pile. Echo 7 {L}.','092')
,('NIN','070','Pit Stop','Item','Deploy. Whenever a Character repositions, restore 3 Health to it, or give it +1 Health if it''s already full.','095')
,('NIN','071','Glitter Shield','Item','Reaction. Equip to a Character. Attached Character has Armored 2 and Ward 2. Allocate 2 {L}.',NULL)
,('NIN','072','One-Shot Sidearm','Item','Reaction. Equip to a Character. Attached Character has +2/+0. When played: Attached Character has Quick Strike this turn.','093')
,('NIN','T01','Stardust','Item','Afflict. When played: Attached Character gets -1/-0, and its controller restores 2 CC.','101')
,('NIN','073','Tamar Thoughtseer','Character','Espionage - When played: Look at an opponent''s hand. Shuffle X Implanted Memory Tokens into their deck, where X is the number of Districts you saw.',NULL)
,('NIN','074','Feather Boa','Character','End of Turn: Each player shuffles their deck. Invest 2 {L}: Put two +1/+1 counters on this.',NULL)
,('NIN','075','Void Summoner','Character','Whenever you Summon a Token Character, pay 1 {L} to put a Stealth counter on this. Unveil - Whenever this removes its Stealth counters, put a +1/+1 counter on a Token Character you control.','053')
,('NIN','076','Money Mover','Character','When played: Move a nondamage counter from a Character you control to this. If you do, put a Stealth counter on this. When killed: Move an Invest counter from this to a Character you control.',NULL)
,('NIN','077','Nights Templar','Character','Stealth.',NULL)
,('NIN','078','Subconcious Silencer','Character','Ward 2 to players with Implanted Memory Tokens in hand. Whenever this attacks, Silence up to one non-Token Character.',NULL)
,('NIN','079','Undercover Hypnotist','Character','Espionage - When played: Look at an opponent''s hand. Exhaust and Restrain a Character they control with 3+X or less Attack, where X is the number of Spells you saw.','052')
,('NIN','080','Enchanting Bouncer','Character','When played: Return a Character to its controller''s hand. They can''t play it while this is in the Field.',NULL)
,('NIN','081','Nora Heights Aristocrat','Character','Start of Turn: If this is Invested, summon a Capital Knight Token. Invest 4 {M}.','031')
,('NIN','082','Silvered Menace','Character','Lethal. This must be blocked by two or more Characters.',NULL)
,('NIN','083','Patron of War','Character','Extravagance 4 - When played, if you control 4 or more Invested cards, deal 8 damage split between enemy Characters. Invest 2 {L}: Draw 2 cards whenever this kills a Character.','032')
,('NIN','084','Revered Shade','Character','Stealth. Unveil - Whenever this removes its Stealth counters, restore Health to a Character you control equal to the number of Tokens you control.',NULL)
,('NIN','085','Liquidate','Spell','Remove an Invest counter from a Character you control to gain 3 {M} SP.','089')
,('NIN','086','Starseek','Spell','Search your deck for a card that costs less than your total orbs and move it to the top of your deck.',NULL)
,('NIN','087','Mythical Investigation','Spell','Spy 4: Your deck. You may draw any number of Characters you find. If you do, each player shuffles an equal number of Characters from their hand into their deck.','091')
,('NIN','088','Unseeming','Spell','Espionage - Look at an opponent''s hand. Draw X cards, where X is the number of non-Character cards you saw.',NULL)
,('NIN','089','Double Think','Spell','Spy 5: Your deck, and put up to two Spells you find into your hand, then shuffle your deck. Invest 2 {M}: Repeat','082')
,('NIN','090','Haze Lightning','Spell','Deal 2 damage to three adjacent spaces in the Field, then put Stealth counters on Characters or Deployed Items in them.',NULL)
,('NIN','091','Mind Fracture','Spell','Reaction. Destroy a Character. Its controller discards a card if it had 3 Attack or less.','090')
,('NIN','092','Share the Wealth','Spell','Put an Invest counter on all Characters in the Field. Until the end of your turn, your Invests cost 0.','099')
,('NIN','093','Rewrite Perception','Spell','Spy 8: All. You may choose 3 cards from each and move them to the top in any order.',NULL)
,('NIN','094','Flickering Candle','Item','Afflict. Attached Character has +1/-1 and "End of Turn: Remove a Stealth counter from this.',NULL)
,('NIN','095','Masquerade Mask','Item','Name a Card Type. Chosen player must discard a card of that type. Extravagance 1 - If you control 1 or more Invested cards, they Trash it instead.',NULL)
,('NIN','096','Inheritor''s Stamp','Item','Afflict. Attached Character has +0/+1 and "When killed: Search your deck for a card with Invest and add it to your hand.','085')
,('NIN','097','Stardust Fountain','Item','Deploy. Extravagance 2 - When played, if you control 2 or more Invested cards, set all Characters'' Attack to 0 until the start of your next turn. Exhaust and pay 2 {L}: Add a Stardust Token to your hand.','102')
,('NIN','T02','Implanted Memory','Spell','This also counts as a Character, Item, and District while in your hand. Can''t be discarded.','084')
,('NIN','098','Backstage Poltergeist','Character','Stealth. Unveil - Whenever this removes its Stealth counters, deal 3 damage to this.','001')
,('NIN','099','Back-Alley Duelist','Character','This has First Strike if it is the only rested Character you control.',NULL)
,('NIN','100','Herald of Stars','Character','When played: Search your deck for a 3 cost card and add it to your hand.',NULL)
,('NIN','101','Loan Catshark','Character','When played: Put 3 Stardust Tokens in an opponent''s hand. Whenever an opponent plays a Token Item, they take 3 CC damage.',NULL)
,('NIN','102','Skulking Zealot','Character','When played: Put a Stealth counter on this if it''s not the rightmost card in your hand. Unveil - Whenever this removes its Stealth counters, discard a card then draw a card.','10032')
,('NIN','103','Blood Graffitist','Character','Retribution - When damaged, give up to one Character -1 Attack or -1 Health.','005')
,('NIN','104','Shini-kai Showstopper','Character','Convert. This Character''s Attack is equal to it''s missing Health.',NULL)
,('NIN','105','Wall Wrecker','Character','When played: Downgrade a Tier II District or higher. When killed: The player that killed this may Reclaim a District.','10299')
,('NIN','106','Looming Shadow','Character','Stealth. Unveil - Whenever this removes its Stealth counters, give a Character across from this -X/-0 until the start of your next turn, where X is this Character''s Attack.',NULL)
,('NIN','107','Startrail Courier','Character','Haste. When Attacking: Adjacent Characters get +0/+1. Allocate 2 {L}.',NULL)
,('NIN','108','Brutal Bouncers','Character','When played: Choose a Character. Return it to its controller''s hand if its Health is less than the amount of CC you gained this turn. Otherwise, deal 2 damage to it and your CC.',NULL)
,('NIN','109','Slimy Menace','Character','This must be blocked by two or more Characters. Allocate 2 {L}. Echo 2 {C} 1 {L}.',NULL)
,('NIN','110','Blood Bancho','Character','Retribution - When damaged, deal 2 CC damage to an opponent and restore 2 CC.','004')
,('NIN','111','Shadow of the Rift','Character','Stealth. When played: Lose 4 CC. Your Characters with Stealth counters get +2/+0 until the start of your next turn. Allocate 2 {L}.','040')
,('NIN','112','Convenient Crowd','Spell','Reaction. Each player may pay 1 CC any number of times to put that many 1 cost Characters from their hand into the Field.',NULL)
,('NIN','113','Spiral of Blood','Spell','Deal 1 damage to up to X Characters, where X is the number of damaged Characters you control.',NULL)
,('NIN','114','Kaichou''s Favor','Spell','Destroy a Character, then pay 4 CC unless a Dragon is in your Legend Zone or discard pile.','087')
,('NIN','115','Bloody Spectacle','Spell','Restore CC equal to the remaining Health of all damaged Characters, then destroy them.',NULL)
,('NIN','116','Double Cross','Spell','Chosen player takes 2 CC damage for each Character in their Field that shares a color with a Character in your Legend Zone. Invest 2 {C}: Repeat.',NULL)
,('NIN','117','Open the Rift','Spell','Shuffle all Characters in the Field into their controller''s decks. Then if you have Ruins 4 or greater, find the first 4 Characters in your deck and Summon them without paying their cost.',NULL)
,('NIN','118','Berried Blade','Item','Equip. When attached: Deal 1 damage to Attached Character. Attached Character has +1/+0.','072')
,('NIN','119','Phantom Card','Item','Characters that remove Stealth counters this turn have Lethal. Allocate 1 {C}.','094')
,('NIN','120','Cloak and Dagger','Item','Choose One: Give a Stealthed Character +2/+0 | Deal 2 damage to a Character','077')
,('NIN','121','Concealing Scroll','Item','Deploy. When a Character you control removes its Stealth counters, you may deal damage equal to the number of counters removed to one one target. If the target is a player, this can’t do more than 1 damage per trigger.','078')
,('NIN','122','Hero''s Laser Sword','Item','Equip. Attached Character has +5/+2, Convert, and "Whenever this attacks, add a Stardust Token to your hand.',NULL)
,('NIN','002','Ionoko, Logical Cop','Character','Intercept - As a Reaction, you may detach an Item from this to reposition it. Legend: Non-Officer Characters lose Reaction and are played Exhausted unless they have Haste.','025')
,('NIN','003','Mama Ro, Haven Hostess','Character','Whenever you play another Character, put an Invest counter on this. Legend: When a Character dies, deal damage equal to the number of Invest counters it had to all Characters in a player’s Field of its controller’s choice.','027')
,('NIN','004','Drov''a, Blade of Justice','Character','Reaction, Quick Strike. Legend: At the start of each Combat Phase, if a Character you control was damaged after the end of your last turn, give a Character you control +3/+0 this turn.','015')
,('NIN','005','Connie, Rookie Detective','Character','Whenever a player discards a card, you may Exhaust: Draw a card. Legend: Whenever you look at an opponent''s hand, you may discard a card then draw a card if you see at least four different card types (Character, Spell, Item, District, Legendary, and Token are card types).','010')
,('NIN','006','Mantev, Art Broker','Character','Whenever this is discarded, draw 2 cards. Legend: During your turn, pay 3 {L}: Return this to your hand.','028')
,('NIN','007','Novum, Star Crossed','Character','When played: If another player has a Legend in their Legend Zone, downgrade all Tier I and III Districts. Legend: Whenever a player plays a Token, that player loses 2 CC then you gain 2 CC. Your CC can be raised above 30 in this way.',NULL)
,('NIN','123','Multitool Mechacop','Character','When played: You may attach an Item that costs 3 or less from your hand to this. If it doesn’t have attach or equip in its text, don’t resolve its effects. Intercept - As a Reaction, you may detach an Item from this to reposition it.','029')
,('NIN','124','Capital Knight','Character','Extravagance 1 - When played, if you control 1 or more Invested cards, give a Character you control Ward 2 this turn. Invest 1 {L} 1 {N} 1 {M}: Summon an Invested Token copy of this.',NULL)
,('NIN','125','Stoneskin Kyodai','Character','Whenever this takes damage, it takes 1 damage instead.',NULL)
,('NIN','126','Ephemeral Agent','Character','Ward 1. When attacking: Shuffle an Implanted Memory Token into defending player''s deck.','020')
,('NIN','127','Copium Dealer','Character','Whenever you discard a card, deal 1 CC damage to all players.','011')
,('NIN','128','Maitako Communicant','Character','Convert. Whenever a Character you control removes its Stealth counters, this gains Attack equal to that Character''s Attack this turn.','026')
,('NIN','129','Libra Cluestar','Item','Choose One: All Characters have -2/-0 until your next turn | Reposition a Character | Return an Item to its controller''s hand','088')
,('NIN','130','Aries Cluestar','Item','Choose One: Apply Restrain 3 | Give 1 Barrier to a Character you control | Restore 5 Health','070')
,('NIN','131','Scorpio Cluestar','Item','Choose One: Deal 1 damage to all Characters | Distribute three +1 Attack counters among Characters you control | Restore 4 CC','098')
,('NIN','132','Gemini Cluestar','Item','Choose One: Spy 4: Your deck. Put any on the bottom of your deck | Draw two cards, then discard a card | Trash a card that costs 2 or less','083')
,('NIN','133','Capricorn Cluestar','Item','Choose One: Sift 3 | Reclaim 2 | Deal 3 damage','074')
,('NIN','134','Aquarius Cluestar','Item','Choose One: Summon a copy of a Token that costs 2 or less | Sacrifice a Character to draw 2 cards | Put a Stealth counter on a Character.','069')
,('NIN','135','Ajimaru Jailhouse','District','The first time each turn a Character you control blocks or is blocked, add a Stardust Token to your hand.','055')
,('NIN','136','Nora Heights','District','Your Characters have Extravagance 2 - When played, if you control 2 or more Invested cards, draw a card.','064')
,('NIN','137','Dragon''s Dojo','District','Whenever a Character is played, deal 1 damage to it unless its controller pays 1 {L}.','060')
,('NIN','138','Sunfish Station','District','If you have a Character in the space of your Field furthest from the District Zone, it has Overpass and "When attacking: Spy 1: Defending player.','067')
,('NIN','139','Bar Robel','District','While you have Ruins 4 or greater, this has +{T}{C}.','056')
,('NIN','140','Pale Void Flowerbed','District','Whenever you play an Eldritch Character, put a Stealth counter on it. If an Eldritch Character removes more than 1 Stealth counter, it has Convert this turn.','065')
,('NIN','T03','Capital Knight','Character','Extravagance 1 - When summoned, if you control 1 or more Invested Cards, give a Character you control Ward 2 this turn.','008')
,('JGK','001','Jean le Dest, Golden Skull','Character','Unblockable if your Field is full. Legend: Whenever you play an Undead Character, you may draw the bottom card of your deck. Take 2 CC damage if it''s a Spell or non-Undead Character.',NULL)
,('JGK','008','Soul Bounty Hunter','Character','When played: Shuffle a Death''s Mark Token into your deck.',NULL)
,('JGK','009','Soulbound Outlander','Character','When played: Return a Character in your Field to your hand.',NULL)
,('JGK','010','Apparition of Sloth','Character','When killed: Restrain a Character you don''t control. This must target a Character that killed it, if any.',NULL)
,('JGK','011','Decrepit Zombie','Character','When killed: Summon a Jigoku Skeleton Token.','10009')
,('JGK','012','Oni Stancemaster','Character','When played: Choose One: Give this +2 Attack | Give this +2 Health.',NULL)
,('JGK','013','Hellcrab Herald','Character','When played: Add two Giant Crab Tokens to your hand.',NULL)
,('JGK','014','Grasping Specter','Character','When killed: Attach this to a Character. When attached Character dies, if you don''t own it, put it in your discard pile instead of its owner''s.',NULL)
,('JGK','015','Holo-Graphic Reaper','Character','When played: Duplicate a Token in your hand.',NULL)
,('JGK','016','Firecrag Legionnaire','Character','Armored 2. When played: Discard a card.',NULL)
,('JGK','017','Graverobber Ghoul','Character','Exhaust: Reclaim the top 3 cards of your discard pile.',NULL)
,('JGK','018','Demon Strator','Character','When played: Search your deck for a Demon and add it to your hand.',NULL)
,('JGK','019','Skull Lord','Character','Immortal 1: 4 {L}',NULL)
,('JGK','020','Necropolis Golem','Character','Blockade. When attacking or defending: Summon a Jigoku Skeleton Token.','10023')
,('JGK','021','Graveyard Shift','Spell','Search your deck or discard pile for two Undead Characters and add them to your hand.',NULL)
,('JGK','022','Ashen Wind','Spell','Silence all Districts until the start of your next turn. Draw a card. (They still produce Nexus Orbs)',NULL)
,('JGK','023','Skull Speakers','Item','Deploy. Characters on the edge of your Field have +2/+0 if you cast a Spell this turn.',NULL)
,('JGK','024','Beating Heart','Item','Give +2/+2 to a non-Undead Character. Draw a card for each other card you played this turn.',NULL)
,('JGK','025','Ashen Wasteland','District','When you play your first Character each turn, you may transmute one of its colored cost to colorless (stacks with each Ashen Wasteland). If you do, it enters Exhausted.',NULL)
,('JGK','026','The Cell','District','When an opponent plays a Character, you may pay 2 {L} to Restrain 2.',NULL)
,('JGK','T01','Death''s Mark','Spell','Afflict. When played: Put 4 Time counters on this. At the end of controlling player''s turn, remove 2 Time counters from this. When this reaches 0 Time counters, destroy attached Character. Characters killed in this way can''t trigger Immortal.',NULL)
,('JGK','002','Veeto, Illegally Cute','Character','Convert. When played: Apply Restrain 5 to this. Whenever you play a Character, this gets +1/+0 this turn. Legend: Whenever you play a Character, remove a Restrain counter from all Restrained Characters.',NULL)
,('JGK','027','Circling Fury','Character','Can''t Block. When played: Draw a card.',NULL)
,('JGK','028','Stygian Owl','Character','If you''ve played 3 or more cards this turn, this has Overpass.',NULL)
,('JGK','029','Decay Crow','Character','Deathcoil, Haste, Flurry 4.',NULL)
,('JGK','030','Hellhound Packmate','Character','Flurry 1. When played: Give up to one Character +2/+0 this turn.',NULL)
,('JGK','031','Black Sheep','Character','Whenever you play a card, this gains +1 Attack. At the end of your turn, it gets -3 Attack, to a minimum of 1.',NULL)
,('JGK','032','Demon Dog','Character','Flurry 1. When played: Deal 3 damage to up to one Character.',NULL)
,('JGK','033','Massive Cockroach','Character','Immortal 1: Pay 1 {L}.',NULL)
,('JGK','034','Cerberus','Character','When played: If this is the third card you played this turn, it attacks up to one Character you don''t control.',NULL)
,('JGK','035','Gatekeeper of Hard Rock','Character','Whenever you play your third spell each turn, each player with a Tier II District may have a Character they control attack another Character.',NULL)
,('JGK','036','Herald of War','Character','The first time each round a Character you play triggers a "When played" effect, trigger it an additional time. Invest 3 {L}: You don''t need to pay the Invest cost for Invest effects copied this way.*',NULL)
,('JGK','037','Sinner of Gluttony','Character','When played: Give up to one Character +0/+5 and give an opponent a Death''s Mark Token.',NULL)
,('JGK','038','Spined Screamer','Character','Whenever this attacks, it deals 3 damage to itself and 1 damage to the Character across from it.',NULL)
,('JGK','039','Lord of the Wastes','Character','Whenever you play your third card each turn, put two +1/+1 counters on a Character you control.',NULL)
,('JGK','040','Cinder Elemental','Character','When played: Deal 4 damage to all Characters and Destroy all Items in the Field.',NULL)
,('JGK','041','Hellhound Alpha','Character','Breakthrough. When played: Add a Death''s Mark Token to your hand. This has +2 Attack for each other Character you control.',NULL)
,('JGK','042','Sun Swallower','Character','Deathcoil, Lethal. When played: This gains 1 Barrier for each Nexus Orb you have, then all other Characters attack this (you choose order of players, each player chooses order of their Characters).',NULL)
,('JGK','043','Thornbound Godsoul','Character','Immortal 4: Sacrifice a Character. Whenever this attacks, you take 2 CC damage. Whenever this defends, attacking player takes 2 CC damage.',NULL)
,('JGK','044','Roll the Dice','Spell','Flurry until you roll 2-4. Roll 2d6: | 2-5: Give a Character you control -1/-1 | 6-8: The next Flurry costs 1 {L} instead | 8-11: Give a Character you control +1/+1 | 12: Duplicate all +1/+1 counters in the Field.',NULL)
,('JGK','045','Unlucky Four','Spell','Flurry 3. Add a Death''s Mark Token to your hand. Draw a card.',NULL)
,('JGK','046','Pack Tactics','Spell','Reaction: After you declare attackers. If you are attacking with three or more Characters, you may give one Lethal.',NULL)
,('JGK','047','To Skin and Bones','Spell','Remove all nondamage counters from the Field. Draw a card.',NULL)
,('JGK','048','Easy Pickings','Spell','Deal X-1 damage to a Character, where X is it''s current Health. Search your deck for up to three Birds or Beasts and put them in your hand.',NULL)
,('JGK','049','Eternal Fruit','Item','Draw a card. Restore 2 CC.',NULL)
,('JGK','050','Twin Demon Blades','Item','Flurry 1. Equip. Attached Character has +2/+0.',NULL)
,('JGK','051','Spiked Choker','Item','Equip. Attached Character has +3/+2 and "When damaged: Draw a card.',NULL)
,('JGK','052','Vinyl of Fire and Ice','Item','When played and at the start of your turn, activate the current effect, then rotate this. Discard this once it returns to the upright position. | Deal 2 damage | Restrain 2 | Reclaim a Character | Destroy a Character',NULL)
,('JGK','053','The Northwest Passage','District','When played: Summon an Ice Wall Token if you played a card this turn. Give it +0/+2 if you played three or more cards this turn.',NULL)
,('JGK','T02','Giant Crab','Character',NULL,NULL)
,('JGK','T03','Decay Crow','Character','Deathcoil, Haste. End of Turn: Trash this.',NULL)
,('JGK','T04','Hellhound Packmate','Character','When Summoned: Give up to one Character +2/+0 this turn. End of Turn: Trash this.',NULL)
,('JGK','T05','Demon Dog','Character','When Summoned: Deal 3 damage to up to one Character. End of Turn: Trash this.',NULL)
,('JGK','003','Xhoro, Unwavering Soul','Character','Armored 2. Legend: Whenever one or more cards are Trashed from a discard pile, you may have chosen player mill 2 cards, and this has "Immortal 5: Mill 5 cards" this turn.',NULL)
,('JGK','054','Album Spirit','Character','Immortal 2: Mill 2 cards.',NULL)
,('JGK','055','Nail-Cursed Spirit','Character','When killed: Deal 2 damage to up to one Character. Echo: Pay 2 {L} and Trash an Undead from a discard pile.',NULL)
,('JGK','056','Spectral Hand','Character','When played: Reclaim an Item from your discard pile. Echo 3 {L}.',NULL)
,('JGK','057','Electroshield Buster','Character','Adjacent Characters have Armored 2. Allocate 1 {L}.',NULL)
,('JGK','058','Ghost Knight','Character','Armored 1. Echo 2 {T} 3 {L}',NULL)
,('JGK','059','Raisin Vinter','Character','When played: You may Trash a Character from your discard pile to gain 2 CC and draw a card.',NULL)
,('JGK','060','Sinner of Greed','Character','When played: Chosen player draws 2 cards, takes Scarcity damage, and gets a Death''s Mark Token. If you are chosen player, every other player gets a Death''s Mark Token instead.',NULL)
,('JGK','061','Spirit Oracle','Character','Whenever you play another card with its Echo ability, put a +1/+1 counter on this. Echo 2 {T} 2 {L}.',NULL)
,('JGK','062','Gatekeeper of Cold Iron','Character','Whenever you play a Fey or Spirit, each player with a Tier II District may play or Allocate a District in their hand.',NULL)
,('JGK','063','Martyr''s Wraith','Character','Immortal 1: 2 {L}. When killed: Add a Death''s Mark Token to your hand.',NULL)
,('JGK','064','Bloated Boogieman','Character','When killed: Trash all Characters in discard piles. If you Trashed at least 8, deal 3 damage to all Characters in a Field.',NULL)
,('JGK','065','Specter Buster','Character','Armored 1. Whenever you Trash a Character from your discard pile, deal 1 damage to a random Character twice.',NULL)
,('JGK','066','Indomitable Spirit','Character','Immortal 2: Trash a card from your discard pile.',NULL)
,('JGK','067','Ghost Ruler','Character','Your Undead and Spirits have Allocate 1 {L}.',NULL)
,('JGK','068','Shrieking Banshee','Character','When played: Deal 8 damage split between Characters you don''t control. Echo 6 {L}.',NULL)
,('JGK','069','Ghost Leviathan','Character','Doesn''t Rest during your Draw Phase. Whenever you play another card with its Echo ability, Rest this. Echo 7 {L}.',NULL)
,('JGK','070','Timeworn Godsoul','Character','Immortal 4: Sacrifice a Character. Whenever a player draws a card, they mill 2 cards. Whenever a player discards a card, they Reclaim the bottom two cards of their discard pile.',NULL)
,('JGK','071','Grave Misfortune','Spell','Trash three Characters or Districts from your discard pile. Return a card from your discard pile to your hand.',NULL)
,('JGK','072','Imaginary Carousel','Spell','Reposition up to 3 Characters you control. Add a Death''s Mark Token to your hand.',NULL)
,('JGK','073','Mystic Motes','Spell','Deal 5 damage split among Characters you don''t control.',NULL)
,('JGK','074','Necrospiral','Spell','Destroy all Characters in the Field. Before they enter the discard pile, each player may search their discard pile for and Summon Characters with lower costs in their spaces.',NULL)
,('JGK','075','Reusable Bottle Cap','Item','Restore 3 CC. When Trashed: Restore 3 CC and draw a card.',NULL)
,('JGK','076','Green Cap','Item','Choose One: Restrain a Character | Reposition a Character. If you are going second, you may choose both.',NULL)
,('JGK','077','Sip of Lethe','Item','Silence a Character. Trash any copies of it in its owner''s discard pile.',NULL)
,('JGK','078','Soul-Powered Spectrograph','Item','Deploy. Start of Turn: Instead of drawing a card you may Spy X: Your deck, where X is the number of Soul counters on this, and choose one to draw, then shuffle your deck. At the start of your District Phase, you may Trash an Undead from a Discard pile to put a Soul counter on this.',NULL)
,('JGK','079','Vinyl of Crown and Comet','Item','When played and at the start of your turn, activate the current effect, then rotate this. Discard this once it returns to the upright position. | Choose a Character. Reposition it. | Give that Character +X Health, where X is the number of Orbs on Districts you control. | Give that Character +2 Attack, or +4 Attack if it''s in the Center space of your Field. | If an opponent has a Legend in their Legend Zone, set that Character''s base stats to 6/6.',NULL)
,('JGK','080','Paranormal Investigator''s Van','District','When played: Each player may choose to mill a card. Each player that does draws a card.',NULL)
,('JGK','004','Ast''ellaryn, Death''s Dragon','Character','Whenever you play a Dragon, you may tuck a Jigoku Skeleton Token under each Character in a Field. Legend: When tucking a Jigoku Skeleton Token under a Character you don''t control, you may instead give it a -1 Health counter.','10007')
,('JGK','081','Boneshield Legionnaire','Character','Invest 1 {M}: Gain 1 Barrier.',NULL)
,('JGK','082','Apprentice Reaper','Character','Lethal. If an opponent has 15 or less CC, this has Reaction.',NULL)
,('JGK','083','Bone Drone','Character','Overpass. When played: Spy 3: Your deck. You may add a Character you find to your hand, then shuffle your deck. If you don''t, Summon a Jigoku Skeleton Token instead.',NULL)
,('JGK','084','Haunting Reaper','Character','Frailty 2. When killed: If an opponent has 15 or less CC, attach this to a Character. Attached Character has this Card Text.',NULL)
,('JGK','085','Lich Spellscribe','Character','Invest 2 {L}: Cast a copy of a spell that costs 2 or less in your hand, then Summon a Jigoku Skeleton Token.',NULL)
,('JGK','086','Stygian Icebreaker','Character','When played: Summon an Ice Wall Token. Ice Walls you control can attack if they have two or more cards tucked under them.','10036')
,('JGK','087','Stygian Oarman','Character','When played: If a Character died this round, draw a card.',NULL)
,('JGK','088','Army of Bones','Character','When played: Summon 6 Jigoku Skeleton Tokens, which must be tucked under this. If this has 10 cards tucked under it, it has Breakthrough.','10006')
,('JGK','089','Death''s Hound','Character','Reaction. When dealing CC damage: Shuffle a Death''s Mark Token into your deck.',NULL)
,('JGK','090','Eekum Bokum','Character','When played: Draw a card for each Eekum Bokum in your hand, Field, or discard pile.',NULL)
,('JGK','091','Gatekeeper of Pearl White','Character','Whenever you summon one or more Tokens, each player with a Tier II District may give 1 Barrier to a Character they control.',NULL)
,('JGK','092','Bone Appraiser','Character','Ward 1. Whenever a Token you Summon gives a Character one or more counters, you may give that Character an additional counter.','10008')
,('JGK','093','Sinner of Wrath','Character','When played: Deal 3 damage to a Character, and give its controller a Death''s Mark Token. Invest 2 {L}: Also deal 3 damage to all other Characters they control.',NULL)
,('JGK','094','Grim Reaper','Character','Lethal. When played: Add a Death''s Mark Token to your hand. If an opponent has 15 or less CC, you may instead play it without paying its cost.',NULL)
,('JGK','095','Ship of Nails','Character','Whenever you tuck an Undead under this, deal 1 CC damage to an opponent. When killed: Summon 3 Jigoku Skeleton Tokens.','10031')
,('JGK','096','Icetombed Godsoul','Character','Immortal 4: Sacrifice a Character. When played: Gain 4 Barrier. Characters can''t attack if they have Barrier counters.',NULL)
,('JGK','097','Claimed by the River','Spell','Give a Character -1/-1 for every 3 Characters in your discard pile.',NULL)
,('JGK','098','Red Tomorrow','Spell','Shuffle four Jigoku Skeleton Tokens into your deck.',NULL)
,('JGK','099','Accelerated Decay','Spell','Reaction. Destroy a Character with a card attached by anyone other than its owner.',NULL)
,('JGK','100','Relentless Death','Spell','Add two Death''s Mark Tokens to your hand.',NULL)
,('JGK','101','Spit Fire','Spell','Deal 4 damage to a Character. If it dies, Trash it and summon a Jigoku Skeleton Token.','10035')
,('JGK','102','Death''s Pardon','Spell','Afflict. When played: Detach any Death''s Mark Tokens on it. Attached Character has Immortal 1: 2 {L}.',NULL)
,('JGK','103','Freeze Over','Spell','Summon Ice Wall Tokens in 3 adjacent spaces. If a Character is already in that space, Restrain it instead.',NULL)
,('JGK','104','Reaper''s Scythe','Item','Equip. When played: Add a Death''s Mark Token to your hand. Attached Character has +2/+0. If an opponent has 15 or less CC, attached Character also has Lethal.',NULL)
,('JGK','105','Vinyl of Sin and Slipper','Item','When played and at the start of your turn, activate the current effect, then rotate this. Discard this once it returns to the upright position. | Add a random Token Sin to your hand. | Add a random Token Sin to your hand. | Add a random Token Sin to your hand. | If your CC is 15 or less, draw 3 cards.',NULL)
,('JGK','106','Reanimator''s Reliquary','Item','Deploy. Ward 3. End of Turn: Summon a Token copy of a Character in your discard pile.',NULL)
,('JGK','107','The River Styx','District','When played: Destroy a Character that costs 1 or less. If an opponent has 15 or less CC, Destroy a Character that costs 4 or less instead.',NULL)
,('JGK','T06','Jigoku Skeleton','Character','When drawn: Draw a card, then Summon this. When you Summon this, you may tuck this underneath a Character to put a +1 Attack or Health counter on it.','10018')
,('JGK','T07','Ice Wall','Character','Can''t Attack. Blockade. When Summoned: Put a Barrier counter on this.','024')
,('JGK','T08','Sin of the Maniac','Spell','Pay 5 CC. Give a Character you control +3 Health, then choose another Character to attack it.',NULL)
,('JGK','T09','Sin of the Wasted','Spell','Pay 5 CC. Remove all stat modifying counters from a Character, then reduce its stats to 1/1.',NULL)
,('JGK','T10','Sin of the Internet','Spell','Pay 5 CC. Chosen opponent reveals their hand, and you choose a card for them to discard.',NULL)
,('JGK','T11','Sin of the Rat','Spell','Pay 5 CC. Destroy the 3 Characters in the Field with the lowest Attack.',NULL)
,('JGK','T12','Sin of the Starving','Spell','Pay 5 CC. Restore 5 Health to all your Characters.',NULL)
,('JGK','T13','Sin of the Cringe','Spell','Pay 5 CC. Your cards have Ward 2 until the start of your next turn.',NULL)
,('JGK','T14','Sin of the Dancer','Spell','Pay 5 CC. Choose a Character. Restrain it, Reposition it, and give it +3 Attack.',NULL)
,('JGK','005','Pan;cre, Campus Bancho','Character','When attacking: Choose One: This gains +2/+0 this turn. | This gains +0/+3 this turn. Legend: Whenever you Choose One, you may pay 4 CC once to Choose one more option.',NULL)
,('JGK','108','Parasitic Imp','Character','Stealth. Immortal 1: 4 CC.',NULL)
,('JGK','109','Cloud of Bats','Character','If you control a Vampire, this has Convert.',NULL)
,('JGK','110','Corpse Butterfly','Character','When killed: Return a Character from your discard pile to your hand.',NULL)
,('JGK','111','Oni Tactician','Character','Whenever you Choose One, give another Character you control +1 Attack.',NULL)
,('JGK','112','Sadistic Overseer','Character','When played: You may deal 1 damage to a Character to give it +2 Attack.',NULL)
,('JGK','113','Barbed Imp','Character','Lethal. Whenever you discard a card, put a Stealth counter on this.',NULL)
,('JGK','114','Half-Horned Diva','Character','This has Convert while in the center space of your Field.',NULL)
,('JGK','115','Fluffy Firespouter','Character','When played: Deal 1 damage. This has Armored 1 if you discarded a card this turn.',NULL)
,('JGK','116','Devilish Patron','Character','When played: You may give another Character +2/+0. If you do, Choose One: Mill 2 cards | Take 3 CC damage | Discard a card | Chosen opponent Summons an Imp Token.',NULL)
,('JGK','117','Gatekeeper of Fool''s Gold','Character','Whenever you play or discard an Item, each player with a Tier II District may pay 2 CC to give a Character they control +2 Attack.',NULL)
,('JGK','118','Two-Faced Marksman','Character','Reach. When played: Choose One: Add a Death''s Mark Token to your hand | Pay 4 CC to destroy a Character.',NULL)
,('JGK','119','Demonic Nurse','Character','When played: Restore 5 Health. Then if the Character''s Health is full and you don''t control it, Rest it and take control of it for as long as you control this.',NULL)
,('JGK','120','Hypnotic Candlekeeper','Character','When played: For each empty adjacent space, Rest and take control of a peripheral Character until the end of the turn.',NULL)
,('JGK','121','Soul Judge','Character','Whenever you Choose One, deal 1 CC damage to all other players.',NULL)
,('JGK','122','Sinner of Pride','Character','When played: Give an opponent a Death''s Mark Token and Rest a Character they control. You control that Character until this leaves your Field.',NULL)
,('JGK','123','Abyssal Bookwyrm','Character','When killed: Draw 2 cards.',NULL)
,('JGK','124','Prince of Flame','Character','Whenever this attacks, Choose One: Deal 2 damage to all Characters | Deal 5 damage to a Character | Deal 3 CC damage to each player.',NULL)
,('JGK','125','Starlost Godsoul','Character','Immortal 4: Sacrifice a Character. Whenever a player plays a Character, they may give it +1/-1 for each Nexus Orb they have.',NULL)
,('JGK','126','Breaking Point','Spell','Reduce a Character''s maximum Health to 1, then give it +2 Attack.',NULL)
,('JGK','127','Left For Dead','Spell','Destroy a Character you control that is damaged or has a Death''s Mark Token attached. Draw 3 cards.',NULL)
,('JGK','128','Devilish Deed','Spell','Choose One: Draw 3 cards and pay 4 CC | Discard 2 cards to deal 4 CC damage to an opponent | Sacrifice a Character to restore 4 CC.',NULL)
,('JGK','129','Queen''s Decree','Spell','Each player may give you control of a Character they control. If they don''t, they discard a card and lose 2 CC.',NULL)
,('JGK','130','Infernal Contract','Item','Choose One: Summon an Imp Token | Discard a card to Rest and take control of a Character until the end of your turn.',NULL)
,('JGK','131','Devil''s Activator','Item','Reaction. Equip. Attached Character has +2/+1 and is a Demon in addition to its other types.',NULL)
,('JGK','132','Demon King''s Throne','Item','Deploy. You can play Characters on this. Characters on this have +1/+1 for each Character you control that you don''t own.',NULL)
,('JGK','133','Vinyl of Myth and Memories','Item','When played and at the start of your turn, activate the current effect, then rotate this. Discard this once it returns to the upright position. | Gain 1 {M} SP and Restore 2 Health. | Gain 1 {C} SP and chosen opponent mills 2 cards. | Gain 1 {N} SP and give a Character +2/+0. | Gain 1 {T} SP and Sift 2.',NULL)
,('JGK','134','Demon Academy','District','When played: Draw a card. If you don''t play it by the end of the turn, discard it.',NULL)
,('JGK','T15','Imp','Character','Overpass. Can''t Block.',NULL)
,('JGK','006','Drov''a, Blade of Spirits','Character','Reaction. Legend: As a Reaction once per turn, you may Trash 3+X cards from your discard pile to give a damaged attacking or blocking Character +X/+0 and Quick Strike this turn.',NULL)
,('JGK','007','Death Sensei','Character','Whenever an opponent plays a Character with 4 or more Health, add a Death''s Mark Token to your hand. Legend: Immortal can''t be activated. Characters can''t be removed from discard piles.',NULL)
,('JGK','135','Ravensong','Spell','Flurry 4. Summon a Decay Crow Token. Chosen opponent mills 2 cards. Give a Character you control +0/+1.',NULL)
,('JGK','136','Ball of Skeletons','Character','As a Reaction, you may detach a card or discard a tucked card to Reposition this. When killed: Summon X Jigoku Skeleton Tokens, where X is the number of cards attached or tucked underneath this.',NULL)
,('JGK','137','Ghostfire Oni Duelist','Character','Twin Strike. Only one Character can block this, and this can''t block alongside other Characters.',NULL)
,('JGK','138','Jacket Spikes','Item','Equip. Attached Character has Ward 2 and "When damaged by a Character: Attach a Death''s Mark Token to that Character.',NULL)
,('FAL','001','Cee Kei, Inspiring Leader','Character','Haste, Leader. Legend: When you attack with exactly one Character of each color, they can''t be damaged or destroyed until your next turn.',NULL)
,('FAL','027','Cog Soldier','Character','When played: If a Start of Turn effect happened this turn, gain +2 Attack.',NULL)
,('FAL','028','Elemental Adept','Character','When played: Search your deck for a Nature, Earth, Fire, Ice, or Lightning spell. Put it on top of your deck.',NULL)
,('FAL','029','Horned Skeleton','Character','When killed: Choose One: Deal 1 damage to a Character | Give a Character +1/+0.',NULL)
,('FAL','030','Pebble Flinjer','Character','When played: Add an Earth Jolem Token to your hand.',NULL)
,('FAL','031','Stage Janitor','Character','When played: If there is a Character in the center space of your Field, Reposition it.',NULL)
,('FAL','032','Unhinged Devotee','Character','When played: Summon a Panicked Civilian for an opponent.',NULL)
,('FAL','033','Patrolling Officer','Character','Reaction. Intercept - As a Reaction, you may detach an Item from this to reposition it.',NULL)
,('FAL','034','Ventilation Rats','Character','Stealth. Can''t be blocked by Characters with 5 or more Attack.',NULL)
,('FAL','035','Blood-Oath Blade','Character','When destroyed by exactly 1 damage, this instead survives at 1 Health.',NULL)
,('FAL','036','Midnight Patron','Character','Leader. Invest 4 {L}: Summon a Crowd Token. While Invested this has +3/+1.',NULL)
,('FAL','037','Transcendent Agent','Character','Ward 1. When blocking: Put an Implanted Memory on top of attacking player''s deck.',NULL)
,('FAL','038','Acrylic Collector','Character','Whenever you create one or more Tokens, you may return this to your hand from your discard pile.',NULL)
,('FAL','039','Arjebee Archmagus','Character','Ward 1. Whenever you pay more than one Nexus type while playing a card, draw a card.',NULL)
,('FAL','040','Generous Bonefactor','Character','Immortal 1: 2 {L}. When killed: Summon a Jigoku Skeleton Token for any player.',NULL)
,('FAL','041','Kusa Clipper','Character','Reaction. When played: Duplicate the last triggered effect.',NULL)
,('FAL','042','Cosmos Elemental','Character','Constellation: This has Attack and Max Health equal to the number of Nexus Orbs you have.*',NULL)
,('FAL','043','Super Suit Skyknight','Character','Overpass. If you control a {N} Character, this has Breakthrough. Same for {T} and Armored 2, {M} and Ward 2, {C} and Convert.',NULL)
,('FAL','044','Ruin Speaker','Character','Haste. When played: Discard two cards. If you discarded less, mill the remainder. When killed: Draw Ruins X cards.',NULL)
,('FAL','045','Augmenting Matrix','Character','Characters you control have +2/+2 for each card attached to them.',NULL)
,('FAL','046','Contorted Oculomare','Character','Stealth. Unveil - Whenever this removes its Stealth counters, transform a Character across or peripheral to this into a Cowering Civilian Token.',NULL)
,('FAL','047','Marble Enceinte','Character','When played: Copy all non-damage counters on other cards you control onto this. This has Ward 10 if it has 10 or more counters.',NULL)
,('FAL','048','Obsessive Rembergast','Character','When played: For each player, name a card. They Reclaim all copies of that card in their discard pile.',NULL)
,('FAL','049','Red Titan','Character','End of Turn: This gets -1/-1. When this has 5 or less Health, all Characters in the Field take damage equal to its Attack.',NULL)
,('FAL','050','Upper Class Feud','Spell','Each player may Choose One: Search their deck for a card with Invest and draw it. | Discard the highest cost card in their hand, then search their deck for a 1 cost card and draw it.',NULL)
,('FAL','051','Cancer Cluestar','Spell','Choose One: Shuffle a Character from each Field into its owner''s deck | Flip 3 coins. If all are heads, draw 3 cards. | Replace the type of all Characters in the Field with "Crustacean Crab.',NULL)
,('FAL','052','Confiscation','Spell','Reaction. Each opponent discards all Tokens in their hand. Add X Stardust Tokens to your hand, where X is the total number of cards discarded.',NULL)
,('FAL','053','First Blood','Spell','Reaction. Deal 1 damage to a Character. Give it First Strike until end of turn.',NULL)
,('FAL','054','Mass Suggestion','Spell','Look at the top 5 cards of an opponent''s deck. Move any Characters you find to the bottom.',NULL)
,('FAL','055','Entrench','Spell','Restore 3 CC. At the end of your next combat, any Characters that could attack and didn''t get +1/+1.',NULL)
,('FAL','056','Plaza of Heroes','District','Your Legendary Characters cost 1 {L} less. If your deck started with no duplicates, they cost 1 colored SP less instead.',NULL)
,('FAL','057','Ritual Cityscape','District','You may play Ritual Cityscape on a Tier I District even if it is your last visible Tier I District. If there are four Ritual Cityscapes in your District Zone, you may pay 2 CC instead of 2 {L} when playing a colored card.',NULL)
,('FAL','058','Monument to the Undying','District','Whenever you trigger Immortal, put a Time counter on this. Remove 9 Time counters from this: Destroy all Characters.',NULL)
,('FAL','T01','Death''s Mark','Spell','Afflict. When played: Put 4 Time counters on this. At the end of controlling player''s turn, remove 2 Time counters from this. When this reaches 0 Time counters, destroy attached Character. Characters killed in this way can''t trigger Immortal.',NULL)
,('FAL','002','Shikaku, Benevolent Beastmaster','Character','After a Beast attacks, restore it to full Health. Legend: Your Characters with full Health have +1/+1.',NULL)
,('FAL','059','Stardust Channeler','Character','Pay 3 {L} and Exhaust: Add a Stardust Token to your hand.',NULL)
,('FAL','060','Apostle of the Twins','Character','Invest 1 {N} 1 {L}: Draw a card for each Character you have exactly two of in the Field.',NULL)
,('FAL','061','Shini-kai Fist-Thrower','Character','Flurry 3. When Played: This may attack a Character you don''t control.',NULL)
,('FAL','062','Flame Weaver','Character','When played: Deal 2 damage. Invest 2 {N}: Instead deal 4 damage. If this kills a Character, Trash it and all Items attached to it.',NULL)
,('FAL','063','Frost Channeler','Character','Your Ice Wall Tokens can''t be destroyed by spells. Invest 1 {M}: Summon an Ice Wall Token.',NULL)
,('FAL','064','Rippling Dancer','Character','When attacking; if Invested: Reposition this. Invest 1 {T}: Restore 2 Health to adjacent Characters.',NULL)
,('FAL','065','Scavenging Beast','Character','When attacking: Trash a card from your discard pile. If you don''t, this takes 1 damage.',NULL)
,('FAL','066','Fountain Spirit','Character','Blockade. Start of Turn: Restore 3 CC.',NULL)
,('FAL','067','Gildleaf Skyknight','Character','Overpass. While Invested, this has Ward 2. Invest 2 {N}: Restore 4 CC.',NULL)
,('FAL','068','Sandstream Elemental','Character','Breakthrough. Reaction: Any player Sifts and mills.',NULL)
,('FAL','069','Ulm-Arbor Administrator','Character','When played: Search your deck for a District and play it. Give a Character +X Health, where X is the number of Orbs on the District.',NULL)
,('FAL','070','Urban Stalker','Character','Flurry 1. When played: Add a Death''s Mark Token to your hand.',NULL)
,('FAL','071','Keeper of the Rings','Character','Start of Turn: Give +0/+2 to a Character you control.',NULL)
,('FAL','072','Sundial Seneschal','Character','Start of Turn: Your Characters with Start of Turn effects deal damage equal to their Max Health instead of their Attack this turn.',NULL)
,('FAL','073','Dragonfist Paragon','Character','Breakthrough. Immortal 1: Trash a card from the top of your deck. Retribution - When damaged: Deal 2 damage, twice.',NULL)
,('FAL','074','Wandering Treehome','Character','Overheal: This gains +4/+4 this turn. Invest 1 {M}. While Invested, this has Ward 3.',NULL)
,('FAL','075','Golden Sunbeam','Spell','Additional cost: Remove all Invest counters on a Character. Deal 2X damage to a Character, where X is the number of counters removed. If this kills a Character, Trash it.',NULL)
,('FAL','076','Persist','Spell','Afflict. When it would be destroyed, remove this instead and it survives at 1 Health, then draw a card.',NULL)
,('FAL','077','Destructive Orders','Spell','Choose One: Give a Character +2/+2 this turn | Destroy an Item.',NULL)
,('FAL','078','Drizzle','Spell','Restore 2 Health to all Characters you control. Draw a card.',NULL)
,('FAL','079','Landslide','Spell','Downgrade a District you control. Deal 1/3/7 damage to all Characters, depending on the District''s Tier.',NULL)
,('FAL','080','Momentum','Spell','Give a Character +X/+X this turn, where X is the number of cards you played this turn.',NULL)
,('FAL','081','Reinforcements','Spell','Search the top 5 cards of your deck for up to two Characters and put them in your hand. Invest 4 {N}: Summon them instead.',NULL)
,('FAL','082','You Lookin For a Fight?','Spell','Search your deck for a Character and put it on top of your deck. An opponent you choose must attack you with a Character of their choice, which you may block.',NULL)
,('FAL','083','Fatal Shot','Spell','Destroy a Character.',NULL)
,('FAL','084','Sandstorm','Spell','Reaction. Attacking Characters deal 0 damage and Defending Characters can only block across this turn.',NULL)
,('FAL','085','Star Fury','Spell','Constellation - Give a Character +X/+X this turn, where X is the number of Nexus Orbs you have. If X is 7 or greater, also give them Breakthrough.',NULL)
,('FAL','086','Elemental Cascade','Spell','Reveal the top 5 cards of your deck. Play any Nature, Earth, Fire, Ice, or Lightning Spells revealed other than Nature''s Fury without paying for their costs. Then Trash all of those cards.',NULL)
,('FAL','087','Gildleaf Rapier','Item','Equip. Attached Character has +X/+0 and Ward X, where X is the number of Invest counters on it.',NULL)
,('FAL','088','Hot Springs Egg','Item','Restore 2 Health. Then draw a card if that Character was Invested.',NULL)
,('FAL','089','Roll the Bones','Item','Flurry. Roll 1d6: | 1-3: Shuffle a Jigoku Skeleton Token into your deck. | 4-5: Shuffle two. | 6: Shuffle two, then draw a card.',NULL)
,('FAL','090','Crow Whistle','Item','Summon three Decay Crow Tokens. If a Character died this turn, Summon two more.',NULL)
,('FAL','091','Sieve-Mesh Shield','Item','Equip. When played: Give attached Character 1 Barrier. Whenever a Barrier you control breaks, Sift 1.',NULL)
,('FAL','T02','Decay Crow','Character','Deathcoil, Haste. End of Turn: Trash this.',NULL)
,('FAL','T03','Shini-kai Fist-Thrower','Character','When Summoned: This may attack a Character you don''t control. End of Turn: Trash this.',NULL)
,('FAL','T04','Urban Stalker','Character','When Summoned: Add a Death''s Mark Token to your hand. End of Turn: Trash this.',NULL)
,('FAL','003','Pryos of the Six Stars','Character','When attacking: Add a Stardust Token to your hand. Legend: Discard six Stardust Tokens from your hand: Search your deck for a Legendary Character and Summon it.',NULL)
,('FAL','092','Apostle of the Lion','Character','Invest 1 {T} 2 {L}: Deal 3 damage to two different targets.',NULL)
,('FAL','093','Gem Merchant','Character','When played: Reveal the top card of your deck. If it''s an Item, gain 3 CC. Allocate 1 {L}.',NULL)
,('FAL','094','Paradoxical Grandchild','Character','If a player plays a copy of a card they have in the Field, they take 3 CC damage.',NULL)
,('FAL','095','Spotlight Engineer','Character','When played: Put a +1/+1 counter on the Character in the center space of your Field.',NULL)
,('FAL','096','Star Conductor','Character','Pay 3 {L}: Reposition a Character that is to the left of this one.',NULL)
,('FAL','097','Dual-Wielding Kronie','Character','Twin Strike. Whenever this attacks, Sift 1.',NULL)
,('FAL','098','Fluffy-Tailed Favorite','Character','Whenever this is the target of a Spell or Item, Reposition it.',NULL)
,('FAL','099','Nintol Mechanic','Character','Reaction. When played: Detach a card from a Character and return it to its owner''s hand.',NULL)
,('FAL','100','Shortstack Singer','Character','Your Characters to the left have Armored 1. Your Characters to the right have Breakthrough.',NULL)
,('FAL','101','Unidentified Object from Area 15','Character','Overpass. Whenever this deals CC damage, shuffle an Implanted Memory Token into defending player''s deck.',NULL)
,('FAL','102','Watcher of Hours','Character','Armored 1. Start of Turn: Sift 1.',NULL)
,('FAL','103','Meteor Miner','Character','Whenever you discard one or more Rocks, reveal the top card of your deck, then move it to the bottom. If it is a Rock or District, gain 2 {L}.',NULL)
,('FAL','104','Ouroboric Skyknight','Character','Overpass. Start of Turn: You may return another Character you control to your hand.',NULL)
,('FAL','105','Virtual Diva','Character','Whenever this enters the center space of your Field: A Spell in your discard pile that costs 5 or less gains Echo 3 {L} this turn.',NULL)
,('FAL','106','Asteroid Golem','Character','When killed: Add two Earth Golem Tokens to your hand.',NULL)
,('FAL','107','Scavenging Sound Crew','Character','Whenever this enters the center space of your Field: Distribute Ruins X +1 Attack counters among Characters you control.',NULL)
,('FAL','108','Twelfth Gear Administrator','Character','When played: Search your deck for a District and play it. Draw X+2 cards then discard X cards, where X is the number of Orbs on the District.',NULL)
,('FAL','109','Flowing Beauty','Character','Whenever this leaves the center space of your Field: Discard any number of cards, then draw that many cards.',NULL)
,('FAL','110','Starfuel Annihilator','Character','Armored 3. Constellation: Costs 1 {L} less for each Nexus Orb you have.',NULL)
,('FAL','111','Revert','Spell','Reclaim the top card of your discard pile. Sift 1.',NULL)
,('FAL','112','Call of the Wanderer','Spell','Search your deck for a District and put it in your discard pile. Constellation: If you did, Reclaim up to X other cards, where X is the number of Nexus Orbs you have.',NULL)
,('FAL','113','Split Second','Spell','Reaction. Counter a card or ability with Reaction. Draw a card. Can''t be Reacted to.',NULL)
,('FAL','114','Starlit Song','Spell','Reposition a Character. Constellation: Give it +X Health, where X is the number of Nexus Orbs you have.',NULL)
,('FAL','115','Eternalize','Spell','Destroy a Character. Costs 1 {L} less if your opponent''s Legend Zone is empty. Costs 1 {L} less if targeting a Legendary Character.',NULL)
,('FAL','116','Time Loop','Spell','All players Reclaim all cards that entered their discard pile since the end of your last turn. Return all Characters played since the end of your last turn to their owner''s hands.',NULL)
,('FAL','117','Genesis','Spell','Discard your hand. Draw 4 cards. Fill your Field with Rocks from your discard pile.* They have Ephemeral (Trash them if they are destroyed).',NULL)
,('FAL','118','Mining Permit','Item','Shuffle two Earth Golem Tokens into your deck. Put two into your discard pile. Allocate 1 {L}.',NULL)
,('FAL','119','Size Limiter','Item','Set a Character''s base stats to 3/3. Remove all +Attack and +Health counters on it.',NULL)
,('FAL','120','Blessed Soda','Item','Equip. As a Reaction, Destroy this to give attached Character +1/+1. It can''t take damage or be destroyed this turn.',NULL)
,('FAL','121','Dazzling Pickaxe','Item','Equip. Attached Character has Breakthrough. When attached Character attacks, you may deal 2 damage to a Rock to add an Earth Golem Token to your hand.',NULL)
,('FAL','122','The Cosmic Hourglass','Item','Deploy. As a Reaction, pay 2 {L}: Copy the last triggered ability.',NULL)
,('FAL','123','Mobilization Protocol','Item','Equip. As a Reaction, Detach this to give adjacent Characters Overpass this turn.',NULL)
,('FAL','124','Monolith of Extinction','Item','Deal 11 damage to all Characters with 3 or more Attack. When discarded: Deal 4 damage to a Character.',NULL)
,('FAL','T05','Stardust','Item','Afflict. When played: Attached Character gets -1/-0, and its controller restores 2 CC.',NULL)
,('FAL','004','Matsu, Star of the Party','Character','Leader. Legend: Whenever you play a Token from your hand, you may instead play it as a Crowd Token.',NULL)
,('FAL','125','Glintveil Thief','Character','Whenever you reveal one or more cards from a deck, you may pay 2 {L} to draw a card.',NULL)
,('FAL','126','Apostle of the Sakura','Character','Invest 1 {M} 1 {L}: Give 1 Barrier to a Character you control. Then deal 2 damage to it if you have less than 5 Nexus Orbs.',NULL)
,('FAL','127','Duskleaf Defector','Character','Characters with 1 attack must block this. Invest 1 {C} 1 {L}: Gain Convert.',NULL)
,('FAL','128','Electric Fairy','Character','Overpass. Invest 1 {T} 1 {L}: The Character in the center space of your Field has +2/+2 while this is Invested.',NULL)
,('FAL','129','Gildleaf Aspirant','Character','Overheal: Gain +2 Attack.',NULL)
,('FAL','130','Mistveil Archer','Character','Exhaust: Put a Stealth counter on this if it doesn''t have one. Exhaust: Remove all Stealth counters from this and deal 2X damage to a Character, where X is the number of Stealth counters removed.',NULL)
,('FAL','131','Runic Stargazer','Character','When played or discarded: Spy 2: Your deck. You may rearrange them.',NULL)
,('FAL','132','Vel''nama Diplomat','Character','Invest 1 {N} 1 {M} 3 {L}: Put an Invest counter on each card you control with an Invest counter, then reactivate those Invest effects. Allocate 2 {L}.',NULL)
,('FAL','133','Magic Monopolist','Character','Whenever a Token is Summoned in the Field not under your control, it''s controller takes 1 CC damage. Allocate 2 {L}.',NULL)
,('FAL','134','Sol Sector Administrator','Character','When played: Search your deck for a District and play it. Allocate 2 {L}.',NULL)
,('FAL','135','Ulm-Arbor Cleric','Character','Overheal: Put a +1/+1 counter on the healed Character. Invest 1 {N}: Restore 3 Health.',NULL)
,('FAL','136','Nebula Jelly','Character','Ward 2. When played: Reveal the top card of your deck. This card may consume it to gain +1/+1.',NULL)
,('FAL','137','Tamar Astrologist','Character','When played: Reveal the top card of your deck and an opponent''s. If they share a card type, put an Implanted Memory underneath that opponent''s top card.',NULL)
,('FAL','138','Old-Blood Defiler','Character','Leader, Lethal. Invest 2 {C}: This gains Immortal 3: Sacrifice two Characters you control. Cultists, Clerics, and Eldritch count for two.',NULL)
,('FAL','139','Binary Sunsoul','Character','When played: Reveal the top card of your deck. If it has a higher Nexus Cost than this, Summon a Token copy of this.',NULL)
,('FAL','140','Starblazer Skyknight','Character','Overpass. Whenever you reveal one or more cards from your deck, Summon an Earth Golem Token in the first open space on the left.',NULL)
,('FAL','141','Hatebearer Cultist','Character','This has +2 Attack for each Character in a Field you don''t control.',NULL)
,('FAL','142','Heavensent Shuriken','Character','Overpass. Once per turn, pay 2 {L}: Reveal the top card of each deck. Deal 2 CC damage to each player that revealed a card with 3 or more Nexus cost.',NULL)
,('FAL','143','Covetous Starscale','Character','Hoard. When attacking: Reveal the top X cards of defending player''s deck, where X is the number of Spells this has hoarded. Pick one for them to mill, then shuffle the others back into their deck.',NULL)
,('FAL','144','Living Meteor','Character','When played: Deal 5 damage to a Character and Summon two Earth Golems in adjacent spaces in the Field. Allocate 2 {L}.',NULL)
,('FAL','145','Star Swallower','Character','Reach. When played: Constellation: Gain X Barrier, where X is the number of Nexus Orbs you have. Each barrier counter you control also gives Ward 2.',NULL)
,('FAL','146','Royal Command','Spell','Put a Barrier on your CC. Draw a card.',NULL)
,('FAL','147','Hyperfrigerate','Spell','Deal 4 damage to an Exhausted Character. If it dies, Summon an Ice Wall Token in its space.',NULL)
,('FAL','148','Premonition','Spell','Spy 3: Your deck. Draw one of them.',NULL)
,('FAL','149','Starfall','Spell','Reveal the top X cards of your deck, one at a time*. For each, you may deal damage equal to its cost to a Character. If you do, Trash that card.',NULL)
,('FAL','150','Descent from Tengoku','Spell','Search your deck for a Celestial and put it on top. If your CC is less than 10, reveal it and gain CC equal to its cost.',NULL)
,('FAL','151','Storm Surge','Spell','Deal 3 damage to 3 adjacent spaces in the Field. A Character you control across from one of those three spaces gets a +1/+1 counter for each Character this killed.',NULL)
,('FAL','152','Invocation of the Moon','Spell','For the rest of the game, all players play with the top card of their deck revealed. As a Reaction, you may pay 1 {L} to move the top card of a player''s deck to the bottom.',NULL)
,('FAL','153','Sparkling Moai','Item','Start of Turn: Put a damage counter on this. If this has 1 or more damage counters on it, Transform this into an Earth Golem Token. Invest 1 {M} 1 {L}: Instead, If this has 2 or more damage counters on it, Transform this into an Asteroid Golem.',NULL)
,('FAL','154','Blade of Earth','Item','Equip. Attached Character has +1/+1 for each Rock in your Field.',NULL)
,('FAL','155','Luminous Starchart','Item','Equip to a District. If it has (or is tied for) the most Orbs of Districts you control, it has an additional Orb of a color it produces. Allocate 1 {L}.',NULL)
,('FAL','156','Bag of Gemstones','Item','Add three Earth Golem Tokens to your hand. Until your next turn, all your Characters have Ward 1.',NULL)
,('FAL','157','Fractaled Window','Item','Destroy a Character. Costs 1 {L} more for each space between that Character and the edge of the Field.',NULL)
,('FAL','T06','Jigoku Skeleton','Character','When drawn: Draw a card, then Summon this. When you Summon this, you may tuck this underneath a Character to put a +1 Attack or Health counter on it.',NULL)
,('FAL','T07','Ice Wall','Character','Can''t Attack. Blockade. When Summoned: Gain 1 Barrier.','10015')
,('FAL','T08','Earth Golem','Character',NULL,NULL)
,('FAL','T09','Crowd','Character','Crowd 3: When played or Summoned, put 3 +1/+1 counters on this. Can''t Attack or Defend without a Leader. Each turn you don''t control a Leader, remove one non-damage counter from this.',NULL)
,('FAL','T10','Implanted Memory','Spell','This also counts as a Character, Item, and District while in your hand. Can''t be discarded.',NULL)
,('FAL','005','Dashi, Evil Supreme','Character','Once per Round, Sacrifice a Character: Put a +1/+1 counter on this. Legend: All CC damage is amplified by the number of +1/+1 counters on this.',NULL)
,('FAL','158','Apostle of the Oni','Character','Invest 2 {L}: Choose One to gain: Haste, Lethal, Stealth, Quick Strike.',NULL)
,('FAL','159','Backup Dancer','Character','Pay 2 {L}: Reposition this with another Character that costs more.',NULL)
,('FAL','160','Crowdchasing Tendril','Character','Reach. When played: Summon two Panicked Civilian Tokens for an opponent.',NULL)
,('FAL','161','Corruption Beast','Character','When played: Summon a Leeching Void Token in an empty space for an opponent.',NULL)
,('FAL','162','Meat Collector','Character','When killed: Summon three Cowering Civilian Tokens for the opponent that killed this.',NULL)
,('FAL','163','Murder Accomplice','Character','When played: Summon a Decay Crow Token in adjacent spaces.',NULL)
,('FAL','164','Astroplasm','Character','Immortal 3: Mill 3 cards.',NULL)
,('FAL','165','Fantastical Balladeer','Character','Start of Nexus Phase: Exhaust this to gain 2 Orbs of one Nexus type this turn. Your Characters with base stats 3/4 have +2 Attack.',NULL)
,('FAL','166','Living Legend','Character','If there is a Legend in your Legend Zone, this has all non-Legend text of that card.',NULL)
,('FAL','167','Maitako Inkshaper','Character','Stealth. Whenever a Character gains a Stealth Counter, Summon a Leeching Void Token for an opponent.',NULL)
,('FAL','168','Noctic Merchandiser','Character','Whenever you discard a card, you may search your deck for a card of a different Nexus type and put it on top of your deck. Allocate 2 {L}.',NULL)
,('FAL','169','Predatory Void','Character','Stealth. Whenever this kills a Character, put a +1/+1 counter on this.',NULL)
,('FAL','170','Twintail Tsundere','Character','Whenever this enters the center space of your Field: Deal 2 CC damage to all players.',NULL)
,('FAL','171','Fateweaver','Character','Immortal 1: Discard a card. Pay 3 {L}: Remove or add a counter from each attached card you control.',NULL)
,('FAL','172','Overworked Administrator','Character','When played: Search your deck for a District and play it. Whenever this is Exhausted, Rest another Character you control.',NULL)
,('FAL','173','Unraveling Skyknight','Character','Overpass. When played: Give all Characters -1/-1.',NULL)
,('FAL','174','Crawler from Beyond','Character','Deathcoil. Immortal 8: Mill 8 cards. Can''t be blocked by Characters with 2 or less Attack.',NULL)
,('FAL','175','Demonic Skyknight','Character','Overpass. When attacking: Choose One: Your other attacking Characters have +2 Attack this turn | Your other attacking Characters +2 Health this turn.',NULL)
,('FAL','176','Blood Star Diamond','Character','Constellation: When damaged, deal X CC damage split among players and restore 3 CC, where X is the number of Nexus Orbs you have.',NULL)
,('FAL','177','Great Old Void','Character','Immortal 8: Sacrifice your other Characters (minimum 1). Whenever you sacrifice a Character, another Character gets -X/-0, where X is sacrificed Character''s Attack.',NULL)
,('FAL','178','Aura of Terror','Spell','Afflict. Attached Character can''t be blocked by Characters with 2 or less Attack.',NULL)
,('FAL','179','Spreading Panic','Spell','Summon three Cowering Civilian Tokens for an opponent and three Panicked Civilian Tokens for yourself.',NULL)
,('FAL','180','Connecting Worlds','Spell','Attach to a Tier II or III District. Attached District loses all card text but gains one Orb of each color.',NULL)
,('FAL','181','Fervent Wish','Spell','Gain 1 {N} if you control a {N} Character. Repeat for {T}, {M}, and {C}. Draw a card.',NULL)
,('FAL','182','Business As Usual','Spell','Afflict. Each player can only play one card per turn.',NULL)
,('FAL','183','Declaration of War','Spell','For each Character in a Field you don''t control, put a +1/+1 counter on a Character you control.',NULL)
,('FAL','184','Fight or Flight','Spell','Choose One: Transform a Character into a Panicked or Cowering Civilian',NULL)
,('FAL','185','Price of Obsession','Spell','Pay 7 CC. Draw 7 cards. If you have a Legend in your Legend Zone, Trash it.',NULL)
,('FAL','186','Assemble Generation','Spell','Put a +1/+1 counter on up to five Characters you control. This turn, they can''t be blocked by Characters with 2 or less Attack.',NULL)
,('FAL','187','Bad Ending','Spell','Name a Nexus Type other than Local. Destroy all Characters of other Types.',NULL)
,('FAL','188','Ephemeral Lyrics','Item','Each player mills a card. If a Character was milled, that player may Reposition a Character they control. Echo 1 {T} 1 {L}',NULL)
,('FAL','189','Warp Hat','Item','Equip. Pay 3 {L}: Reposition this Character. If Attached Character swapped with another Character, put a +1/+1 counter on this Character, then attach this to the other one.',NULL)
,('FAL','190','Anomalous Rift','Item','Deploy in any Field. Start of Turn: Search controlling player''s deck for the topmost Character and Summon it in an adjacent space as a 1/1 that can''t block.',NULL)
,('FAL','T11','Leeching Void','Character','A character can be played on this, causing this to Afflict. Attached Character has -2/-0.',NULL)
,('FAL','T12','Panicked Civilian','Character','Can''t block.',NULL)
,('FAL','T13','Cowering Civilian','Character','Can''t attack.',NULL)
,('FAL','006','The Grim Reaper''s Apprentice','Character','When attacking: Remove up to four non-damage counters from cards in the Field. Legend: Once per turn, 3 {L}: Attach a Death''s Mark Token to a Character.',NULL)
,('FAL','007','The Phoenix Knight','Character','Whenever this Repositions: Put a +1/+1 counter on this. While this is in your Legend Zone or discard pile, you may pay 3 {N} 2 {M} 2 {L} to recast it.',NULL)
,('FAL','008','The Priestess of the Ancient Ones','Character','Your Tokens have Convert. Legend: Whenever you draw a card, restore 1 CC and each opponent loses 1 CC.',NULL)
,('FAL','009','The Last Atlantean','Character','Breakthrough. Legend: Your attacking Characters have +Ruins X Attack',NULL)
,('FAL','010','The Time Traveling Detectives','Character','When played: Set the Turn Counter to 5. Legend: Whenever you look at cards from a player''s deck, Reclaim the bottom card of your discard pile.',NULL)
,('FAL','011','The Embodiment of Hope','Character','Overpass. Legend: At the start of your Field Phase, Choose One: Restore X CC | Each player discards their highest cost card that costs X or less, where X is the number of Characters in your Field.',NULL)
,('FAL','012','The Speaker of Space','Character','Constellation: At the start of each Combat Phase, you may discard a card to give this +4/+4 this turn for each Nexus Orb you have. Legend: Your District Zone gains two additional spaces.',NULL)
,('FAL','013','The Keeper of Nature','Character','Overheal: Your other Characters gain +1/+1 until end of turn. Legend: Pay 2 {N}: Restore 3 Health, then Restore 3 Health.',NULL)
,('FAL','014','The Warden of Time','Character','When played: For each counter in the Field, duplicate or remove it. Legend: Start of Turn: Give a Character Quick Strike until end of turn.',NULL)
,('FAL','015','The Guardian of Civilization','Character','When played: Search your deck for a Tier III District and put it in your Field, ignoring Tier rules. Downgrade all your other Districts. Legend: Your Districts generate orbs again during your District Phase. You may play cards during your District Phase.',NULL)
,('FAL','016','The Harbinger of Chaos','Character','When played: All players give their hand to the player on their right. Legend: Whenever you mill a card, roll a d6: 1 - Trash it. | 4 - Reclaim it. | 5 - Draw it. | 6 - If you can pay for it, you may play it.',NULL)
,('FAL','017','Whenever a card enters a discard pile, you may pay 1 {L} to instead set it aside with a Bookmark counter. Legend: Once per turn, you may play a copy of a card with a Bookmark counter, as if all of its cost was {L}. Cards played this way have Ephemeral.','Character','Whenever a card enters a discard pile, you may pay 1 {L} to instead set it aside with a Bookmark counter. Legend: Once per turn, you may play a copy of a card with a Bookmark counter, as if all of its cost was {L}.',NULL)
,('FAL','018','The Jewel of Emotions','Character','Your cards have Ward Discard 1. Legend: Whenever you discard a card, duplicate a card in your hand that costs less.',NULL)
,('FAL','019','The Demon of Sound','Character','All other Characters must attack each turn, if able. Legend: End of Turn: Choose One for each Field: Silence a Character until your next turn | Exhaust a Character | Deal 1 damage to a Character | Remove a counter from a Character.',NULL)
,('FAL','020','The Twin Demonic Guard Dogs','Character','Twin Strike. When played: Destroy an Item. Legend: Your Beasts and Demons have Flurry 1.',NULL)
,('FAL','021','The Inevitability Constant','Character','Immortal 3: Skip your next Draw Phase. Legend: Your Start of Turn effects also trigger at the end of your turn.',NULL)
,('FAL','022','High Councillor Arivyrre','Character','Ward 3. Legend: Your Elves have Invest 3 {L}: Gain +2/+2 in addition to other Invest effects they may have.',NULL)
,('FAL','023','Veeto, Midnight Sensation','Character','Convert. Legend: Whenever you restore Health or CC, you may Exhaust one Character you control to restore 3 more.',NULL)
,('FAL','024','Katherine, Star Tracer','Character','Overpass. Add Katherine''s Attack to X for your Constellation effects. Legend: Whenever you Reveal a card from your deck that isn''t in your Field or discard pile, give a Character you control +1/+1.',NULL)
,('FAL','025','Connie, Daremo Daisuki','Character','When played: Gain +1 Attack for each Entertainer and +2 for each HoloEN Legend you control. Legend: Pay 2 {L}: Discard a card, then draw a card. If the drawn card is an Entertainer or HoloEN Legend, gain 1 SP of any color.',NULL)
,('FAL','026','Novum, Architect of Delusion','Character','When played: If another player has a Legend in their Legend Zone, Tuck all Characters you don''t control under this and replace them with Cowering Civilian Tokens. When killed: Return all tucked Characters to their owner''s Fields. Legend: Tokens deal 1 less damage to your CC. All Civilians are Cultists.',NULL)
,('FAL','191','Bulwark Fortifier','Character','Whenever you Sift and mill, give a Character +1 Health and Blockade this turn.',NULL)
,('FAL','192','Fourth Dimension Fauchard','Item','Equip. Attached Character has +2 Attack, First Strike, and "Start of Turn: If attached Character is in the Field, remove it. If attached Character isn''t in the Field, return it to an empty space in your Field.',NULL)
,('FAL','193','Currency Caster','Character','Whenever you cast a Nature, Earth, Fire, Ice, or Lightning Spell, your next Invest costs 1 {L} less, or 1 colored SP less of that Spell''s color.',NULL)
,('FAL','194','Gildleaf Gifting','Spell','Remove an Invest counter from a Character. Reactivate its Invest ability.',NULL)
,('FAL','195','Vacationing Draco','Character','Can''t Attack. Retribution - When damaged: Another Character you control attacks the damage source (Character or player).',NULL)
,('FAL','196','Training Montage','Spell','Deal 1 damage to a Character. Put a +1/+1 counter on it. Repeat up to 3 times.',NULL)
,('FAL','197','Fabricator Android','Character','When played: Duplicate all Tokens in your hand.',NULL)
,('FAL','198','Dream Visor','Item','Afflict. When played: Look at an opponent''s hand and Choose One non-Token card. They must shuffle it back into their deck. Put an Implanted Memory in their hand in its place.',NULL)
,('FAL','199','Starlight Racer','Character','Whenever this Repositions, put a Stardust Token in each empty space it passed over. They don''t activate or attach until a Character is played on them.',NULL)
,('FAL','200','Holographic Idol Outfit','Item','Equip. Attached Character has +1/+1 for each color among Characters you control.',NULL)
,('FAL','201','Silver Gate Sentinel','Character','Stealth. Remove a Stealth counter from this: Spy 3: Any player.',NULL)
,('FAL','202','Forbidden Ritual','Spell','Each player discards their hand and loses 2 CC for each Character discarded this way. Then, each player draws 4 cards.',NULL)
,('FAL','203','Nexus to The Eternal Clockworks','District','Start of Turn: Draw a card. Constellation: During your Nexus Phase, you may pay 5 {L} and Downgrade this to gain X total SP split between {N} and {T}, where X is the number of Nexus Orbs you control after this is downgraded.',NULL)
,('FAL','204','Nexus to Ulm Lyntheas','District','Your Elves have Ward 3. Constellation: During your Nexus Phase, you may pay 5 {L} and Downgrade this to gain X total SP split between {N} and {M}, where X is the number of Nexus Orbs you control after this is downgraded.',NULL)
,('FAL','205','Nexus Rift to Jigoku','District','All Characters go to your discard pile when they die.* Constellation: During your Nexus Phase, you may pay 5 CC and Downgrade this to gain X total SP split between {N} and {C}, where X is the number of Nexus Orbs you control after this is downgraded.',NULL)
,('FAL','206','Nexus to Observare Galactia','District','If seven spaces in your Field are full, your Characters have Overpass. Constellation: During your Nexus Phase, you may pay 5 {L} and Downgrade this to gain X total SP split between {T} and {M}, where X is the number of Nexus Orbs you control after this is downgraded.',NULL)
,('FAL','207','Nexus to Makuhari Messe','District','Characters in the center space of your Field have Convert. Constellation: During your Nexus Phase, you may pay 5 {L} and Downgrade this to gain X total SP split between {T} and {C}, where X is the number of Nexus Orbs you control after this is downgraded',NULL)
,('FAL','208','Nexus Rift to The Void','District','When another player restores CC, they restore half as much and you restore the rest. Constellation: During your Nexus Phase, you may pay 5 CC and Downgrade this to gain X total SP split between {M} and {C}, where X is the number of Nexus Orbs you control after this is downgraded.',NULL);

INSERT INTO SubType (setID,cardID,subtype)
VALUES
('DEP','025','Aquatic'),
('DEP','049','Aquatic'),
('DEP','103','Aquatic'),
('QIL','108','Aquatic'),
('DEP','028','Aquatic, Beast'),
('DEP','031','Aquatic, Beast, Cephalopod'),
('DEP','065','Aquatic, Beast, Cephalopod'),
('DEP','012','Aquatic, Beast, Cetacean'),
('QIL','034','Aquatic, Beast, Cetacean'),
('DEP','030','Aquatic, Beast, Cetacean, Giant'),
('CLA','030','Aquatic, Beast, Human, Cleric'),
('DEP','069','Aquatic, Crab'),
('DEP','107','Aquatic, Crab'),
('QIL','106','Aquatic, Crab'),
('QIL','033','Aquatic, Crab, Cephalopod'),
('QIL','013','Aquatic, Crustacean'),
('QIL','066','Aquatic, Devil, Fish'),
('QIL','035','Aquatic, Dragon'),
('QIL','055','Aquatic, Dragon'),
('KGD','049','Aquatic, Dragon'),
('KGD','032','Aquatic, Dragon, Beast, Turtle'),
('DEP','090','Aquatic, Eldritch'),
('DEP','105','Aquatic, Eldritch'),
('QIL','086','Aquatic, Eldritch'),
('DEP','089','Aquatic, Eldritch, Crab'),
('QIL','031','Aquatic, Fish'),
('QIL','112','Aquatic, Fish'),
('QIL','114','Aquatic, Fish'),
('DEP','092','Aquatic, Monster'),
('QIL','110','Aquatic, Monster'),
('QIL','116','Aquatic, Plant'),
('DEP','011','Aquatic, Plant, Beast'),
('QIL','027','Aquatic, Rock, Fish'),
('DEP','029','Aquatic, Rock, Monster'),
('DEP','027','Aquatic, Tentacle'),
('DEP','050','Aquatic, Vehicle'),
('DEP','023','Aquatic, Wall'),
('DEP','087','Aquatic, Wall'),
('COR','039','Arachnid'),
('FAL','141','Beast, Bear, Cultist'),
('NIN','030','Beast, Bear, Machine'),
('COR','015','Beast, Bird, Merchant'),
('FAL','126','Beast, Cat, Cleric'),
('NIN','104','Beast, Cat, Entertainer'),
('FAL','038','Beast, Cat, Merchant'),
('JGK','039','Beast, Cat, Noble'),
('COR','017','Beast, Cat, Officer'),
('NIN','009','Beast, Cat, Rogue'),
('NIN','101','Beast, Cat, Shark, Merchant'),
('FAL','092','Beast, Cat, Soldier'),
('COR','095','Beast, Cat, Wizard'),
('NIN','028','Beast, Cow, Golem'),
('FAL','060','Beast, Dog, Fighter'),
('CLA','007','Beast, Fighter'),
('COR','099','Beast, Fox, Entertainer'),
('FAL','098','Beast, Fox, Entertainer'),
('NIN','026','Beast, Fox, Plant, Samurai'),
('NIN','098','Beast, Fox, Undead, Spirit'),
('NIN','056','Beast, Lizard, Fighter'),
('CLA','006','Beast, Merchant'),
('FAL','159','Beast, Rat, Entertainer'),
('COR','014','Beast, Rat, Rogue'),
('NIN','099','Beast, Rat, Samurai'),
('FAL','034','Beast, Rat, Swarm'),
('KGD','027','Beast, Rodent'),
('KGD','041','Beast, Rodent'),
('FAL','107','Beast, Rodent, Engineer'),
('FAL','165','Beast, Rodent, Entertainer'),
('NIN','035','Beast, Rodent, Knight'),
('NIN','024','Beast, Rodent, Noble'),
('CLA','005','Beast, Rogue'),
('COR','101','Beast, Shark, Human'),
('NIN','076','Beast, Shark, Noble'),
('COR','122','Beast, Sheep'),
('COR','042','Beast, Sheep, Merchant'),
('NIN','074','Beast, Snake'),
('KGD','073','Beast, Snake, Cultist'),
('FAL','104','Beast, Snake, Knight'),
('NIN','079','Beast, Snake, Wizard'),
('KGD','031','Beast, Wolf, Cultist'),
('WHV','030','Beholder'),
('KGD','069','Bird'),
('JGK','028','Bird'),
('FAL','102','Bird, Clock, Soldier'),
('JGK','027','Bird, Demon'),
('CLA','043','Bird, Human, Cleric'),
('FAL','168','Bird, Merchant'),
('NIN','027','Bird, Noble'),
('NIN','054','Bird, Officer'),
('COR','067','Bird, Rogue'),
('FAL','163','Bird, Rogue'),
('COR','097','Bird, Wizard'),
('NIN','036','Celestial'),
('COR','023','Celestial, Beast, Dog'),
('FAL','101','Celestial, Beast, Rodent, Vehicle'),
('KGD','048','Celestial, Dragon'),
('FAL','143','Celestial, Dragon'),
('COR','125','Celestial, Eldritch, Insect'),
('FAL','042','Celestial, Elemental'),
('FAL','109','Celestial, Entertainer'),
('FAL','049','Celestial, Giant'),
('COR','096','Celestial, Knight'),
('FAL','140','Celestial, Knight'),
('FAL','110','Celestial, Machine, Mech'),
('NIN','048','Celestial, Officer'),
('FAL','134','Celestial, Official'),
('FAL','144','Celestial, Rock, Elemental'),
('FAL','125','Celestial, Rogue'),
('FAL','136','Celestial, Slime'),
('FAL','164','Celestial, Slime'),
('COR','098','Celestial, Spirit'),
('COR','128','Celestial, Spirit, Beast, Cetacean'),
('NIN','061','Celestial, Vehicle'),
('FAL','199','Celestial, Vehicle, Entertainer'),
('FAL','059','Celestial, Worker'),
('FAL','096','Celestial, Worker'),
('COR','124','Cephalopod, Cultist'),
('FAL','094','Civilian'),
('FAL','072','Clock, Golem, Noble, Warrior'),
('FAL','097','Clock, Machine, Fighter'),
('FAL','108','Clock, Machine, Official'),
('FAL','027','Clock, Machine, Soldier'),
('FAL','068','Clock, Rock, Elemental'),
('HOE','004','Concept'),
('HOE','090','Concept'),
('HOE','091','Concept'),
('HOE','092','Concept'),
('HOE','093','Concept'),
('HOE','094','Concept'),
('HOE','095','Concept'),
('HOE','096','Concept'),
('HOE','097','Concept'),
('HOE','098','Concept'),
('HOE','099','Concept'),
('COR','056','Consumable'),
('COR','057','Consumable'),
('COR','059','Consumable'),
('COR','083','Consumable'),
('COR','112','Consumable'),
('COR','140','Consumable'),
('KGD','039','Consumable'),
('KGD','053','Consumable'),
('KGD','067','Consumable'),
('KGD','081','Consumable'),
('NIN','043','Consumable'),
('JGK','049','Consumable'),
('FAL','088','Consumable'),
('HOE','001','Crab'),
('HOE','009','Crab'),
('HOE','010','Crab'),
('HOE','012','Crab'),
('HOE','016','Crab'),
('HOE','017','Crab'),
('HOE','018','Crab'),
('COR','040','Crab, Giant'),
('QIL','054','Crab, Monster'),
('JGK','013','Crab, Monster'),
('HOE','011','Crustacean'),
('HOE','013','Crustacean'),
('HOE','014','Crustacean'),
('HOE','015','Crustacean'),
('JGK','043','Deity'),
('FAL','145','Deity, Celestial, Snake'),
('JGK','042','Deity, Monster, Snake'),
('FAL','065','Demon, Beast'),
('JGK','030','Demon, Beast, Dog'),
('JGK','032','Demon, Beast, Dog'),
('JGK','041','Demon, Beast, Dog'),
('FAL','061','Demon, Beast, Dog, Fighter'),
('JGK','034','Demon, Beast, Dog, Monster'),
('FAL','070','Demon, Beast, Ranger'),
('NIN','108','Demon, Fighter'),
('JGK','012','Demon, Fighter'),
('FAL','158','Demon, Fighter'),
('FAL','175','Demon, Knight'),
('JGK','009','Demon, Ranger'),
('COR','022','Demon, Rock, Beast, Bird, Dog, Fighter'),
('NIN','125','Demon, Rogue, Fighter'),
('JGK','016','Demon, Soldier'),
('JGK','018','Demon, Soldier'),
('NIN','014','Demon, Worker'),
('HOE','002','Devil'),
('HOE','036','Devil'),
('HOE','037','Devil'),
('HOE','038','Devil'),
('HOE','039','Devil'),
('HOE','040','Devil'),
('HOE','041','Devil'),
('WHV','059','Devil'),
('WHV','058','Devil, Fighter'),
('KGD','009','Dragon'),
('KGD','012','Dragon'),
('KGD','014','Dragon'),
('KGD','016','Dragon'),
('KGD','017','Dragon'),
('KGD','028','Dragon'),
('KGD','030','Dragon'),
('KGD','033','Dragon'),
('KGD','035','Dragon'),
('KGD','036','Dragon'),
('KGD','042','Dragon'),
('KGD','044','Dragon'),
('KGD','047','Dragon'),
('KGD','050','Dragon'),
('KGD','056','Dragon'),
('KGD','058','Dragon'),
('KGD','061','Dragon'),
('KGD','063','Dragon'),
('KGD','064','Dragon'),
('KGD','070','Dragon'),
('KGD','072','Dragon'),
('KGD','075','Dragon'),
('KGD','077','Dragon'),
('KGD','078','Dragon'),
('KGD','008','Dragon, Cultist'),
('KGD','029','Dragon, Druid'),
('KGD','043','Dragon, Engineer'),
('NIN','011','Dragon, Fighter'),
('FAL','195','Dragon, Fighter, Rogue'),
('KGD','018','Dragon, Giant'),
('KGD','062','Dragon, Golem'),
('KGD','046','Dragon, Machine, Mech'),
('WHV','074','Dragon, Merchant'),
('NIN','031','Dragon, Monk'),
('FAL','073','Dragon, Monk'),
('KGD','071','Dragon, Rogue'),
('QIL','072','Dragon, Spirit'),
('KGD','010','Dragon, Wizard'),
('KGD','057','Dragon, Wizard'),
('NIN','052','Drone'),
('NIN','057','Drone'),
('KGD','045','Dwarf, Cultist'),
('WHV','031','Dwarf, Fighter'),
('COR','103','Earth'),
('FAL','079','Earth'),
('FAL','117','Earth'),
('FAL','154','Earth, Rock, Weapon'),
('KGD','006','Egg'),
('FAL','174','Eldritch, Arachnid'),
('QIL','095','Eldritch, Beast'),
('FAL','161','Eldritch, Beast'),
('FAL','046','Eldritch, Beast, Horse'),
('FAL','142','Eldritch, Celestial'),
('FAL','167','Eldritch, Cephalopod, Cultist'),
('NIN','128','Eldritch, Cleric, Cultist'),
('FAL','138','Eldritch, Crab, Cultist'),
('COR','123','Eldritch, Cultist'),
('NIN','100','Eldritch, Cultist'),
('FAL','173','Eldritch, Cultist, Knight'),
('COR','132','Eldritch, Deity'),
('FAL','177','Eldritch, Deity'),
('KGD','076','Eldritch, Dragon'),
('FAL','169','Eldritch, Elemental'),
('FAL','162','Eldritch, Insect'),
('NIN','077','Eldritch, Knight, Cultist'),
('COR','131','Eldritch, Monster'),
('JGK','038','Eldritch, Monster'),
('COR','127','Eldritch, Spirit'),
('FAL','201','Eldritch, Spirit'),
('FAL','160','Eldritch, Tentacle'),
('NIN','075','Eldritch, Wizard'),
('COR','048','Elemental'),
('QIL','068','Elemental'),
('JGK','040','Elemental'),
('QIL','049','Elemental, Machine'),
('COR','045','Elemental, Spirit'),
('QIL','026','Elemental, Spirit'),
('WHV','046','Elf, Arachnid, Merchant'),
('FAL','129','Elf, Cleric'),
('FAL','135','Elf, Cleric'),
('FAL','127','Elf, Cultist'),
('WHV','029','Elf, Druid'),
('NIN','029','Elf, Druid'),
('FAL','062','Elf, Druid'),
('FAL','063','Elf, Druid'),
('COR','041','Elf, Druid, Fighter'),
('COR','046','Elf, Druid, Rogue'),
('FAL','064','Elf, Entertainer'),
('FAL','067','Elf, Knight'),
('FAL','193','Elf, Merchant, Wizard'),
('FAL','036','Elf, Noble, Merchant'),
('FAL','069','Elf, Official'),
('FAL','132','Elf, Official'),
('WHV','044','Elf, Pirate'),
('QIL','046','Elf, Pirate'),
('WHV','042','Elf, Pirate, Worker'),
('FAL','130','Elf, Ranger, Wizard'),
('NIN','080','Elf, Wizard'),
('FAL','028','Elf, Wizard'),
('KGD','060','Fey, Dragon'),
('FAL','066','Fey, Elemental'),
('FAL','128','Fey, Elf, Maid, Entertainer'),
('QIL','047','Fey, Pirate'),
('COR','054','Fire'),
('COR','106','Fire'),
('QIL','041','Fire'),
('FAL','075','Fire'),
('JGK','052','Fire, Ice'),
('WHV','063','Fire, Shadow'),
('FAL','031','Fish, Worker'),
('COR','031','Gear'),
('COR','080','Gear'),
('COR','143','Gear'),
('NIN','045','Gear'),
('NIN','067','Gear'),
('NIN','094','Gear'),
('JGK','023','Gear'),
('FAL','119','Gear'),
('FAL','198','Gear'),
('FAL','200','Gear'),
('KGD','055','Goblin'),
('WHV','028','Goblin, Fighter'),
('QIL','015','Golem, Engineer'),
('NIN','049','Golem, Officer'),
('FAL','044','Golem, Scientist'),
('COR','107','Holy'),
('WHV','060','Holy'),
('DEP','076','Holy'),
('QIL','042','Holy'),
('QIL','077','Holy'),
('QIL','078','Holy'),
('QIL','082','Holy'),
('CLA','046','Holy'),
('CLA','047','Holy'),
('CLA','048','Holy'),
('FAL','150','Holy'),
('FAL','120','Holy, Consumable'),
('HOE','003','Human'),
('HOE','063','Human'),
('HOE','064','Human'),
('HOE','065','Human'),
('HOE','066','Human'),
('HOE','067','Human'),
('HOE','068','Human'),
('HOE','069','Human'),
('DEP','091','Human'),
('NIN','073','Human, Agent'),
('WHV','013','Human, Bird, Soldier'),
('KGD','007','Human, Cavalry'),
('COR','129','Human, Cultist'),
('WHV','057','Human, Cultist'),
('DEP','085','Human, Cultist'),
('NIN','102','Human, Cultist'),
('COR','069','Human, Engineer'),
('QIL','051','Human, Engineer'),
('FAL','095','Human, Engineer'),
('FAL','099','Human, Engineer'),
('FAL','039','Human, Entertainer'),
('FAL','170','Human, Entertainer'),
('COR','019','Human, Fighter'),
('COR','044','Human, Fighter'),
('DEP','044','Human, Fighter'),
('DEP','106','Human, Fighter'),
('KGD','015','Human, Fighter'),
('WHV','075','Human, Fighter, Rogue'),
('FAL','100','Human, Maid, Entertainer'),
('COR','016','Human, Merchant'),
('WHV','015','Human, Merchant'),
('DEP','088','Human, Merchant'),
('QIL','048','Human, Merchant'),
('NIN','107','Human, Merchant'),
('NIN','127','Human, Merchant'),
('DEP','086','Human, Merchant, Rogue'),
('NIN','081','Human, Noble'),
('KGD','059','Human, Noble, Cultist'),
('NIN','124','Human, Noble, Knight'),
('NIN','012','Human, Officer'),
('NIN','060','Human, Officer'),
('FAL','033','Human, Officer'),
('COR','126','Human, Official'),
('FAL','172','Human, Official'),
('QIL','092','Human, Pirate'),
('DEP','084','Human, Pirate, Cultist'),
('DEP','108','Human, Pirate, Rogue'),
('QIL','087','Human, Pirate, Wizard'),
('COR','100','Human, Priest'),
('COR','070','Human, Rogue'),
('WHV','071','Human, Rogue'),
('WHV','073','Human, Rogue'),
('DEP','043','Human, Scientist'),
('DEP','045','Human, Scientist'),
('QIL','050','Human, Scientist'),
('COR','020','Human, Soldier'),
('WHV','012','Human, Soldier'),
('DEP','013','Human, Soldier'),
('FAL','133','Human, Wizard, Merchant'),
('COR','109','Ice'),
('COR','110','Ice'),
('WHV','078','Ice'),
('FAL','147','Ice'),
('QIL','074','Illithid, Deity'),
('QIL','071','Illithid, Monster'),
('QIL','069','Illithid, Pilot'),
('JGK','033','Insect'),
('NIN','055','Insect, Drone'),
('FAL','137','Insect, Scientist'),
('CLA','032','Legendary'),
('CLA','064','Legendary'),
('KGD','022','Legendary'),
('KGD','026','Legendary'),
('QIL','001','Legendary, Aquatic, Golem, Official'),
('NIN','005','Legendary, Beast, Alligator, Agent'),
('FAL','025','Legendary, Beast, Alligator, Hero'),
('NIN','003','Legendary, Beast, Cat, Noble'),
('NIN','002','Legendary, Beast, Cat, Officer'),
('NIN','001','Legendary, Beast, Cat, Official'),
('FAL','002','Legendary, Beast, Fox, Entertainer'),
('COR','010','Legendary, Beast, Nightmare'),
('FAL','013','Legendary, Beast, Plant, Druid, Deity'),
('FAL','016','Legendary, Beast, Rat, Spirit'),
('FAL','009','Legendary, Beast, Shark, Fighter'),
('NIN','006','Legendary, Beast, Sheep, Merchant'),
('FAL','015','Legendary, Bird, Human, Civilian'),
('CLA','003','Legendary, Bird, Human, Cleric'),
('FAL','007','Legendary, Bird, Knight, Hero'),
('FAL','012','Legendary, Celestial, Cleric'),
('FAL','011','Legendary, Celestial, Demon, Spirit'),
('FAL','014','Legendary, Clock, Human, Deity'),
('HOE','089','Legendary, Concept'),
('COR','001','Legendary, Demon, Beast'),
('FAL','020','Legendary, Demon, Beast, Dog, Fighter'),
('FAL','019','Legendary, Demon, Bird, Entertainer'),
('FAL','005','Legendary, Demon, Villain'),
('HOE','035','Legendary, Devil'),
('KGD','005','Legendary, Dragon'),
('KGD','003','Legendary, Dragon, Deity'),
('KGD','001','Legendary, Dragon, Human, Knight'),
('KGD','002','Legendary, Dragon, Monster'),
('KGD','004','Legendary, Dragon, Wizard'),
('WHV','003','Legendary, Dwarf, Cleric'),
('QIL','003','Legendary, Dwarf, Cleric, Engineer'),
('COR','011','Legendary, Eldritch, Beast, Goat, Druid'),
('COR','005','Legendary, Eldritch, Fighter'),
('FAL','008','Legendary, Eldritch, Human, Cleric'),
('FAL','017','Legendary, Eldritch, Human, Cultist'),
('NIN','007','Legendary, Eldritch, Villain'),
('FAL','026','Legendary, Eldritch, Villain'),
('WHV','005','Legendary, Elf, Agent'),
('QIL','002','Legendary, Elf, Agent, Druid'),
('WHV','009','Legendary, Elf, Fighter'),
('FAL','022','Legendary, Elf, Noble, Official'),
('WHV','006','Legendary, Elf, Pirate, Rogue, Villain'),
('WHV','001','Legendary, Elf, Rogue'),
('WHV','010','Legendary, Elf, Scientist, Villain'),
('QIL','004','Legendary, Elf, Vampire, Fighter'),
('COR','009','Legendary, Fey, Wizard'),
('HOE','062','Legendary, Human'),
('FAL','010','Legendary, Human, Agent, Swarm'),
('FAL','024','Legendary, Human, Celestial, Scientist'),
('DEP','009','Legendary, Human, Cultist, Pirate'),
('QIL','006','Legendary, Human, Engineer'),
('COR','007','Legendary, Human, Engineer, Official'),
('FAL','004','Legendary, Human, Entertainer'),
('WHV','002','Legendary, Human, Fighter'),
('WHV','004','Legendary, Human, Fighter, Villain'),
('FAL','001','Legendary, Human, Hero'),
('COR','008','Legendary, Human, Maid, Knight'),
('DEP','001','Legendary, Human, Merchant'),
('WHV','008','Legendary, Human, Noble, Cultist, Villain'),
('QIL','008','Legendary, Human, Pirate'),
('QIL','010','Legendary, Human, Pirate, Noble'),
('DEP','005','Legendary, Human, Pirate, Rogue'),
('DEP','008','Legendary, Human, Rogue, Scientist'),
('NIN','004','Legendary, Human, Samurai'),
('DEP','003','Legendary, Human, Scientist'),
('FAL','021','Legendary, Machine, Deity'),
('COR','006','Legendary, Machine, Scientist'),
('COR','004','Legendary, Plant, Wizard'),
('QIL','009','Legendary, Qil''oth, Agent'),
('QIL','012','Legendary, Qil''oth, Deity'),
('DEP','007','Legendary, QIl''oth, Fighter'),
('DEP','006','Legendary, Qil''oth, Merchant'),
('DEP','002','Legendary, Qil''oth, Ranger'),
('QIL','007','Legendary, Qil''oth, Ranger'),
('DEP','004','Legendary, Qil''oth, Wizard'),
('FAL','003','Legendary, Rock, Human, Gamer'),
('FAL','018','Legendary, Rock, Spirit'),
('CLA','004','Legendary, Seaborn, Aquatic, Monster'),
('CLA','002','Legendary, Seaborn, Aquatic, Monster, Human, Agent'),
('CLA','001','Legendary, Seaborn, Aquatic, Monster, Human, Entertainer'),
('FAL','006','Legendary, Spirit, Skeleton, Entertainer'),
('WHV','007','Legendary, Tiefling, Cleric'),
('QIL','005','Legendary, Tiefling, Undead, Villain'),
('JGK','001','Legendary, Undead, Pirate'),
('QIL','011','Legendary, Undead, Qil''oth, Wizard'),
('COR','003','Legendary, Undead, Skeleton, Merchant, Priest'),
('COR','002','Legendary, Undead, Spirit, Maid'),
('JGK','002','Legendary, Vampire, Criminal'),
('FAL','023','Legendary, Vampire, Entertainer'),
('COR','105','Lightning'),
('WHV','064','Lightning'),
('KGD','065','Lightning'),
('NIN','090','Lightning'),
('FAL','151','Lightning'),
('COR','068','Machine'),
('DEP','046','Machine'),
('DEP','051','Machine'),
('QIL','052','Machine'),
('NIN','053','Machine'),
('FAL','197','Machine'),
('NIN','050','Machine, Agent'),
('DEP','047','Machine, Crab'),
('FAL','043','Machine, Hero, Knight'),
('NIN','058','Machine, Mech'),
('FAL','103','Machine, Mech, Dwarf, Worker'),
('WHV','043','Machine, Merchant'),
('DEP','048','Machine, Shark'),
('COR','071','Machine, Spirit'),
('FAL','045','Machine, Spirit'),
('FAL','105','Machine, Spirit, Entertainer'),
('COR','066','Machine, Swarm'),
('COR','021','Machine, Vehicle'),
('COR','072','Machine, Vehicle'),
('COR','073','Machine, Vehicle'),
('COR','074','Machine, Vehicle'),
('QIL','016','Machine, Vehicle'),
('NIN','010','Machine, Wizard'),
('COR','094','Mana, Bird'),
('NIN','123','Mech, Officer'),
('CLA','031','Merchant'),
('NIN','032','Monster'),
('NIN','059','Monster'),
('NIN','082','Monster'),
('NIN','105','Monster, Fighter'),
('NIN','013','Monster, Merchant'),
('COR','049','Nature'),
('COR','053','Nature'),
('WHV','034','Nature'),
('WHV','037','Nature'),
('QIL','039','Nature'),
('FAL','078','Nature'),
('FAL','084','Nature'),
('FAL','086','Nature'),
('NIN','106','Nightmare'),
('KGD','011','Nightmare, Dragon'),
('COR','012','Nightmare, Merchant'),
('DEP','083','Nightmare, Spirit'),
('NIN','111','Nightmare, Spirit'),
('NIN','033','Officer, Vehicle'),
('WHV','033','Orc, Fighter'),
('QIL','053','Pirate, Vehicle, Swarm'),
('COR','043','Plant'),
('COR','047','Plant, Beast, Dinosaur'),
('FAL','032','Plant, Cultist'),
('KGD','034','Plant, Dragon'),
('COR','038','Plant, Druid'),
('FAL','071','Plant, Druid'),
('WHV','032','Plant, Elemental, Spirit'),
('FAL','041','Plant, Entertainer'),
('FAL','074','Plant, Golem'),
('QIL','028','Plant, Knight'),
('NIN','023','Plant, Machine, Officer'),
('QIL','094','Plant, Vehicle, Swarm'),
('QIL','067','Qil''oth, Agent'),
('NIN','078','Qil''oth, Agent'),
('DEP','024','Qil''oth, Civilian'),
('DEP','068','Qil''oth, Druid'),
('DEP','071','Qil''oth, Druid'),
('DEP','014','Qil''oth, Entertainer'),
('DEP','026','Qil''oth, Fighter'),
('DEP','067','Qil''oth, Knight'),
('QIL','029','Qil''oth, Knight'),
('QIL','090','Qil''oth, Undead, Zombie'),
('WHV','072','Rat, Rogue'),
('FAL','030','Rock'),
('FAL','124','Rock'),
('FAL','153','Rock'),
('FAL','156','Rock'),
('DEP','066','Rock, Crab'),
('KGD','013','Rock, Dragon'),
('FAL','093','Rock, Dwarf, Merchant'),
('ELM','006','Rock, Elemental'),
('FAL','191','Rock, Elemental'),
('JGK','035','Rock, Entertainer'),
('NIN','034','Rock, Fighter'),
('FAL','121','Rock, Gear'),
('FAL','047','Rock, Golem'),
('FAL','106','Rock, Golem'),
('FAL','131','Rock, Golem'),
('NIN','025','Rogue, Merchant'),
('HOE','005','Sand, Castle'),
('CLA','015','Seaborn, Aquatic, Monster'),
('CLA','017','Seaborn, Aquatic, Monster'),
('CLA','018','Seaborn, Aquatic, Monster'),
('CLA','019','Seaborn, Aquatic, Monster'),
('CLA','020','Seaborn, Aquatic, Monster'),
('CLA','021','Seaborn, Aquatic, Monster'),
('CLA','022','Seaborn, Aquatic, Monster'),
('CLA','023','Seaborn, Aquatic, Monster'),
('CLA','057','Seaborn, Aquatic, Monster'),
('CLA','058','Seaborn, Aquatic, Monster'),
('CLA','059','Seaborn, Aquatic, Monster'),
('CLA','062','Seaborn, Aquatic, Monster'),
('CLA','063','Seaborn, Aquatic, Monster'),
('CLA','024','Seaborn, Aquatic, Monster, Beast, Knight'),
('CLA','061','Seaborn, Aquatic, Monster, Cleric'),
('CLA','060','Seaborn, Aquatic, Monster, Entertainer'),
('CLA','029','Seaborn, Aquatic, Monster, Human, Agent'),
('CLA','016','Seaborn, Aquatic, Monster, Human, Ranger'),
('COR','133','Shadow'),
('COR','136','Shadow'),
('COR','137','Shadow'),
('DEP','072','Shadow'),
('QIL','076','Shadow'),
('QIL','098','Shadow'),
('NIN','037','Shadow'),
('NIN','088','Shadow'),
('NIN','091','Shadow'),
('NIN','113','Shadow'),
('JGK','022','Shadow'),
('FAL','090','Shadow'),
('FAL','178','Shadow'),
('FAL','182','Shadow'),
('FAL','187','Shadow'),
('FAL','190','Shadow'),
('FAL','202','Shadow'),
('NIN','109','Slime, Monster'),
('COR','018','Spirit'),
('FAL','166','Spirit'),
('QIL','032','Spirit, Beast, Shark'),
('QIL','030','Spirit, Bird'),
('FAL','139','Spirit, Celestial'),
('DEP','104','Spirit, Giant, Beast, Cetacean'),
('NIN','051','Spirit, Machine'),
('QIL','073','Spirit, Nightmare'),
('DEP','063','Spirit, Qil''oth'),
('DEP','064','Spirit, Qil''oth'),
('DEP','070','Spirit, Qil''oth'),
('QIL','070','Spirit, Qil''oth'),
('JGK','036','Spirit, Skeleton, Cavalry'),
('JGK','015','Spirit, Skeleton, Engineer'),
('JGK','008','Spirit, Skeleton, Ranger'),
('WHV','056','Tiefling, Cultist'),
('WHV','014','Tiefling, Merchant'),
('COR','T06','Token'),
('HOE','019','Token'),
('HOE','070','Token'),
('HOE','100','Token'),
('HOE','101','Token'),
('ELM','027','Token'),
('WHV','T03','Token'),
('QIL','T02','Token'),
('QIL','T05','Token'),
('QIL','T07','Token'),
('CLA','T01','Token'),
('CLA','T04','Token'),
('CLA','T05','Token'),
('NIN','T01','Token'),
('NIN','T02','Token'),
('JGK','T01','Token'),
('FAL','T01','Token'),
('FAL','T05','Token'),
('FAL','T10','Token'),
('DEP','T02','Token, Aquatic, Beast, Cephalopod'),
('DEP','T01','Token, Aquatic, Tentacle'),
('FAL','T13','Token, Beast, Civilian'),
('COR','T11','Token, Beast, Shark, Human'),
('COR','T03','Token, Crab, Giant'),
('JGK','T02','Token, Crab, Giant'),
('JGK','T04','Token, Demon, Beast, Dog'),
('JGK','T05','Token, Demon, Beast, Dog'),
('FAL','T03','Token, Demon, Beast, Dog, Fighter'),
('FAL','T04','Token, Demon, Beast, Dog, Fighter'),
('WHV','T04','Token, Devil'),
('ELM','011','Token, Earth, Elemental'),
('FAL','T11','Token, Eldritch, Elemental'),
('COR','T12','Token, Eldritch, Monster'),
('COR','T09','Token, Elemental'),
('COR','T08','Token, Elemental, Rock, Golem'),
('FAL','T08','Token, Elemental, Rock, Golem'),
('COR','T07','Token, Elemental, Wall'),
('FAL','T07','Token, Elemental, Wall'),
('WHV','T02','Token, Elf, Pirate'),
('WHV','T01','Token, Goblin, Fighter'),
('QIL','T01','Token, Golem'),
('FAL','T12','Token, Human, Civilian'),
('FAL','T09','Token, Human, Civilian, Swarm'),
('NIN','T03','Token, Human, Noble, Knight'),
('WHV','T07','Token, Human, Rogue'),
('KGD','T01','Token, Lightning'),
('COR','T04','Token, Machine, Beast, Cat'),
('COR','T05','Token, Machine, Human, Soldier'),
('QIL','T04','Token, Machine, Vehicle, Crab'),
('COR','T10','Token, Mana, Shapeshifter'),
('COR','T01','Token, Plant'),
('WHV','T06','Token, Plant, Undead, Zombie'),
('CLA','T02','Token, Seaborn, Aquatic, Monster'),
('CLA','T03','Token, Seaborn, Aquatic, Monster'),
('CLA','T06','Token, Seaborn, Aquatic, Monster'),
('QIL','T03','Token, Spirit, Beast'),
('WHV','T05','Token, Tiefling, Cultist'),
('FAL','T06','Token, Undead'),
('JGK','T03','Token, Undead, Bird'),
('FAL','T02','Token, Undead, Bird'),
('COR','T02','Token, Undead, Maid'),
('QIL','T06','Token, Undead, Zombie, Plant'),
('WHV','T09','Transformed'),
('WHV','T08','Transformed, Legendary, Dwarf, Cleric, Merchant'),
('WHV','T10','Transformed, Legendary, Elf, Agent, Druid'),
('WHV','T14','Transformed, Legendary, Elf, Vampire, Fighter'),
('WHV','T12','Transformed, Legendary, Tiefling, Undead, Cleric'),
('WHV','T11','Transformed, Machine, Orb'),
('WHV','T13','Transformed, Shadow'),
('WHV','T15','Transformed, Undead, Zombie'),
('NIN','084','Undead'),
('JGK','037','Undead'),
('JGK','031','Undead, Beast, Sheep'),
('JGK','029','Undead, Bird'),
('WHV','070','Undead, Bird, Merchant'),
('FAL','171','Undead, Deity'),
('KGD','074','Undead, Dragon, Slime'),
('DEP','010','Undead, Plant, Crab'),
('FAL','029','Undead, Skeleton, Demon'),
('QIL','093','Undead, Skeleton, Dragon'),
('JGK','020','Undead, Skeleton, Golem'),
('JGK','019','Undead, Skeleton, Noble'),
('FAL','040','Undead, Skeleton, Noble'),
('COR','013','Undead, Skeleton, Ranger'),
('NIN','008','Undead, Skeleton, Rogue'),
('JGK','010','Undead, Spirit'),
('JGK','014','Undead, Spirit'),
('FAL','048','Undead, Spirit'),
('NIN','126','Undead, Spirit, Agent'),
('FAL','037','Undead, Spirit, Agent'),
('WHV','011','Undead, Spirit, Merchant'),
('QIL','088','Undead, Zombie'),
('JGK','011','Undead, Zombie'),
('JGK','017','Undead, Zombie, Criminal'),
('WHV','076','Undead, Zombie, Giant'),
('NIN','083','Undead, Zombie, Noble, Soldier'),
('QIL','089','Undead, Zombie, Pirate'),
('QIL','091','Undead, Zombie, Plant'),
('QIL','014','Undead, Zombie, Worker'),
('FAL','035','Vampire, Fighter'),
('COR','130','Vampire, Rogue'),
('FAL','176','Vampire, Rogue, Spirit'),
('NIN','110','Vampire, Samurai, Rogue'),
('NIN','103','Vampire, Wizard'),
('WHV','045','Vehicle'),
('ELM','025','Water, Elemental, Abomination'),
('COR','032','Weapon'),
('COR','060','Weapon'),
('COR','116','Weapon'),
('COR','139','Weapon'),
('NIN','044','Weapon'),
('NIN','047','Weapon'),
('NIN','071','Weapon'),
('NIN','072','Weapon'),
('NIN','118','Weapon'),
('NIN','120','Weapon'),
('NIN','122','Weapon'),
('JGK','050','Weapon'),
('FAL','087','Weapon'),
('FAL','091','Weapon'),
('FAL','192','Weapon');

INSERT INTO CharacterCard(setID,cardID,cost,attack,health) VALUES
 ('COR','001',2,2,3)
,('COR','002',5,2,2)
,('COR','003',4,5,4)
,('COR','012',1,1,3)
,('COR','013',1,2,1)
,('COR','014',1,1,1)
,('COR','015',2,2,1)
,('COR','016',3,3,3)
,('COR','017',3,4,2)
,('COR','018',4,4,4)
,('COR','019',4,0,3)
,('COR','020',5,4,4)
,('COR','021',5,2,6)
,('COR','022',6,4,4)
,('COR','023',10,12,12)
,('COR','T01',1,1,1)
,('COR','T02',3,2,2)
,('COR','004',6,2,4)
,('COR','005',16,6,6)
,('COR','038',2,2,2)
,('COR','039',2,2,1)
,('COR','040',2,2,3)
,('COR','041',2,1,3)
,('COR','042',2,1,1)
,('COR','043',3,4,4)
,('COR','044',3,4,5)
,('COR','045',4,4,4)
,('COR','046',5,3,2)
,('COR','047',7,5,7)
,('COR','048',8,8,8)
,('COR','T03',2,2,3)
,('COR','006',3,2,1)
,('COR','007',5,3,5)
,('COR','066',1,1,1)
,('COR','067',2,2,2)
,('COR','068',2,3,1)
,('COR','069',2,1,3)
,('COR','070',3,3,2)
,('COR','071',4,4,4)
,('COR','072',5,3,5)
,('COR','073',7,4,4)
,('COR','074',9,5,6)
,('COR','T04',2,0,3)
,('COR','T05',3,2,2)
,('COR','008',2,3,1)
,('COR','009',6,3,5)
,('COR','094',1,2,1)
,('COR','095',2,2,2)
,('COR','096',3,3,4)
,('COR','097',3,1,1)
,('COR','098',4,4,4)
,('COR','099',5,3,2)
,('COR','100',5,3,4)
,('COR','101',6,2,2)
,('COR','T07',1,0,1)
,('COR','T08',2,2,2)
,('COR','T09',4,4,4)
,('COR','T10',5,1,1)
,('COR','T11',6,2,2)
,('COR','010',2,2,0)
,('COR','011',8,3,8)
,('COR','122',1,1,2)
,('COR','123',1,2,1)
,('COR','124',2,2,2)
,('COR','125',2,2,2)
,('COR','126',2,1,1)
,('COR','127',4,4,4)
,('COR','128',4,3,6)
,('COR','129',4,4,4)
,('COR','130',4,3,2)
,('COR','131',5,1,5)
,('COR','132',10,8,8)
,('COR','T12',3,3,3)
,('HOE','001',0,1,1)
,('HOE','002',0,1,1)
,('HOE','003',0,1,1)
,('HOE','004',0,1,1)
,('HOE','005',5,0,20)
,('HOE','009',1,3,2)
,('HOE','010',1,0,3)
,('HOE','011',2,5,2)
,('HOE','012',1,1,1)
,('HOE','013',2,3,4)
,('HOE','014',1,3,4)
,('HOE','015',0,1,1)
,('HOE','016',6,6,6)
,('HOE','017',1,1,2)
,('HOE','018',5,5,8)
,('HOE','019',1,NULL,NULL)
,('HOE','035',5,4,4)
,('HOE','036',0,1,2)
,('HOE','037',1,1,3)
,('HOE','038',2,2,3)
,('HOE','039',0,1,1)
,('HOE','040',1,1,2)
,('HOE','041',2,3,3)
,('HOE','062',1,3,3)
,('HOE','063',0,1,2)
,('HOE','064',1,2,2)
,('HOE','065',2,0,1)
,('HOE','066',1,1,1)
,('HOE','067',1,2,0)
,('HOE','068',0,2,1)
,('HOE','069',1,1,2)
,('HOE','070',2,NULL,NULL)
,('HOE','089',2,7,6)
,('HOE','090',1,2,2)
,('HOE','091',1,2,2)
,('HOE','092',2,0,5)
,('HOE','093',2,2,3)
,('HOE','094',1,0,0)
,('HOE','095',1,1,1)
,('HOE','096',2,2,5)
,('HOE','097',2,1,1)
,('HOE','098',1,2,2)
,('HOE','099',2,4,4)
,('HOE','100',1,2,1)
,('HOE','101',1,1,2)
,('ELM','006',2,1,1)
,('ELM','011',0,1,7)
,('ELM','025',7,0,5)
,('ELM','027',0,0,3)
,('WHV','001',2,2,2)
,('WHV','002',6,4,4)
,('WHV','011',1,1,1)
,('WHV','012',2,2,2)
,('WHV','013',3,2,4)
,('WHV','014',4,1,4)
,('WHV','015',4,1,2)
,('WHV','003',3,3,3)
,('WHV','004',7,6,6)
,('WHV','028',1,2,1)
,('WHV','029',3,2,3)
,('WHV','030',3,2,2)
,('WHV','031',4,4,2)
,('WHV','032',4,3,5)
,('WHV','033',6,4,5)
,('WHV','T01',1,2,1)
,('WHV','T08',5,3,5)
,('WHV','005',3,3,3)
,('WHV','006',7,6,6)
,('WHV','042',1,0,2)
,('WHV','043',3,2,3)
,('WHV','044',3,3,2)
,('WHV','045',4,0,4)
,('WHV','046',4,1,5)
,('WHV','T02',1,0,2)
,('WHV','T10',6,3,3)
,('WHV','T11',2,2,4)
,('WHV','007',3,3,3)
,('WHV','008',7,6,6)
,('WHV','056',1,1,1)
,('WHV','057',3,1,2)
,('WHV','058',4,4,2)
,('WHV','059',7,7,8)
,('WHV','T04',1,NULL,NULL)
,('WHV','T05',1,1,1)
,('WHV','T12',8,1,1)
,('WHV','009',3,3,3)
,('WHV','010',7,6,6)
,('WHV','070',1,1,1)
,('WHV','071',1,1,2)
,('WHV','072',2,2,2)
,('WHV','073',3,3,1)
,('WHV','074',4,2,3)
,('WHV','075',5,3,4)
,('WHV','076',6,5,6)
,('WHV','T06',1,1,3)
,('WHV','T07',1,1,2)
,('WHV','T14',7,5,4)
,('WHV','T15',4,3,3)
,('DEP','001',1,0,2)
,('DEP','010',2,1,1)
,('DEP','011',3,0,5)
,('DEP','012',3,2,3)
,('DEP','013',4,3,4)
,('DEP','014',6,3,3)
,('DEP','002',2,2,1)
,('DEP','023',1,1,2)
,('DEP','024',1,2,1)
,('DEP','025',2,2,3)
,('DEP','026',2,3,1)
,('DEP','027',2,2,2)
,('DEP','028',3,2,2)
,('DEP','029',4,3,4)
,('DEP','030',6,5,8)
,('DEP','031',6,5,4)
,('DEP','T01',2,2,2)
,('DEP','003',3,4,2)
,('DEP','043',2,1,1)
,('DEP','044',3,2,2)
,('DEP','045',3,3,2)
,('DEP','046',3,3,3)
,('DEP','047',4,3,4)
,('DEP','048',4,5,2)
,('DEP','049',4,1,4)
,('DEP','050',5,2,5)
,('DEP','051',6,5,5)
,('DEP','004',2,2,2)
,('DEP','063',1,1,2)
,('DEP','064',2,0,3)
,('DEP','065',2,2,2)
,('DEP','066',3,1,4)
,('DEP','067',4,3,4)
,('DEP','068',4,3,4)
,('DEP','069',5,4,6)
,('DEP','070',5,3,5)
,('DEP','071',6,1,1)
,('DEP','T02',2,2,2)
,('DEP','005',3,2,4)
,('DEP','083',1,1,1)
,('DEP','084',1,2,1)
,('DEP','085',1,1,1)
,('DEP','086',2,2,3)
,('DEP','087',2,0,4)
,('DEP','088',3,1,3)
,('DEP','089',3,4,1)
,('DEP','090',3,3,4)
,('DEP','091',4,2,5)
,('DEP','092',6,4,7)
,('DEP','006',3,3,3)
,('DEP','007',6,2,8)
,('DEP','008',7,5,4)
,('DEP','009',3,2,2)
,('DEP','103',4,1,6)
,('DEP','104',6,0,8)
,('DEP','105',8,6,8)
,('DEP','106',2,2,2)
,('DEP','107',3,2,3)
,('DEP','108',2,1,2)
,('QIL','001',7,3,9)
,('QIL','013',1,2,1)
,('QIL','014',1,1,1)
,('QIL','015',2,2,1)
,('QIL','016',3,3,3)
,('QIL','T01',1,1,1)
,('QIL','002',3,1,2)
,('QIL','026',1,2,1)
,('QIL','027',2,3,1)
,('QIL','028',3,3,4)
,('QIL','029',3,2,3)
,('QIL','030',3,1,4)
,('QIL','031',4,1,2)
,('QIL','032',5,5,3)
,('QIL','033',5,3,5)
,('QIL','034',7,3,9)
,('QIL','035',8,5,9)
,('QIL','T03',1,1,1)
,('QIL','003',4,3,3)
,('QIL','046',1,2,1)
,('QIL','047',3,1,1)
,('QIL','048',3,2,2)
,('QIL','049',3,2,4)
,('QIL','050',3,1,1)
,('QIL','051',4,1,5)
,('QIL','052',5,2,6)
,('QIL','053',6,5,4)
,('QIL','054',7,4,7)
,('QIL','055',8,5,8)
,('QIL','T04',3,NULL,NULL)
,('QIL','004',5,1,5)
,('QIL','066',2,2,2)
,('QIL','067',3,2,1)
,('QIL','068',3,3,2)
,('QIL','069',4,2,4)
,('QIL','070',5,2,2)
,('QIL','071',6,4,5)
,('QIL','072',7,5,7)
,('QIL','073',8,6,7)
,('QIL','074',10,8,8)
,('QIL','005',7,6,6)
,('QIL','086',2,1,3)
,('QIL','087',3,1,4)
,('QIL','088',3,2,0)
,('QIL','089',3,3,4)
,('QIL','090',4,1,5)
,('QIL','091',4,3,2)
,('QIL','092',4,2,1)
,('QIL','093',6,5,5)
,('QIL','094',6,4,5)
,('QIL','095',9,7,5)
,('QIL','T06',2,2,2)
,('QIL','006',2,2,3)
,('QIL','007',3,1,4)
,('QIL','008',4,4,2)
,('QIL','009',2,2,3)
,('QIL','010',6,5,6)
,('QIL','011',3,4,5)
,('QIL','012',10,7,12)
,('QIL','106',3,2,3)
,('QIL','108',2,0,4)
,('QIL','110',3,1,1)
,('QIL','112',3,4,3)
,('QIL','114',2,1,1)
,('QIL','116',4,3,5)
,('CLA','005',1,2,2)
,('CLA','006',2,0,4)
,('CLA','007',3,5,5)
,('CLA','001',3,1,3)
,('CLA','015',1,1,1)
,('CLA','016',4,2,5)
,('CLA','017',4,1,1)
,('CLA','018',4,2,6)
,('CLA','019',5,3,8)
,('CLA','020',5,1,4)
,('CLA','021',6,2,5)
,('CLA','022',7,6,6)
,('CLA','023',7,4,5)
,('CLA','024',7,4,8)
,('CLA','T02',1,1,1)
,('CLA','T03',1,1,1)
,('CLA','002',4,1,6)
,('CLA','029',2,3,1)
,('CLA','030',2,1,4)
,('CLA','031',3,2,4)
,('CLA','003',5,4,3)
,('CLA','043',7,6,7)
,('CLA','004',2,1,1)
,('CLA','057',3,2,3)
,('CLA','058',4,1,3)
,('CLA','059',5,2,4)
,('CLA','060',6,0,8)
,('CLA','061',7,2,8)
,('CLA','062',7,3,6)
,('CLA','063',8,3,10)
,('CLA','T06',2,2,2)
,('KGD','001',5,2,4)
,('KGD','006',1,0,2)
,('KGD','007',2,3,2)
,('KGD','008',2,1,2)
,('KGD','009',3,2,2)
,('KGD','010',3,1,1)
,('KGD','011',4,1,6)
,('KGD','012',5,4,4)
,('KGD','013',5,4,4)
,('KGD','014',5,5,5)
,('KGD','015',6,3,6)
,('KGD','016',7,5,4)
,('KGD','017',9,9,9)
,('KGD','018',10,10,10)
,('KGD','002',7,3,12)
,('KGD','027',1,1,2)
,('KGD','028',2,2,3)
,('KGD','029',3,2,4)
,('KGD','030',3,3,2)
,('KGD','031',4,2,2)
,('KGD','032',5,3,5)
,('KGD','033',5,4,4)
,('KGD','034',7,6,7)
,('KGD','035',8,4,3)
,('KGD','036',9,9,9)
,('KGD','003',5,4,6)
,('KGD','041',1,1,1)
,('KGD','042',2,1,1)
,('KGD','043',3,2,4)
,('KGD','044',3,3,2)
,('KGD','045',4,2,2)
,('KGD','046',5,4,5)
,('KGD','047',5,4,4)
,('KGD','048',7,6,7)
,('KGD','049',8,3,4)
,('KGD','050',9,9,9)
,('KGD','004',6,5,5)
,('KGD','055',1,2,1)
,('KGD','056',2,1,1)
,('KGD','057',3,2,4)
,('KGD','058',3,2,1)
,('KGD','059',4,2,2)
,('KGD','060',5,4,2)
,('KGD','061',5,4,4)
,('KGD','062',7,6,7)
,('KGD','063',8,4,3)
,('KGD','064',9,9,9)
,('KGD','005',7,7,4)
,('KGD','069',1,1,1)
,('KGD','070',2,2,1)
,('KGD','071',3,2,4)
,('KGD','072',3,3,2)
,('KGD','073',4,2,2)
,('KGD','074',5,4,4)
,('KGD','075',5,4,4)
,('KGD','076',7,6,7)
,('KGD','077',8,3,4)
,('KGD','078',9,9,9)
,('NIN','001',3,2,4)
,('NIN','008',2,3,2)
,('NIN','009',2,1,2)
,('NIN','010',3,3,3)
,('NIN','011',3,2,4)
,('NIN','012',4,2,3)
,('NIN','013',5,6,5)
,('NIN','014',6,2,6)
,('NIN','023',1,0,2)
,('NIN','024',1,1,1)
,('NIN','025',2,2,3)
,('NIN','026',2,1,3)
,('NIN','027',2,2,2)
,('NIN','028',3,4,5)
,('NIN','029',3,2,4)
,('NIN','030',4,2,2)
,('NIN','031',4,4,3)
,('NIN','032',5,3,6)
,('NIN','033',5,4,4)
,('NIN','034',5,3,5)
,('NIN','035',6,5,3)
,('NIN','036',7,7,7)
,('NIN','048',1,3,1)
,('NIN','049',2,0,4)
,('NIN','050',2,2,2)
,('NIN','051',2,2,2)
,('NIN','052',2,1,1)
,('NIN','053',3,3,1)
,('NIN','054',3,1,3)
,('NIN','055',3,0,1)
,('NIN','056',4,1,4)
,('NIN','057',4,3,3)
,('NIN','058',5,4,7)
,('NIN','059',5,4,3)
,('NIN','060',6,2,7)
,('NIN','061',7,5,9)
,('NIN','073',1,1,1)
,('NIN','074',2,2,3)
,('NIN','075',2,1,1)
,('NIN','076',3,2,2)
,('NIN','077',3,3,4)
,('NIN','078',3,2,1)
,('NIN','079',3,1,4)
,('NIN','080',4,2,2)
,('NIN','081',4,2,5)
,('NIN','082',4,1,5)
,('NIN','083',5,4,4)
,('NIN','084',6,5,5)
,('NIN','098',1,2,4)
,('NIN','099',2,3,1)
,('NIN','100',2,1,2)
,('NIN','101',2,2,2)
,('NIN','102',2,2,2)
,('NIN','103',3,1,4)
,('NIN','104',3,0,5)
,('NIN','105',3,3,3)
,('NIN','106',4,4,3)
,('NIN','107',4,2,3)
,('NIN','108',5,4,5)
,('NIN','109',5,3,3)
,('NIN','110',6,4,6)
,('NIN','111',7,7,7)
,('NIN','002',3,2,4)
,('NIN','003',5,1,5)
,('NIN','004',4,1,4)
,('NIN','005',3,2,3)
,('NIN','006',3,3,3)
,('NIN','007',7,6,6)
,('NIN','123',3,2,2)
,('NIN','124',4,3,4)
,('NIN','125',6,5,7)
,('NIN','126',3,3,2)
,('NIN','127',3,1,3)
,('NIN','128',3,0,4)
,('NIN','T03',4,3,4)
,('JGK','001',6,2,6)
,('JGK','008',1,2,1)
,('JGK','009',2,2,2)
,('JGK','010',2,2,2)
,('JGK','011',2,1,1)
,('JGK','012',2,1,1)
,('JGK','013',3,2,3)
,('JGK','014',3,3,3)
,('JGK','015',3,3,1)
,('JGK','016',3,3,3)
,('JGK','017',4,2,5)
,('JGK','018',5,3,3)
,('JGK','019',6,5,5)
,('JGK','020',10,5,11)
,('JGK','002',4,3,3)
,('JGK','027',1,1,1)
,('JGK','028',1,2,1)
,('JGK','029',2,2,1)
,('JGK','030',2,2,2)
,('JGK','031',3,1,5)
,('JGK','032',3,3,2)
,('JGK','033',3,3,3)
,('JGK','034',4,4,5)
,('JGK','035',4,2,5)
,('JGK','036',4,1,4)
,('JGK','037',4,4,5)
,('JGK','038',5,5,7)
,('JGK','039',6,6,5)
,('JGK','040',7,5,5)
,('JGK','041',8,3,5)
,('JGK','042',9,7,7)
,('JGK','043',10,8,8)
,('JGK','T02',2,2,3)
,('JGK','T03',2,2,1)
,('JGK','T04',2,2,2)
,('JGK','T05',3,3,2)
,('JGK','003',4,3,4)
,('JGK','054',1,2,0)
,('JGK','055',2,2,1)
,('JGK','056',2,1,1)
,('JGK','057',3,1,3)
,('JGK','058',3,3,4)
,('JGK','059',3,3,1)
,('JGK','060',3,3,3)
,('JGK','061',3,1,1)
,('JGK','062',4,2,5)
,('JGK','063',4,2,2)
,('JGK','064',4,1,5)
,('JGK','065',5,4,5)
,('JGK','066',6,5,3)
,('JGK','067',6,4,4)
,('JGK','068',6,4,2)
,('JGK','069',7,7,11)
,('JGK','070',10,8,8)
,('JGK','004',7,4,6)
,('JGK','081',1,1,2)
,('JGK','082',2,1,3)
,('JGK','083',2,1,1)
,('JGK','084',3,4,1)
,('JGK','085',3,2,3)
,('JGK','086',3,3,1)
,('JGK','087',3,2,4)
,('JGK','088',3,0,0)
,('JGK','089',4,3,2)
,('JGK','090',4,3,3)
,('JGK','091',4,2,5)
,('JGK','092',4,1,2)
,('JGK','093',6,6,5)
,('JGK','094',6,5,4)
,('JGK','095',7,4,7)
,('JGK','096',10,8,8)
,('JGK','T06',1,1,1)
,('JGK','T07',1,0,1)
,('JGK','005',5,4,3)
,('JGK','108',1,2,1)
,('JGK','109',2,3,1)
,('JGK','110',2,1,1)
,('JGK','111',2,1,3)
,('JGK','112',2,2,2)
,('JGK','113',3,3,2)
,('JGK','114',3,4,3)
,('JGK','115',3,2,4)
,('JGK','116',3,3,3)
,('JGK','117',4,2,5)
,('JGK','118',4,3,2)
,('JGK','119',5,3,4)
,('JGK','120',5,3,1)
,('JGK','121',6,6,6)
,('JGK','122',7,5,7)
,('JGK','123',7,7,5)
,('JGK','124',8,6,7)
,('JGK','125',10,8,8)
,('JGK','T15',1,1,1)
,('JGK','006',5,4,4)
,('JGK','007',7,7,8)
,('JGK','136',3,3,3)
,('JGK','137',2,2,2)
,('FAL','001',3,2,2)
,('FAL','027',1,1,1)
,('FAL','028',1,1,1)
,('FAL','029',1,2,1)
,('FAL','030',1,1,1)
,('FAL','031',1,1,1)
,('FAL','032',1,3,1)
,('FAL','033',2,2,2)
,('FAL','034',2,2,2)
,('FAL','035',3,3,1)
,('FAL','036',3,2,4)
,('FAL','037',3,3,2)
,('FAL','038',4,2,2)
,('FAL','039',4,1,4)
,('FAL','040',4,3,1)
,('FAL','041',4,2,2)
,('FAL','042',5,0,0)
,('FAL','043',5,3,4)
,('FAL','044',6,5,3)
,('FAL','045',7,0,9)
,('FAL','046',8,7,5)
,('FAL','047',9,5,9)
,('FAL','048',9,7,8)
,('FAL','049',10,15,15)
,('FAL','002',5,3,2)
,('FAL','059',1,1,2)
,('FAL','060',2,2,2)
,('FAL','061',2,2,2)
,('FAL','062',3,3,2)
,('FAL','063',3,1,4)
,('FAL','064',3,2,2)
,('FAL','065',3,4,4)
,('FAL','066',4,1,5)
,('FAL','067',4,3,4)
,('FAL','068',4,4,5)
,('FAL','069',4,2,3)
,('FAL','070',4,4,4)
,('FAL','071',5,2,4)
,('FAL','072',7,0,7)
,('FAL','073',8,6,5)
,('FAL','074',9,6,8)
,('FAL','T02',2,2,1)
,('FAL','T03',2,2,2)
,('FAL','T04',4,4,4)
,('FAL','003',4,4,3)
,('FAL','092',2,2,2)
,('FAL','093',2,1,3)
,('FAL','094',2,1,1)
,('FAL','095',2,2,1)
,('FAL','096',2,2,3)
,('FAL','097',3,2,2)
,('FAL','098',3,3,3)
,('FAL','099',3,2,2)
,('FAL','100',3,1,3)
,('FAL','101',3,1,3)
,('FAL','102',3,3,3)
,('FAL','103',4,2,3)
,('FAL','104',4,3,4)
,('FAL','105',4,3,3)
,('FAL','106',5,3,3)
,('FAL','107',5,2,4)
,('FAL','108',6,3,5)
,('FAL','109',7,6,5)
,('FAL','110',15,9,9)
,('FAL','004',4,3,3)
,('FAL','125',1,2,1)
,('FAL','126',2,2,2)
,('FAL','127',2,3,2)
,('FAL','128',2,1,2)
,('FAL','129',2,1,2)
,('FAL','130',2,2,3)
,('FAL','131',2,2,2)
,('FAL','132',2,1,3)
,('FAL','133',3,3,3)
,('FAL','134',3,1,2)
,('FAL','135',3,2,3)
,('FAL','136',4,3,3)
,('FAL','137',4,2,4)
,('FAL','138',5,4,4)
,('FAL','139',6,4,4)
,('FAL','140',6,3,4)
,('FAL','141',7,4,2)
,('FAL','142',7,5,3)
,('FAL','143',8,6,7)
,('FAL','144',8,3,3)
,('FAL','145',9,7,7)
,('FAL','T06',1,1,1)
,('FAL','T07',1,0,1)
,('FAL','T08',2,2,2)
,('FAL','T09',3,0,0)
,('FAL','005',7,6,6)
,('FAL','158',2,2,2)
,('FAL','159',2,2,2)
,('FAL','160',2,1,5)
,('FAL','161',3,3,2)
,('FAL','162',3,5,4)
,('FAL','163',3,3,1)
,('FAL','164',4,2,3)
,('FAL','165',4,1,2)
,('FAL','166',4,4,4)
,('FAL','167',4,2,1)
,('FAL','168',4,2,2)
,('FAL','169',4,3,3)
,('FAL','170',4,4,2)
,('FAL','171',5,4,3)
,('FAL','172',5,1,3)
,('FAL','173',5,3,4)
,('FAL','174',7,5,8)
,('FAL','175',7,3,4)
,('FAL','176',8,4,6)
,('FAL','177',10,8,8)
,('FAL','T11',1,0,2)
,('FAL','T12',1,1,1)
,('FAL','T13',1,1,1)
,('FAL','006',5,4,4)
,('FAL','007',6,3,4)
,('FAL','008',4,1,5)
,('FAL','009',7,5,3)
,('FAL','010',3,3,5)
,('FAL','011',6,1,6)
,('FAL','012',7,2,2)
,('FAL','013',4,2,6)
,('FAL','014',7,7,4)
,('FAL','015',7,4,2)
,('FAL','016',3,3,2)
,('FAL','017',4,2,4)
,('FAL','018',5,3,3)
,('FAL','019',7,3,8)
,('FAL','020',5,3,2)
,('FAL','021',8,4,12)
,('FAL','022',7,5,7)
,('FAL','023',4,4,3)
,('FAL','024',6,2,5)
,('FAL','025',4,3,3)
,('FAL','026',9,6,6)
,('FAL','191',3,1,4)
,('FAL','193',5,4,5)
,('FAL','195',4,2,5)
,('FAL','197',7,4,4)
,('FAL','199',6,3,6)
,('FAL','201',4,3,5);

INSERT INTO  SpellCard (setID,cardID,cost)
VALUES
('COR','024',0),
('COR','025',2),
('COR','026',3),
('COR','027',5),
('COR','028',5),
('COR','049',1),
('COR','050',2),
('COR','051',2),
('COR','052',2),
('COR','053',3),
('COR','054',5),
('COR','055',9),
('COR','075',2),
('COR','076',3),
('COR','077',4),
('COR','078',9),
('COR','102',1),
('COR','103',2),
('COR','104',2),
('COR','105',4),
('COR','106',4),
('COR','107',5),
('COR','108',5),
('COR','109',5),
('COR','110',7),
('COR','111',9),
('COR','133',1),
('COR','134',2),
('COR','135',3),
('COR','136',4),
('COR','137',5),
('COR','138',9),
('HOE','020',0),
('HOE','021',2),
('HOE','022',2),
('HOE','023',1),
('HOE','024',0),
('HOE','042',0),
('HOE','043',0),
('HOE','044',1),
('HOE','045',1),
('HOE','046',1),
('HOE','047',1),
('HOE','071',1),
('HOE','072',1),
('HOE','073',0),
('HOE','074',2),
('HOE','075',0),
('HOE','076',1),
('HOE','077',1),
('HOE','078',0),
('HOE','079',0),
('HOE','102',3),
('HOE','103',1),
('HOE','104',0),
('HOE','105',0),
('HOE','106',0),
('HOE','107',2),
('ELM','001',8),
('ELM','002',4),
('ELM','003',6),
('ELM','004',6),
('ELM','005',10),
('ELM','007',3),
('ELM','008',7),
('ELM','009',5),
('ELM','010',10),
('ELM','012',4),
('ELM','013',3),
('ELM','014',6),
('ELM','016',10),
('ELM','017',2),
('ELM','018',3),
('ELM','019',4),
('ELM','020',8),
('ELM','021',10),
('ELM','022',1),
('ELM','023',6),
('ELM','024',6),
('ELM','026',10),
('ELM','028',3),
('ELM','029',4),
('ELM','030',3),
('ELM','031',7),
('ELM','032',10),
('WHV','016',0),
('WHV','017',1),
('WHV','018',4),
('WHV','019',3),
('WHV','034',1),
('WHV','035',4),
('WHV','036',4),
('WHV','037',5),
('WHV','047',3),
('WHV','048',4),
('WHV','060',2),
('WHV','061',2),
('WHV','062',3),
('WHV','063',3),
('WHV','064',4),
('WHV','065',5),
('WHV','T13',2),
('WHV','077',1),
('WHV','078',2),
('WHV','079',4),
('WHV','080',5),
('DEP','015',0),
('DEP','016',9),
('DEP','032',1),
('DEP','033',2),
('DEP','034',3),
('DEP','035',4),
('DEP','036',4),
('DEP','052',1),
('DEP','053',2),
('DEP','072',1),
('DEP','073',1),
('DEP','074',2),
('DEP','075',2),
('DEP','076',2),
('DEP','077',4),
('DEP','078',5),
('DEP','093',2),
('DEP','094',2),
('DEP','096',3),
('DEP','097',4),
('QIL','017',2),
('QIL','018',3),
('QIL','019',4),
('QIL','036',2),
('QIL','037',3),
('QIL','038',3),
('QIL','039',5),
('QIL','040',6),
('QIL','041',7),
('QIL','042',2),
('QIL','056',1),
('QIL','057',1),
('QIL','058',2),
('QIL','059',2),
('QIL','060',3),
('QIL','075',1),
('QIL','076',1),
('QIL','077',2),
('QIL','078',2),
('QIL','079',3),
('QIL','080',3),
('QIL','081',3),
('QIL','082',4),
('QIL','096',2),
('QIL','097',3),
('QIL','098',3),
('QIL','099',3),
('QIL','100',5),
('QIL','107',4),
('QIL','109',3),
('QIL','111',7),
('QIL','113',5),
('QIL','115',2),
('QIL','117',5),
('QIL','118',6),
('CLA','008',1),
('CLA','009',4),
('CLA','010',5),
('CLA','025',2),
('CLA','026',5),
('CLA','027',9),
('CLA','033',1),
('CLA','044',2),
('CLA','045',3),
('CLA','046',3),
('CLA','047',4),
('CLA','064',10),
('CLA','065',1),
('CLA','066',3),
('CLA','067',4),
('KGD','019',1),
('KGD','020',2),
('KGD','021',3),
('KGD','022',7),
('KGD','037',2),
('KGD','038',2),
('KGD','051',3),
('KGD','052',3),
('KGD','065',2),
('KGD','066',5),
('KGD','T01',1),
('KGD','079',2),
('KGD','080',3),
('NIN','037',1),
('NIN','038',2),
('NIN','039',2),
('NIN','040',3),
('NIN','041',3),
('NIN','042',3),
('NIN','062',1),
('NIN','063',2),
('NIN','064',3),
('NIN','065',3),
('NIN','066',4),
('NIN','085',1),
('NIN','086',1),
('NIN','087',4),
('NIN','088',3),
('NIN','089',4),
('NIN','090',4),
('NIN','091',5),
('NIN','092',6),
('NIN','093',7),
('NIN','T02',4),
('NIN','112',1),
('NIN','113',2),
('NIN','114',3),
('NIN','115',4),
('NIN','116',7),
('NIN','117',8),
('JGK','021',3),
('JGK','022',4),
('JGK','T01',2),
('JGK','044',1),
('JGK','045',2),
('JGK','046',2),
('JGK','047',4),
('JGK','048',5),
('JGK','071',2),
('JGK','072',2),
('JGK','073',3),
('JGK','074',6),
('JGK','097',1),
('JGK','098',1),
('JGK','099',2),
('JGK','100',2),
('JGK','101',3),
('JGK','102',4),
('JGK','103',5),
('JGK','T08',2),
('JGK','T09',2),
('JGK','T10',2),
('JGK','T11',2),
('JGK','T12',2),
('JGK','T13',2),
('JGK','T14',2),
('JGK','126',2),
('JGK','127',3),
('JGK','128',3),
('JGK','129',5),
('JGK','135',2),
('FAL','050',1),
('FAL','051',3),
('FAL','052',3),
('FAL','053',3),
('FAL','054',4),
('FAL','055',5),
('FAL','T01',2),
('FAL','075',1),
('FAL','076',1),
('FAL','077',2),
('FAL','078',3),
('FAL','079',3),
('FAL','080',3),
('FAL','081',3),
('FAL','082',3),
('FAL','083',4),
('FAL','084',4),
('FAL','085',5),
('FAL','086',7),
('FAL','111',1),
('FAL','112',2),
('FAL','113',2),
('FAL','114',2),
('FAL','115',4),
('FAL','116',6),
('FAL','117',8),
('FAL','146',1),
('FAL','147',2),
('FAL','148',2),
('FAL','149',2),
('FAL','150',3),
('FAL','151',6),
('FAL','152',9),
('FAL','T10',4),
('FAL','178',2),
('FAL','179',2),
('FAL','180',3),
('FAL','181',3),
('FAL','182',4),
('FAL','183',4),
('FAL','184',4),
('FAL','185',4),
('FAL','186',6),
('FAL','187',7),
('FAL','194',2),
('FAL','196',3),
('FAL','202',5);

INSERT INTO ItemCard (setID,cardID,cost)
VALUES
('COR','029',1),
('COR','030',2),
('COR','031',3),
('COR','032',4),
('COR','033',5),
('COR','056',2),
('COR','057',2),
('COR','058',2),
('COR','059',3),
('COR','060',4),
('COR','079',1),
('COR','080',1),
('COR','081',2),
('COR','082',2),
('COR','083',2),
('COR','084',2),
('COR','085',2),
('COR','086',3),
('COR','087',3),
('COR','088',4),
('COR','112',2),
('COR','113',2),
('COR','114',2),
('COR','115',3),
('COR','116',3),
('COR','139',1),
('COR','140',2),
('COR','141',3),
('COR','142',4),
('COR','143',5),
('COR','144',6),
('HOE','006',1),
('HOE','007',1),
('HOE','008',2),
('HOE','025',1),
('HOE','026',1),
('HOE','027',1),
('HOE','028',1),
('HOE','048',1),
('HOE','049',1),
('HOE','050',2),
('HOE','051',2),
('HOE','052',1),
('HOE','053',0),
('HOE','054',1),
('HOE','055',0),
('HOE','056',2),
('HOE','057',3),
('HOE','080',0),
('HOE','081',0),
('HOE','082',0),
('HOE','083',1),
('HOE','084',0),
('HOE','085',1),
('HOE','108',0),
('HOE','109',0),
('HOE','110',2),
('HOE','111',1),
('HOE','112',1),
('HOE','113',2),
('ELM','015',2),
('WHV','020',0),
('WHV','021',2),
('WHV','022',2),
('WHV','023',4),
('WHV','038',1),
('WHV','039',2),
('WHV','040',3),
('WHV','T09',1),
('WHV','049',1),
('WHV','050',2),
('WHV','051',3),
('WHV','052',4),
('WHV','053',5),
('WHV','054',6),
('WHV','T03',3),
('WHV','066',1),
('WHV','067',3),
('WHV','068',3),
('WHV','081',2),
('WHV','082',3),
('DEP','017',2),
('DEP','018',2),
('DEP','037',1),
('DEP','038',1),
('DEP','039',2),
('DEP','040',2),
('DEP','041',3),
('DEP','054',1),
('DEP','055',2),
('DEP','056',2),
('DEP','057',2),
('DEP','058',3),
('DEP','059',3),
('DEP','060',3),
('DEP','061',4),
('DEP','079',2),
('DEP','080',3),
('DEP','081',3),
('DEP','098',2),
('DEP','099',2),
('DEP','100',3),
('DEP','101',4),
('QIL','020',1),
('QIL','021',2),
('QIL','043',1),
('QIL','044',2),
('QIL','061',1),
('QIL','062',2),
('QIL','063',2),
('QIL','064',3),
('QIL','083',2),
('QIL','084',4),
('QIL','101',2),
('QIL','102',2),
('QIL','103',2),
('QIL','104',3),
('QIL','T07',2),
('CLA','011',0),
('CLA','012',2),
('CLA','T01',4),
('CLA','032',4),
('CLA','034',1),
('CLA','035',2),
('CLA','036',2),
('CLA','037',3),
('CLA','038',3),
('CLA','039',6),
('CLA','T04',2),
('CLA','048',4),
('CLA','049',1),
('CLA','050',1),
('CLA','051',2),
('CLA','052',2),
('CLA','053',2),
('CLA','068',3),
('CLA','T05',4),
('KGD','023',2),
('KGD','024',4),
('KGD','039',2),
('KGD','040',4),
('KGD','053',2),
('KGD','054',4),
('KGD','067',2),
('KGD','068',4),
('KGD','081',2),
('KGD','082',4),
('NIN','015',2),
('NIN','016',2),
('NIN','017',2),
('NIN','018',2),
('NIN','019',2),
('NIN','020',2),
('NIN','043',1),
('NIN','044',1),
('NIN','045',1),
('NIN','046',2),
('NIN','047',3),
('NIN','067',1),
('NIN','068',1),
('NIN','069',2),
('NIN','070',2),
('NIN','071',3),
('NIN','072',3),
('NIN','T01',2),
('NIN','094',1),
('NIN','095',1),
('NIN','096',2),
('NIN','097',3),
('NIN','118',1),
('NIN','119',1),
('NIN','120',2),
('NIN','121',4),
('NIN','122',7),
('NIN','129',3),
('NIN','130',3),
('NIN','131',3),
('NIN','132',3),
('NIN','133',3),
('NIN','134',3),
('JGK','023',3),
('JGK','024',4),
('JGK','049',1),
('JGK','050',2),
('JGK','051',4),
('JGK','052',4),
('JGK','075',1),
('JGK','076',2),
('JGK','077',3),
('JGK','078',4),
('JGK','079',7),
('JGK','104',3),
('JGK','105',2),
('JGK','106',10),
('JGK','130',2),
('JGK','131',3),
('JGK','132',4),
('JGK','133',5),
('JGK','138',3),
('FAL','087',2),
('FAL','088',1),
('FAL','089',1),
('FAL','090',4),
('FAL','091',3),
('FAL','118',1),
('FAL','119',2),
('FAL','120',3),
('FAL','121',3),
('FAL','122',4),
('FAL','123',5),
('FAL','124',8),
('FAL','T05',2),
('FAL','153',1),
('FAL','154',2),
('FAL','155',2),
('FAL','156',3),
('FAL','157',3),
('FAL','188',2),
('FAL','189',3),
('FAL','190',5),
('FAL','192',4),
('FAL','198',3),
('FAL','200',2);

INSERT INTO DistrictCard (setID,cardID,tier)
VALUES
('COR','034','I'),
('COR','035','I'),
('COR','036','II'),
('COR','037','III'),
('COR','150','II'),
('COR','151','II'),
('COR','152','II'),
('COR','153','II'),
('COR','154','II'),
('COR','155','II'),
('COR','061','I'),
('COR','062','II'),
('COR','063','II'),
('COR','064','III'),
('COR','065','III'),
('COR','089','I'),
('COR','090','II'),
('COR','091','II'),
('COR','092','III'),
('COR','093','III'),
('COR','T06','I'),
('COR','117','I'),
('COR','118','II'),
('COR','119','II'),
('COR','120','III'),
('COR','121','III'),
('COR','145','I'),
('COR','146','II'),
('COR','147','II'),
('COR','148','III'),
('COR','149','III'),
('HOE','029','I'),
('HOE','030','I'),
('HOE','031','II'),
('HOE','032','II'),
('HOE','033','III'),
('HOE','034','III'),
('HOE','058','I'),
('HOE','059','I'),
('HOE','060','II'),
('HOE','061','III'),
('HOE','086','I'),
('HOE','087','II'),
('HOE','088','III'),
('HOE','114','I'),
('HOE','115','II'),
('HOE','116','III'),
('WHV','024','I'),
('WHV','025','II'),
('WHV','026','III'),
('WHV','027','III'),
('WHV','084','I'),
('WHV','085','I'),
('WHV','041','I'),
('WHV','055','I'),
('WHV','069','I'),
('WHV','083','I'),
('DEP','019','I'),
('DEP','020','I'),
('DEP','021','II'),
('DEP','022','III'),
('DEP','042','II'),
('DEP','062','II'),
('DEP','082','II'),
('DEP','102','II'),
('DEP','109','I'),
('DEP','110','I'),
('QIL','022','I'),
('QIL','023','II'),
('QIL','024','II'),
('QIL','025','III'),
('QIL','T02','I'),
('QIL','045','III'),
('QIL','065','III'),
('QIL','T05','I'),
('QIL','085','III'),
('QIL','105','III'),
('QIL','119','I'),
('QIL','120','I'),
('CLA','013','I'),
('CLA','014','III'),
('CLA','028','I'),
('CLA','040','I'),
('CLA','041','II'),
('CLA','042','III'),
('CLA','054','I'),
('CLA','055','II'),
('CLA','056','III'),
('CLA','069','I'),
('CLA','070','II'),
('KGD','025','I'),
('KGD','026','III'),
('NIN','021','I'),
('NIN','022','II'),
('NIN','135','II'),
('NIN','136','II'),
('NIN','137','II'),
('NIN','138','II'),
('NIN','139','II'),
('NIN','140','II'),
('JGK','025','I'),
('JGK','026','II'),
('JGK','053','I'),
('JGK','080','I'),
('JGK','107','I'),
('JGK','134','I'),
('FAL','056','I'),
('FAL','057','II'),
('FAL','058','III'),
('FAL','203','III'),
('FAL','204','III'),
('FAL','205','III'),
('FAL','206','III'),
('FAL','207','III'),
('FAL','208','III');

INSERT INTO Orb (setID,cardID,orb)
VALUES
('HOE','114','+ 1 [C]'),
('HOE','086','+ 1 [M]'),
('HOE','058','+ 1 [T]'),
('HOE','059','+ 1 [T]'),
('HOE','060','+ 1 [T]'),
('HOE','115','+ 2 [C]'),
('HOE','116','+ 2 [C]'),
('HOE','087','+ 2 [M]'),
('HOE','029','+ 2 [N]'),
('HOE','030','+ 2 [N]'),
('HOE','031','+ 2 [N]'),
('HOE','032','+ 2 [N]'),
('HOE','061','+ 2 [T]'),
('HOE','088','+ 3 [M]'),
('HOE','033','+ 3 [N]'),
('HOE','034','+ 3 [N]'),
('QIL','012','{N}{T}{M}{C}'),
('QIL','118','{N}{T}{M}{C}'),
('WHV','083','+ {C}'),
('WHV','069','+ {M}'),
('QIL','120','+ {M} {C}'),
('WHV','041','+ {N}'),
('WHV','084','+ {N} {C}'),
('DEP','109','+ {N} {M}'),
('QIL','119','+ {N} {T}'),
('WHV','055','+ {T}'),
('DEP','110','+ {T} {C}'),
('WHV','085','+ {T} {M}'),
('COR','145','+ 1 {C}'),
('COR','146','+ 1 {C}'),
('COR','117','+ 1 {M}'),
('COR','155','+ 1 {M} 1 {C}'),
('COR','152','+ 1 {N} 1 {C}'),
('COR','151','+ 1 {N} 1 {M}'),
('COR','150','+ 1 {N} 1 {T}'),
('COR','089','+ 1 {T}'),
('COR','090','+ 1 {T}'),
('COR','091','+ 1 {T}'),
('COR','154','+ 1 {T} 1 {C}'),
('COR','153','+ 1 {T} 1 {M}'),
('COR','147','+ 2 {C}'),
('COR','149','+ 2 {C}'),
('COR','118','+ 2 {M}'),
('COR','119','+ 2 {M}'),
('COR','061','+ 2 {N}'),
('COR','062','+ 2 {N}'),
('COR','092','+ 2 {T}'),
('COR','093','+ 2 {T}'),
('COR','148','+ 3 {C}'),
('COR','120','+ 3 {M}'),
('COR','121','+ 3 {M}'),
('COR','063','+ 3 {N}'),
('COR','065','+ 3 {N}'),
('COR','064','+ 4 {N}'),
('JGK','134','+{C}'),
('JGK','107','+{M}'),
('NIN','140','+{M}{C}'),
('NIN','137','+{N}{C}'),
('NIN','136','+{N}{M}'),
('JGK','053','+{N}{N}'),
('NIN','135','+{N}{T}'),
('JGK','080','+{T}'),
('NIN','139','+{T}{C}'),
('NIN','138','+{T}{M}'),
('DEP','102','+1 {C}'),
('CLA','069','+1 {C}'),
('CLA','070','+1 {C}'),
('CLA','054','+1 {M}'),
('DEP','062','+1 {T}'),
('CLA','040','+1 {T}'),
('CLA','041','+1 {T}'),
('FAL','208','+1{M}2{C}'),
('FAL','203','+1{N}2{T}'),
('FAL','207','+1{T}2{C}'),
('DEP','082','+2 {M}'),
('CLA','055','+2 {M}'),
('CLA','028','+2 {N}'),
('QIL','065','+2 {T}'),
('CLA','042','+2 {T}'),
('FAL','205','+2{N}1{C}'),
('FAL','204','+2{N}1{M}'),
('FAL','206','+2{T}1{M}'),
('QIL','105','+3 {C}'),
('QIL','085','+3 {M}'),
('CLA','056','+3 {M}'),
('DEP','042','+3 {N}'),
('QIL','045','+3 {N}'),
('HOE','078','0 [M]'),
('HOE','042','0 [T]'),
('HOE','055','0 [T]'),
('HOE','063','1 [M]'),
('HOE','064','1 [M]'),
('HOE','065','1 [M]'),
('HOE','066','1 [M]'),
('HOE','067','1 [M]'),
('HOE','068','1 [M]'),
('HOE','069','1 [M]'),
('HOE','072','1 [M]'),
('HOE','073','1 [M]'),
('HOE','076','1 [M]'),
('HOE','077','1 [M]'),
('HOE','080','1 [M]'),
('HOE','082','1 [M]'),
('HOE','083','1 [M]'),
('HOE','085','1 [M]'),
('HOE','036','1 [T]'),
('HOE','037','1 [T]'),
('HOE','038','1 [T]'),
('HOE','039','1 [T]'),
('HOE','040','1 [T]'),
('HOE','041','1 [T]'),
('HOE','043','1 [T]'),
('HOE','044','1 [T]'),
('HOE','045','1 [T]'),
('HOE','047','1 [T]'),
('HOE','049','1 [T]'),
('HOE','050','1 [T]'),
('HOE','051','1 [T]'),
('HOE','052','1 [T]'),
('HOE','053','1 [T]'),
('HOE','054','1 [T]'),
('HOE','056','1 [T]'),
('HOE','057','1 [T]'),
('COR','122','1 {C}'),
('COR','123','1 {C}'),
('COR','124','1 {C}'),
('COR','125','1 {C}'),
('COR','126','1 {C}'),
('COR','128','1 {C}'),
('COR','129','1 {C}'),
('COR','130','1 {C}'),
('COR','131','1 {C}'),
('COR','133','1 {C}'),
('COR','134','1 {C}'),
('COR','135','1 {C}'),
('COR','139','1 {C}'),
('COR','140','1 {C}'),
('COR','143','1 {C}'),
('WHV','009','1 {C}'),
('WHV','070','1 {C}'),
('WHV','071','1 {C}'),
('WHV','072','1 {C}'),
('WHV','073','1 {C}'),
('WHV','075','1 {C}'),
('WHV','077','1 {C}'),
('WHV','078','1 {C}'),
('WHV','081','1 {C}'),
('WHV','082','1 {C}'),
('DEP','005','1 {C}'),
('DEP','083','1 {C}'),
('DEP','084','1 {C}'),
('DEP','085','1 {C}'),
('DEP','086','1 {C}'),
('DEP','087','1 {C}'),
('DEP','088','1 {C}'),
('DEP','091','1 {C}'),
('DEP','092','1 {C}'),
('DEP','093','1 {C}'),
('DEP','098','1 {C}'),
('DEP','099','1 {C}'),
('DEP','100','1 {C}'),
('DEP','101','1 {C}'),
('QIL','086','1 {C}'),
('QIL','087','1 {C}'),
('QIL','088','1 {C}'),
('QIL','091','1 {C}'),
('QIL','092','1 {C}'),
('QIL','098','1 {C}'),
('QIL','099','1 {C}'),
('QIL','101','1 {C}'),
('QIL','102','1 {C}'),
('QIL','103','1 {C}'),
('QIL','104','1 {C}'),
('CLA','004','1 {C}'),
('CLA','057','1 {C}'),
('CLA','058','1 {C}'),
('CLA','065','1 {C}'),
('CLA','067','1 {C}'),
('CLA','068','1 {C}'),
('KGD','069','1 {C}'),
('KGD','070','1 {C}'),
('KGD','071','1 {C}'),
('KGD','072','1 {C}'),
('KGD','073','1 {C}'),
('KGD','074','1 {C}'),
('KGD','075','1 {C}'),
('KGD','079','1 {C}'),
('KGD','080','1 {C}'),
('KGD','081','1 {C}'),
('KGD','082','1 {C}'),
('NIN','098','1 {C}'),
('NIN','099','1 {C}'),
('NIN','100','1 {C}'),
('NIN','101','1 {C}'),
('NIN','102','1 {C}'),
('NIN','104','1 {C}'),
('NIN','105','1 {C}'),
('NIN','107','1 {C}'),
('NIN','109','1 {C}'),
('NIN','112','1 {C}'),
('NIN','113','1 {C}'),
('NIN','114','1 {C}'),
('NIN','118','1 {C}'),
('NIN','119','1 {C}'),
('NIN','120','1 {C}'),
('NIN','121','1 {C}'),
('JGK','108','1 {C}'),
('JGK','109','1 {C}'),
('JGK','110','1 {C}'),
('JGK','111','1 {C}'),
('JGK','113','1 {C}'),
('JGK','114','1 {C}'),
('JGK','115','1 {C}'),
('JGK','117','1 {C}'),
('JGK','122','1 {C}'),
('JGK','126','1 {C}'),
('JGK','127','1 {C}'),
('JGK','130','1 {C}'),
('JGK','131','1 {C}'),
('JGK','132','1 {C}'),
('JGK','133','1 {C}'),
('FAL','158','1 {C}'),
('FAL','159','1 {C}'),
('FAL','160','1 {C}'),
('FAL','161','1 {C}'),
('FAL','163','1 {C}'),
('FAL','164','1 {C}'),
('FAL','165','1 {C}'),
('FAL','166','1 {C}'),
('FAL','170','1 {C}'),
('FAL','172','1 {C}'),
('FAL','178','1 {C}'),
('FAL','180','1 {C}'),
('FAL','181','1 {C}'),
('FAL','182','1 {C}'),
('FAL','188','1 {C}'),
('FAL','189','1 {C}'),
('JGK','089','1 {M]'),
('COR','008','1 {M}'),
('COR','094','1 {M}'),
('COR','095','1 {M}'),
('COR','096','1 {M}'),
('COR','097','1 {M}'),
('COR','100','1 {M}'),
('COR','102','1 {M}'),
('COR','103','1 {M}'),
('COR','104','1 {M}'),
('COR','106','1 {M}'),
('COR','112','1 {M}'),
('COR','113','1 {M}'),
('COR','114','1 {M}'),
('COR','115','1 {M}'),
('COR','116','1 {M}'),
('WHV','007','1 {M}'),
('WHV','056','1 {M}'),
('WHV','057','1 {M}'),
('WHV','060','1 {M}'),
('WHV','061','1 {M}'),
('WHV','066','1 {M}'),
('WHV','067','1 {M}'),
('WHV','068','1 {M}'),
('DEP','063','1 {M}'),
('DEP','065','1 {M}'),
('DEP','067','1 {M}'),
('DEP','069','1 {M}'),
('DEP','072','1 {M}'),
('DEP','073','1 {M}'),
('DEP','074','1 {M}'),
('DEP','075','1 {M}'),
('DEP','080','1 {M}'),
('DEP','081','1 {M}'),
('QIL','004','1 {M}'),
('QIL','066','1 {M}'),
('QIL','067','1 {M}'),
('QIL','069','1 {M}'),
('QIL','075','1 {M}'),
('QIL','076','1 {M}'),
('QIL','077','1 {M}'),
('QIL','079','1 {M}'),
('QIL','083','1 {M}'),
('QIL','084','1 {M}'),
('CLA','044','1 {M}'),
('CLA','047','1 {M}'),
('CLA','049','1 {M}'),
('CLA','050','1 {M}'),
('CLA','051','1 {M}'),
('CLA','052','1 {M}'),
('KGD','055','1 {M}'),
('KGD','056','1 {M}'),
('KGD','057','1 {M}'),
('KGD','058','1 {M}'),
('KGD','059','1 {M}'),
('KGD','060','1 {M}'),
('KGD','065','1 {M}'),
('KGD','067','1 {M}'),
('KGD','068','1 {M}'),
('NIN','073','1 {M}'),
('NIN','074','1 {M}'),
('NIN','075','1 {M}'),
('NIN','077','1 {M}'),
('NIN','078','1 {M}'),
('NIN','079','1 {M}'),
('NIN','081','1 {M}'),
('NIN','083','1 {M}'),
('NIN','085','1 {M}'),
('NIN','086','1 {M}'),
('NIN','087','1 {M}'),
('NIN','089','1 {M}'),
('NIN','094','1 {M}'),
('NIN','095','1 {M}'),
('NIN','096','1 {M}'),
('NIN','097','1 {M}'),
('JGK','081','1 {M}'),
('JGK','082','1 {M}'),
('JGK','083','1 {M}'),
('JGK','084','1 {M}'),
('JGK','085','1 {M}'),
('JGK','086','1 {M}'),
('JGK','087','1 {M}'),
('JGK','090','1 {M}'),
('JGK','093','1 {M}'),
('JGK','097','1 {M}'),
('JGK','098','1 {M}'),
('JGK','099','1 {M}'),
('JGK','100','1 {M}'),
('JGK','101','1 {M}'),
('JGK','104','1 {M}'),
('FAL','125','1 {M}'),
('FAL','126','1 {M}'),
('FAL','127','1 {M}'),
('FAL','128','1 {M}'),
('FAL','129','1 {M}'),
('FAL','132','1 {M}'),
('FAL','133','1 {M}'),
('FAL','134','1 {M}'),
('FAL','135','1 {M}'),
('FAL','137','1 {M}'),
('FAL','138','1 {M}'),
('FAL','141','1 {M}'),
('FAL','146','1 {M}'),
('FAL','147','1 {M}'),
('FAL','153','1 {M}'),
('FAL','155','1 {M}'),
('FAL','156','1 {M}'),
('DEP','108','1 {M} 1 {C}'),
('QIL','116','1 {M} 1 {C}'),
('NIN','128','1 {M} 1 {C}'),
('NIN','134','1 {M} 1 {C}'),
('JGK','138','1 {M} 1 {C}'),
('DEP','009','1 {M} 2 {C}'),
('QIL','011','1 {M} 2 {C}'),
('QIL','117','1 {M} 2 {C}'),
('FAL','008','1 {M} 2 {C}'),
('FAL','017','1 {M} 2 {C}'),
('FAL','201','1 {M} 2 {C}'),
('NIN','007','1 {M} 3 {C}'),
('COR','038','1 {N}'),
('COR','040','1 {N}'),
('COR','041','1 {N}'),
('COR','042','1 {N}'),
('COR','043','1 {N}'),
('COR','044','1 {N}'),
('COR','049','1 {N}'),
('COR','050','1 {N}'),
('COR','051','1 {N}'),
('COR','052','1 {N}'),
('COR','057','1 {N}'),
('COR','058','1 {N}'),
('COR','059','1 {N}'),
('COR','060','1 {N}'),
('WHV','003','1 {N}'),
('WHV','028','1 {N}'),
('WHV','030','1 {N}'),
('WHV','031','1 {N}'),
('WHV','033','1 {N}'),
('WHV','034','1 {N}'),
('WHV','035','1 {N}'),
('WHV','036','1 {N}'),
('WHV','038','1 {N}'),
('WHV','039','1 {N}'),
('WHV','040','1 {N}'),
('DEP','002','1 {N}'),
('DEP','023','1 {N}'),
('DEP','024','1 {N}'),
('DEP','025','1 {N}'),
('DEP','026','1 {N}'),
('DEP','027','1 {N}'),
('DEP','028','1 {N}'),
('DEP','032','1 {N}'),
('DEP','033','1 {N}'),
('DEP','037','1 {N}'),
('DEP','038','1 {N}'),
('DEP','039','1 {N}'),
('DEP','040','1 {N}'),
('DEP','041','1 {N}'),
('QIL','026','1 {N}'),
('QIL','027','1 {N}'),
('QIL','028','1 {N}'),
('QIL','029','1 {N}'),
('QIL','030','1 {N}'),
('QIL','036','1 {N}'),
('QIL','038','1 {N}'),
('QIL','043','1 {N}'),
('QIL','044','1 {N}'),
('CLA','015','1 {N}'),
('CLA','016','1 {N}'),
('CLA','017','1 {N}'),
('CLA','020','1 {N}'),
('CLA','025','1 {N}'),
('KGD','027','1 {N}'),
('KGD','028','1 {N}'),
('KGD','029','1 {N}'),
('KGD','031','1 {N}'),
('KGD','038','1 {N}'),
('KGD','039','1 {N}'),
('KGD','040','1 {N}'),
('NIN','023','1 {N}'),
('NIN','024','1 {N}'),
('NIN','025','1 {N}'),
('NIN','026','1 {N}'),
('NIN','027','1 {N}'),
('NIN','029','1 {N}'),
('NIN','031','1 {N}'),
('NIN','037','1 {N}'),
('NIN','039','1 {N}'),
('NIN','042','1 {N}'),
('NIN','043','1 {N}'),
('NIN','044','1 {N}'),
('NIN','045','1 {N}'),
('NIN','046','1 {N}'),
('NIN','076','1 {N}'),
('JGK','027','1 {N}'),
('JGK','028','1 {N}'),
('JGK','029','1 {N}'),
('JGK','030','1 {N}'),
('JGK','031','1 {N}'),
('JGK','032','1 {N}'),
('JGK','034','1 {N}'),
('JGK','035','1 {N}'),
('JGK','036','1 {N}'),
('JGK','037','1 {N}'),
('JGK','038','1 {N}'),
('JGK','044','1 {N}'),
('JGK','045','1 {N}'),
('JGK','048','1 {N}'),
('JGK','049','1 {N}'),
('JGK','050','1 {N}'),
('JGK','051','1 {N}'),
('FAL','059','1 {N}'),
('FAL','060','1 {N}'),
('FAL','062','1 {N}'),
('FAL','063','1 {N}'),
('FAL','064','1 {N}'),
('FAL','067','1 {N}'),
('FAL','068','1 {N}'),
('FAL','075','1 {N}'),
('FAL','076','1 {N}'),
('FAL','077','1 {N}'),
('FAL','078','1 {N}'),
('FAL','081','1 {N}'),
('FAL','083','1 {N}'),
('FAL','084','1 {N}'),
('FAL','087','1 {N}'),
('FAL','088','1 {N}'),
('FAL','089','1 {N}'),
('FAL','090','1 {N}'),
('FAL','091','1 {N}'),
('QIL','008','1 {N} 1 {C}'),
('QIL','110','1 {N} 1 {C}'),
('NIN','131','1 {N} 1 {C}'),
('JGK','135','1 {N} 1 {C}'),
('FAL','023','1 {N} 1 {C}'),
('FAL','196','1 {N} 1 {C}'),
('QIL','108','1 {N} 1 {M}'),
('QIL','109','1 {N} 1 {M}'),
('NIN','124','1 {N} 1 {M}'),
('NIN','130','1 {N} 1 {M}'),
('FAL','007','1 {N} 1 {M}'),
('FAL','194','1 {N} 1 {M}'),
('DEP','006','1 {N} 1 {T}'),
('QIL','006','1 {N} 1 {T}'),
('QIL','106','1 {N} 1 {T}'),
('NIN','129','1 {N} 1 {T}'),
('FAL','192','1 {N} 1 {T}'),
('FAL','006','1 {N} 2 {C}'),
('FAL','019','1 {N} 2 {C}'),
('JGK','007','1 {N} 2 {M}'),
('FAL','022','1 {N} 2 {M}'),
('FAL','193','1 {N} 2 {M}'),
('NIN','002','1 {N} 2 {T}'),
('FAL','021','1 {N} 3 {T}'),
('COR','066','1 {T}'),
('COR','067','1 {T}'),
('COR','068','1 {T}'),
('COR','069','1 {T}'),
('COR','070','1 {T}'),
('COR','075','1 {T}'),
('COR','076','1 {T}'),
('COR','079','1 {T}'),
('COR','080','1 {T}'),
('COR','083','1 {T}'),
('COR','084','1 {T}'),
('COR','085','1 {T}'),
('COR','086','1 {T}'),
('COR','087','1 {T}'),
('COR','088','1 {T}'),
('WHV','005','1 {T}'),
('WHV','042','1 {T}'),
('WHV','043','1 {T}'),
('WHV','044','1 {T}'),
('WHV','047','1 {T}'),
('WHV','048','1 {T}'),
('WHV','049','1 {T}'),
('WHV','050','1 {T}'),
('WHV','051','1 {T}'),
('WHV','053','1 {T}'),
('DEP','043','1 {T}'),
('DEP','044','1 {T}'),
('DEP','045','1 {T}'),
('DEP','046','1 {T}'),
('DEP','047','1 {T}'),
('DEP','049','1 {T}'),
('DEP','050','1 {T}'),
('DEP','052','1 {T}'),
('DEP','053','1 {T}'),
('DEP','054','1 {T}'),
('DEP','055','1 {T}'),
('DEP','056','1 {T}'),
('DEP','057','1 {T}'),
('DEP','058','1 {T}'),
('DEP','059','1 {T}'),
('QIL','003','1 {T}'),
('QIL','046','1 {T}'),
('QIL','047','1 {T}'),
('QIL','050','1 {T}'),
('QIL','051','1 {T}'),
('QIL','052','1 {T}'),
('QIL','054','1 {T}'),
('QIL','056','1 {T}'),
('QIL','057','1 {T}'),
('QIL','058','1 {T}'),
('QIL','059','1 {T}'),
('QIL','061','1 {T}'),
('QIL','062','1 {T}'),
('QIL','063','1 {T}'),
('CLA','029','1 {T}'),
('CLA','030','1 {T}'),
('CLA','031','1 {T}'),
('CLA','033','1 {T}'),
('CLA','034','1 {T}'),
('CLA','036','1 {T}'),
('KGD','003','1 {T}'),
('KGD','041','1 {T}'),
('KGD','042','1 {T}'),
('KGD','043','1 {T}'),
('KGD','044','1 {T}'),
('KGD','045','1 {T}'),
('KGD','047','1 {T}'),
('KGD','051','1 {T}'),
('KGD','053','1 {T}'),
('KGD','054','1 {T}'),
('NIN','048','1 {T}'),
('NIN','050','1 {T}'),
('NIN','051','1 {T}'),
('NIN','053','1 {T}'),
('NIN','054','1 {T}'),
('NIN','055','1 {T}'),
('NIN','056','1 {T}'),
('NIN','057','1 {T}'),
('NIN','062','1 {T}'),
('NIN','063','1 {T}'),
('NIN','064','1 {T}'),
('NIN','066','1 {T}'),
('NIN','067','1 {T}'),
('NIN','068','1 {T}'),
('NIN','069','1 {T}'),
('NIN','070','1 {T}'),
('NIN','071','1 {T}'),
('NIN','072','1 {T}'),
('JGK','054','1 {T}'),
('JGK','055','1 {T}'),
('JGK','056','1 {T}'),
('JGK','057','1 {T}'),
('JGK','058','1 {T}'),
('JGK','059','1 {T}'),
('JGK','060','1 {T}'),
('JGK','061','1 {T}'),
('JGK','062','1 {T}'),
('JGK','063','1 {T}'),
('JGK','065','1 {T}'),
('JGK','066','1 {T}'),
('JGK','069','1 {T}'),
('JGK','071','1 {T}'),
('JGK','072','1 {T}'),
('JGK','073','1 {T}'),
('JGK','075','1 {T}'),
('JGK','076','1 {T}'),
('JGK','077','1 {T}'),
('JGK','078','1 {T}'),
('JGK','079','1 {T}'),
('FAL','003','1 {T}'),
('FAL','092','1 {T}'),
('FAL','093','1 {T}'),
('FAL','095','1 {T}'),
('FAL','096','1 {T}'),
('FAL','098','1 {T}'),
('FAL','099','1 {T}'),
('FAL','100','1 {T}'),
('FAL','101','1 {T}'),
('FAL','104','1 {T}'),
('FAL','105','1 {T}'),
('FAL','106','1 {T}'),
('FAL','111','1 {T}'),
('FAL','112','1 {T}'),
('FAL','113','1 {T}'),
('FAL','114','1 {T}'),
('FAL','115','1 {T}'),
('FAL','118','1 {T}'),
('FAL','119','1 {T}'),
('FAL','120','1 {T}'),
('FAL','121','1 {T}'),
('FAL','123','1 {T}'),
('COR','081','1 {T}'),
('DEP','107','1 {T} 1 {C}'),
('QIL','114','1 {T} 1 {C}'),
('QIL','115','1 {T} 1 {C}'),
('NIN','006','1 {T} 1 {C}'),
('NIN','127','1 {T} 1 {C}'),
('NIN','133','1 {T} 1 {C}'),
('JGK','137','1 {T} 1 {C}'),
('FAL','016','1 {T} 1 {C}'),
('FAL','025','1 {T} 1 {C}'),
('FAL','200','1 {T} 1 {C}'),
('DEP','106','1 {T} 1 {M}'),
('QIL','009','1 {T} 1 {M}'),
('QIL','112','1 {T} 1 {M}'),
('NIN','005','1 {T} 1 {M}'),
('NIN','126','1 {T} 1 {M}'),
('NIN','132','1 {T} 1 {M}'),
('JGK','136','1 {T} 1 {M}'),
('FAL','010','1 {T} 1 {M}'),
('FAL','198','1 {T} 1 {M}'),
('QIL','010','1 {T} 2 {C}'),
('QIL','113','1 {T} 2 {M}'),
('FAL','012','1 {T} 2 {M}'),
('FAL','018','1 {T} 2 {M}'),
('HOE','090','1[C]'),
('HOE','091','1[C]'),
('HOE','093','1[C]'),
('HOE','094','1[C]'),
('HOE','095','1[C]'),
('HOE','097','1[C]'),
('HOE','098','1[C]'),
('HOE','102','1[C]'),
('HOE','103','1[C]'),
('HOE','104','1[C]'),
('HOE','108','1[C]'),
('HOE','110','1[C]'),
('HOE','009','1[N]'),
('HOE','010','1[N]'),
('HOE','012','1[N]'),
('HOE','015','1[N]'),
('HOE','017','1[N]'),
('HOE','023','1[N]'),
('HOE','024','1[N]'),
('HOE','025','1[N]'),
('HOE','026','1[N]'),
('HOE','028','1[N]'),
('HOE','020','10[N]'),
('ELM','006','1L 1M'),
('ELM','017','1L 1N'),
('ELM','007','1L 2M'),
('ELM','018','1L 2N'),
('ELM','028','1L 2T'),
('ELM','030','1L 2T'),
('ELM','002','1L 3M'),
('ELM','029','1L 3T'),
('ELM','004','1L 5M'),
('ELM','014','1L 5N'),
('ELM','022','1T'),
('HOE','062','2 [M]'),
('HOE','071','2 [M]'),
('HOE','074','2 [M]'),
('HOE','075','2 [M]'),
('HOE','079','2 [M]'),
('HOE','081','2 [M]'),
('HOE','084','2 [M]'),
('HOE','035','2 [T]'),
('HOE','046','2 [T]'),
('HOE','048','2 [T]'),
('COR','010','2 {C}'),
('COR','127','2 {C}'),
('COR','136','2 {C}'),
('COR','137','2 {C}'),
('COR','141','2 {C}'),
('WHV','010','2 {C}'),
('WHV','074','2 {C}'),
('WHV','076','2 {C}'),
('WHV','079','2 {C}'),
('WHV','080','2 {C}'),
('DEP','089','2 {C}'),
('DEP','090','2 {C}'),
('DEP','094','2 {C}'),
('DEP','096','2 {C}'),
('QIL','089','2 {C}'),
('QIL','090','2 {C}'),
('QIL','093','2 {C}'),
('QIL','096','2 {C}'),
('CLA','059','2 {C}'),
('CLA','061','2 {C}'),
('CLA','066','2 {C}'),
('KGD','005','2 {C}'),
('KGD','077','2 {C}'),
('NIN','103','2 {C}'),
('NIN','106','2 {C}'),
('NIN','108','2 {C}'),
('NIN','110','2 {C}'),
('NIN','111','2 {C}'),
('JGK','112','2 {C}'),
('JGK','116','2 {C}'),
('JGK','118','2 {C}'),
('JGK','119','2 {C}'),
('JGK','121','2 {C}'),
('JGK','123','2 {C}'),
('JGK','128','2 {C}'),
('JGK','129','2 {C}'),
('FAL','005','2 {C}'),
('FAL','162','2 {C}'),
('FAL','167','2 {C}'),
('FAL','168','2 {C}'),
('FAL','169','2 {C}'),
('FAL','171','2 {C}'),
('FAL','175','2 {C}'),
('FAL','179','2 {C}'),
('FAL','183','2 {C}'),
('FAL','184','2 {C}'),
('FAL','186','2 {C}'),
('FAL','190','2 {C}'),
('COR','098','2 {M}'),
('COR','099','2 {M}'),
('COR','101','2 {M}'),
('COR','105','2 {M}'),
('COR','108','2 {M}'),
('COR','109','2 {M}'),
('COR','110','2 {M}'),
('WHV','008','2 {M}'),
('WHV','058','2 {M}'),
('WHV','063','2 {M}'),
('WHV','064','2 {M}'),
('WHV','065','2 {M}'),
('DEP','004','2 {M}'),
('DEP','064','2 {M}'),
('DEP','066','2 {M}'),
('DEP','068','2 {M}'),
('DEP','076','2 {M}'),
('DEP','077','2 {M}'),
('DEP','079','2 {M}'),
('QIL','068','2 {M}'),
('QIL','070','2 {M}'),
('QIL','071','2 {M}'),
('QIL','072','2 {M}'),
('QIL','078','2 {M}'),
('QIL','081','2 {M}'),
('QIL','082','2 {M}'),
('CLA','003','2 {M}'),
('CLA','045','2 {M}'),
('CLA','046','2 {M}'),
('CLA','053','2 {M}'),
('KGD','004','2 {M}'),
('KGD','061','2 {M}'),
('KGD','066','2 {M}'),
('NIN','080','2 {M}'),
('NIN','082','2 {M}'),
('NIN','084','2 {M}'),
('NIN','088','2 {M}'),
('NIN','090','2 {M}'),
('NIN','091','2 {M}'),
('JGK','091','2 {M}'),
('JGK','092','2 {M}'),
('JGK','094','2 {M}'),
('JGK','102','2 {M}'),
('JGK','105','2 {M}'),
('FAL','004','2 {M}'),
('FAL','130','2 {M}'),
('FAL','131','2 {M}'),
('FAL','136','2 {M}'),
('FAL','139','2 {M}'),
('FAL','140','2 {M}'),
('FAL','143','2 {M}'),
('FAL','148','2 {M}'),
('FAL','149','2 {M}'),
('FAL','150','2 {M}'),
('FAL','154','2 {M}'),
('FAL','157','2 {M}'),
('FAL','011','2 {M} 2 {C}'),
('FAL','202','2 {M} 2 {C}'),
('FAL','026','2 {M} 3 {C}'),
('COR','005','2 {N}'),
('COR','039','2 {N}'),
('COR','045','2 {N}'),
('COR','046','2 {N}'),
('COR','053','2 {N}'),
('COR','056','2 {N}'),
('WHV','004','2 {N}'),
('WHV','029','2 {N}'),
('WHV','032','2 {N}'),
('WHV','037','2 {N}'),
('DEP','029','2 {N}'),
('DEP','031','2 {N}'),
('DEP','035','2 {N}'),
('QIL','031','2 {N}'),
('QIL','033','2 {N}'),
('QIL','035','2 {N}'),
('QIL','042','2 {N}'),
('CLA','021','2 {N}'),
('CLA','024','2 {N}'),
('KGD','030','2 {N}'),
('KGD','032','2 {N}'),
('KGD','033','2 {N}'),
('KGD','037','2 {N}'),
('NIN','030','2 {N}'),
('NIN','032','2 {N}'),
('NIN','035','2 {N}'),
('NIN','036','2 {N}'),
('NIN','038','2 {N}'),
('NIN','041','2 {N}'),
('NIN','047','2 {N}'),
('JGK','033','2 {N}'),
('JGK','039','2 {N}'),
('JGK','046','2 {N}'),
('JGK','052','2 {N}'),
('FAL','002','2 {N}'),
('FAL','061','2 {N}'),
('FAL','065','2 {N}'),
('FAL','069','2 {N}'),
('FAL','070','2 {N}'),
('FAL','071','2 {N}'),
('FAL','072','2 {N}'),
('FAL','079','2 {N}'),
('FAL','082','2 {N}'),
('NIN','004','2 {N} 1 {C}'),
('NIN','125','2 {N} 1 {C}'),
('FAL','020','2 {N} 1 {C}'),
('FAL','195','2 {N} 1 {C}'),
('DEP','007','2 {N} 1 {M}'),
('QIL','007','2 {N} 1 {M}'),
('DEP','103','2 {N} 1 {T}'),
('QIL','107','2 {N} 1 {T}'),
('NIN','123','2 {N} 1 {T}'),
('JGK','006','2 {N} 1 {T}'),
('FAL','191','2 {N} 1 {T}'),
('NIN','003','2 {N} 2 {M}'),
('FAL','014','2 {N} 2 {T}'),
('COR','007','2 {T}'),
('COR','071','2 {T}'),
('COR','072','2 {T}'),
('COR','073','2 {T}'),
('COR','074','2 {T}'),
('COR','077','2 {T}'),
('COR','082','2 {T}'),
('WHV','006','2 {T}'),
('WHV','045','2 {T}'),
('WHV','046','2 {T}'),
('WHV','052','2 {T}'),
('WHV','054','2 {T}'),
('DEP','003','2 {T}'),
('DEP','048','2 {T}'),
('DEP','051','2 {T}'),
('DEP','060','2 {T}'),
('DEP','061','2 {T}'),
('QIL','048','2 {T}'),
('QIL','049','2 {T}'),
('QIL','053','2 {T}'),
('QIL','055','2 {T}'),
('QIL','064','2 {T}'),
('CLA','002','2 {T}'),
('CLA','035','2 {T}'),
('CLA','037','2 {T}'),
('CLA','038','2 {T}'),
('CLA','039','2 {T}'),
('KGD','046','2 {T}'),
('KGD','048','2 {T}'),
('KGD','049','2 {T}'),
('KGD','052','2 {T}'),
('NIN','049','2 {T}'),
('NIN','052','2 {T}'),
('NIN','058','2 {T}'),
('NIN','059','2 {T}'),
('NIN','060','2 {T}'),
('NIN','061','2 {T}'),
('NIN','065','2 {T}'),
('JGK','003','2 {T}'),
('JGK','064','2 {T}'),
('JGK','067','2 {T}'),
('FAL','094','2 {T}'),
('FAL','097','2 {T}'),
('FAL','102','2 {T}'),
('FAL','103','2 {T}'),
('FAL','107','2 {T}'),
('FAL','108','2 {T}'),
('FAL','109','2 {T}'),
('FAL','116','2 {T}'),
('FAL','122','2 {T}'),
('DEP','008','2 {T} 1 {C}'),
('FAL','015','2 {T} 1 {C}'),
('FAL','199','2 {T} 1 {C}'),
('FAL','024','2 {T} 1 {M}'),
('FAL','197','2 {T} 1 {M}'),
('HOE','092','2[C]'),
('HOE','096','2[C]'),
('HOE','105','2[C]'),
('HOE','106','2[C]'),
('HOE','113','2[C]'),
('HOE','011','2[N]'),
('HOE','013','2[N]'),
('HOE','014','2[N]'),
('HOE','021','2[N]'),
('HOE','022','2[N]'),
('HOE','027','2[N]'),
('ELM','009','2L 3M'),
('ELM','024','2L 4T'),
('ELM','031','2L 5T'),
('ELM','015','2N'),
('COR','142','3 {C}'),
('COR','144','3 {C}'),
('DEP','097','3 {C}'),
('QIL','094','3 {C}'),
('QIL','095','3 {C}'),
('QIL','097','3 {C}'),
('QIL','100','3 {C}'),
('CLA','063','3 {C}'),
('KGD','076','3 {C}'),
('KGD','078','3 {C}'),
('NIN','115','3 {C}'),
('NIN','116','3 {C}'),
('NIN','122','3 {C}'),
('JGK','005','3 {C}'),
('JGK','120','3 {C}'),
('JGK','124','3 {C}'),
('FAL','173','3 {C}'),
('FAL','176','3 {C}'),
('FAL','185','3 {C}'),
('FAL','187','3 {C}'),
('COR','009','3 {M}'),
('COR','107','3 {M}'),
('WHV','059','3 {M}'),
('WHV','062','3 {M}'),
('DEP','070','3 {M}'),
('DEP','071','3 {M}'),
('DEP','078','3 {M}'),
('QIL','073','3 {M}'),
('QIL','080','3 {M}'),
('CLA','043','3 {M}'),
('CLA','048','3 {M}'),
('KGD','062','3 {M}'),
('KGD','063','3 {M}'),
('KGD','064','3 {M}'),
('NIN','092','3 {M}'),
('JGK','004','3 {M}'),
('JGK','088','3 {M}'),
('JGK','095','3 {M}'),
('JGK','103','3 {M}'),
('FAL','142','3 {M}'),
('FAL','144','3 {M}'),
('FAL','151','3 {M}'),
('COR','047','3 {N}'),
('COR','054','3 {N}'),
('DEP','034','3 {N}'),
('DEP','036','3 {N}'),
('QIL','002','3 {N}'),
('QIL','032','3 {N}'),
('QIL','034','3 {N}'),
('QIL','037','3 {N}'),
('QIL','039','3 {N}'),
('CLA','001','3 {N}'),
('CLA','018','3 {N}'),
('CLA','023','3 {N}'),
('CLA','026','3 {N}'),
('KGD','002','3 {N}'),
('KGD','034','3 {N}'),
('KGD','035','3 {N}'),
('NIN','028','3 {N}'),
('NIN','033','3 {N}'),
('NIN','034','3 {N}'),
('NIN','040','3 {N}'),
('JGK','002','3 {N}'),
('JGK','040','3 {N}'),
('JGK','041','3 {N}'),
('JGK','047','3 {N}'),
('FAL','066','3 {N}'),
('FAL','073','3 {N}'),
('FAL','080','3 {N}'),
('FAL','085','3 {N}'),
('FAL','086','3 {N}'),
('FAL','013','3 {N} 1 {M}'),
('FAL','009','3 {N} 1 {T}'),
('DEP','105','3 {N} 2 {C}'),
('QIL','111','3 {N} 2 {C}'),
('DEP','104','3 {N} 3 {M}'),
('COR','006','3 {T}'),
('QIL','060','3 {T}'),
('KGD','050','3 {T}'),
('JGK','068','3 {T}'),
('JGK','074','3 {T}'),
('FAL','110','3 {T}'),
('FAL','124','3 {T}'),
('HOE','099','3[C]'),
('HOE','107','3[C]'),
('HOE','111','3[C]'),
('HOE','112','3[C]'),
('ELM','012','3L 1N'),
('ELM','003','3L 3M'),
('ELM','025','3L 4T'),
('ELM','021','3L 7N'),
('ELM','013','3N'),
('ELM','023','3N 3T'),
('QIL','005','4 {C}'),
('CLA','062','4 {C}'),
('NIN','117','4 {C}'),
('JGK','125','4 {C}'),
('FAL','174','4 {C}'),
('QIL','074','4 {M}'),
('NIN','093','4 {M}'),
('JGK','096','4 {M}'),
('COR','004','4 {N}'),
('COR','048','4 {N}'),
('DEP','030','4 {N}'),
('QIL','041','4 {N}'),
('CLA','019','4 {N}'),
('CLA','022','4 {N}'),
('KGD','036','4 {N}'),
('JGK','043','4 {N}'),
('FAL','074','4 {N}'),
('CLA','032','4 {T}'),
('JGK','070','4 {T}'),
('FAL','117','4 {T}'),
('HOE','089','4[C]'),
('HOE','109','4[C]'),
('HOE','016','4[N]'),
('HOE','018','4[N]'),
('ELM','008','4L 3M'),
('ELM','020','4L 4N'),
('ELM','010','4L 6M'),
('ELM','026','4L 6T'),
('ELM','019','4N'),
('COR','011','5 {C}'),
('COR','132','5 {C}'),
('COR','138','5 {C}'),
('CLA','060','5 {C}'),
('CLA','064','5 {C}'),
('FAL','177','5 {C}'),
('COR','111','5 {M}'),
('JGK','106','5 {M}'),
('FAL','145','5 {M}'),
('FAL','152','5 {M}'),
('COR','055','5 {N}'),
('CLA','027','5 {N}'),
('JGK','042','5 {N}'),
('COR','078','5 {T}'),
('ELM','001','5L 3M'),
('ELM','032','5L 5T'),
('QIL','040','6 {N}'),
('ELM','005','6L 4M'),
('ELM','016','7L 3N');

INSERT INTO Keyword (setID,cardID,keyword)
VALUES
('COR','001','Haste, Legend, Trash'),
('COR','002','Legend, Summon'),
('COR','003','Invest, Legend'),
('COR','012','Mill, Reclaim'),
('COR','013','Reaction'),
('COR','014',''),
('COR','015','Haste, Invest'),
('COR','016','Exhaust'),
('COR','017','Haste'),
('COR','018',''),
('COR','019','Reaction, Barrier'),
('COR','020','Blockade'),
('COR','021','Armored'),
('COR','022',''),
('COR','023',''),
('COR','024',''),
('COR','025','Reaction'),
('COR','026','Reposition'),
('COR','027','Reaction'),
('COR','028',''),
('COR','029','Deploy, Restrain'),
('COR','030','Choose One'),
('COR','031','Attach'),
('COR','032','Equip, Reaction'),
('COR','033','Deploy'),
('COR','034','Summon'),
('COR','035',''),
('COR','036',''),
('COR','037','Reach'),
('COR','150',''),
('COR','151',''),
('COR','152',''),
('COR','153',''),
('COR','154',''),
('COR','155',''),
('COR','T01','Sacrifice'),
('COR','T02',''),
('COR','004','Legend, Quick Strike'),
('COR','005','Legend'),
('COR','038','Invest'),
('COR','039','Invest, Lethal'),
('COR','040',''),
('COR','041','Blockade'),
('COR','042','Exhaust'),
('COR','043','Overheal'),
('COR','044','Haste'),
('COR','045','Breakthrough'),
('COR','046','Reaction, Overpass'),
('COR','047','Breakthrough, Barrier'),
('COR','048','Breakthrough, Exhaust'),
('COR','049',''),
('COR','050',''),
('COR','051','Reaction, Reposition'),
('COR','052','Invest'),
('COR','053','Transform'),
('COR','054',''),
('COR','055',''),
('COR','056','Equip, Lethal'),
('COR','057','Equip, Reaction'),
('COR','058','Afflict'),
('COR','059','Invest'),
('COR','060','Equip, Quick Strike'),
('COR','061',''),
('COR','062',''),
('COR','063',''),
('COR','064','Breakthrough'),
('COR','065','Sacrifice'),
('COR','T03',''),
('COR','006','Legend, Summon, Haste'),
('COR','007','Legend'),
('COR','066','Overpass, Spy'),
('COR','067','Invest'),
('COR','068',''),
('COR','069','Reaction, Armored'),
('COR','070','Haste, Overpass'),
('COR','071','Echo'),
('COR','072','Blockade, Armored'),
('COR','073','Breakthrough, Ruins'),
('COR','074','Ruins'),
('COR','075','Reaction'),
('COR','076','Allocate'),
('COR','077',''),
('COR','078',''),
('COR','079','Reaction, Afflict, Reposition'),
('COR','080',''),
('COR','081','Reaction, Afflict'),
('COR','082','Reaction, Deploy, Haste, Quick Strike'),
('COR','083','Equip, Reaction, Sacrifice, Sift'),
('COR','084','Afflict'),
('COR','085','Reaction'),
('COR','086','Choose One'),
('COR','087','Sift'),
('COR','088','Echo'),
('COR','089','Sift'),
('COR','090','Armored'),
('COR','091','Overpass'),
('COR','092','Reclaim'),
('COR','093',''),
('COR','T04',''),
('COR','T05',''),
('COR','T06',''),
('COR','008','Haste, Legend, Ephemeral, Sacrifice'),
('COR','009','Spy, Legend, Reaction'),
('COR','094','Overpass, Silence'),
('COR','095','Invest'),
('COR','096',''),
('COR','097','Ward, Spy'),
('COR','098','Ward'),
('COR','099','Overpass, Spy'),
('COR','100','Ward'),
('COR','101','Ward, Summon'),
('COR','102','Reaction'),
('COR','103','Summon, Invest'),
('COR','104','Reaction, Barrier'),
('COR','105','Breakthrough'),
('COR','106','Summon, Invest, Haste'),
('COR','107','Trash'),
('COR','108','Spy'),
('COR','109','Summon'),
('COR','110','Exhaust, Echo'),
('COR','111','Spy'),
('COR','112','Equip, Reaction, Sacrifice'),
('COR','113','Summon, Invest'),
('COR','114','Choose One, Invest'),
('COR','115',''),
('COR','116','Untargetable, Equip, Ward'),
('COR','117','Summon'),
('COR','118',''),
('COR','119','Exhaust'),
('COR','120','Ward'),
('COR','121','Summon, Spy, Sacrifice'),
('COR','T07','Blockade, Barrier'),
('COR','T08',''),
('COR','T09',''),
('COR','T10','Transform'),
('COR','T11','Ward'),
('COR','010','Mill, Legend'),
('COR','011','Legend, Mill, Summon'),
('COR','122',''),
('COR','123',''),
('COR','124','Invest, Convert'),
('COR','125','Overpass'),
('COR','126',''),
('COR','127','Convert'),
('COR','128',''),
('COR','129','Breakthrough, Mill'),
('COR','130','Overpass'),
('COR','131',''),
('COR','132','Convert, Sacrifice'),
('COR','133','Sacrifice'),
('COR','134','Invest'),
('COR','135',''),
('COR','136',''),
('COR','137','Convert'),
('COR','138','Sacrifice, Mill'),
('COR','139','Equip'),
('COR','140','Equip, Reaction, Sacrifice'),
('COR','141','Deploy, Mill'),
('COR','142','Deploy'),
('COR','143',''),
('COR','144','Attach, Reposition'),
('COR','145','Convert'),
('COR','146',''),
('COR','147',''),
('COR','148',''),
('COR','149','Sacrifice, Mill'),
('COR','T12','Mill'),
('HOE','001',''),
('HOE','002',''),
('HOE','003',''),
('HOE','004',''),
('HOE','005','Frailty, Quick Strike'),
('HOE','006',''),
('HOE','007','Stealth'),
('HOE','008','Silence'),
('HOE','009',''),
('HOE','010','Blockade'),
('HOE','011','Quick Strike'),
('HOE','012','Exhaust, Reposition'),
('HOE','013','Blockade, Armored'),
('HOE','014','Breakthrough'),
('HOE','015','Lethal'),
('HOE','016',''),
('HOE','017',''),
('HOE','018','Breakthrough'),
('HOE','019',''),
('HOE','020',''),
('HOE','021','Summon'),
('HOE','022',''),
('HOE','023',''),
('HOE','024',''),
('HOE','025','Armored'),
('HOE','026','Blockade'),
('HOE','027',''),
('HOE','028','Deploy'),
('HOE','029','Frailty'),
('HOE','030',''),
('HOE','031','Frailty'),
('HOE','032',''),
('HOE','033','Silence, Untargetable'),
('HOE','034',''),
('HOE','035','Legend'),
('HOE','036',''),
('HOE','037','Armored'),
('HOE','038','Armored'),
('HOE','039','Frailty'),
('HOE','040',''),
('HOE','041','Convert'),
('HOE','042',''),
('HOE','043',''),
('HOE','044',''),
('HOE','045','Reaction, Frailty'),
('HOE','046','Reaction, Armored'),
('HOE','047','Frailty, Armored'),
('HOE','048','Deploy'),
('HOE','049','Reaction, Exhaust'),
('HOE','050','Attach, Exhaust'),
('HOE','051','Restrain'),
('HOE','052',''),
('HOE','053','Exhaust'),
('HOE','054',''),
('HOE','055',''),
('HOE','056','Reaction, Attach'),
('HOE','057','Deploy, Hoard, Trash'),
('HOE','058',''),
('HOE','059','Armored'),
('HOE','060','Frailty'),
('HOE','061','Armored, Frailty'),
('HOE','062','Leader, Legend, Summon'),
('HOE','063','Invest'),
('HOE','064','Leader'),
('HOE','065','Crowd, Twin Strike'),
('HOE','066',''),
('HOE','067','Crowd'),
('HOE','068','Exhaust'),
('HOE','069','Leader, Stealth'),
('HOE','070','Crowd'),
('HOE','071',''),
('HOE','072',''),
('HOE','073','Reaction'),
('HOE','074',''),
('HOE','075','Summon'),
('HOE','076',''),
('HOE','077','Leader'),
('HOE','078',''),
('HOE','079',''),
('HOE','080','Equip, Reposition'),
('HOE','081','Equip, Breakthrough, Overpass'),
('HOE','082','Deploy, Reposition'),
('HOE','083','Attach, Reaction'),
('HOE','084','Invest, Crowd'),
('HOE','085','Reaction'),
('HOE','086','Summon'),
('HOE','087','Leader'),
('HOE','088','Leader, Crowd'),
('HOE','089','Breakthrough, Legend, Scarcity'),
('HOE','090','Stealth'),
('HOE','091','Invest, Summon'),
('HOE','092',''),
('HOE','093','Trash'),
('HOE','094','Reposition'),
('HOE','095',''),
('HOE','096',''),
('HOE','097','Overpass'),
('HOE','098',''),
('HOE','099',''),
('HOE','100',''),
('HOE','101',''),
('HOE','102','Scarcity'),
('HOE','103','Scarcity'),
('HOE','104','Scarcity'),
('HOE','105',''),
('HOE','106','Scarcity'),
('HOE','107','Restrain'),
('HOE','108',''),
('HOE','109',''),
('HOE','110',''),
('HOE','111','Exhaust, Scarcity'),
('HOE','112','Deploy, Exhaust'),
('HOE','113','Deploy, Haste'),
('HOE','114',''),
('HOE','115','Scarcity'),
('HOE','116',''),
('ELM','001','Breakthrough'),
('ELM','002','Breakthrough'),
('ELM','003','Breakthrough'),
('ELM','004','Breakthrough, Barrier, Ward'),
('ELM','005','Breakthrough'),
('ELM','006',''),
('ELM','007','Summon, Invest'),
('ELM','008','Summon'),
('ELM','009',''),
('ELM','010','Downgrade, Summon'),
('ELM','011','Summon'),
('ELM','012','Trash'),
('ELM','013','Invest'),
('ELM','014','Trash'),
('ELM','015','Lethal'),
('ELM','016','Trash'),
('ELM','017','Attach, Invest'),
('ELM','018','Silence'),
('ELM','019',''),
('ELM','020',''),
('ELM','021','Deploy'),
('ELM','022','Reposition'),
('ELM','023',''),
('ELM','024','Summon'),
('ELM','025',''),
('ELM','026',''),
('ELM','027',''),
('ELM','028','Reaction, First Strike'),
('ELM','029','Overpass, Armored'),
('ELM','030','Reaction, Armored'),
('ELM','031','Armored, Overpass'),
('ELM','032','Restrain, Armored'),
('WHV','001','Roll, Legend'),
('WHV','002','Armored, Legend'),
('WHV','011','Stealth'),
('WHV','012','Blockade'),
('WHV','013','Overpass, Spy'),
('WHV','014','Armored'),
('WHV','015',''),
('WHV','016',''),
('WHV','017','Reaction, Ward, Reposition'),
('WHV','018',''),
('WHV','019','Depth'),
('WHV','020',''),
('WHV','021',''),
('WHV','022',''),
('WHV','023','Attach'),
('WHV','024','Depth'),
('WHV','025','Invest'),
('WHV','026','Depth'),
('WHV','027','Legend'),
('WHV','084','Depth, Mill'),
('WHV','085','Depth, Mill'),
('WHV','003','Transform, Legend'),
('WHV','004','Legend'),
('WHV','028','Breakthrough, Invest, Summon'),
('WHV','029','Depth'),
('WHV','030','Overpass, Invest'),
('WHV','031','Depth, Quick Strike'),
('WHV','032',''),
('WHV','033','Breakthrough'),
('WHV','034','Reaction, Attach, Reposition, Ward'),
('WHV','035',''),
('WHV','036','Attach, Silence'),
('WHV','037','Attach'),
('WHV','038','Overheal, Transform'),
('WHV','039','Attach, Armored'),
('WHV','040','Lethal'),
('WHV','041','Reaction'),
('WHV','T01','Breakthrough'),
('WHV','T08','Legend'),
('WHV','T09','Deploy'),
('WHV','005','Transform, Legend, Stealth, Reposition'),
('WHV','006','Legend, Stealth'),
('WHV','042','Invest, Summon'),
('WHV','043','Armored, Stealth'),
('WHV','044','Stealth'),
('WHV','045','Armored'),
('WHV','046',''),
('WHV','047','Allocate'),
('WHV','048','Depth, Sift'),
('WHV','049','Depth'),
('WHV','050','Depth, Transform'),
('WHV','051','Sift, Armored'),
('WHV','052','Attach, Quick Strike, Twin Strike'),
('WHV','053','Attach, Trash'),
('WHV','054','Deploy, Depth, Sift, Mill'),
('WHV','055','Reaction'),
('WHV','T02',''),
('WHV','T03','Attach, Stealth'),
('WHV','T10','Overpass, Legend'),
('WHV','T11','Blockade, Exhaust, Sift'),
('WHV','007','Transform, Legend, Trash'),
('WHV','008','Legend, Silence, Sacrifice'),
('WHV','056','Sacrifice, Invest'),
('WHV','057','Summon, Silence'),
('WHV','058','Depth'),
('WHV','059','Overpass, Choose One, Sacrifice'),
('WHV','060','Transform'),
('WHV','061',''),
('WHV','062','Reaction, Attach, Ward, Barrier'),
('WHV','063','Reaction'),
('WHV','064','Depth, Silence'),
('WHV','065','Summon'),
('WHV','066','Spy'),
('WHV','067','Attach, Silence, Sacrifice'),
('WHV','068','Summon, Ward'),
('WHV','069','Reaction'),
('WHV','T04','Overpass'),
('WHV','T05','Sacrifice'),
('WHV','T12','Legend, Trash, Silence'),
('WHV','T13',''),
('WHV','009','Transform'),
('WHV','010','Legend, Trash'),
('WHV','070',''),
('WHV','071','Invest, Summon'),
('WHV','072','Depth, Stealth'),
('WHV','073',''),
('WHV','074','Trash'),
('WHV','075','Breakthrough, Haste'),
('WHV','076',''),
('WHV','077','Invest'),
('WHV','078','Depth'),
('WHV','079',''),
('WHV','080','Reaction'),
('WHV','081','Convert'),
('WHV','082','Attach'),
('WHV','083','Reaction'),
('WHV','T06',''),
('WHV','T07',''),
('WHV','T14','Stealth, Legend, Convert'),
('WHV','T15','Breakthrough'),
('DEP','001','Legend'),
('DEP','010',''),
('DEP','011','Depth, Overpass'),
('DEP','012','Echo'),
('DEP','013','Depth, Armored'),
('DEP','014','Echo'),
('DEP','015','Trash'),
('DEP','016','Trash'),
('DEP','017','Invest, Depth'),
('DEP','018','Attach, Depth'),
('DEP','019','Echo'),
('DEP','020','Trash'),
('DEP','021','Downgrade'),
('DEP','022','Depth'),
('DEP','002','Legend'),
('DEP','023','Reaction'),
('DEP','024','Exhaust'),
('DEP','025','Lethal'),
('DEP','026',''),
('DEP','027','Depth, Summon'),
('DEP','028','Breakthrough'),
('DEP','029','Depth, Barrier, Echo'),
('DEP','030',''),
('DEP','031','Breakthrough'),
('DEP','032',''),
('DEP','033','Depth'),
('DEP','034','Attach, Echo'),
('DEP','035','Reaction'),
('DEP','036','Depth, Invest, Exhaust, Breakthrough'),
('DEP','037','Attach, Armored'),
('DEP','038',''),
('DEP','039',''),
('DEP','040','Spy, Echo'),
('DEP','041','Deploy'),
('DEP','042',''),
('DEP','T01','Depth'),
('DEP','003','Legend'),
('DEP','043','Stealth'),
('DEP','044','Armored'),
('DEP','045','Stealth'),
('DEP','046','Depth, Echo'),
('DEP','047','Armored, Reposition, Stealth'),
('DEP','048','Armored, Breakthrough, Reaction'),
('DEP','049','Armored, Depth'),
('DEP','050','Armored, Barrier, Stealth'),
('DEP','051','Sift'),
('DEP','052','Reposition'),
('DEP','053','Depth, Invest'),
('DEP','054','Stealth'),
('DEP','055','Stealth'),
('DEP','056','Deploy'),
('DEP','057','Deploy'),
('DEP','058','Depth, Attach, Armored'),
('DEP','059','Spy, Echo'),
('DEP','060',''),
('DEP','061','Deploy'),
('DEP','062',''),
('DEP','004','Legend'),
('DEP','063',''),
('DEP','064','Reaction, Ward, Exhaust'),
('DEP','065','Ward, Summon'),
('DEP','066','Ward, Deploy'),
('DEP','067','Ward, Echo'),
('DEP','068','Depth, Summon'),
('DEP','069','Armored'),
('DEP','070','Barrier'),
('DEP','071','Depth'),
('DEP','072',''),
('DEP','073','Reaction'),
('DEP','074','Silence, Invest'),
('DEP','075','Echo'),
('DEP','076','Attach'),
('DEP','077','Attach'),
('DEP','078','Depth, Invest'),
('DEP','079','Attach'),
('DEP','080',''),
('DEP','081','Spy, Echo'),
('DEP','082','Summon'),
('DEP','T02','Ward'),
('DEP','005','Legend, Stealth, Haste'),
('DEP','083','Reaction, Convert, Echo'),
('DEP','084','First Strike'),
('DEP','085','Covnert'),
('DEP','086','Invest, Echo'),
('DEP','087','Depth, Blockade'),
('DEP','088',''),
('DEP','089','Barrier, Reposition, Mill'),
('DEP','090','Depth, Mill'),
('DEP','091',''),
('DEP','092','Depth'),
('DEP','093','Mill'),
('DEP','094','Depth'),
('DEP','096','Depth'),
('DEP','097','Depth, Invest, Mill'),
('DEP','098','Attach'),
('DEP','099','Mill'),
('DEP','100','Depth'),
('DEP','101','Spy, Echo'),
('DEP','102',''),
('DEP','006','Legend'),
('DEP','007','Blockade, Legend'),
('DEP','008','Sift, Legend'),
('DEP','009','Unblockable, Legend, Summon'),
('DEP','103',''),
('DEP','104',''),
('DEP','105','Mill'),
('DEP','106','Armored, Ward'),
('DEP','107',''),
('DEP','108','Overpass'),
('DEP','109','Depth, Mill'),
('DEP','110','Depth, Mill'),
('QIL','001','Legendary, Summon'),
('QIL','013','Depth'),
('QIL','014','Haste, Trash'),
('QIL','015','Summon'),
('QIL','016','Depth, Quick Strike'),
('QIL','017',''),
('QIL','018','Depth, Reaction'),
('QIL','019',''),
('QIL','020','Attach'),
('QIL','021',''),
('QIL','022',''),
('QIL','023','Spy'),
('QIL','024','Depth, Unblockable'),
('QIL','025','Ward'),
('QIL','T01',''),
('QIL','T02',''),
('QIL','002','Unblockable, Legend'),
('QIL','026',''),
('QIL','027',''),
('QIL','028','Invest, Convert'),
('QIL','029',''),
('QIL','030','Overpass'),
('QIL','031','Lethal'),
('QIL','032','Breakthrough'),
('QIL','033','Armored'),
('QIL','034','Sacrifice'),
('QIL','035','Lethal'),
('QIL','036','Reaction, Invest, Armored'),
('QIL','037','Reaction, Barrier'),
('QIL','038',''),
('QIL','039',''),
('QIL','040','Trash'),
('QIL','041',''),
('QIL','042','Summon, Haste'),
('QIL','043','Deploy'),
('QIL','044','Attach'),
('QIL','045','Reaction, Downgrade'),
('QIL','T03',''),
('QIL','003','Summon, Sift'),
('QIL','046',''),
('QIL','047','Overpass, Invest, Reaction'),
('QIL','048','Invest'),
('QIL','049','Summon, Downgrade'),
('QIL','050','Echo'),
('QIL','051','Overpass'),
('QIL','052','Trash'),
('QIL','053','Exhaust'),
('QIL','054','Sacrifice'),
('QIL','055','Sift'),
('QIL','056','Reposition'),
('QIL','057','Reaction, Reposition'),
('QIL','058',''),
('QIL','059',''),
('QIL','060','Reaction'),
('QIL','061',''),
('QIL','062','Deploy'),
('QIL','063',''),
('QIL','064','Downgrade'),
('QIL','065','Reaction, Downgrade'),
('QIL','T04','Depth, Sift'),
('QIL','T05',''),
('QIL','004','Depth, Attach, Legend, Trash'),
('QIL','066',''),
('QIL','067','Echo'),
('QIL','068','Breakthrough'),
('QIL','069','Reaction, Overpass, Silence'),
('QIL','070','Ward'),
('QIL','071','Breakthrough, Silence'),
('QIL','072','Ward'),
('QIL','073','Sacrifice'),
('QIL','074','Silence'),
('QIL','075','Silence'),
('QIL','076','Silence'),
('QIL','077','Silence'),
('QIL','078',''),
('QIL','079','Reposition, Invest'),
('QIL','080','Reaction'),
('QIL','081','Silence'),
('QIL','082',''),
('QIL','083','Attach'),
('QIL','084','Attach'),
('QIL','085','Reaction, Downgrade'),
('QIL','005','Attach, Legend'),
('QIL','086',''),
('QIL','087','Mill'),
('QIL','088','Mill, Invest'),
('QIL','089','Summon'),
('QIL','090','Lethal'),
('QIL','091','Summon'),
('QIL','092',''),
('QIL','093','Convert'),
('QIL','094','Depth, Overpass, Trash, Summon'),
('QIL','095','Sacrifice'),
('QIL','096','Reaction, Attach'),
('QIL','097','Reaction'),
('QIL','098','Invest'),
('QIL','099',''),
('QIL','100',''),
('QIL','101','Trash'),
('QIL','102','Reaction, Attach'),
('QIL','103','Invest'),
('QIL','104',''),
('QIL','105','Reaction, Downgrade'),
('QIL','T06',''),
('QIL','T07','Summon'),
('QIL','006','Legend'),
('QIL','007','Blockade, Legend, Exhaust'),
('QIL','008','Legend'),
('QIL','009','Legend'),
('QIL','010','Legend'),
('QIL','011','Legend'),
('QIL','012','Legend'),
('QIL','106','Attach'),
('QIL','107','Reposition, Breakthrough'),
('QIL','108',''),
('QIL','109',''),
('QIL','110','Trash'),
('QIL','111',''),
('QIL','112','Echo, Ward'),
('QIL','113','Barrier'),
('QIL','114','Lethal, Stealth'),
('QIL','115','Echo'),
('QIL','116','Sacrifice'),
('QIL','117',''),
('QIL','118',''),
('QIL','119','Depth, Mill'),
('QIL','120','Depth, Mill'),
('CLA','005','Stealth'),
('CLA','006',''),
('CLA','007',''),
('CLA','008','Roll, Summon, Invest'),
('CLA','009',''),
('CLA','010',''),
('CLA','011','Invest'),
('CLA','012','Mill'),
('CLA','013','Sacrifice'),
('CLA','014','Transform, Silence'),
('CLA','T01','Deploy, Exhaust'),
('CLA','001','Legend'),
('CLA','015','Trash, Exhaust'),
('CLA','016','Reach, First Strike'),
('CLA','017','Overpass, Trash, Exhaust'),
('CLA','018',''),
('CLA','019',''),
('CLA','020','Armored, Exhaust, Attach'),
('CLA','021','Overpass, First Strike'),
('CLA','022','Summon'),
('CLA','023','Exhaust'),
('CLA','024',''),
('CLA','025','Choose One, Mill'),
('CLA','026','Legend'),
('CLA','027',''),
('CLA','028','Roll'),
('CLA','T02',''),
('CLA','T03',''),
('CLA','002','Roll, Exhaust'),
('CLA','029','Reach, Roll, Transform'),
('CLA','030',''),
('CLA','031','Invest'),
('CLA','032','Legend'),
('CLA','033','Attach, Roll'),
('CLA','034','Deploy, Invest, Roll'),
('CLA','035','Choose One'),
('CLA','036','Invest'),
('CLA','037','Reaction, Exhaust'),
('CLA','038','Haste, Quick Strike, Echo'),
('CLA','039','Deploy, Choose One'),
('CLA','040','Choose One'),
('CLA','041','Ward'),
('CLA','042',''),
('CLA','T04','Sift'),
('CLA','003','First Strike, Legend'),
('CLA','043',''),
('CLA','044',''),
('CLA','045','Reaction, Counter, Roll'),
('CLA','046',''),
('CLA','047','Sacrifice, Trash'),
('CLA','048',''),
('CLA','049','Spy, Roll'),
('CLA','050','Roll'),
('CLA','051','Spy'),
('CLA','052','Reaction, Trash'),
('CLA','053','Blockade, Convert, Quick Strike'),
('CLA','054',''),
('CLA','055',''),
('CLA','056','Mill'),
('CLA','004','Sacrifice, Legend, Trash'),
('CLA','057','Ward, Unblockable, Trash, Exhaust'),
('CLA','058','Trash, Exhaust, Reach'),
('CLA','059','Trash, Exhaust, Convert'),
('CLA','060','Convert'),
('CLA','061','Reach, Sacrifice, Attach'),
('CLA','062','Armored, Breakthrough, Summon, Trash, Exhaust'),
('CLA','063','Overpass, Haste, Quick Strike, Echo'),
('CLA','064','Silence'),
('CLA','065','Sacrifice'),
('CLA','066','Downgrade'),
('CLA','067','Summon, Echo'),
('CLA','068','Attach'),
('CLA','069',''),
('CLA','070','Summon'),
('CLA','T05','Deploy'),
('CLA','T06',''),
('KGD','001','Haste, Legend'),
('KGD','006','Invest, Summon'),
('KGD','007','Overpass'),
('KGD','008','Invest'),
('KGD','009','Stealth, Spy'),
('KGD','010','Tuck'),
('KGD','011','Hoard, Depth'),
('KGD','012','Overpass'),
('KGD','013','Armored, Ward'),
('KGD','014','Hoard'),
('KGD','015',''),
('KGD','016','Overpass'),
('KGD','017','Hoard, Overpass, Exhaust, Restrain'),
('KGD','018','Armored, Breakthrough, Reach'),
('KGD','019',''),
('KGD','020',''),
('KGD','021','Overpass, Reaction'),
('KGD','022','Legend'),
('KGD','023','Hoard'),
('KGD','024','Attach'),
('KGD','025',''),
('KGD','026','Hoard'),
('KGD','002','Hoard, Legend'),
('KGD','027','Hoard'),
('KGD','028','Hoard, Trash'),
('KGD','029','Hoard'),
('KGD','030',''),
('KGD','031','Breakthrough'),
('KGD','032','Hoard, Quick Strike'),
('KGD','033','Lethal, Overpass'),
('KGD','034','Hoard, Overheal'),
('KGD','035','Allocate'),
('KGD','036','Hoard, Overpass, Exhaust, Lethal'),
('KGD','037','Reaction, Exhaust'),
('KGD','038',''),
('KGD','039','Reclaim'),
('KGD','040','Deploy'),
('KGD','003','Hoard, Legend'),
('KGD','041','Hoard, Sift'),
('KGD','042','Hoard, Silence'),
('KGD','043','Hoard, Armored'),
('KGD','044',''),
('KGD','045','Armored'),
('KGD','046','Hoard, Armored'),
('KGD','047','Overpass, Echo'),
('KGD','048','Hoard, Reposition'),
('KGD','049','Allocate'),
('KGD','050','Hoard, Overpass, Exhaust, Frailty'),
('KGD','051',''),
('KGD','052','Spy, Mill'),
('KGD','053','Reclaim, Reposition'),
('KGD','054','Deploy, Armored'),
('KGD','004','Hoard, Legend'),
('KGD','055','Hoard'),
('KGD','056','Hoard'),
('KGD','057','Hoard'),
('KGD','058',''),
('KGD','059','Ward'),
('KGD','060','Hoard, Ward'),
('KGD','061','Haste, Overpass'),
('KGD','062','Hoard, Summon'),
('KGD','063','Allocate'),
('KGD','064','Hoard, Overpass, Exhaust, Trash'),
('KGD','065','Armored'),
('KGD','066',''),
('KGD','067','Reclaim'),
('KGD','068','Deploy, Ward'),
('KGD','T01','Breakthrough'),
('KGD','005','Hoard'),
('KGD','069','Hoard, Overpass'),
('KGD','070','Hoard, Mill'),
('KGD','071','Hoard'),
('KGD','072','Lethal'),
('KGD','073','Convert'),
('KGD','074','Hoard, Lethal'),
('KGD','075','Deathcoil, Overpass'),
('KGD','076','Hoard, Mill'),
('KGD','077','Sacrifice'),
('KGD','078','Hoard, Overpass, Exhaust'),
('KGD','079',''),
('KGD','080',''),
('KGD','081','Barrier, Reclaim'),
('KGD','082','Deploy'),
('NIN','001','Legend'),
('NIN','008',''),
('NIN','009',''),
('NIN','010',''),
('NIN','011',''),
('NIN','012','Reaction'),
('NIN','013','Blockade, Exhaust'),
('NIN','014','Trash'),
('NIN','015','Equip'),
('NIN','016','Equip'),
('NIN','017','Equip'),
('NIN','018','Equip'),
('NIN','019','Equip'),
('NIN','020','Equip'),
('NIN','021','Unblockable'),
('NIN','022',''),
('NIN','023','Quick Strike, Blockade'),
('NIN','024','Invest, Restrain'),
('NIN','025','Invest'),
('NIN','026',''),
('NIN','027','Invest'),
('NIN','028','Invest'),
('NIN','029','Invest'),
('NIN','030','Breakthrough'),
('NIN','031','Breakthrough'),
('NIN','032','Breakthrough'),
('NIN','033','Haste, Reaction, Reposition'),
('NIN','034','Quick Strike, Reclaim'),
('NIN','035',''),
('NIN','036','Attach'),
('NIN','037',''),
('NIN','038','Reaction'),
('NIN','039',''),
('NIN','040',''),
('NIN','041','Invest'),
('NIN','042','Reaction'),
('NIN','043','Equip'),
('NIN','044','Equip'),
('NIN','045','Attach, Invest'),
('NIN','046','Equip'),
('NIN','047','Equip, Invest'),
('NIN','048','Haste, Allocate'),
('NIN','049','Blockade, Reaction, Reposition'),
('NIN','050','Spy'),
('NIN','051',''),
('NIN','052','Overpass'),
('NIN','053','Ruins, Allocate'),
('NIN','054','Overpass, Reaction, Repostion'),
('NIN','055','Overpass'),
('NIN','056','Stealth'),
('NIN','057','Allocate'),
('NIN','058','Haste, Reach'),
('NIN','059','Armored'),
('NIN','060','Reaction, Armored'),
('NIN','061','Overpass, Ruins, Allocate'),
('NIN','062',''),
('NIN','063','Reaction, Attach, Overpass'),
('NIN','064',''),
('NIN','065','Stealth'),
('NIN','066','Invest'),
('NIN','067','Equip'),
('NIN','068','Trash'),
('NIN','069','Reclaim, Echo'),
('NIN','070','Deploy, Reposition'),
('NIN','071','Reaction, Equip, Armored, Ward, Allocate'),
('NIN','072','Reaction, Equip, Quick Strike'),
('NIN','T01','Afflict'),
('NIN','073',''),
('NIN','074','Invest'),
('NIN','075','Summon, Stealth'),
('NIN','076','Stealth, Invest'),
('NIN','077','Stealth'),
('NIN','078','Ward, Silence'),
('NIN','079','Exhaust, Restrain'),
('NIN','080',''),
('NIN','081','Invest'),
('NIN','082','Lethal'),
('NIN','083','Invest'),
('NIN','084','Stealth'),
('NIN','085',''),
('NIN','086',''),
('NIN','087','Spy'),
('NIN','088',''),
('NIN','089','Spy, Invest'),
('NIN','090','Stealth'),
('NIN','091','Reaction'),
('NIN','092','Invest'),
('NIN','093','Spy'),
('NIN','094','Afflict'),
('NIN','095','Trash'),
('NIN','096','Afflict'),
('NIN','097','Deploy, Invest, Exhaust'),
('NIN','T02',''),
('NIN','098','Stealth'),
('NIN','099','First Strike'),
('NIN','100',''),
('NIN','101',''),
('NIN','102','Stealth'),
('NIN','103',''),
('NIN','104','Convert'),
('NIN','105','Downgrade, Reclaim'),
('NIN','106','Stealth'),
('NIN','107','Haste, Allocate'),
('NIN','108',''),
('NIN','109','Allocate, Echo'),
('NIN','110',''),
('NIN','111','Stealth, Allocate'),
('NIN','112','Reaction'),
('NIN','113',''),
('NIN','114',''),
('NIN','115',''),
('NIN','116','Invest'),
('NIN','117','Ruins, Summon'),
('NIN','118','Equip'),
('NIN','119','Stealth, Lethal, Allocate'),
('NIN','120','Choose One, Stealth'),
('NIN','121','Deploy, Stealth'),
('NIN','122','Equip, Convert'),
('NIN','002','Reaction, Reposition, Legend, Exhaust'),
('NIN','003','Invest, Legend'),
('NIN','004','Reaction, Quick Strike, Legend'),
('NIN','005','Exhaust, Legend'),
('NIN','006','Legend'),
('NIN','007','Legend'),
('NIN','123','Attach, Reaction, Reposition'),
('NIN','124','Invest, Summon'),
('NIN','125',''),
('NIN','126','Ward'),
('NIN','127',''),
('NIN','128','Convert, Stealth'),
('NIN','129','Choose One, Reposition'),
('NIN','130','Choose One, Restrain, Barrier'),
('NIN','131','Choose One'),
('NIN','132','Choose One, Spy, Trash'),
('NIN','133','Choose One, Sift, Reclaim'),
('NIN','134','Choose One, Summon, Sacrifice, Stealth'),
('NIN','135',''),
('NIN','136','Invest'),
('NIN','137',''),
('NIN','138','Overpass, Spy'),
('NIN','139','Ruins'),
('NIN','140','Stealth, Convert'),
('NIN','T03','Invest, Ward'),
('JGK','001','Unblockable, Legend'),
('JGK','008',''),
('JGK','009',''),
('JGK','010','Restrain'),
('JGK','011','Summon'),
('JGK','012','Choose One'),
('JGK','013',''),
('JGK','014','Attach'),
('JGK','015',''),
('JGK','016','Armored'),
('JGK','017','Exhaust, Reclaim'),
('JGK','018',''),
('JGK','019','Immortal'),
('JGK','020','Blockade, Summon'),
('JGK','021',''),
('JGK','022','Silence'),
('JGK','023','Deploy'),
('JGK','024',''),
('JGK','025',''),
('JGK','026','Restrain'),
('JGK','T01','Afflict, Immortal'),
('JGK','002','Convert, Restrain, Legend'),
('JGK','027',''),
('JGK','028','Overpass'),
('JGK','029','Deathcoil, Haste, Flurry'),
('JGK','030','Flurry'),
('JGK','031',''),
('JGK','032','Flurry'),
('JGK','033','Immortal'),
('JGK','034',''),
('JGK','035',''),
('JGK','036','Invest'),
('JGK','037',''),
('JGK','038',''),
('JGK','039',''),
('JGK','040',''),
('JGK','041','Breakthrough'),
('JGK','042','Deathcoil, Lethal, Barrier'),
('JGK','043','Immortal'),
('JGK','044','flurry'),
('JGK','045','Flurry'),
('JGK','046','Reaction, Lethal'),
('JGK','047',''),
('JGK','048',''),
('JGK','049',''),
('JGK','050','Flurry, Equip'),
('JGK','051','Equip'),
('JGK','052','Restrain, Reclaim'),
('JGK','053','Summon'),
('JGK','T02',''),
('JGK','T03','Deathcoil, Haste'),
('JGK','T04',''),
('JGK','T05',''),
('JGK','003','Armored, Legend, Mill, Immortal'),
('JGK','054','Immortal, Mill'),
('JGK','055','Echo, Trash'),
('JGK','056','Reclaim, Echo'),
('JGK','057','Armored, Allocate'),
('JGK','058','Armored, Echo'),
('JGK','059','Trash'),
('JGK','060','Scarcity'),
('JGK','061','Echo'),
('JGK','062','Allocate'),
('JGK','063','Immortal'),
('JGK','064','Trash'),
('JGK','065','Armored'),
('JGK','066','Immortal, Trash'),
('JGK','067','Allocate'),
('JGK','068','Echo'),
('JGK','069','Echo'),
('JGK','070','Immortal, Mill, Reclaim'),
('JGK','071','Trash'),
('JGK','072','Reposition'),
('JGK','073',''),
('JGK','074','Summon'),
('JGK','075','Trash'),
('JGK','076','Choose One, Restrain, Reposition'),
('JGK','077','Silence, Trash'),
('JGK','078','Deploy, Spy, Trash'),
('JGK','079','Reposition'),
('JGK','080','Mill'),
('JGK','004','Tuck, Legend'),
('JGK','081','Invest, Barrier'),
('JGK','082','Lethal, Reaction'),
('JGK','083','Overpass, Spy, Summon'),
('JGK','084','Frailty, Attach'),
('JGK','085','Invest, Summon'),
('JGK','086','Summon'),
('JGK','087',''),
('JGK','088','Summon, Breakthrough'),
('JGK','089','Reaction'),
('JGK','090',''),
('JGK','091','Summon, Barrier'),
('JGK','092','Ward, Summon'),
('JGK','093','Invest'),
('JGK','094','Lethal'),
('JGK','095','Tuck, Summon'),
('JGK','096','Immortal, Sacrifice, Barrier'),
('JGK','097',''),
('JGK','098',''),
('JGK','099','Reaction'),
('JGK','100',''),
('JGK','101','Trash, Summon'),
('JGK','102','Afflict, Immortal'),
('JGK','103','Summon, Restrain'),
('JGK','104','Equip, Lethal'),
('JGK','105',''),
('JGK','106','Deploy, Ward, Summon'),
('JGK','107',''),
('JGK','T06','Summon, Tuck'),
('JGK','T07','Blockade, Summon, Barrier'),
('JGK','T08',''),
('JGK','T09',''),
('JGK','T10',''),
('JGK','T11',''),
('JGK','T12',''),
('JGK','T13','Ward'),
('JGK','T14','Restrain, Reposition'),
('JGK','005','Choose One, Legend'),
('JGK','108','Stealth, Immortal'),
('JGK','109','Convert'),
('JGK','110',''),
('JGK','111','Choose One'),
('JGK','112',''),
('JGK','113','Lethal, Stealth'),
('JGK','114','Convert'),
('JGK','115','Armored'),
('JGK','116','Choose One, Mill, Summon'),
('JGK','117',''),
('JGK','118','Reach, Choose One'),
('JGK','119',''),
('JGK','120',''),
('JGK','121','Choose One'),
('JGK','122',''),
('JGK','123',''),
('JGK','124','Choose One'),
('JGK','125','Immortal, Sacrifice'),
('JGK','126',''),
('JGK','127',''),
('JGK','128','Choose One, Sacrifice'),
('JGK','129',''),
('JGK','130','Choose One, Summon'),
('JGK','131','Reaction, Equip'),
('JGK','132','Deploy'),
('JGK','133','Mill, Sift'),
('JGK','134',''),
('JGK','T15','Overpass'),
('JGK','006','Reaction, Legend, Trash, Quick Strike'),
('JGK','007','Legend'),
('JGK','135','Flurry, Mill'),
('JGK','136','Reaction, Reposition, Summon'),
('JGK','137','Twin Strike'),
('JGK','138','Equip, Ward'),
('FAL','001','Haste, Leader, Legend'),
('FAL','027',''),
('FAL','028',''),
('FAL','029','Choose One'),
('FAL','030',''),
('FAL','031','Reposition'),
('FAL','032','Summon'),
('FAL','033','Reaction, Reposition'),
('FAL','034','Stealth'),
('FAL','035',''),
('FAL','036','Leader, Invest, Summon'),
('FAL','037','Ward'),
('FAL','038',''),
('FAL','039','Ward'),
('FAL','040','Immortal, Summon'),
('FAL','041','Reaction'),
('FAL','042','Constellation'),
('FAL','043','Overpass, Breakthrough, Armored, Ward, Convert'),
('FAL','044','Haste, Mill, Ruins'),
('FAL','045',''),
('FAL','046','Stealth, Transform'),
('FAL','047','Ward'),
('FAL','048','Reclaim'),
('FAL','049',''),
('FAL','050','Choose One'),
('FAL','051','Choose One'),
('FAL','052','Reaction'),
('FAL','053','Reaction, First Strike'),
('FAL','054','Spy'),
('FAL','055',''),
('FAL','056',''),
('FAL','057',''),
('FAL','058','Immortal'),
('FAL','T01','Afflict'),
('FAL','002','Legend'),
('FAL','059','Exhaust'),
('FAL','060','Invest'),
('FAL','061','Flurry'),
('FAL','062','Invest, Trash'),
('FAL','063','Invest, Summon'),
('FAL','064','Invest, Reposition'),
('FAL','065','Trash'),
('FAL','066','Blockade'),
('FAL','067','Overpass, Invest, Ward'),
('FAL','068','Breakthrough, Reaction, Sift'),
('FAL','069',''),
('FAL','070','Flurry'),
('FAL','071',''),
('FAL','072',''),
('FAL','073','Breakthrough, Immortal, Trash'),
('FAL','074','Overheal, Invest, Ward'),
('FAL','075',''),
('FAL','076','Afflict'),
('FAL','077','Choose One'),
('FAL','078',''),
('FAL','079',''),
('FAL','080',''),
('FAL','081','Invest'),
('FAL','082',''),
('FAL','083',''),
('FAL','084','Reaction'),
('FAL','085','Constellation, Breakthrough'),
('FAL','086','Trash'),
('FAL','087','Equip, Ward'),
('FAL','088',''),
('FAL','089','Flurry'),
('FAL','090','Summon'),
('FAL','091','Equip, Barrier, Sift'),
('FAL','T02','Deathcoil, Haste'),
('FAL','T03',''),
('FAL','T04',''),
('FAL','003','Legend, Summon'),
('FAL','092','Invest'),
('FAL','093','Allocate'),
('FAL','094',''),
('FAL','095',''),
('FAL','096','Reposition'),
('FAL','097','Twin Strike, Sift'),
('FAL','098','Reposition'),
('FAL','099','Reaction'),
('FAL','100','Armored, Breakthrough'),
('FAL','101','Overpass'),
('FAL','102','Armored, Sift'),
('FAL','103',''),
('FAL','104','Overpass'),
('FAL','105','Echo'),
('FAL','106',''),
('FAL','107','Ruins'),
('FAL','108',''),
('FAL','109',''),
('FAL','110','Armored, Constellation'),
('FAL','111','Reclaim, Sift'),
('FAL','112','Constellation, Reclaim'),
('FAL','113','Reaction, Counter'),
('FAL','114','Reposition, Constellation'),
('FAL','115','Legend'),
('FAL','116','Reclaim'),
('FAL','117','Ephemeral'),
('FAL','118','Allocate'),
('FAL','119',''),
('FAL','120','Equip, Reaction'),
('FAL','121','Equip, Breakthrough'),
('FAL','122','Deploy, Reaction'),
('FAL','123','Equip, Reaction, Overpass'),
('FAL','124',''),
('FAL','T05','Afflict'),
('FAL','004','Leader, Legend'),
('FAL','125',''),
('FAL','126','Invest, Barrier'),
('FAL','127','Invest, Convert'),
('FAL','128','Overpass, Invest'),
('FAL','129','Overheal'),
('FAL','130','Exhaust, Stealth'),
('FAL','131','Spy'),
('FAL','132','Invest, Allocate'),
('FAL','133','Summon, Allocate'),
('FAL','134','Allocate'),
('FAL','135','Overheal, Invest'),
('FAL','136','Ward, Consume'),
('FAL','137',''),
('FAL','138','Leader, Leathal, Invest, Immortal, Sacrifice'),
('FAL','139','Summon'),
('FAL','140','Overpass, Summon'),
('FAL','141',''),
('FAL','142','Overpass'),
('FAL','143','Hoard, Mill'),
('FAL','144','Summon, Allocate'),
('FAL','145','Reach, Constellation, Barrier, Ward'),
('FAL','146','Barrier'),
('FAL','147','Summon'),
('FAL','148','Spy'),
('FAL','149',''),
('FAL','150',''),
('FAL','151',''),
('FAL','152','Reaction'),
('FAL','153','Transform, Invest'),
('FAL','154','Equip'),
('FAL','155','Equip, Allocate'),
('FAL','156','Ward'),
('FAL','157',''),
('FAL','T06','Summon'),
('FAL','T07','Blockade, Summon, Barrier'),
('FAL','T08',''),
('FAL','T09','Crowd, Leader'),
('FAL','T10',''),
('FAL','005','Sacrifice, Legend'),
('FAL','158','Invest, Choose One, Haste, Lethal, Stealth, Quick Strike'),
('FAL','159','Reposition'),
('FAL','160','Reach, Summon'),
('FAL','161','Summon'),
('FAL','162','Summon'),
('FAL','163','Summon'),
('FAL','164','Immortal, Mill'),
('FAL','165','Exhaust'),
('FAL','166','Legend'),
('FAL','167','Stealth, Summon'),
('FAL','168','Allocate'),
('FAL','169','Stealth'),
('FAL','170',''),
('FAL','171','Immortal'),
('FAL','172','Exhaust'),
('FAL','173','Overpass'),
('FAL','174','Deathcoil, Immortal, Mill'),
('FAL','175','Overpass, Choose One'),
('FAL','176','Constellation'),
('FAL','177','Immortal, Sacrifice'),
('FAL','178','Afflict'),
('FAL','179','Summon'),
('FAL','180','Attach'),
('FAL','181',''),
('FAL','182','Afflict'),
('FAL','183',''),
('FAL','184','Choose One, Transform'),
('FAL','185','Legend'),
('FAL','186',''),
('FAL','187',''),
('FAL','188','Mill, Reposition, Echo'),
('FAL','189','Equip, Reposition'),
('FAL','190','Deploy, Summon'),
('FAL','T11','Afflict'),
('FAL','T12',''),
('FAL','T13',''),
('FAL','006','Legend, Attach'),
('FAL','007','Reposition, Legend'),
('FAL','008','Convert, Legend'),
('FAL','009','Breakthrough, Legend, Ruins'),
('FAL','010','Legend, Reclaim'),
('FAL','011','Overpass, Legend, Choose One'),
('FAL','012','Constellation, Legend'),
('FAL','013','Overheal, Legend'),
('FAL','014','Legend, Quick Strike'),
('FAL','015','Downgrade, Legend'),
('FAL','016','Legend, Mill, Trash, Reclaim'),
('FAL','017','Legend, Ephemeral'),
('FAL','018','Ward, Legend'),
('FAL','019','Legend, Choose One, Silence, Exhaust'),
('FAL','020','Twin Strike, Legend, Flurry'),
('FAL','021','Immortal, Legend'),
('FAL','022','Ward, Legend, Invest'),
('FAL','023','Convert, Legend, Exhaust'),
('FAL','024','Overpass, Constellation, Legend'),
('FAL','025','Legend'),
('FAL','026','Legend, Tuck'),
('FAL','191','Sift, Blockade'),
('FAL','192','Equip, First Strike'),
('FAL','193','Invest'),
('FAL','194','Invest'),
('FAL','195',''),
('FAL','196',''),
('FAL','197',''),
('FAL','198','Afflict, Choose One'),
('FAL','199','Reposition'),
('FAL','200','Equip'),
('FAL','201','Stealth, Spy'),
('FAL','202',''),
('FAL','203','Constellation, Downgrade'),
('FAL','204','Ward, Constellation, Downgrade'),
('FAL','205','Constellation, Downgrade'),
('FAL','206','Overpass, Constellation, Downgrade'),
('FAL','207','Convert, Constellation, Downgrade'),
('FAL','208','Constellation, Downgrade');


INSERT INTO Color(setID,cardID,color) VALUES
 ('COR','001','Colorless')
,('COR','002','Colorless')
,('COR','003','Colorless')
,('COR','012','Colorless')
,('COR','013','Colorless')
,('COR','014','Colorless')
,('COR','015','Colorless')
,('COR','016','Colorless')
,('COR','017','Colorless')
,('COR','018','Colorless')
,('COR','019','Colorless')
,('COR','020','Colorless')
,('COR','021','Colorless')
,('COR','022','Colorless')
,('COR','023','Colorless')
,('COR','024','Colorless')
,('COR','025','Colorless')
,('COR','026','Colorless')
,('COR','027','Colorless')
,('COR','028','Colorless')
,('COR','029','Colorless')
,('COR','030','Colorless')
,('COR','031','Colorless')
,('COR','032','Colorless')
,('COR','033','Colorless')
,('COR','034','Colorless')
,('COR','035','Colorless')
,('COR','036','Colorless')
,('COR','037','Colorless')
,('COR','150','Green, Blue')
,('COR','151','Green, Red')
,('COR','152','Green, Purple')
,('COR','153','Blue, Red')
,('COR','154','Blue, Purple')
,('COR','155','Red, Purple')
,('COR','T01','Colorless')
,('COR','T02','Colorless')
,('COR','004','Green')
,('COR','005','Green')
,('COR','038','Green')
,('COR','039','Green')
,('COR','040','Green')
,('COR','041','Green')
,('COR','042','Green')
,('COR','043','Green')
,('COR','044','Green')
,('COR','045','Green')
,('COR','046','Green')
,('COR','047','Green')
,('COR','048','Green')
,('COR','049','Green')
,('COR','050','Green')
,('COR','051','Green')
,('COR','052','Green')
,('COR','053','Green')
,('COR','054','Green')
,('COR','055','Green')
,('COR','056','Green')
,('COR','057','Green')
,('COR','058','Green')
,('COR','059','Green')
,('COR','060','Green')
,('COR','061','Green')
,('COR','062','Green')
,('COR','063','Green')
,('COR','064','Green')
,('COR','065','Green')
,('COR','T03','Green')
,('COR','006','Blue')
,('COR','007','Blue')
,('COR','066','Blue')
,('COR','067','Blue')
,('COR','068','Blue')
,('COR','069','Blue')
,('COR','070','Blue')
,('COR','071','Blue')
,('COR','072','Blue')
,('COR','073','Blue')
,('COR','074','Blue')
,('COR','075','Blue')
,('COR','076','Blue')
,('COR','077','Blue')
,('COR','078','Blue')
,('COR','079','Blue')
,('COR','080','Blue')
,('COR','081','Blue')
,('COR','082','Blue')
,('COR','083','Blue')
,('COR','084','Blue')
,('COR','085','Blue')
,('COR','086','Blue')
,('COR','087','Blue')
,('COR','088','Blue')
,('COR','089','Blue')
,('COR','090','Blue')
,('COR','091','Blue')
,('COR','092','Blue')
,('COR','093','Blue')
,('COR','T04','Blue')
,('COR','T05','Blue')
,('COR','T06','Blue')
,('COR','008','Red')
,('COR','009','Red')
,('COR','094','Red')
,('COR','095','Red')
,('COR','096','Red')
,('COR','097','Red')
,('COR','098','Red')
,('COR','099','Red')
,('COR','100','Red')
,('COR','101','Red')
,('COR','102','Red')
,('COR','103','Red')
,('COR','104','Red')
,('COR','105','Red')
,('COR','106','Red')
,('COR','107','Red')
,('COR','108','Red')
,('COR','109','Red')
,('COR','110','Red')
,('COR','111','Red')
,('COR','112','Red')
,('COR','113','Red')
,('COR','114','Red')
,('COR','115','Red')
,('COR','116','Red')
,('COR','117','Red')
,('COR','118','Red')
,('COR','119','Red')
,('COR','120','Red')
,('COR','121','Red')
,('COR','T07','Red')
,('COR','T08','Red')
,('COR','T09','Red')
,('COR','T10','Red')
,('COR','T11','Red')
,('COR','010','Purple')
,('COR','011','Purple')
,('COR','122','Purple')
,('COR','123','Purple')
,('COR','124','Purple')
,('COR','125','Purple')
,('COR','126','Purple')
,('COR','127','Purple')
,('COR','128','Purple')
,('COR','129','Purple')
,('COR','130','Purple')
,('COR','131','Purple')
,('COR','132','Purple')
,('COR','133','Purple')
,('COR','134','Purple')
,('COR','135','Purple')
,('COR','136','Purple')
,('COR','137','Purple')
,('COR','138','Purple')
,('COR','139','Purple')
,('COR','140','Purple')
,('COR','141','Purple')
,('COR','142','Purple')
,('COR','143','Purple')
,('COR','144','Purple')
,('COR','145','Purple')
,('COR','146','Purple')
,('COR','147','Purple')
,('COR','148','Purple')
,('COR','149','Purple')
,('COR','T12','Purple')
,('HOE','001','Colorless')
,('HOE','002','Colorless')
,('HOE','003','Colorless')
,('HOE','004','Colorless')
,('HOE','005','Colorless')
,('HOE','006','Colorless')
,('HOE','007','Colorless')
,('HOE','008','Colorless')
,('HOE','009','Green')
,('HOE','010','Green')
,('HOE','011','Green')
,('HOE','012','Green')
,('HOE','013','Green')
,('HOE','014','Green')
,('HOE','015','Green')
,('HOE','016','Green')
,('HOE','017','Green')
,('HOE','018','Green')
,('HOE','019','Green')
,('HOE','020','Green')
,('HOE','021','Green')
,('HOE','022','Green')
,('HOE','023','Green')
,('HOE','024','Green')
,('HOE','025','Green')
,('HOE','026','Green')
,('HOE','027','Green')
,('HOE','028','Green')
,('HOE','029','Green')
,('HOE','030','Green')
,('HOE','031','Green')
,('HOE','032','Green')
,('HOE','033','Green')
,('HOE','034','Green')
,('HOE','035','Blue')
,('HOE','036','Blue')
,('HOE','037','Blue')
,('HOE','038','Blue')
,('HOE','039','Blue')
,('HOE','040','Blue')
,('HOE','041','Blue')
,('HOE','042','Blue')
,('HOE','043','Blue')
,('HOE','044','Blue')
,('HOE','045','Blue')
,('HOE','046','Blue')
,('HOE','047','Blue')
,('HOE','048','Blue')
,('HOE','049','Blue')
,('HOE','050','Blue')
,('HOE','051','Blue')
,('HOE','052','Blue')
,('HOE','053','Blue')
,('HOE','054','Blue')
,('HOE','055','Blue')
,('HOE','056','Blue')
,('HOE','057','Blue')
,('HOE','058','Blue')
,('HOE','059','Blue')
,('HOE','060','Blue')
,('HOE','061','Blue')
,('HOE','062','Red')
,('HOE','063','Red')
,('HOE','064','Red')
,('HOE','065','Red')
,('HOE','066','Red')
,('HOE','067','Red')
,('HOE','068','Red')
,('HOE','069','Red')
,('HOE','070','Red')
,('HOE','071','Red')
,('HOE','072','Red')
,('HOE','073','Red')
,('HOE','074','Red')
,('HOE','075','Red')
,('HOE','076','Red')
,('HOE','077','Red')
,('HOE','078','Red')
,('HOE','079','Red')
,('HOE','080','Red')
,('HOE','081','Red')
,('HOE','082','Red')
,('HOE','083','Red')
,('HOE','084','Red')
,('HOE','085','Red')
,('HOE','086','Red')
,('HOE','087','Red')
,('HOE','088','Red')
,('HOE','089','Purple')
,('HOE','090','Purple')
,('HOE','091','Purple')
,('HOE','092','Purple')
,('HOE','093','Purple')
,('HOE','094','Purple')
,('HOE','095','Purple')
,('HOE','096','Purple')
,('HOE','097','Purple')
,('HOE','098','Purple')
,('HOE','099','Purple')
,('HOE','100','Purple')
,('HOE','101','Purple')
,('HOE','102','Purple')
,('HOE','103','Purple')
,('HOE','104','Purple')
,('HOE','105','Purple')
,('HOE','106','Purple')
,('HOE','107','Purple')
,('HOE','108','Purple')
,('HOE','109','Purple')
,('HOE','110','Purple')
,('HOE','111','Purple')
,('HOE','112','Purple')
,('HOE','113','Purple')
,('HOE','114','Purple')
,('HOE','115','Purple')
,('HOE','116','Purple')
,('ELM','001','Red')
,('ELM','002','Red')
,('ELM','003','Red')
,('ELM','004','Red')
,('ELM','005','Red')
,('ELM','006','Red')
,('ELM','007','Red')
,('ELM','008','Red')
,('ELM','009','Red')
,('ELM','010','Red')
,('ELM','011','Red')
,('ELM','012','Green')
,('ELM','013','Green')
,('ELM','014','Green')
,('ELM','015','Green')
,('ELM','016','Green')
,('ELM','017','Green')
,('ELM','018','Green')
,('ELM','019','Green')
,('ELM','020','Green')
,('ELM','021','Green')
,('ELM','022','Green')
,('ELM','023','Blue')
,('ELM','024','Blue')
,('ELM','025','Blue')
,('ELM','026','Blue')
,('ELM','027','Blue')
,('ELM','028','Blue')
,('ELM','029','Blue')
,('ELM','030','Blue')
,('ELM','031','Blue')
,('ELM','032','Blue')
,('WHV','001','Colorless')
,('WHV','002','Colorless')
,('WHV','011','Colorless')
,('WHV','012','Colorless')
,('WHV','013','Colorless')
,('WHV','014','Colorless')
,('WHV','015','Colorless')
,('WHV','016','Colorless')
,('WHV','017','Colorless')
,('WHV','018','Colorless')
,('WHV','019','Colorless')
,('WHV','020','Colorless')
,('WHV','021','Colorless')
,('WHV','022','Colorless')
,('WHV','023','Colorless')
,('WHV','024','Colorless')
,('WHV','025','Colorless')
,('WHV','026','Colorless')
,('WHV','027','Colorless')
,('WHV','084','Green, Purple')
,('WHV','085','Blue, Red')
,('WHV','003','Green')
,('WHV','004','Green')
,('WHV','028','Green')
,('WHV','029','Green')
,('WHV','030','Green')
,('WHV','031','Green')
,('WHV','032','Green')
,('WHV','033','Green')
,('WHV','034','Green')
,('WHV','035','Green')
,('WHV','036','Green')
,('WHV','037','Green')
,('WHV','038','Green')
,('WHV','039','Green')
,('WHV','040','Green')
,('WHV','041','Green')
,('WHV','T01','Green')
,('WHV','T08','Green')
,('WHV','T09','Green')
,('WHV','005','Blue')
,('WHV','006','Blue')
,('WHV','042','Blue')
,('WHV','043','Blue')
,('WHV','044','Blue')
,('WHV','045','Blue')
,('WHV','046','Blue')
,('WHV','047','Blue')
,('WHV','048','Blue')
,('WHV','049','Blue')
,('WHV','050','Blue')
,('WHV','051','Blue')
,('WHV','052','Blue')
,('WHV','053','Blue')
,('WHV','054','Blue')
,('WHV','055','Blue')
,('WHV','T02','Blue')
,('WHV','T03','Blue')
,('WHV','T10','Blue')
,('WHV','T11','Blue')
,('WHV','007','Red')
,('WHV','008','Red')
,('WHV','056','Red')
,('WHV','057','Red')
,('WHV','058','Red')
,('WHV','059','Red')
,('WHV','060','Red')
,('WHV','061','Red')
,('WHV','062','Red')
,('WHV','063','Red')
,('WHV','064','Red')
,('WHV','065','Red')
,('WHV','066','Red')
,('WHV','067','Red')
,('WHV','068','Red')
,('WHV','069','Red')
,('WHV','T04','Red')
,('WHV','T05','Red')
,('WHV','T12','Red')
,('WHV','T13','Red')
,('WHV','009','Purple')
,('WHV','010','Purple')
,('WHV','070','Purple')
,('WHV','071','Purple')
,('WHV','072','Purple')
,('WHV','073','Purple')
,('WHV','074','Purple')
,('WHV','075','Purple')
,('WHV','076','Purple')
,('WHV','077','Purple')
,('WHV','078','Purple')
,('WHV','079','Purple')
,('WHV','080','Purple')
,('WHV','081','Purple')
,('WHV','082','Purple')
,('WHV','083','Purple')
,('WHV','T06','Purple')
,('WHV','T07','Purple')
,('WHV','T14','Purple')
,('WHV','T15','Purple')
,('DEP','001','Colorless')
,('DEP','010','Colorless')
,('DEP','011','Colorless')
,('DEP','012','Colorless')
,('DEP','013','Colorless')
,('DEP','014','Colorless')
,('DEP','015','Colorless')
,('DEP','016','Colorless')
,('DEP','017','Colorless')
,('DEP','018','Colorless')
,('DEP','019','Colorless')
,('DEP','020','Colorless')
,('DEP','021','Colorless')
,('DEP','022','Colorless')
,('DEP','002','Green')
,('DEP','023','Green')
,('DEP','024','Green')
,('DEP','025','Green')
,('DEP','026','Green')
,('DEP','027','Green')
,('DEP','028','Green')
,('DEP','029','Green')
,('DEP','030','Green')
,('DEP','031','Green')
,('DEP','032','Green')
,('DEP','033','Green')
,('DEP','034','Green')
,('DEP','035','Green')
,('DEP','036','Green')
,('DEP','037','Green')
,('DEP','038','Green')
,('DEP','039','Green')
,('DEP','040','Green')
,('DEP','041','Green')
,('DEP','042','Green')
,('DEP','T01','Green')
,('DEP','003','Blue')
,('DEP','043','Blue')
,('DEP','044','Blue')
,('DEP','045','Blue')
,('DEP','046','Blue')
,('DEP','047','Blue')
,('DEP','048','Blue')
,('DEP','049','Blue')
,('DEP','050','Blue')
,('DEP','051','Blue')
,('DEP','052','Blue')
,('DEP','053','Blue')
,('DEP','054','Blue')
,('DEP','055','Blue')
,('DEP','056','Blue')
,('DEP','057','Blue')
,('DEP','058','Blue')
,('DEP','059','Blue')
,('DEP','060','Blue')
,('DEP','061','Blue')
,('DEP','062','Blue')
,('DEP','004','Red')
,('DEP','063','Red')
,('DEP','064','Red')
,('DEP','065','Red')
,('DEP','066','Red')
,('DEP','067','Red')
,('DEP','068','Red')
,('DEP','069','Red')
,('DEP','070','Red')
,('DEP','071','Red')
,('DEP','072','Red')
,('DEP','073','Red')
,('DEP','074','Red')
,('DEP','075','Red')
,('DEP','076','Red')
,('DEP','077','Red')
,('DEP','078','Red')
,('DEP','079','Red')
,('DEP','080','Red')
,('DEP','081','Red')
,('DEP','082','Red')
,('DEP','T02','Red')
,('DEP','005','Purple')
,('DEP','083','Purple')
,('DEP','084','Purple')
,('DEP','085','Purple')
,('DEP','086','Purple')
,('DEP','087','Purple')
,('DEP','088','Purple')
,('DEP','089','Purple')
,('DEP','090','Purple')
,('DEP','091','Purple')
,('DEP','092','Purple')
,('DEP','093','Purple')
,('DEP','094','Purple')
,('DEP','096','Purple')
,('DEP','097','Purple')
,('DEP','098','Purple')
,('DEP','099','Purple')
,('DEP','100','Purple')
,('DEP','101','Purple')
,('DEP','102','Purple')
,('DEP','006','Green, Blue')
,('DEP','007','Green, Red')
,('DEP','008','Blue, Purple')
,('DEP','009','Red, Purple')
,('DEP','103','Green, Blue')
,('DEP','104','Green, Red')
,('DEP','105','Green, Purple')
,('DEP','106','Blue, Red')
,('DEP','107','Blue, Purple')
,('DEP','108','Red, Purple')
,('DEP','109','Green, Red')
,('DEP','110','Blue, Purple')
,('QIL','001','Colorless')
,('QIL','013','Colorless')
,('QIL','014','Colorless')
,('QIL','015','Colorless')
,('QIL','016','Colorless')
,('QIL','017','Colorless')
,('QIL','018','Colorless')
,('QIL','019','Colorless')
,('QIL','020','Colorless')
,('QIL','021','Colorless')
,('QIL','022','Colorless')
,('QIL','023','Colorless')
,('QIL','024','Colorless')
,('QIL','025','Colorless')
,('QIL','T01','Colorless')
,('QIL','T02','Colorless')
,('QIL','002','Green')
,('QIL','026','Green')
,('QIL','027','Green')
,('QIL','028','Green')
,('QIL','029','Green')
,('QIL','030','Green')
,('QIL','031','Green')
,('QIL','032','Green')
,('QIL','033','Green')
,('QIL','034','Green')
,('QIL','035','Green')
,('QIL','036','Green')
,('QIL','037','Green')
,('QIL','038','Green')
,('QIL','039','Green')
,('QIL','040','Green')
,('QIL','041','Green')
,('QIL','042','Green')
,('QIL','043','Green')
,('QIL','044','Green')
,('QIL','045','Green')
,('QIL','T03','Green')
,('QIL','003','Blue')
,('QIL','046','Blue')
,('QIL','047','Blue')
,('QIL','048','Blue')
,('QIL','049','Blue')
,('QIL','050','Blue')
,('QIL','051','Blue')
,('QIL','052','Blue')
,('QIL','053','Blue')
,('QIL','054','Blue')
,('QIL','055','Blue')
,('QIL','056','Blue')
,('QIL','057','Blue')
,('QIL','058','Blue')
,('QIL','059','Blue')
,('QIL','060','Blue')
,('QIL','061','Blue')
,('QIL','062','Blue')
,('QIL','063','Blue')
,('QIL','064','Blue')
,('QIL','065','Blue')
,('QIL','T04','Blue')
,('QIL','T05','Blue')
,('QIL','004','Red')
,('QIL','066','Red')
,('QIL','067','Red')
,('QIL','068','Red')
,('QIL','069','Red')
,('QIL','070','Red')
,('QIL','071','Red')
,('QIL','072','Red')
,('QIL','073','Red')
,('QIL','074','Red')
,('QIL','075','Red')
,('QIL','076','Red')
,('QIL','077','Red')
,('QIL','078','Red')
,('QIL','079','Red')
,('QIL','080','Red')
,('QIL','081','Red')
,('QIL','082','Red')
,('QIL','083','Red')
,('QIL','084','Red')
,('QIL','085','Red')
,('QIL','005','Purple')
,('QIL','086','Purple')
,('QIL','087','Purple')
,('QIL','088','Purple')
,('QIL','089','Purple')
,('QIL','090','Purple')
,('QIL','091','Purple')
,('QIL','092','Purple')
,('QIL','093','Purple')
,('QIL','094','Purple')
,('QIL','095','Purple')
,('QIL','096','Purple')
,('QIL','097','Purple')
,('QIL','098','Purple')
,('QIL','099','Purple')
,('QIL','100','Purple')
,('QIL','101','Purple')
,('QIL','102','Purple')
,('QIL','103','Purple')
,('QIL','104','Purple')
,('QIL','105','Purple')
,('QIL','T06','Purple')
,('QIL','T07','Purple')
,('QIL','006','Green, Blue')
,('QIL','007','Green, Red')
,('QIL','008','Green, Purple')
,('QIL','009','Blue, Red')
,('QIL','010','Blue, Purple')
,('QIL','011','Red, Purple')
,('QIL','012','Green, Blue, Red, Purple')
,('QIL','106','Green, Blue')
,('QIL','107','Green, Blue')
,('QIL','108','Green, Red')
,('QIL','109','Green, Red')
,('QIL','110','Green, Purple')
,('QIL','111','Green, Purple')
,('QIL','112','Blue, Red')
,('QIL','113','Blue, Red')
,('QIL','114','Blue, Purple')
,('QIL','115','Blue, Purple')
,('QIL','116','Red, Purple')
,('QIL','117','Red, Purple')
,('QIL','118','Green, Blue, Red, Purple')
,('QIL','119','Green, Blue')
,('QIL','120','Red, Purple')
,('CLA','005','Colorless')
,('CLA','006','Colorless')
,('CLA','007','Colorless')
,('CLA','008','Colorless')
,('CLA','009','Colorless')
,('CLA','010','Colorless')
,('CLA','011','Colorless')
,('CLA','012','Colorless')
,('CLA','013','Colorless')
,('CLA','014','Colorless')
,('CLA','T01','Colorless')
,('CLA','001','Green')
,('CLA','015','Green')
,('CLA','016','Green')
,('CLA','017','Green')
,('CLA','018','Green')
,('CLA','019','Green')
,('CLA','020','Green')
,('CLA','021','Green')
,('CLA','022','Green')
,('CLA','023','Green')
,('CLA','024','Green')
,('CLA','025','Green')
,('CLA','026','Green')
,('CLA','027','Green')
,('CLA','028','Green')
,('CLA','T02','Green')
,('CLA','T03','Green')
,('CLA','002','Blue')
,('CLA','029','Blue')
,('CLA','030','Blue')
,('CLA','031','Blue')
,('CLA','032','Blue')
,('CLA','033','Blue')
,('CLA','034','Blue')
,('CLA','035','Blue')
,('CLA','036','Blue')
,('CLA','037','Blue')
,('CLA','038','Blue')
,('CLA','039','Blue')
,('CLA','040','Blue')
,('CLA','041','Blue')
,('CLA','042','Blue')
,('CLA','T04','Blue')
,('CLA','003','Red')
,('CLA','043','Red')
,('CLA','044','Red')
,('CLA','045','Red')
,('CLA','046','Red')
,('CLA','047','Red')
,('CLA','048','Red')
,('CLA','049','Red')
,('CLA','050','Red')
,('CLA','051','Red')
,('CLA','052','Red')
,('CLA','053','Red')
,('CLA','054','Red')
,('CLA','055','Red')
,('CLA','056','Red')
,('CLA','004','Purple')
,('CLA','057','Purple')
,('CLA','058','Purple')
,('CLA','059','Purple')
,('CLA','060','Purple')
,('CLA','061','Purple')
,('CLA','062','Purple')
,('CLA','063','Purple')
,('CLA','064','Purple')
,('CLA','065','Purple')
,('CLA','066','Purple')
,('CLA','067','Purple')
,('CLA','068','Purple')
,('CLA','069','Purple')
,('CLA','070','Purple')
,('CLA','T05','Purple')
,('CLA','T06','Purple')
,('KGD','001','Colorless')
,('KGD','006','Colorless')
,('KGD','007','Colorless')
,('KGD','008','Colorless')
,('KGD','009','Colorless')
,('KGD','010','Colorless')
,('KGD','011','Colorless')
,('KGD','012','Colorless')
,('KGD','013','Colorless')
,('KGD','014','Colorless')
,('KGD','015','Colorless')
,('KGD','016','Colorless')
,('KGD','017','Colorless')
,('KGD','018','Colorless')
,('KGD','019','Colorless')
,('KGD','020','Colorless')
,('KGD','021','Colorless')
,('KGD','022','Colorless')
,('KGD','023','Colorless')
,('KGD','024','Colorless')
,('KGD','025','Colorless')
,('KGD','026','Colorless')
,('KGD','002','Green')
,('KGD','027','Green')
,('KGD','028','Green')
,('KGD','029','Green')
,('KGD','030','Green')
,('KGD','031','Green')
,('KGD','032','Green')
,('KGD','033','Green')
,('KGD','034','Green')
,('KGD','035','Green')
,('KGD','036','Green')
,('KGD','037','Green')
,('KGD','038','Green')
,('KGD','039','Green')
,('KGD','040','Green')
,('KGD','003','Blue')
,('KGD','041','Blue')
,('KGD','042','Blue')
,('KGD','043','Blue')
,('KGD','044','Blue')
,('KGD','045','Blue')
,('KGD','046','Blue')
,('KGD','047','Blue')
,('KGD','048','Blue')
,('KGD','049','Blue')
,('KGD','050','Blue')
,('KGD','051','Blue')
,('KGD','052','Blue')
,('KGD','053','Blue')
,('KGD','054','Blue')
,('KGD','004','Red')
,('KGD','055','Red')
,('KGD','056','Red')
,('KGD','057','Red')
,('KGD','058','Red')
,('KGD','059','Red')
,('KGD','060','Red')
,('KGD','061','Red')
,('KGD','062','Red')
,('KGD','063','Red')
,('KGD','064','Red')
,('KGD','065','Red')
,('KGD','066','Red')
,('KGD','067','Red')
,('KGD','068','Red')
,('KGD','T01','Red')
,('KGD','005','Purple')
,('KGD','069','Purple')
,('KGD','070','Purple')
,('KGD','071','Purple')
,('KGD','072','Purple')
,('KGD','073','Purple')
,('KGD','074','Purple')
,('KGD','075','Purple')
,('KGD','076','Purple')
,('KGD','077','Purple')
,('KGD','078','Purple')
,('KGD','079','Purple')
,('KGD','080','Purple')
,('KGD','081','Purple')
,('KGD','082','Purple')
,('NIN','001','Colorless')
,('NIN','008','Colorless')
,('NIN','009','Colorless')
,('NIN','010','Colorless')
,('NIN','011','Colorless')
,('NIN','012','Colorless')
,('NIN','013','Colorless')
,('NIN','014','Colorless')
,('NIN','015','Colorless')
,('NIN','016','Colorless')
,('NIN','017','Colorless')
,('NIN','018','Colorless')
,('NIN','019','Colorless')
,('NIN','020','Colorless')
,('NIN','021','Colorless')
,('NIN','022','Colorless')
,('NIN','023','Green')
,('NIN','024','Green')
,('NIN','025','Green')
,('NIN','026','Green')
,('NIN','027','Green')
,('NIN','028','Green')
,('NIN','029','Green')
,('NIN','030','Green')
,('NIN','031','Green')
,('NIN','032','Green')
,('NIN','033','Green')
,('NIN','034','Green')
,('NIN','035','Green')
,('NIN','036','Green')
,('NIN','037','Green')
,('NIN','038','Green')
,('NIN','039','Green')
,('NIN','040','Green')
,('NIN','041','Green')
,('NIN','042','Green')
,('NIN','043','Green')
,('NIN','044','Green')
,('NIN','045','Green')
,('NIN','046','Green')
,('NIN','047','Green')
,('NIN','048','Blue')
,('NIN','049','Blue')
,('NIN','050','Blue')
,('NIN','051','Blue')
,('NIN','052','Blue')
,('NIN','053','Blue')
,('NIN','054','Blue')
,('NIN','055','Blue')
,('NIN','056','Blue')
,('NIN','057','Blue')
,('NIN','058','Blue')
,('NIN','059','Blue')
,('NIN','060','Blue')
,('NIN','061','Blue')
,('NIN','062','Blue')
,('NIN','063','Blue')
,('NIN','064','Blue')
,('NIN','065','Blue')
,('NIN','066','Blue')
,('NIN','067','Blue')
,('NIN','068','Blue')
,('NIN','069','Blue')
,('NIN','070','Blue')
,('NIN','071','Blue')
,('NIN','072','Blue')
,('NIN','T01','Blue')
,('NIN','073','Red')
,('NIN','074','Red')
,('NIN','075','Red')
,('NIN','076','Red')
,('NIN','077','Red')
,('NIN','078','Red')
,('NIN','079','Red')
,('NIN','080','Red')
,('NIN','081','Red')
,('NIN','082','Red')
,('NIN','083','Red')
,('NIN','084','Red')
,('NIN','085','Red')
,('NIN','086','Red')
,('NIN','087','Red')
,('NIN','088','Red')
,('NIN','089','Red')
,('NIN','090','Red')
,('NIN','091','Red')
,('NIN','092','Red')
,('NIN','093','Red')
,('NIN','094','Red')
,('NIN','095','Red')
,('NIN','096','Red')
,('NIN','097','Red')
,('NIN','T02','Red')
,('NIN','098','Purple')
,('NIN','099','Purple')
,('NIN','100','Purple')
,('NIN','101','Purple')
,('NIN','102','Purple')
,('NIN','103','Purple')
,('NIN','104','Purple')
,('NIN','105','Purple')
,('NIN','106','Purple')
,('NIN','107','Purple')
,('NIN','108','Purple')
,('NIN','109','Purple')
,('NIN','110','Purple')
,('NIN','111','Purple')
,('NIN','112','Purple')
,('NIN','113','Purple')
,('NIN','114','Purple')
,('NIN','115','Purple')
,('NIN','116','Purple')
,('NIN','117','Purple')
,('NIN','118','Purple')
,('NIN','119','Purple')
,('NIN','120','Purple')
,('NIN','121','Purple')
,('NIN','122','Purple')
,('NIN','002','Green, Blue')
,('NIN','003','Green, Red')
,('NIN','004','Green, Purple')
,('NIN','005','Blue, Red')
,('NIN','006','Blue, Purple')
,('NIN','007','Red, Purple')
,('NIN','123','Green, Blue')
,('NIN','124','Green, Red')
,('NIN','125','Green, Purple')
,('NIN','126','Blue, Red')
,('NIN','127','Blue, Purple')
,('NIN','128','Red, Purple')
,('NIN','129','Green, Blue')
,('NIN','130','Green, Red')
,('NIN','131','Green, Purple')
,('NIN','132','Blue, Red')
,('NIN','133','Blue, Purple')
,('NIN','134','Red, Purple')
,('NIN','135','Green, Blue')
,('NIN','136','Green, Red')
,('NIN','137','Green, Purple')
,('NIN','138','Blue, Red')
,('NIN','139','Blue, Purple')
,('NIN','140','Red, Purple')
,('NIN','T03','Green, Red')
,('JGK','001','Colorless')
,('JGK','008','Colorless')
,('JGK','009','Colorless')
,('JGK','010','Colorless')
,('JGK','011','Colorless')
,('JGK','012','Colorless')
,('JGK','013','Colorless')
,('JGK','014','Colorless')
,('JGK','015','Colorless')
,('JGK','016','Colorless')
,('JGK','017','Colorless')
,('JGK','018','Colorless')
,('JGK','019','Colorless')
,('JGK','020','Colorless')
,('JGK','021','Colorless')
,('JGK','022','Colorless')
,('JGK','023','Colorless')
,('JGK','024','Colorless')
,('JGK','025','Colorless')
,('JGK','026','Colorless')
,('JGK','T01','Colorless')
,('JGK','002','Green')
,('JGK','027','Green')
,('JGK','028','Green')
,('JGK','029','Green')
,('JGK','030','Green')
,('JGK','031','Green')
,('JGK','032','Green')
,('JGK','033','Green')
,('JGK','034','Green')
,('JGK','035','Green')
,('JGK','036','Green')
,('JGK','037','Green')
,('JGK','038','Green')
,('JGK','039','Green')
,('JGK','040','Green')
,('JGK','041','Green')
,('JGK','042','Green')
,('JGK','043','Green')
,('JGK','044','Green')
,('JGK','045','Green')
,('JGK','046','Green')
,('JGK','047','Green')
,('JGK','048','Green')
,('JGK','049','Green')
,('JGK','050','Green')
,('JGK','051','Green')
,('JGK','052','Green')
,('JGK','053','Green')
,('JGK','T02','Green')
,('JGK','T03','Green')
,('JGK','T04','Green')
,('JGK','T05','Green')
,('JGK','003','Blue')
,('JGK','054','Blue')
,('JGK','055','Blue')
,('JGK','056','Blue')
,('JGK','057','Blue')
,('JGK','058','Blue')
,('JGK','059','Blue')
,('JGK','060','Blue')
,('JGK','061','Blue')
,('JGK','062','Blue')
,('JGK','063','Blue')
,('JGK','064','Blue')
,('JGK','065','Blue')
,('JGK','066','Blue')
,('JGK','067','Blue')
,('JGK','068','Blue')
,('JGK','069','Blue')
,('JGK','070','Blue')
,('JGK','071','Blue')
,('JGK','072','Blue')
,('JGK','073','Blue')
,('JGK','074','Blue')
,('JGK','075','Blue')
,('JGK','076','Blue')
,('JGK','077','Blue')
,('JGK','078','Blue')
,('JGK','079','Blue')
,('JGK','080','Blue')
,('JGK','004','Red')
,('JGK','081','Red')
,('JGK','082','Red')
,('JGK','083','Red')
,('JGK','084','Red')
,('JGK','085','Red')
,('JGK','086','Red')
,('JGK','087','Red')
,('JGK','088','Red')
,('JGK','089','Red')
,('JGK','090','Red')
,('JGK','091','Red')
,('JGK','092','Red')
,('JGK','093','Red')
,('JGK','094','Red')
,('JGK','095','Red')
,('JGK','096','Red')
,('JGK','097','Red')
,('JGK','098','Red')
,('JGK','099','Red')
,('JGK','100','Red')
,('JGK','101','Red')
,('JGK','102','Red')
,('JGK','103','Red')
,('JGK','104','Red')
,('JGK','105','Red')
,('JGK','106','Red')
,('JGK','107','Red')
,('JGK','T06','Red')
,('JGK','T07','Red')
,('JGK','T08','Red')
,('JGK','T09','Red')
,('JGK','T10','Red')
,('JGK','T11','Red')
,('JGK','T12','Red')
,('JGK','T13','Red')
,('JGK','T14','Red')
,('JGK','005','Purple')
,('JGK','108','Purple')
,('JGK','109','Purple')
,('JGK','110','Purple')
,('JGK','111','Purple')
,('JGK','112','Purple')
,('JGK','113','Purple')
,('JGK','114','Purple')
,('JGK','115','Purple')
,('JGK','116','Purple')
,('JGK','117','Purple')
,('JGK','118','Purple')
,('JGK','119','Purple')
,('JGK','120','Purple')
,('JGK','121','Purple')
,('JGK','122','Purple')
,('JGK','123','Purple')
,('JGK','124','Purple')
,('JGK','125','Purple')
,('JGK','126','Purple')
,('JGK','127','Purple')
,('JGK','128','Purple')
,('JGK','129','Purple')
,('JGK','130','Purple')
,('JGK','131','Purple')
,('JGK','132','Purple')
,('JGK','133','Purple')
,('JGK','134','Purple')
,('JGK','T15','Purple')
,('JGK','006','Green, Blue')
,('JGK','007','Green, Red')
,('JGK','135','Green, Purple')
,('JGK','136','Blue, Red')
,('JGK','137','Blue, Purple')
,('JGK','138','Red, Purple')
,('FAL','001','Colorless')
,('FAL','027','Colorless')
,('FAL','028','Colorless')
,('FAL','029','Colorless')
,('FAL','030','Colorless')
,('FAL','031','Colorless')
,('FAL','032','Colorless')
,('FAL','033','Colorless')
,('FAL','034','Colorless')
,('FAL','035','Colorless')
,('FAL','036','Colorless')
,('FAL','037','Colorless')
,('FAL','038','Colorless')
,('FAL','039','Colorless')
,('FAL','040','Colorless')
,('FAL','041','Colorless')
,('FAL','042','Colorless')
,('FAL','043','Colorless')
,('FAL','044','Colorless')
,('FAL','045','Colorless')
,('FAL','046','Colorless')
,('FAL','047','Colorless')
,('FAL','048','Colorless')
,('FAL','049','Colorless')
,('FAL','050','Colorless')
,('FAL','051','Colorless')
,('FAL','052','Colorless')
,('FAL','053','Colorless')
,('FAL','054','Colorless')
,('FAL','055','Colorless')
,('FAL','056','Colorless')
,('FAL','057','Colorless')
,('FAL','058','Colorless')
,('FAL','T01','Colorless')
,('FAL','002','Green')
,('FAL','059','Green')
,('FAL','060','Green')
,('FAL','061','Green')
,('FAL','062','Green')
,('FAL','063','Green')
,('FAL','064','Green')
,('FAL','065','Green')
,('FAL','066','Green')
,('FAL','067','Green')
,('FAL','068','Green')
,('FAL','069','Green')
,('FAL','070','Green')
,('FAL','071','Green')
,('FAL','072','Green')
,('FAL','073','Green')
,('FAL','074','Green')
,('FAL','075','Green')
,('FAL','076','Green')
,('FAL','077','Green')
,('FAL','078','Green')
,('FAL','079','Green')
,('FAL','080','Green')
,('FAL','081','Green')
,('FAL','082','Green')
,('FAL','083','Green')
,('FAL','084','Green')
,('FAL','085','Green')
,('FAL','086','Green')
,('FAL','087','Green')
,('FAL','088','Green')
,('FAL','089','Green')
,('FAL','090','Green')
,('FAL','091','Green')
,('FAL','T02','Green')
,('FAL','T03','Green')
,('FAL','T04','Green')
,('FAL','003','Blue')
,('FAL','092','Blue')
,('FAL','093','Blue')
,('FAL','094','Blue')
,('FAL','095','Blue')
,('FAL','096','Blue')
,('FAL','097','Blue')
,('FAL','098','Blue')
,('FAL','099','Blue')
,('FAL','100','Blue')
,('FAL','101','Blue')
,('FAL','102','Blue')
,('FAL','103','Blue')
,('FAL','104','Blue')
,('FAL','105','Blue')
,('FAL','106','Blue')
,('FAL','107','Blue')
,('FAL','108','Blue')
,('FAL','109','Blue')
,('FAL','110','Blue')
,('FAL','111','Blue')
,('FAL','112','Blue')
,('FAL','113','Blue')
,('FAL','114','Blue')
,('FAL','115','Blue')
,('FAL','116','Blue')
,('FAL','117','Blue')
,('FAL','118','Blue')
,('FAL','119','Blue')
,('FAL','120','Blue')
,('FAL','121','Blue')
,('FAL','122','Blue')
,('FAL','123','Blue')
,('FAL','124','Blue')
,('FAL','T05','Blue')
,('FAL','004','Red')
,('FAL','125','Red')
,('FAL','126','Red')
,('FAL','127','Red')
,('FAL','128','Red')
,('FAL','129','Red')
,('FAL','130','Red')
,('FAL','131','Red')
,('FAL','132','Red')
,('FAL','133','Red')
,('FAL','134','Red')
,('FAL','135','Red')
,('FAL','136','Red')
,('FAL','137','Red')
,('FAL','138','Red')
,('FAL','139','Red')
,('FAL','140','Red')
,('FAL','141','Red')
,('FAL','142','Red')
,('FAL','143','Red')
,('FAL','144','Red')
,('FAL','145','Red')
,('FAL','146','Red')
,('FAL','147','Red')
,('FAL','148','Red')
,('FAL','149','Red')
,('FAL','150','Red')
,('FAL','151','Red')
,('FAL','152','Red')
,('FAL','153','Red')
,('FAL','154','Red')
,('FAL','155','Red')
,('FAL','156','Red')
,('FAL','157','Red')
,('FAL','T06','Red')
,('FAL','T07','Red')
,('FAL','T08','Red')
,('FAL','T09','Red')
,('FAL','T10','Red')
,('FAL','005','Purple')
,('FAL','158','Purple')
,('FAL','159','Purple')
,('FAL','160','Purple')
,('FAL','161','Purple')
,('FAL','162','Purple')
,('FAL','163','Purple')
,('FAL','164','Purple')
,('FAL','165','Purple')
,('FAL','166','Purple')
,('FAL','167','Purple')
,('FAL','168','Purple')
,('FAL','169','Purple')
,('FAL','170','Purple')
,('FAL','171','Purple')
,('FAL','172','Purple')
,('FAL','173','Purple')
,('FAL','174','Purple')
,('FAL','175','Purple')
,('FAL','176','Purple')
,('FAL','177','Purple')
,('FAL','178','Purple')
,('FAL','179','Purple')
,('FAL','180','Purple')
,('FAL','181','Purple')
,('FAL','182','Purple')
,('FAL','183','Purple')
,('FAL','184','Purple')
,('FAL','185','Purple')
,('FAL','186','Purple')
,('FAL','187','Purple')
,('FAL','188','Purple')
,('FAL','189','Purple')
,('FAL','190','Purple')
,('FAL','T11','Purple')
,('FAL','T12','Purple')
,('FAL','T13','Purple')
,('FAL','006','Green, Purple')
,('FAL','007','Green, Red')
,('FAL','008','Red, Purple')
,('FAL','009','Green, Blue')
,('FAL','010','Blue, Red')
,('FAL','011','Red, Purple')
,('FAL','012','Blue, Red')
,('FAL','013','Green, Red')
,('FAL','014','Green, Blue')
,('FAL','015','Blue, Purple')
,('FAL','016','Blue, Purple')
,('FAL','017','Red, Purple')
,('FAL','018','Blue, Red')
,('FAL','019','Green, Purple')
,('FAL','020','Green, Purple')
,('FAL','021','Green, Blue')
,('FAL','022','Green, Red')
,('FAL','023','Green, Purple')
,('FAL','024','Blue, Red')
,('FAL','025','Blue, Purple')
,('FAL','026','Red, Purple')
,('FAL','191','Green, Blue')
,('FAL','192','Green, Blue')
,('FAL','193','Green, Red')
,('FAL','194','Green, Red')
,('FAL','195','Green, Purple')
,('FAL','196','Green, Purple')
,('FAL','197','Blue, Red')
,('FAL','198','Blue, Red')
,('FAL','199','Blue, Purple')
,('FAL','200','Blue, Purple')
,('FAL','201','Red, Purple')
,('FAL','202','Red, Purple')
,('FAL','203','Green, Blue')
,('FAL','204','Green, Red')
,('FAL','205','Green, Purple')
,('FAL','206','Blue, Red')
,('FAL','207','Blue, Purple')
,('FAL','208','Red, Purple');
