CREATE TABLE cliente (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  data_cadastro DATE NOT NULL
  );
  
INSERT INTO cliente (nome, email, data_cadastro) 
VALUES 
  ('Maria Oliveira', 'maria@gmail.com', '2026-05-20'),
  ('João Pedro', 'joao@hotmail.com', '2026-06-01'),
  ('Ana Clara Silva', 'ana.clara@yahoo.com', '2025-12-15');
 
  
