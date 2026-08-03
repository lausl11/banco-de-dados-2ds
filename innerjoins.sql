-- Criação das tabelas
CREATE TABLE produtos (
  id INT PRIMARY KEY,
  nome VARCHAR(50),
  categoria VARCHAR(30),
  preco DECIMAL(10, 2),
  em_estoque BOOLEAN
);

CREATE TABLE clientes (
  id INT PRIMARY KEY,
  nome VARCHAR(50),
  cidade VARCHAR(30),
  vip BOOLEAN
);

CREATE TABLE vendas (
  id INT PRIMARY KEY,
  produto_id INT,
  cliente_id INT,
  quantidade INT,
  data_venda DATE,
  FOREIGN KEY (produto_id) REFERENCES produtos(id),
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Inserindo dados
INSERT INTO produtos
VALUES (1, 'Notebook', 'Informática', 3500.00, TRUE),
       (2, 'Mouse', 'Informática', 45.00, TRUE),
       (3, 'Cadeira', 'Móveis', 850.00, FALSE),
       (4, 'Teclado', 'Informática', 120.00, TRUE);

INSERT INTO clientes
VALUES (201, 'Ana', 'Curitiba', TRUE),
       (202, 'Bruno', 'São Paulo', FALSE),
       (203, 'Carla', 'Curitiba', TRUE),
       (204, 'Diego', 'Rio de Janeiro', FALSE);

INSERT INTO vendas
VALUES (101, 1, 201, 2, '2023-10-01'),
       (102, 2, 202, 15, '2023-10-02'),
       (103, 3, 203, 1, '2023-10-02'),
       (104, 4, 204, 3, '2023-10-03');

-- Consulta simples das tabelas (em Query SQL)
SELECT * FROM produtos;
SELECT * FROM vendas;
SELECT * FROM clientes;
