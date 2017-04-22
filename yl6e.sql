COLUMN nimetus FORMAT A15 NEW_VALUE nimetus NOPRINT
COLUMN oppejoud FORMAT A15 NEW_VALUE oppejoud NOPRINT
COLUMN Nimi FORMAT A15
BTITLE CENTER 'Õppejõud: ' oppejoud
TTITLE CENTER 'Aine: ' nimetus SKIP 2
BREAK ON nimetus SKIP PAGE
SET PAGESIZE 15
ACCEPT nimetus PROMT 'Sisestage õppeaine nimetus: '
SELECT
perenimi || ', ' || eesnimi as "Nimi",
too_nr as "Ülesanne",
punktid as "Punktid",
to_char(kuupaev, 'dd.mm.rrrr') as "Kuupäev",
nimetus,
oppejoud
FROM
yliopilased y,
koduylesanded k,
oppeained o
WHERE
k.yliopilase_id=y.id AND
k.kursusekood=o.kood AND
UPPER(nimetus) LIKE UPPER ('%&nimetus%')
ORDER BY nimetus;
CLEAR COLUMN

