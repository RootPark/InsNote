CREATE DATABASE insnote;

CREATE TABLE feed(
    id INT AUTO_INCREMENT,
    tagID INT,
    keyword VARCHAR(50) NOT NULL, //핵심
    detail VARCHAR(255), //디테일
    date DATETIME, //언제 그 아이디어가 떠올랐는지
    location VARCHAR(255), //어느 장소에서 그 아이디어가 떠올랐는지
    alarm TINYINT(1), //1Byte 저장공간 사용하는 데이터 타입
    link_1 VARCHAR(255), //해당 아이디어 관련 링크
    link_2 VARCHAR(255),
    link_3 VARCHAR(255),
    PRIMARY KEY(id)
);

CREATE TABLE tag( // 주제
    tagID INT,
    content VARCHAR(50),
    PRIMARY KEY(tagID)
);