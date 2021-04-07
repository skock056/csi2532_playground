# csi2532_playground
Dépôt de Sébastien Kock 300137051

Modification du fichier README.md

# lab09
## Question 1

1a:
    a) Clés candidates de R: AB, BC, BD
    b) R est dans 3NF, R n'est pas dans BCNF.
    
1b:
    a) Clés candidates de R: A, B, C, D
    b) R est dans 3NF et BCNF.

1c:
    a) Clés candidates de R: B
    b) R n'est pas dans 3NF ou BCNF.
    
1d:
    a) Clés candidates de R: ABC, BCD
    b) R est dans 3NF, R n'est pas dans BCNF.
    
1e:
    a) Clés candidates de R: AB
    b) R n'est pas dans 3NF ou BCNF.
    
## Question 2

2a:
    AB->D est valide.
        Preuve: Règle de transitivité
        si 𝛼->β et β->𝛾, alors 𝛼->𝛾
        AB->C et BC->AD donc, AB->D
        
2b: 
    A->C est invalide.
        Contre-exemple: Pour que A->C, il faut A->B.
        
2c: 
    B->C est invalide.
        Contre-exemple: Pour que B->C, il faut A->B.
        
2d: 
    A->C OR B->C est valide.
        Preuve: règle de décomposition
        if 𝛼->β𝛾 then 𝛼->β and 𝛼->𝛾
        if AB->C then A->C and B->C.
        
## Question 3

Fd = {D->A, B->D} est la couverture canonique de F = {B->A, D->A, AB->D}.

## Question 4

ABH -> C est la décomposition BCNF de R. 
    
  

# lab06

## 1

|name|birthplace|
|---|---|
|Caravaggio|Milan|
|Smith|Ottawa|
|Picasso|Malaga|
|Leonardo|Florence|
|Michelangelo|Arezzo|
|Josefa|Seville|
|Hans Hofmann|Weisenburg|
|John|San Francisco|

```sql
SELECT name, birthplace FROM artists;
```

## 2

|title|price|
|---|---|
|Blue|10000.00|
|Waves|4000.00|
|Three Musicians|11000.00|

```sql
SELECT title, price FROM artworks
    WHERE year > 1600;
```

## 3

|title|type|
|---|---|
|Blue|Modern|
|Waves||
|Three Musicians|Modern|

```sql
SELECT title, type FROM artworks
    WHERE year = 2000 OR artist_name = 'Picasso';
```

## 4

|name|birthplace|
|---|---|
|Picasso|Malaga|
|John|San Francisco|

```sql
SELECT name, birthplace FROM artists
    WHERE dateofbirth > '12-31-1879' AND dateofbirth < '01-01-1931';
```

## 5

|name|country|
|---|---|
|Caravaggio||
|Smith||
|Leonardo|Italy|
|Michelangelo|Italy|
|Josefa|Spain|
|Hans Hofmann|Germany|
|John|USA|

```sql
SELECT name, country FROM artists
    WHERE style = 'Modern' OR style = 'Baroque' OR style = 'Renaissance';
```

## 6

|title|year|type|price|artist_name|
|---|---|---|---|---|
|Blue|2000|Modern|10000.00|Smith|
|The Cardsharps|1594|Baroque|40000.00|Caravaggio|
|Three Musicians|1921|Modern|11000.00|Picasso|
|Waves|2000||4000.00|Smith|

```sql
SELECT * FROM artworks
    ORDER BY title ASC;
```

## 7

|name|id|
|---|---|
|Emre|4|
|Saeid|5|

```sql
SELECT name, id FROM customers
    INNER JOIN likeartists ON customers.id = likeartists.customer_id
    WHERE artist_name = 'Picasso';
```

## 8

|name|
|---|
|Saeid|

```sql
SELECT name FROM customers
    INNER JOIN likeartists ON customers.id = likeartists.customer_id
    WHERE artist_name IN(
        SELECT artist_name FROM likeartists
        INNER JOIN artists ON likeartists.artist_name = artists.name
        WHERE style = 'Renaissance')
        AND amount > 30000;
```

# lab05 (voir dossier 'lab05')

# lab04 - Diagrammes et schémas relationnels

## Diagrammes relationnels

1. Les professeurs peuvent enseigner le même cours sur plusieurs semestres et seule la plus récente doit être enregistrée.

![Diag Relationnel](https://github.com/skock056/csi2532_playground/blob/lab04/lab04/1.PNG?raw=true)

<br/>

3. Chaque professeur enseigne exactement un cours (ni plus, ni moins).

![Diag Relationnel](https://github.com/skock056/csi2532_playground/blob/lab04/lab04/3.PNG?raw=true)

<br/>

5. Les professeurs peuvent enseigner le même cours sur plusieurs semestres et chaque doit être enregistrée.

![Diag Relationnel](https://github.com/skock056/csi2532_playground/blob/lab04/lab04/5.PNG?raw=true)

<br/>

6. Supposons maintenant que certains cours puissent être enseignés conjointement par une équipe de professeurs, mais il est possible qu'aucun professeur dans une équipe ne puisse enseigner le cours. Modélisez cette situation en introduisant des ensembles d'entités et des ensembles de relations supplémentaires si nécessaire.

![Diag Relationnel](https://github.com/skock056/csi2532_playground/blob/lab04/lab04/6.PNG?raw=true)

## Schémas relationnels (SQL)

1. Les professeurs peuvent enseigner le même cours sur plusieurs semestres et seule la plus récente doit être enregistrée.

```sql
CREATE TABLE Course (
  courseid int,
  PRIMARY KEY (courseid)
 );
 
CREATE TABLE Professor (
  ssn int,
  PRIMARY KEY (ssn)
 );

CREATE TABLE Teaches (
  semesterid int,
  courseid int,
  ssn int,
  FOREIGN KEY (courseid) REFERENCES Course(courseid),
  FOREIGN KEY (ssn) REFERENCES Professor(ssn),
  PRIMARY KEY (courseid, ssn)
 );
```

<br/>

3. Chaque professeur enseigne exactement un cours (ni plus, ni moins).

```sql
CREATE TABLE Course (
  courseid int,
  PRIMARY KEY (courseid)
 );

CREATE TABLE Professor (
  ssn int,
  courseid int,
  PRIMARY KEY (ssn),
  FOREIGN KEY (courseid) REFERENCES Course(courseid)
 );
```

<br/>

5. Les professeurs peuvent enseigner le même cours sur plusieurs semestres et chaque doit être enregistrée.

```sql
CREATE TABLE Course (
  courseid int,
  PRIMARY KEY (courseid)
 );
 
CREATE TABLE Professor (
  ssn int,
  PRIMARY KEY (ssn)
 );

CREATE TABLE Semester (
  semesterid int,
  PRIMARY KEY (semesterid)
 );
 
CREATE TABLE Teaches (
  semesterid int,
  courseid int,
  ssn int,
  FOREIGN KEY (semesterid) REFERENCES Semester(semesterid),
  FOREIGN KEY (courseid) REFERENCES Course(courseid),
  FOREIGN KEY (ssn) REFERENCES Professor(ssn),
  PRIMARY KEY (semesterid, courseid, ssn)
 );
```

<br/>

6. Supposons maintenant que certains cours puissent être enseignés conjointement par une équipe de professeurs, mais il est possible qu'aucun professeur dans une équipe ne puisse enseigner le cours. Modélisez cette situation en introduisant des ensembles d'entités et des ensembles de relations supplémentaires si nécessaire.

```sql
CREATE TABLE Course (
  courseid int,
  PRIMARY KEY (courseid)
 );

CREATE TABLE Professor (
  ssn int,
  PRIMARY KEY (ssn)
 );

CREATE TABLE Teaches (
  semesterid int,
  courseid int,
  groupid int,
  FOREIGN KEY (courseid) REFERENCES Course(courseid),
  FOREIGN KEY (groupid) REFERENCES ProfessorGroup(groupid),
  PRIMARY KEY (groupid, courseid)
 );
 
CREATE TABLE ProfessorGroup (
  groupid int,
  PRIMARY KEY (groupid)
 );

CREATE TABLE MemberOf (
  ssn int,
  groupid int,
  FOREIGN KEY (ssn) REFERENCES Professor(ssn),
  FOREIGN KEY (groupid) REFERENCES ProfessorGroup(groupid),
  PRIMARY KEY (ssn, groupid)
 );
```
<br/>

# lab03 - Diagrammes ER

1. Les professeurs peuvent enseigner le même cours sur plusieurs semestres et seule la plus récente doit être enregistrée.
![Diagram ER](https://github.com/skock056/csi2532_playground/blob/lab03/lab03/1.PNG?raw=true)

2. Chaque professeur doit enseigner un cours.
![Diagram ER](https://github.com/skock056/csi2532_playground/blob/lab03/lab03/2.PNG?raw=true)

3. Chaque professeur enseigne exactement un cours (ni plus, ni moins).
![Diagram ER](https://github.com/skock056/csi2532_playground/blob/lab03/lab03/3.PNG?raw=true)

4. Chaque professeur enseigne exactement un cours (ni plus, ni moins), et chaque cours doit être enseigné par un professeur.
![Diagram ER](https://github.com/skock056/csi2532_playground/blob/lab03/lab03/4.PNG?raw=true)

5. Les professeurs peuvent enseigner le même cours sur plusieurs semestres et chaque doit être enregistrée.
![Diagram ER](https://github.com/skock056/csi2532_playground/blob/lab03/lab03/5.PNG?raw=true)

6. Supposons maintenant que certains cours puissent être enseignés conjointement par une équipe de professeurs, mais il est possible qu'aucun professeur dans une équipe ne puisse enseigner le cours. Modélisez cette situation en introduisant des ensembles d'entités et des ensembles de relations supplémentaires si nécessaire.
![Diagram ER](https://github.com/skock056/csi2532_playground/blob/lab03/lab03/6.PNG?raw=true)

