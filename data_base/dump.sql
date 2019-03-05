INSERT INTO  `club`.`user` (
`id` ,
`name` ,
`surname` ,
`DOB` ,
`phone` ,
`address` ,
`email` ,
`photo` ,
`password` ,
`token` ,
`user_type`
)
VALUES (
NULL ,  'user',  'user',  '2019-03-05',  '23649702',  'address user',  'user@user',  'no photo',  '098F6BCD4621D373CADE4E832627B4F6', NULL ,  'member'
);

INSERT INTO  `club`.`user` (
`id` ,
`name` ,
`surname` ,
`DOB` ,
`phone` ,
`address` ,
`email` ,
`photo` ,
`password` ,
`token` ,
`user_type`
)
VALUES (
NULL ,  'test',  'test',  '2019-03-05',  '23649702',  'address test',  'test@test',  'no photo',  '098F6BCD4621D373CADE4E832627B4F6', NULL ,  'admin'
);

INSERT INTO  `club`.`activity` (
`id` ,
`name` ,
`description` ,
`photo`
)
VALUES (
NULL ,  'Futbol', 'Football is a family of team sports that involve, to varying degrees, kicking a ball to score a goal. Unqualified, the word football is understood to refer to whichever form of football is the most popular in the regional context in which the word appears. Sports commonly called football in certain places include association football (known as soccer in some countries); gridiron football (specifically American football or Canadian football); Australian rules football; rugby football (either rugby league or rugby union); and Gaelic football.', 'no photo'
);

INSERT INTO  `club`.`activity` (
`id` ,
`name` ,
`description` ,
`photo`
)
VALUES (
NULL ,  'Casin', 'Cue sports (sometimes written cuesports), also known as billiard sports, are a wide variety of games of skill generally played with a cue stick, which is used to strike billiard balls and thereby cause them to move around a cloth-covered billiards table bounded by elastic bumpers known as cushions.', 'no photo'
);

INSERT INTO  `club`.`activity` (
`id` ,
`name` ,
`description` ,
`photo`
)
VALUES (
NULL ,  'Bochas', 'Bochas is a ball sport belonging to the boules family, closely related to British bowls and French pétanque, with a common ancestry from ancient games played in the Roman Empire. Developed into its present form in Italy[6] (where it is called bocce, the plural of the Italian word boccia which means ''bowl'' in the sport sense),[7] it is played around Europe and also in overseas areas that have received Italian migrants, including Australia, North America, and South America.', 'no photo'
);

INSERT INTO  `club`.`activity` (
`id` ,
`name` ,
`description` ,
`photo`
)
VALUES (
NULL ,  'Truco', 'Truco is a variant of Truc and a popular trick-taking card game originally from Valencia and Balearic Islands (Spain) and played specially in the Southern Cone in Brazil, Argentina, Uruguay, Italy (in Piemonte, in Lomellina, and a particular variant in the towns Porto San Giorgio, Sirolo, Numana, Porto Recanati, Potenza Picena (Marche) and Paulilatino (Sardegna) ), Paraguay, southern Chile and Venezuela. It is played using a Spanish deck, by two, four or six players, divided into two teams.', 'no photo'
);

INSERT INTO  `club`.`enroll` (
`user` ,
`activity` ,
`date`
)
VALUES (
'2',  '1', 
CURRENT_TIMESTAMP
);



