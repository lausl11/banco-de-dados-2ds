-- Tabela Clientes
CREATE TABLE Clientes (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    nomeCliente VARCHAR(100) NOT NULL,
    emailCliente VARCHAR(100) NOT NULL
);

-- Tabela Compras
CREATE TABLE Compras (
    CompraID INTEGER PRIMARY KEY AUTOINCREMENT,
    ClienteID INTEGER NOT NULL,
    NomeLivro VARCHAR(150) NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID)
);

DROP TABLE demo;


 INSERT INTO Clientes (nomeCliente, emailCliente) VALUES ('João Silva', 'joao@email.com');
 INSERT INTO Clientes (nomeCliente, emailCliente) VALUES ('Maria Santos', 'maria@email.com');
 INSERT INTO Compras (ClienteID, NomeLivro) VALUES (1, 'Clean Code');
 INSERT INTO Compras (ClienteID, NomeLivro) VALUES (2, 'The Pragmatic Programmer');


SELECT 'Tabelas criadas e dados inseridos com sucesso!' AS Status;

SELECT * FROM Clientes;
SELECT * FROM Compras;


SELECT 
    c.ID,
    c.nomeCliente,
    c.emailCliente,
    co.NomeLivro
FROM Clientes c
LEFT JOIN Compras co ON c.ID = co.ClienteID
ORDER BY c.nomeCliente;





--exercicio 2--

DROP TABLE IF EXISTS Compras;
DROP TABLE IF EXISTS Clientes;

CREATE TABLE Clientes (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    nomeCliente TEXT NOT NULL,
    emailCliente TEXT UNIQUE
);

CREATE TABLE Compras (
    CompraID INTEGER PRIMARY KEY AUTOINCREMENT,
    ClienteID INTEGER NOT NULL,
    NomeLivro TEXT NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID)
);

INSERT INTO Clientes (nomeCliente, emailCliente) VALUES
('João Silva', 'joao.silva@email.com'),
('Maria Santos', 'maria.santos@email.com'),
('Pedro Oliveira', 'pedro.oliveira@email.com'),
('Ana Costa', 'ana.costa@email.com'),
('Lucas Ferreira', 'lucas.ferreira@email.com');

INSERT INTO Compras (ClienteID, NomeLivro) VALUES
(1, 'O Senhor dos Anéis'),
(1, '1984'),
(2, 'Harry Potter e a Pedra Filosofal'),
(2, 'A Menina que Roubava Livros'),
(3, 'O Código Da Vinci'),
(4, 'Dom Quixote'),
(4, 'Orgulho e Preconceito'),
(5, 'O Pequeno Príncipe'),
(5, 'A Revolução dos Bichos'),
(1, 'Duna');

SELECT 
    Clientes.nomeCliente,
    Compras.NomeLivro
FROM Compras
INNER JOIN Clientes ON Compras.ClienteID = Clientes.ID
ORDER BY Clientes.nomeCliente;
