1
​
2
CREATE TABLE Ramo_Atividade (cd_ramo INT PRIMARY KEY, ds_ramo VARCHAR(50));
3
CREATE TABLE Tipo_Assinante (cd_tipo INT PRIMARY KEY, ds_tipo VARCHAR(50));
4
CREATE TABLE Municipio (cd_municipio INT PRIMARY KEY, ds_municipio VARCHAR(50));
5
​
6
CREATE TABLE Assinante (
7
    cd_assinante INT PRIMARY KEY,
8
    nm_assinante VARCHAR(100),
9
    cd_ramo INT,
10
    cd_tipo INT,
11
    FOREIGN KEY (cd_ramo) REFERENCES Ramo_Atividade(cd_ramo),
12
    FOREIGN KEY (cd_tipo) REFERENCES Tipo_Assinante(cd_tipo)
13
);
14
​
15
CREATE TABLE Endereco (
16
    cd_endereco INT PRIMARY KEY,
17
    ds_endereco VARCHAR(100),
18
    cd_assinante INT,
19
    cd_municipio INT,
20
    FOREIGN KEY (cd_assinante) REFERENCES Assinante(cd_assinante),
21
    FOREIGN KEY (cd_municipio) REFERENCES Municipio(cd_municipio)
22
);
23
​
24
CREATE TABLE Telefone (
25
    cd_fone INT PRIMARY KEY,
26
    n_fone VARCHAR(20),
27
    cd_endereco INT,
28
    FOREIGN KEY (cd_endereco) REFERENCES Endereco(cd_endereco)
29
);
30
​
31
-- Inserções para teste
32
INSERT INTO Ramo_Atividade VALUES (1, 'Tecnologia'), (2, 'Educação');
33
INSERT INTO Tipo_Assinante VALUES (1, 'Residencial'), (2, 'Comercial');
34
INSERT INTO Municipio VALUES (1, 'Pelotas'), (2, 'Natal'), (3, 'João Câmara');
35
INSERT INTO Assinante VALUES (1, 'Carlos Silva', 1, 1), (2, 'Ana Costa', NULL, 2), (3, 'Empresa X', 1, 2);
36
INSERT INTO Endereco VALUES (10, 'Rua A', 1, 1), (20, 'Rua B', 2, 2), (30, 'Rua C', 3, 3);
37
INSERT INTO Telefone VALUES (101, '9999-1111', 10), (102, '9999-2222', 10), (103, '8888-3333', 20);
38
​

SELECT * FROM Ramo_Atividade;
SELECT * FROM Tipo_Assinante;
SELECT * FROM Municipio; 
SELECT * FROM Assinante; 
SELECT * FROM Endereco;
SELECT * FROM Telefone;
