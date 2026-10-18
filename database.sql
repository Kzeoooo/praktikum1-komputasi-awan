-- Buat Tabel User
CREATE TABLE IF NOT EXISTS user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(80) NOT NULL UNIQUE,
    password VARCHAR(120) NOT NULL
);

-- Insert Data Awal (Dummy Data)
INSERT INTO user (username, password) VALUES ('bryanzefanyamaitimu', 'password123');
INSERT INTO user (username, password) VALUES ('asprak_gacor', 'asprak');
INSERT INTO user (username, password) VALUES ('budi_yanto', 'budi123');
INSERT INTO user (username, password) VALUES ('merica_pedes', 'caca456');
INSERT INTO user (username, password) VALUES ('salma_imup', 'dewi789');
