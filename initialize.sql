DROP TABLE IF EXISTS users, userHighScore, user2FA, userDailyStreak, userLevelsComplete, userCharacter, characterHelmets, characterJumpSuits;

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE userHighScore (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    highestScore INT NOT NULL,
    todayScore INT NOT NULL,
    fastestTime INT NOT NULL,
    todayTime INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)
    REFERENCES users (id)
);

CREATE TABLE user2FA (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    has2FA BOOLEAN NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)
    REFERENCES users (id)
);

CREATE TABLE userDailyStreak (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    heighestStreak INT NOT NULL,
    currentStreak INT NOT NULL,
    previousStreak INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)
    REFERENCES users (id)
);

CREATE TABLE userLevelsComplete (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    levelsComplete INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)
    REFERENCES users (id)
);


CREATE TABLE characterHelmets (
    id INT NOT NULL AUTO_INCREMENT,
    helmetName VARCHAR(50) NOT NULL,
    helmetDescription VARCHAR(240) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE characterJumpSuits (
    id INT NOT NULL AUTO_INCREMENT,
    jumpSuitName VARCHAR(50) NOT NULL,
    jumpSuitDescription VARCHAR(240) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE userCharacter (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    user_helmet VARCHAR(50) NOT NULL,
    user_jumpsuit VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_helmet)
    REFERENCES characterHelmets (helmetName),
    FOREIGN KEY (user_jumpsuit)
    REFERENCES characterJumpSuits (jumpSuitName)
);