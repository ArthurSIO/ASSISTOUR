--use assistour;
insert into adherent(numadherent,nomadherent,prenomadherent,adresseadherent,codepostaladherent,villeadherent,telephoneadherent) values(1,'Ivanovitch','Sacha','14 boulevard du Temple',75003,'Paris','06-92-88-29-53'); 
insert into typecontrat values(1,'Plenitude');
insert into marque values(1,'citroen');
insert into marque values(2,'renault');
insert into vehicule values('3412CV75',1,1,1,'voiture','c3','03-04-15');
insert into vehicule values('BJ83AE',1,1,2,'voiture','Kadjar','19-10-10');
insert into sinistre values(1,1,'3412CV75',1,'2020-05-20','13:27:00','dormir','Dinan',1);
insert into technicienassistance values(1,'BENTOU','Olivia');
insert into garage values(1,'Sansonnais','rue du Général de Gaulle','02-96-85-40-98',210,0);
insert into hotel values(1,'théâtre','2 rue Sainte Claire','02-96-39-06-91',79);
insert into hotel values(2,'Ocean','9 place du 11 novembre 1918','02-96-85-43-61',79);

insert into adherent(numadherent,nomadherent,prenomadherent,adresseadherent,codepostaladherent,villeadherent,telephoneadherent) values(2,'BELKACEM','Marwan','2 rue Maspero',75016,'Paris','06-73-93-99-05');
insert into typecontrat values(2,'TR ECO');
insert into marque values(1,'renault');
insert into vehicule values('GN92DE',2,2,3,'voiture','Koleos','20-01-03');
insert into garage values(2,'Citroen Gueret','22 Rue du Marechal Leclerc','05-55-52-48-52',190,0);
insert into sinistre values(2,1,'GN92DE',2,'2020-06-03','19:30:00','percuté par un poids lourd','irrécupérable','Saint Vaury',2);
insert into rapatriment values(1,2,'BATY TAXI',22,'Saint Vaury','Gueret');
insert into rapatriment values(2,2,'SNCF',23,'Gueret','Limoges');
insert into rapatriment values(3,2,'SNCF TAXI',68,'Limoges','Paris-Austerlitz');
