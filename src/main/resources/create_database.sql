
-- TABLE user
CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email    VARCHAR(255) NOT NULL,
    active BOOLEAN NOT NULL DEFAULT FALSE,
    activationcode VARCHAR(255)
    )
ENGINE InnoDB;

-- TABLE roles
CREATE TABLE roles (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
    )
ENGINE InnoDB;

-- TABLE user_roles
CREATE TABLE user_roles (
    user_id INT NOT NULL,
    role_id INT NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
    )
ENGINE InnoDB;
CREATE TABLE genres(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
)
ENGINE  InnoDB;

CREATE TABLE movies(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    director VARCHAR(255) NOT NULL,
    age_bracket VARCHAR(20) NOT NULL DEFAULT '12+',
    duration VARCHAR(20) NOT NULL,
    poster VARCHAR(255) NOT NULL

)
    ENGINE InnoDB;
CREATE TABLE movie_genres (
    movie_id INT NOT NULL,
    genre_id INT NOT NULL,

    FOREIGN KEY (movie_id) REFERENCES movies(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
)

Engine InnoDB;

INSERT INTO roles VALUES (1,'ROLE_USER');
INSERT INTO roles VALUES (2,'ROLE_ADMIN');
INSERT INTO users VALUES (1,'admin', '$2a$11$iZEbj0X9ypdXODxwdkYgPuLBcV8FCxToD.7A.6YqrEXpEOnq7BqF.', 'admin@localhost.ru',1, '08dbabc5-1154-49e7-8ece-b3b1f6dacd30');
INSERT INTO genres VALUES (1,'Ужасы');
INSERT INTO genres VALUES (2,'Экшн');
INSERT INTO genres VALUES (3,'Боевик');
INSERT INTO genres VALUES (4,'детектив');
INSERT INTO genres VALUES (5,'документальный');
INSERT INTO genres VALUES (6,'драма');
INSERT INTO genres VALUES (7,'комедия');
INSERT INTO genres VALUES (8,'криминал');
INSERT INTO genres VALUES (9,'мелодрама');
INSERT INTO genres VALUES (10,'мультфильм');
INSERT INTO genres VALUES (11,'мюзикл');
INSERT INTO genres VALUES (12,'приключения');
INSERT INTO genres VALUES (13,'триллер');
INSERT INTO genres VALUES (14,'фантастика');
INSERT INTO genres VALUES (15,'фильм-нуар');
INSERT INTO genres VALUES (16,'фэнтези');
INSERT INTO genres VALUES (17,'вестерн');
INSERT INTO genres VALUES (18,'аниме');
INSERT INTO user_roles VALUES (1,2);