CREATE TABLE users (
 id SERIAL PRIMARY KEY,
 name VARCHAR(100),
 email VARCHAR(255) UNIQUE,
 password_hash VARCHAR(255),
 instrument VARCHAR(50),
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE groups (
 id SERIAL PRIMARY KEY,
 name VARCHAR(100),
 description TEXT,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE memberships (
 user_id INTEGER REFERENCES users(id),
 group_id INTEGER REFERENCES groups(id),
 role VARCHAR(50),
 PRIMARY KEY (user_id, group_id)
);
CREATE TABLE events (
 id SERIAL PRIMARY KEY,
 group_id INTEGER REFERENCES groups(id),
 title VARCHAR(255),
 start_time TIMESTAMP,
 end_time TIMESTAMP,
 location VARCHAR(255),
 notes TEXT
);
CREATE TABLE attendance (
 event_id INTEGER REFERENCES events(id),
 user_id INTEGER REFERENCES users(id),
 availability VARCHAR(10),
 PRIMARY KEY (event_id, user_id)
);
CREATE TABLE setlists (
 id SERIAL PRIMARY KEY,
 group_id INTEGER REFERENCES groups(id),
 name VARCHAR(255),
 notes TEXT
);
CREATE TABLE setlist_songs (
 id SERIAL PRIMARY KEY,
 setlist_id INTEGER REFERENCES setlists(id),
 song_title VARCHAR(255),
 position INTEGER
);
CREATE TABLE messages (
 id SERIAL PRIMARY KEY,
 group_id INTEGER REFERENCES groups(id),
 user_id INTEGER REFERENCES users(id),
 content TEXT,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
