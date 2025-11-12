
-- TABLE PARTIE
CREATE TABLE Partie (
    id_partie INT AUTO_INCREMENT PRIMARY KEY,
    date_partie DATE NOT NULL
);


-- TABLE JOUEUR

CREATE TABLE Joueur (
    id_joueur INT AUTO_INCREMENT PRIMARY KEY,
    nom_joueur VARCHAR(100) NOT NULL,
    role_joueur ENUM('maitre','utilisateur','observateur') NOT NULL,
    id_partie INT NOT NULL,
    FOREIGN KEY (id_partie) REFERENCES Partie(id_partie)
);


-- TABLE PERSONNAGE
CREATE TABLE Personnage (
    id_personnage INT AUTO_INCREMENT PRIMARY KEY,
    nom_personnage VARCHAR(100) NOT NULL,
    couleur VARCHAR(50) NOT NULL
);


-- TABLE PIECE
CREATE TABLE Piece (
    id_piece INT AUTO_INCREMENT PRIMARY KEY,
    nom_piece VARCHAR(100) NOT NULL
);
-- TABLE OBJET

CREATE TABLE Objet (
    id_objet INT AUTO_INCREMENT PRIMARY KEY,
    nom_objet VARCHAR(100) NOT NULL
);


-- TABLE DEPLACEMENT

CREATE TABLE Deplacement (
    id_deplacement INT AUTO_INCREMENT PRIMARY KEY,
    date_visite DATE NOT NULL,
    heure_entree TIME NOT NULL,
    heure_sortie TIME NOT NULL
);

-- TABLE ASSIGNATION 

CREATE TABLE Assignation (
    id_joueur INT NOT NULL,
    id_personnage INT NOT NULL,
    PRIMARY KEY (id_joueur, id_personnage),
    FOREIGN KEY (id_joueur) REFERENCES Joueur(id_joueur),
    FOREIGN KEY (id_personnage) REFERENCES Personnage(id_personnage)
);


-- TABLE CONTIENT (PIECE ↔ OBJET)

CREATE TABLE Contient (
    id_piece INT NOT NULL,
    id_objet INT NOT NULL,
    PRIMARY KEY (id_piece, id_objet),
    FOREIGN KEY (id_piece) REFERENCES Piece(id_piece),
    FOREIGN KEY (id_objet) REFERENCES Objet(id_objet)
);


-- TABLE VISITE 

CREATE TABLE Visite (
    id_personnage INT NOT NULL,
    id_piece INT NOT NULL,
    id_deplacement INT NOT NULL,
    date_visite DATE NOT NULL,
    heure_entree TIME NOT NULL,
    heure_sortie TIME NOT NULL,
    PRIMARY KEY (id_personnage, id_piece, id_deplacement),
    FOREIGN KEY (id_personnage) REFERENCES Personnage(id_personnage),
    FOREIGN KEY (id_piece) REFERENCES Piece(id_piece),
    FOREIGN KEY (id_deplacement) REFERENCES Deplacement(id_deplacement)
);
