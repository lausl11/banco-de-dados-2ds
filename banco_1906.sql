CREATE TABLE clientes (
  id INTEGER PRIMARY KEY,
  nome VARCHAR(50),
  idade INT,
  cidade VARCHAR(50),
  status VARCHAR(20)
  );
  
 INSERT INTO clientes (nome, idade, cidade, status) VALUES
('maria regina', 25, 'londrina', 'ativo'),
('victor da de costa', 60, 'curitiba', 'ativo'),
('suellen', 38, 'maringa', 'inativo'),
('luiz rafael', 28, 'curitiba', 'ativo'),
('nogueira', 41, 'maringa', 'ativo');

SELECT * FROM clientes;


