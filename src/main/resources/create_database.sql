
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
CREATE TABLE room (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(255) NOT NULL
)

    Engine InnoDB;
CREATE TABLE row (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    room_id INT NOT NULL,
    place_in_row INT NOT NULL,
    FOREIGN KEY (room_id) REFERENCES room(id)
)

    Engine InnoDB;

CREATE TABLE session (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    movie_id INT NOT NULL,
    room_id INT NOT NULL,
    date DATE NOT NULL,

    FOREIGN KEY (movie_id) REFERENCES movies(id),
    FOREIGN KEY (room_id) REFERENCES room(id)
)

    Engine InnoDB;

CREATE TABLE booking (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    session_id INT NOT NULL,
    date DATE NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (session_id) REFERENCES session(id)
)

    Engine InnoDB;

CREATE TABLE booking_place (
    booking_id INT NOT NULL,
    place INT NOT NULL,

    FOREIGN KEY (booking_id) REFERENCES booking(id)
)

    Engine InnoDB;
INSERT INTO roles VALUES (1,'ROLE_USER');
INSERT INTO roles VALUES (2,'ROLE_ADMIN');
INSERT INTO users VALUES (1,'admin', '$2a$11$iZEbj0X9ypdXODxwdkYgPuLBcV8FCxToD.7A.6YqrEXpEOnq7BqF.', 'admin@localhost.ru',1, '08dbabc5-1154-49e7-8ece-b3b1f6dacd30');
INSERT INTO genres VALUES (1,'Ужасы');
INSERT INTO genres VALUES (2,'Экшн');
INSERT INTO genres VALUES (3,'Боевик');
INSERT INTO genres VALUES (4,'Детектив');
INSERT INTO genres VALUES (5,'Документальный');
INSERT INTO genres VALUES (6,'Драма');
INSERT INTO genres VALUES (7,'Комедия');
INSERT INTO genres VALUES (8,'Криминал');
INSERT INTO genres VALUES (9,'Мелодрама');
INSERT INTO genres VALUES (10,'Мультфильм');
INSERT INTO genres VALUES (11,'Мюзикл');
INSERT INTO genres VALUES (12,'Приключения');
INSERT INTO genres VALUES (13,'Триллер');
INSERT INTO genres VALUES (14,'Фантастика');
INSERT INTO genres VALUES (15,'Фильм-нуар');
INSERT INTO genres VALUES (16,'Фэнтези');
INSERT INTO genres VALUES (17,'Вестерн');
INSERT INTO genres VALUES (18,'Аниме');
INSERT INTO user_roles VALUES (1,2);
