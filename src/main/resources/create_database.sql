
-- TABLE user
CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email    VARCHAR(255) NOT NULL,
    active BOOLEAN NOT NULL DEFAULT FALSE,
    activationcode VARCHAR(255),
    restorationcode VARCHAR(255)
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
    poster VARCHAR(255) NOT NULL,
    popular BOOLEAN NOT NULL

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

CREATE TABLE sessions (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    movie_id  INT NOT NULL,
    room_id INT NOT NULL,
    date TIMESTAMP NOT NULL,
    price DECIMAL(10,2) NOT NULL,
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
    FOREIGN KEY (session_id) REFERENCES sessions(id)
)

    Engine InnoDB;

CREATE TABLE booking_place (
    booking_id INT NOT NULL,
    place INT NOT NULL,

    FOREIGN KEY (booking_id) REFERENCES booking(id)
)

    Engine InnoDB;

