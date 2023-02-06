CREATE TABLE [Videogame] (
  [id] INT PRIMARY KEY,
  [nome] VARCHAR(100) NOT NULL,
  [trama] TEXT NOT NULL,
  [data_rilascio] DATE NOT NULL,
  [software_house_id] INT NOT NULL,
  [id_classificazione_PEGI] INT NOT NULL
)
GO

CREATE TABLE [Categoria_Videogame] (
  [id_videogame] INT NOT NULL,
  [id_categoria] int NOT NULL
)
GO

CREATE TABLE [SoftwareHouse] (
  [id] INT PRIMARY KEY,
  [nome] VARCHAR(100) NOT NULL,
  [partita_iva] VARCHAR(11) NOT NULL,
  [città] VARCHAR(50) NOT NULL,
  [nazione] VARCHAR(50) NOT NULL
)
GO

CREATE TABLE [Piattaforma] (
  [id] INT PRIMARY KEY,
  [nome] VARCHAR(100) NOT NULL
)
GO

CREATE TABLE [Categoria] (
  [id] INT PRIMARY KEY,
  [nome] VARCHAR(100) NOT NULL
)
GO

CREATE TABLE [Classificazione_PEGI] (
  [id] INT PRIMARY KEY,
  [tipo] VARCHAR(100) NOT NULL
)
GO

CREATE TABLE [Torneo] (
  [id] INT PRIMARY KEY,
  [nome] VARCHAR(100) NOT NULL,
  [anno] INT NOT NULL,
  [città] VARCHAR(100) NOT NULL,
  [id_videogame] INT NOT NULL
)
GO

CREATE TABLE [Giocatore] (
  [id] INT PRIMARY KEY,
  [nome] VARCHAR(100) NOT NULL,
  [cognome] VARCHAR(100) NOT NULL,
  [nickname] VARCHAR(100) NOT NULL,
  [città] VARCHAR(100) NOT NULL
)
GO

CREATE TABLE [Recensione] (
  [id_videogame] INT NOT NULL,
  [id_giocatore] INT NOT NULL,
  [titolo] VARCHAR(100) NOT NULL,
  [testo] TEXT NOT NULL,
  [rating] INT NOT NULL
)
GO

CREATE TABLE [Premio] (
  [id] INT PRIMARY KEY,
  [nome] VARCHAR(255) NOT NULL,
  [descrizione] VARCHAR(255) NOT NULL
)
GO

CREATE TABLE [Partecipazione_torneo] (
  [id_giocatore] INT NOT NULL,
  [id_torneo] INT NOT NULL
)
GO

CREATE TABLE [piattaforma_videogame] (
  [id_videogame] INT NOT NULL,
  [id_piattaforma] INT NOT NULL
)
GO

CREATE TABLE [Assegnazione_premio] (
  [id_videogame] INT NOT NULL,
  [id_premio] INT NOT NULL,
  [anno] INT NOT NULL
)
GO

ALTER TABLE [Torneo] ADD FOREIGN KEY ([id_videogame]) REFERENCES [Videogame] ([id])
GO

ALTER TABLE [Categoria_Videogame] ADD FOREIGN KEY ([id_videogame]) REFERENCES [Videogame] ([id])
GO

ALTER TABLE [Categoria_Videogame] ADD FOREIGN KEY ([id_categoria]) REFERENCES [Categoria] ([id])
GO

ALTER TABLE [Videogame] ADD FOREIGN KEY ([id_classificazione_PEGI]) REFERENCES [Classificazione_PEGI] ([id])
GO

ALTER TABLE [Videogame] ADD FOREIGN KEY ([software_house_id]) REFERENCES [SoftwareHouse] ([id])
GO

ALTER TABLE [Recensione] ADD FOREIGN KEY ([id_videogame]) REFERENCES [Videogame] ([id])
GO

ALTER TABLE [Recensione] ADD FOREIGN KEY ([id_giocatore]) REFERENCES [Giocatore] ([id])
GO

ALTER TABLE [Partecipazione_torneo] ADD FOREIGN KEY ([id_giocatore]) REFERENCES [Giocatore] ([id])
GO

ALTER TABLE [Partecipazione_torneo] ADD FOREIGN KEY ([id_torneo]) REFERENCES [Torneo] ([id])
GO

ALTER TABLE [piattaforma_videogame] ADD FOREIGN KEY ([id_videogame]) REFERENCES [Videogame] ([id])
GO

ALTER TABLE [piattaforma_videogame] ADD FOREIGN KEY ([id_piattaforma]) REFERENCES [Piattaforma] ([id])
GO

ALTER TABLE [Assegnazione_premio] ADD FOREIGN KEY ([id_videogame]) REFERENCES [Videogame] ([id])
GO

ALTER TABLE [Assegnazione_premio] ADD FOREIGN KEY ([id_premio]) REFERENCES [Premio] ([id])
GO
