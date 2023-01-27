
CREATE TABLE IF NOT EXISTS users(
    id serial PRIMARY KEY NOT NULL ,
    username varchar NOT NULL UNIQUE,
    email varchar NOT NULL UNIQUE,
    first_name varchar,
    last_name varchar,
    password varchar NOT NULL,
    user_slug varchar NOT NULL UNIQUE,
    created_at timestamp WITHOUT TIME ZONE
);

CREATE TABLE IF NOT EXISTS categories(
    id serial PRIMARY KEY NOT NULL ,
    category_name varchar NOT NULL,
    category_slug varchar NOT NULL UNIQUE,
    created_at timestamp  WITHOUT TIME ZONE
);

CREATE TABLE IF NOT EXISTS posts(
    id serial PRIMARY KEY NOT NULL,
    title varchar NOT NULL,
    content text NOT NULL,
    category_id SMALLINT NOT NULL UNIQUE,
    author_id SMALLINT  NOT NULL UNIQUE,
    post_slug varchar NOT NULL UNIQUE,
    created_at timestamp WITHOUT TIME ZONE,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tags(
    id serial PRIMARY KEY NOT NULL,
    tag_name varchar NOT NULL,
    tag_slug varchar NOT NULL UNIQUE,
    created_at timestamp WITHOUT TIME ZONE
);


CREATE TABLE IF NOT EXISTS posts_tags(
    id serial PRIMARY KEY NOT NULL,
    tag_id int,
    post_id int,
    FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE
)
