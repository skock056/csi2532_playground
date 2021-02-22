# csi2532_playground
Dépôt de Sébastien Kock 300137051

Modification du fichier README.md

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

