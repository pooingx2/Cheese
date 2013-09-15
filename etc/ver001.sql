create Database Cheese;
GRANT ALL ON Cheese.* To 'pooingx2' IDENTIFIED BY 'SSM2013';

CREATE TABLE User (
    uid VARCHAR(20) NOT NULL,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL,
	type VARCHAR(20) NOT NULL,

    PRIMARY KEY (uid)
)DEFAULT CHARSET=utf8;

CREATE TABLE Gallery (
    gid INTEGER NOT NULL AUTO_INCREMENT,
	nation VARCHAR(20) NOT NULL,
    title VARCHAR(100) NOT NULL,
    content BLOB NOT NULL,
	mapx INTEGER NOT NULL,
	mapy INTEGER NOT NULL,
    master VARCHAR(20) NOT NULL,

    PRIMARY KEY (gid),
    FOREIGN KEY (master) REFERENCES User (uid)
)DEFAULT CHARSET=utf8;

CREATE TABLE Photo (
    pid INTEGER NOT NULL AUTO_INCREMENT,
    path VARCHAR(100) NOT NULL,
    count INTEGER NOT NULL,
    gallery INTEGER NOT NULL,

    PRIMARY KEY (pid),
    FOREIGN KEY (gallery) REFERENCES Gallery (gid)
)DEFAULT CHARSET=utf8;