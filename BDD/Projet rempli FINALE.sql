DROP DATABASE IF EXISTS VeloMax; 
CREATE DATABASE IF NOT EXISTS VeloMax; 
USE VeloMax;

/*Creation table*/

CREATE TABLE velo (id_velo INT NOT NULL UNIQUE, nom_velo varchar(20), taille varchar(20), prix int, type_velo varchar(20), date_debut datetime, date_fin datetime, quantite_velo int, id_fournisseur int);

CREATE TABLE piece (id_piece INT NOT NULL UNIQUE, id_fournisseur INT, num_catalogue INT,  datedebut datetime, datefin datetime, delai int, descrip_piece varchar(20), quantite_piece int, prix int);

CREATE TABLE livraison (id_livraison INT NOT NULL UNIQUE, quantite int, date_livraison datetime, id_commande INT );

CREATE TABLE commande (id_commande INT NOT NULL UNIQUE, date_commande datetime,id_velo int, id_piece int, id_client int, montant int, qty int);

Create table archive(code int, dateArchive date, nom varchar(20), action varchar(20));

CREATE TABLE fidelio (id_prog INT NOT NULL UNIQUE, descrip varchar(20), cout int, remise int, dateFin datetime, id_client INT );

CREATE TABLE clients (id_client INT NOT NULL UNIQUE, nom_client varchar(20), prenom_client varchar(20), rue varchar(20), ville varchar(20), cp varchar(20), province varchar(20), telephone int, mail varchar(20));

CREATE TABLE fournisseurs (id_fournisseurs INT NOT NULL UNIQUE, nom_fournisseurs varchar(20), siret int, nom_entreprise varchar(20), contact varchar(20), adresse varchar(20), note int, libelle varchar(20));

CREATE TABLE compose (id_velo INT NOT NULL UNIQUE, id_piece INT NOT NULL UNIQUE);

CREATE TABLE est_compose (id_commande INT NOT NULL UNIQUE, id_velo INT NOT NULL UNIQUE, id_piece INT NOT NULL UNIQUE);

CREATE TABLE fourni (id_piece INT NOT NULL UNIQUE, id_fournisseurs INT NOT NULL UNIQUE);

CREATE TABLE passer (id_client INT NOT NULL UNIQUE, id_commande INT NOT NULL UNIQUE);

ALTER TABLE velo ADD CONSTRAINT PK_velo PRIMARY KEY (id_velo);

ALTER TABLE piece ADD CONSTRAINT PK_piece PRIMARY KEY (id_piece);

ALTER TABLE livraison ADD CONSTRAINT PK_livraison PRIMARY KEY (id_livraison);

ALTER TABLE commande ADD CONSTRAINT PK_commande PRIMARY KEY (id_commande);

ALTER TABLE fidelio ADD CONSTRAINT PK_fidelio PRIMARY KEY (id_prog);

ALTER TABLE clients ADD CONSTRAINT PK_clients PRIMARY KEY (id_client);

ALTER TABLE fournisseurs ADD CONSTRAINT PK_fournisseurs PRIMARY KEY (id_fournisseurs);

ALTER TABLE compose ADD CONSTRAINT PK_compose PRIMARY KEY (id_velo, id_piece);

ALTER TABLE est_compose ADD CONSTRAINT PK_est_compose PRIMARY KEY (id_commande, id_velo, id_piece);

ALTER TABLE fourni ADD CONSTRAINT PK_fourni PRIMARY KEY (id_piece, id_fournisseurs);

ALTER TABLE passer ADD CONSTRAINT PK_passer PRIMARY KEY (id_client, id_commande);

ALTER TABLE livraison ADD CONSTRAINT FK_livraison_id_commande FOREIGN KEY (id_commande) REFERENCES commande (id_commande);

ALTER TABLE fidelio ADD CONSTRAINT FK_fidelio_id_client FOREIGN KEY (id_client) REFERENCES clients (id_client);

ALTER TABLE compose ADD CONSTRAINT FK_compose_id_velo FOREIGN KEY (id_velo) REFERENCES velo (id_velo);

ALTER TABLE compose ADD CONSTRAINT FK_compose_id_piece FOREIGN KEY (id_piece) REFERENCES piece (id_piece);

ALTER TABLE est_compose ADD CONSTRAINT FK_est_compose_id_commande FOREIGN KEY (id_commande) REFERENCES commande (id_commande);

ALTER TABLE est_compose ADD CONSTRAINT FK_est_compose_id_velo FOREIGN KEY (id_velo) REFERENCES velo (id_velo);

ALTER TABLE est_compose ADD CONSTRAINT FK_est_compose_id_piece FOREIGN KEY (id_piece) REFERENCES piece (id_piece);

ALTER TABLE fourni ADD CONSTRAINT FK_fourni_id_piece FOREIGN KEY (id_piece) REFERENCES piece (id_piece);

ALTER TABLE fourni ADD CONSTRAINT FK_fourni_id_fournisseurs FOREIGN KEY (id_fournisseurs) REFERENCES fournisseurs (id_fournisseurs);

ALTER TABLE passer ADD CONSTRAINT FK_passer_id_client FOREIGN KEY (id_client) REFERENCES clients (id_client);

ALTER TABLE passer ADD CONSTRAINT FK_passer_id_commande FOREIGN KEY (id_commande) REFERENCES commande (id_commande);

/* Insertion dans les tables  */
insert into velomax.velo values(01,'Kilimandjaro','Adultes',569,'VTT',"2021,04,05",null,1, 01);
insert into velomax.velo values(02,'NorthPole','Adultes',329,'VTT','2021,04,25','2021,04,26',1,02);
insert into velomax.velo values(03,'titan','enfant',254,'course',null,null,1,03);
insert into velomax.velo values(04,'saturne','Adultes',360,'VTT','2021,04,25','2021,04,26',1,04);
insert into velomax.velo values(05,'jupiter','Adultes',356,'ville','2021,01,30','2021,02,02',3,01);
insert into velomax.velo values(06,'evreste','enfant',136,'ville','2021,04,25',null,2,02);
insert into velomax.velo values(07,'alpes','enfant',256,'VTT',null,null,1,01);
insert into velomax.velo values(08,'mars','Adultes',852,'VTT',null,null,4,04);
insert into velomax.velo values(09,'pacifique','Adultes',1200,'course','2021,05,12',null,1,01);
insert into velomax.velo values(10,'bicle','enfant',630,'course',null,null,2,02);


insert into velomax.clients values(01,'Pakiry','Jules ','rue des bois','Paris','7500',null,'075236985',"pakiry@gmail.com");
insert into velomax.clients values(02,'perez','hugo ','rue des fleur','grenoble','38320',null,'075286985',"perez@gmail.com");
insert into velomax.clients values(03,'obadia','elie ','rue de la mer','agde','34300',null,'0786936255',"obadia@gmail.com");
insert into velomax.clients values(04,'rival','antoine ','rue du peuil','grenoble','38320',"isere",'063985145',"rival@gmail.com");
insert into velomax.clients values(05,'baffert','titou ','avenue du golf','bretagne','36110',null,'06932587',"baffert@gmail.com");

insert into velomax.clients values(06,'super velo',null,'avenue du golf','bretagne','36110',null,null,"supervelo@gmail.com");

INSERT INTO velomax.piece VALUES (1,01,111,"2020,05,18","2020,05,21",3, 'C32', 2,6);
INSERT INTO velomax.piece VALUES (2,01,112,"2020,06,12","2020,08,13",9, 'C34', 9,8);
INSERT INTO velomax.piece VALUES (3,02,113,"2020,03,12","2020,03,30",2, 'C15', 6,2);
INSERT INTO velomax.piece VALUES (4,02,114,"2020,04,02","2020,08,09",2, 'C17', 10,11);
INSERT INTO velomax.piece VALUES (5,01,115,"2020,01,01","2020,02,12",2, 'G7', 2,15);
INSERT INTO velomax.piece VALUES (6,02,116,"2020,03,14","2020,07,07",12, 'G9', 1,36);
INSERT INTO velomax.piece VALUES (7,02,117,"2020,01,01","2020,01,13",23, 'G12', 1,45);
INSERT INTO velomax.piece VALUES (8,03,118,"2020,02,14","2020,09,29",20, 'F3', 2,2);
INSERT INTO velomax.piece VALUES (9,03,119,"2021,01,12","2021,03,03",6, 'F9', 4,4);
INSERT INTO velomax.piece VALUES (10,03,1110,"2020,06,13","2020,08,15",9, 'S88', 19,20);
INSERT INTO velomax.piece VALUES (11,03,1111,"2020,06,20","2020,08,17",9, 'S37', 9,1);
INSERT INTO velomax.piece VALUES (12,04,1112,"2020,03,23","2020,11,15",3, 'S35', 3,12);
INSERT INTO velomax.piece VALUES (13,04,1113,"2020,11,13","2021,02,14",10, 'DV133',3, 12);
INSERT INTO velomax.piece VALUES (14,04,1114,"2020,12,13","2021,01,14",4, 'DV57', 3,3);
INSERT INTO velomax.piece VALUES (15,04,1115,"2020,01,29","2020,02,26",29, 'DV15', 10,122);
INSERT INTO velomax.piece VALUES (16,04,1115,"2020,01,29","2020,02,26",29, 'DV15', 0,10);

INSERT INTO velomax.fournisseurs VALUES (01,"super velo",1236,"velo and co","cedric","paris",2, "Bon");
INSERT INTO velomax.fournisseurs VALUES (02,"mega velo",1266,"supreme velo","lola","londre",3, "Mauvais");
INSERT INTO velomax.fournisseurs VALUES (03,"nitro velo",7856,"piece.com","madrid","paris",1, "Bon");
INSERT INTO velomax.fournisseurs VALUES (04,"ultra bike",9635,"bike.com","eloi","chicago",4, "Moyen");

INSERT INTO velomax.fidelio VALUES (01,"bronze",5,3,"2021,02,02",05);
INSERT INTO velomax.fidelio VALUES (02,"or",10,5,"2021,01,05",02);
INSERT INTO velomax.fidelio VALUES (03,"platine",15,7,"2021,12,04",03);
INSERT INTO velomax.fidelio VALUES (04,"platine",15,7,"2021,06,06",01);
INSERT INTO velomax.fidelio VALUES (05,"bronze",5,3,"2021,11,04",04);

INSERT INTO velomax.commande VALUES (01,"2021,04,24",01,null,2,12,1);
INSERT INTO velomax.commande VALUES (02,"2021,04,26",02,null,3,120,3);
INSERT INTO velomax.commande VALUES (03,"2021,04,28",03,01,1,300,1);
INSERT INTO velomax.commande VALUES (04,"2021,05,02",04,02,1,150,2);
INSERT INTO velomax.commande VALUES (05,"2021,05,07",05,03,1,800,3);
INSERT INTO velomax.commande VALUES (06,"2021,05,07",null,04,3,56,5);
INSERT INTO velomax.commande VALUES (07,"2021,05,08",null,05,1,120,12);

INSERT INTO velomax.livraison VALUES (01,1,"2021,04,25",01);
INSERT INTO velomax.livraison VALUES (02,2,"2021,04,28",02);
INSERT INTO velomax.livraison VALUES (03,1,"2021,04,30",03);
INSERT INTO velomax.livraison VALUES (04,3,"2021,05,03",04);
INSERT INTO velomax.livraison VALUES (05,1,"2021,05,12",05);
INSERT INTO velomax.livraison VALUES (06,4,"2021,05,08",06);
INSERT INTO velomax.livraison VALUES (07,1,"2021,05,08",07);

/* Gestion  piece */
INSERT INTO velomax.piece(id_piece, id_fournisseur, num_catalogue, pirx_piece,  datedebut , datefin, delai, descrip_piece, quantite_piece) VALUES (@id_piece, @id_fournisseur, @num_catalogue, @pirx_piece,  @datedebut , @datefin, @delai, @descrip_piece, @quantite_piece);

/* Gestion  stock : liste des pieces et velos avec  les quantites */
Select  a.descrip_piece  as article,a.quantite_piece as qty
from piece a
union
Select  b.nom_velo as article, b.quantite_velo as qty
from velo b;

/* Stock des pieces par fournissseurs */
select a.id_piece, a.descrip_piece,a.quantite_piece,b.nom_fournisseurs
from piece a ,fournisseurs b
where a.id_fournisseur = b.id_fournisseurs
group by b.nom_fournisseurs
order by a.descrip_piece;

/*Stock des velos par taille, quantite */
select id_velo, nom_velo,taille,quantite_velo
from velo
order by taille,nom_velo;

/* liste des fournisseurs */
select * from fournisseurs;

select * from livraison;

/* Stockdes velos et pieces */
select distinct a.nom_velo, b.descrip_piece
from piece b ,velo a, commande c
where (a.id_velo = c.id_velo)
or (b.id_piece=c.id_piece);

/* Quantite des pieces et velos en stock */
select distinct a.nom_velo as article, c.qty as qty
from velo a, commande c
where (a.id_velo = c.id_velo)
union 
select distinct descrip_piece as article, c.qty as qty
from piece a, commande c
where (a.id_piece = c.id_piece);

/* nombre de clients */
select  count(*) from clients;

/* nom des clients avec le cumul de toutes ses commandes en euros */
select b.id_commande,c.id_piece as article ,sum(b.montant),a.nom_client
from  piece c, commande b, clients a
where b.id_piece = c.id_piece
and b.id_client= a.id_client
group by a.nom_client
union
select b.id_commande,c.id_velo,sum(b.montant),a.nom_client
from  velo c, commande b, clients a
where b.id_velo = c.id_velo
and b.id_client= a.id_client
group by a.nom_client;

/* liste des produits ayant une qty en stock >= 2 */
select nom_velo as article, quantite_velo as qty
from velo
where quantite_velo <=2
union
select descrip_piece as article, quantite_piece as qty
from piece
where quantite_piece <=2 ;

/* nb de pieces fourni par fournisseur */
select b.nom_fournisseurs,count(a.descrip_piece)
from piece a, fournisseurs b
where a.id_fournisseur = b.id_fournisseurs
group by b.id_fournisseurs;


/* requete auto-jointure : liste des clients qui habitent la meme ville */
select a.nom_client, b.nom_client
from clients a , clients b
where a.ville = b.ville
and a.nom_client > b.nom_client;

/* requete synchronisée : Liste des commandes contiennent toutes les pieces presentes */   
select b.id_commande,count(a.id_piece)
from commande b, piece a
where b.id_piece= a.id_piece
group by b.id_commande
having count(a.id_piece) < (select count(c.id_piece) from piece c);

/* requete synchronisée : Liste des fournisseurs qui sont aussi clients */ 
select nom_fournisseurs
from fournisseurs
where nom_fournisseurs in (select  nom_client from clients);

/* liste des velos pour adultes classes par prix decroissant*/
select nom_velo,prix
from velo
where taille like 'Adu%'
order by prix asc;

/* Liste des clients ayant un programme de fidelite */
select a.nom_client,b.descrip,b.remise,b.cout
from clients a , fidelio b
where a.id_client = b.id_client
order by b.cout;

select  descrip, id_client from fidelio order by descrip;

select dateFIn from fidelio;
select dateFin, id_prog from fidelio order by dateFin;

/* Montant de la commande la plus importante */ 
 select max(mnt) from
 (select a.nom_client as nom ,sum(montant) as mnt
      from clients a, commande b
      where a.id_client = b.id_client
      group by a.id_client ) v ;
      
/* fournisseurs qui ont fourni des pieces et pas de velo */
select a.nom_fournisseurs, b.id_piece
from fournisseurs a, commande b,piece c
where a.id_fournisseurs = c.id_fournisseur
and b.id_piece= c.id_piece
and isnull(b.id_velo)
group by a.nom_fournisseurs;

/* le meilleur client en cumul d'euros */
select a.nom_client ,sum(montant)
from clients a, commande b
where a.id_client = b.id_client
group by a.id_client 
order by sum(montant) desc
LIMIT 1;

/* moyenne des montants des commandes */
select avg(montant) 
from commande ;

/*moyenne du nb de pieces par commande */
select avg(qty)
from commande
where not isnull(id_piece);

/* recherche des pieces qui ont une quantite = 0 */
select  id_piece,descrip_piece
from piece
where quantite_piece = 0;

/* Lise des fournisseurs avaec la note de chacun */
select nom_fournisseurs,libelle
from fournisseurs
order by nom_fournisseurs ;

/* liste des meilleurs fournisseurs */
select nom_fournisseurs,libelle
from fournisseurs
where note =1;


/* pour export en xml */
/*mysql -uroot --xml VeloMax -e (ecrire cetteligen de code dans la console)*/
select a.id_piece,a.descrip_piece,b.id_fournisseurs ,b.nom_fournisseurs into outfile 'c:\temp\stock.xml'
from piece a , fournisseurs b
where a.id_fournisseur = b.id_fournisseurs
and a.quantite_piece <=2;

/* pour export en json */
  select 
  json_object (
  'id_client',a.id_client, 
  'nom_client', a.nom_client) as client_json
  from velomax.clients a , velomax.fidelio b
  where  a.id_client = b.id_client
  and b.datefin <= now() - 60 ;  

/*Trigger*/

create trigger del_client
after delete
on  velomax.clients for each row
delete from fidelio where id_client = old.id_client;

create trigger del_client2
before delete
on  velomax.clients for each row 
insert into velomax.archive values(old.id_client,sysdate(),old.nom_client,"suppr");

create trigger del_client3
before update
on  velomax.clients for each row 
insert into velomax.archive values(old.id_client,sysdate(),old.nom_client,"update");

