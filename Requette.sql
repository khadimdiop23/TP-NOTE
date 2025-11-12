--Liste de tous personnage
SELECT * 
FROM Personnage;

-----Lister chaque joueur avec son personnage associé

SELECT Joueur.nom_joueur, Joueur.role_joueur, Personnage.nom_personnage
FROM Joueur 
LEFT JOIN Assignation  ON Joueur.id_joueur = Assignation.id_joueur
LEFT JOIN Personnage  ON Assignation.id_personnage = Personnage.id_personnage;

---Afficher la liste des personnages présents dans la cuisine entre 08:00 et 09:00

SELECT Personnage.nom_personnage
FROM Personnage 
JOIN Visite ON Personnage.id_personnage = Visite.id_personnage
JOIN Piece ON Visite.id_piece = Piece.id_piece
WHERE Piece.nom_piece = 'Cuisine'
  AND Visite.heure_entree <= '09:00:00'
  AND Visite.heure_sortie >= '08:00:00';


--Afficher les pieces où aucun personnage n'est allé

SELECT Piece.nom_piece
FROM Piece
LEFT JOIN Visite ON Piece.id_piece = Visite.id_piece
WHERE Visite.id_piece IS NULL;

---Le nombre objet par piece 
SELECT Piece.nom_piece, COUNT(Contient.id_objet) AS nb_objets
FROM Piece
LEFT JOIN Contient ON Piece.id_piece = Contient.id_piece
GROUP BY Piece.id_piece, Piece.nom_piece;

---Ajouter un piece
 INSERT INTO Piece (nom_piece) 
VALUES ('Salle de bal');


--Modifier un objte 

UPDATE Objet
SET nom_objet = 'revolver'
WHERE id_objet = 7; 

--Supprimer une piece 
DELETE FROM Piece
WHERE id_piece = 5;  


