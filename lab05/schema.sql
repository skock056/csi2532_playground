CREATE TABLE Athlete (
    id int,
    nom varchar(255),
    gender varchar(1),
    age int,
    PRIMARY KEY(id)
);

CREATE TABLE Competitions (
    compid int,
    comp_name varchar(255),
    venue varchar(255),
    start_time date,
    duration time(0),
    PRIMARY KEY(compid)
);

CREATE TABLE schema_migrations (
    migration varchar(255),
    migrated_at time,
    PRIMARY KEY (migration)
);

INSERT INTO schema_migrations (migration, migrated_at) VALUES
('20210301171200-create-athletes.sql', '2021-03-01 17:12:00');

INSERT INTO schema_migrations (migration, migrated_at) VALUES 
('20210301171300-create-migrations.sql', '2021-03-01 17:13:00');

DELETE FROM athletes;
INSERT INTO athletes (id, name, gender, dob) VALUES
(1, 'Andrew', 'm', '1975-12-01'),
(2, 'Ayana', 'F', '1998-06-11'),
(3, 'Hayden', 'm', '1996-07-24'),
(4, 'August', 'm', '1999-09-09');