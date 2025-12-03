
        
-- TABLE utilisateurs

CREATE TABLE utilisateurs (
    id_utilisateur INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    motdepass VARCHAR(255) NOT NULL,
    role ENUM('enseignant','etudiant') NOT NULL
);

-- TABLE Categories
CREATE TABLE categories (
    id_categorie INT PRIMARY KEY AUTO_INCREMENT,
    nom_categorie VARCHAR(100) NOT NULL
);

-- TABLE Quiz
CREATE TABLE Quiz (
    id_quiz INT PRIMARY KEY AUTO_INCREMENT,
    titre_quiz VARCHAR(150) NOT NULL,
    description TEXT,
    id_categorie INT,
    id_enseignant INT,
    duree_minutes INT,

    FOREIGN KEY (id_categorie) REFERENCES categories(id_categorie),
    FOREIGN KEY (id_enseignant) REFERENCES utilisateurs(id_utilisateur)
);

-- TABLE Questions
CREATE TABLE questions (
    id_question INT PRIMARY KEY AUTO_INCREMENT,
    texte_question TEXT NOT NULL,
    reponse_correcte VARCHAR(255) NOT NULL,
    points INT,
    id_quiz INT,

    FOREIGN KEY(id_quiz) REFERENCES quiz(id_quiz)
);

-- TABLE resultats
CREATE TABLE resultats (
    id_resultat INT PRIMARY KEY AUTO_INCREMENT,
    score INT,
    date_passage DATETIME,
    id_etudiant INT,
    id_quiz INT,
    FOREIGN KEY(id_etudiant) REFERENCES utilisateurs(id_utilisateur),
    FOREIGN KEY(id_quiz) REFERENCES quiz(id_quiz)
);





INSERT INTO utilisateurs (nom, email, motdepass, role)
VALUES 
('said', 'said.teacher@gmail.com', 'password123', 'enseignant'),
('Youssef', 'youssef@gmail.com', 'pass789', 'etudiant'),
('asaad', 'asaad@example.com', 'pass987', 'etudiant'),
('reda', 'reda@example.com', 'pass654', 'etudiant');



INSERT INTO categories (nom_categorie)
VALUES 
('Informatique'),
('histoire');


-- Requête 1 : Ajouter un nouveau quiz créé par un enseignant

INSERT INTO quiz (titre_quiz, description, id_categorie, id_enseignant, duree_minutes)
VALUES ('Introduction à SQL', 'Quiz pour débutants SQL', 1, 1, 30);



-- Requête 2 : Modifier la durée d'un quiz existant

UPDATE quiz
SET duree_minutes = 60
WHERE id_quiz = 1;


-- Requête 3 : Afficher tous les utilisateurs

SELECT * FROM utilisateurs;


-- Requête 4 : Afficher uniquement les noms et emails des utilisateurs

SELECT nom, email FROM utilisateurs;

-- Requête 5 : Afficher tous les quiz

SELECT * FROM quiz;

-- Requête 6 : Afficher uniquement les titres des quiz

SELECT titre_quiz FROM quiz;

-- Requête 7 : Afficher toutes les catégories

SELECT * FROM categories;

-- Requête 8 : Afficher les utilisateurs qui sont enseignants

SELECT * FROM utilisateurs
WHERE role = 'enseignant';

-- Requête 9 : Afficher les utilisateurs qui sont étudiants

SELECT * FROM utilisateurs
WHERE role = 'etudiant';


-- Requête 10 : Afficher les quiz de durée supérieure à 30 minutes

SELECT * FROM quiz
WHERE duree_minutes > 30;


-- Requête 11 : Afficher les quiz de durée inférieure ou égale à 45 minutes

SELECT * FROM quiz
WHERE duree_minutes <= 45;


-- Requête 12 : Afficher les questions valant plus de 5 points

SELECT * FROM questions
WHERE points > 5;

-- Requête 13 : Afficher les quiz de durée entre 20 et 40 minutes

SELECT * FROM quiz
WHERE duree_minutes BETWEEN 20 AND 40;


-- Requête 14 : Afficher les résultats avec un score supérieur ou égal à 60

SELECT * FROM resultats
WHERE score >= 60;


-- Requête 15 : Afficher les résultats avec un score inférieur à 50

SELECT * FROM resultats
WHERE score < 50;


-- Requête 16 : Afficher les questions valant entre 5 et 15 points

SELECT * FROM questions
WHERE points BETWEEN 5 AND 15;


-- Requête 17 : Afficher les quiz créés par l'enseignant avec id_enseignant = 1

SELECT * FROM quiz
WHERE id_enseignant = 1;


-- Requête 18 : Afficher tous les quiz triés par durée (du plus court au plus long)

SELECT * FROM quiz
ORDER BY duree_minutes ASC;

-- Requête 19 : Afficher tous les résultats triés par score (du plus élevé au plus faible)

SELECT * FROM resultats
ORDER BY score DESC;


-- Requête 20 : Afficher les 5 meilleurs scores

SELECT * FROM resultats
ORDER BY score DESC
LIMIT 5;



-- Requête 21 : Afficher les questions triées par points (du plus faible au plus élevé)

SELECT * FROM questions
ORDER BY points ASC;


-- Requête 22 : Afficher les 3 derniers résultats (triés par date_passage décroissante)

SELECT * FROM resultats
ORDER BY date_passage DESC
LIMIT 3;


-- Requête 23 : Afficher le nom de chaque quiz avec sa catégorie

-- SELECT q.titre_quiz, c.nom_categorie
-- FROM quiz q
-- JOIN categories c ON q.id_categorie = c.id_categorie;  

-- this last one is not my work, i have to understand it first ,


















