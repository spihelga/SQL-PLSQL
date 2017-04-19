COLUMN nimetus FORMAT A15 NEW_VALUE nimetus NOPRINT
COLUMN oppejoud FORMAT A15 NEW_VALUE oppejoud NOPRINT
BTITLE CENTER 'Õppejõud: ' oppejoud
TTITLE CENTER 'Aine: ' nimetus SKIP 2
BREAK ON nimetus SKIP PAGE
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
k.yliopisalse_id=y.id AND
k.kursusekood=o.kood AND
UPPER(nimetus) LIKE UPPER ('%&nimetus%');
CLEAR COLUMN


