
DROP TABLE IF EXISTS user_learn;
CREATE TABLE user_learn (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  benutzername TEXT NOT NULL,
  passwort TEXT NOT NULL
);

DROP TABLE IF EXISTS fach_learn;
CREATE TABLE fach_learn (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  fach TEXT,
  fach_id INTEGER,
  FOREIGN KEY (fach_id) REFERENCES user_learn (id)
);

DROP TABLE IF EXISTS thema_learn;
CREATE TABLE thema_learn (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  thema TEXT,
  thema_id INTEGER,
  thema_category INTEGER,
  FOREIGN KEY (thema_id) REFERENCES user_learn (id),
  FOREIGN KEY (thema_category) REFERENCES fach_learn (id)
);

DROP TABLE IF EXISTS quest_learn;
CREATE TABLE quest_learn (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  frage text,
  antwort text,
  quest_id INTEGER,
  fach_category INTEGER,
  thema_category INTEGER,
  FOREIGN KEY (quest_id) REFERENCES user_learn (id),
  FOREIGN KEY (fach_category) REFERENCES fach_learn (id),
  FOREIGN KEY (thema_category) REFERENCES thema_learn (id)
);
