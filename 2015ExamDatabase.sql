CREATE DATABASE Exam2015;
USE Exam2015;

--tabella dei Centri
CREATE TABLE Centro (
    ID_Centro INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Indirizzo VARCHAR(255) NOT NULL,
    Contatti VARCHAR(100) NOT NULL
);

--tabella delle Categorie
CREATE TABLE Categoria (
    ID_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL UNIQUE
);

--tabella delle Risorse
CREATE TABLE Risorsa (
    ID_Risorsa INT AUTO_INCREMENT PRIMARY KEY,
    Numero_inventario VARCHAR(50) NOT NULL UNIQUE,
    Stato ENUM('Disponibile', 'In prestito', 'Non utilizzabile') NOT NULL,
    ID_Categoria INT NOT NULL,
    ID_Centro INT NOT NULL,
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria) ON DELETE CASCADE,
    FOREIGN KEY (ID_Centro) REFERENCES Centro(ID_Centro) ON DELETE CASCADE
);

--tabella degli Utenti
CREATE TABLE Utente (
    ID_Utente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Cognome VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Tipo_Utente ENUM('Amministratore', 'Gestore', 'Registrato', 'Anonimo') NOT NULL
);

--tabella dei Prestiti
CREATE TABLE Prestito (
    ID_Prestito INT AUTO_INCREMENT PRIMARY KEY,
    ID_Risorsa INT NOT NULL,
    ID_Utente INT NOT NULL,
    Data_Prestito DATE NOT NULL,
    Data_Restituzione DATE DEFAULT NULL,
    Stato ENUM('Attivo', 'Concluso') NOT NULL,
    FOREIGN KEY (ID_Risorsa) REFERENCES Risorsa(ID_Risorsa) ON DELETE CASCADE,
    FOREIGN KEY (ID_Utente) REFERENCES Utente(ID_Utente) ON DELETE CASCADE
);

--tabella delle Prenotazioni
CREATE TABLE Prenotazione (
    ID_Prenotazione INT AUTO_INCREMENT PRIMARY KEY,
    ID_Categoria INT NOT NULL,
    ID_Utente INT NOT NULL,
    ID_Centro INT NOT NULL,
    Data_Prenotazione DATE NOT NULL,
    Stato ENUM('Attiva', 'Conclusa') NOT NULL,
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria) ON DELETE CASCADE,
    FOREIGN KEY (ID_Utente) REFERENCES Utente(ID_Utente) ON DELETE CASCADE,
    FOREIGN KEY (ID_Centro) REFERENCES Centro(ID_Centro) ON DELETE CASCADE
);
