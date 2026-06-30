CREATE TABLE IF NOT EXISTS Clientes (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    nomeCliente TEXT NOT NULL,
    emailCliente TEXT UNIQUE
);

CREATE TABLE IF NOT EXISTS Compras (
    CompraID INTEGER PRIMARY KEY AUTOINCREMENT,
    ClienteID INTEGER NOT NULL,
    NomeLivro TEXT NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID) ON DELETE CASCADE
);



INSERT INTO Clientes (nomeCliente, emailCliente) VALUES
('João Silva', 'joao.silva@email.com'),
('Maria Santos', 'maria.santos@email.com'),
('Pedro Oliveira', 'pedro.oliveira@email.com'),
('Ana Costa', 'ana.costa@email.com'),
('Lucas Ferreira', 'lucas.ferreira@email.com');

-- Inserindo Compras
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
