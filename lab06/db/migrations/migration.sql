UPDATE customers
SET amount = 9.8
WHERE address = 'Gatineau';

DELETE
FROM customers
WHERE name = 'John';

ALTER TABLE customers
ADD COLUMN rating integer CHECK(0 < rating < 11);

ALTER TABLE artists
ADD COLUMN country varchar(100);

DELETE
FROM artworks
WHERE artist_name = 'Smith';

DELETE
FROM artists
WHERE name = 'Smith';

BEGIN;
ALTER TABLE artworks
DROP CONSTRAINT artworks_artist_name_fkey;

ALTER TABLE artworks
ADD CONSTRAINT artworks_artist_name_fkey
FOREIGN KEY (artist_name) REFERENCES artists(name)
ON DELETE CASCADE
ON UPDATE CASCADE;

COMMIT;

SELECT name, birthplace FROM artists;

SELECT title, price FROM artworks
    WHERE year > 1600;

SELECT title, type FROM artworks
    WHERE year = 2000 OR artist_name = 'Picasso';

SELECT name, birthplace FROM artists
    WHERE dateofbirth > '12-31-1879' AND dateofbirth < '01-01-1931';

SELECT name, country FROM artists
    WHERE style = 'Modern' OR style = 'Baroque' OR style = 'Renaissance';

SELECT * FROM artworks
    ORDER BY title ASC;

SELECT name, id FROM customers
    INNER JOIN likeartists ON customers.id = likeartists.customer_id
    WHERE artist_name = 'Picasso';

SELECT name FROM customers
    INNER JOIN likeartists ON customers.id = likeartists.customer_id
    WHERE artist_name IN(
        SELECT artist_name FROM likeartists
        INNER JOIN artists ON likeartists.artist_name = artists.name
        WHERE style = 'Renaissance')
        AND amount > 30000;