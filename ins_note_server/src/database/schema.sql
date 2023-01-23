CREATE DATABASE insnote;

CREATE TABLE feed(
    id INT AUTO_INCREMENT,
    tagID INT,
    keyword VARCHAR(50) NOT NULL,
    detail VARCHAR(255),
    date DATETIME,
    location VARCHAR(255),
    alarm TINYINT(1),
    link_1 VARCHAR(255),
    link_2 VARCHAR(255),
    link_3 VARCHAR(255),
    PRIMARY KEY(id)
);

CREATE TABLE tag(
    tagID INT,
    content VARCHAR(50),
    PRIMARY KEY(tagID)
);