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

CREATE INDEX IF NOT EXISTS idx_compras_cliente ON Compras(ClienteID);

-- Exemplo de inserção de dados (opcional)
-- INSERT INTO Clientes (nomeCliente, emailCliente) VALUES 
-- ('João Silva', 'joao@email.com'),
-- ('Maria Santos', 'maria@email.com');

-- INSERT INTO Compras (ClienteID, NomeLivro) VALUES 
-- (1, 'O Senhor dos Anéis'),
-- (1, '1984'),
-- (2, 'Harry Potter');

DROP TABLE demo;
