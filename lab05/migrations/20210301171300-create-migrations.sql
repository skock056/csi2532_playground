CREATE TABLE schema_migrations (
    migration varchar(255),
    migrated_at time,
    PRIMARY KEY (migration)
);

INSERT INTO schema_migrations (migration, migrated_at) VALUES
('20210301171200-create-athletes.sql', '2021-03-01 17:12:00');

INSERT INTO schema_migrations (migration, migrated_at) VALUES 
('20210301171300-create-migrations.sql', '2021-03-01 17:13:00');