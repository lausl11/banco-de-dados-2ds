CREATE TABLE FARMACIA ( 
 tel_farmacia INT,  
 CNPJ_produto INT PRIMARY KEY,  
 end_farmacia INT,  
 nome_farmacia INT 
); 

CREATE TABLE PRODUTO ( 
 cod_produto INT PRIMARY KEY,  
 qtd_produto INT,  
 valor_produto INT,  
 idFARMACIA INT  
); 

CREATE TABLE Farmaceutico ( 
 nome_farmaceutico INT,  
 RG_famaceutico INT PRIMARY KEY,  
 idFARMACIA INT  
); 

ALTER TABLE PRODUTO ADD FOREIGN KEY(idFARMACIA) REFERENCES FARMACIA (idFARMACIA);
ALTER TABLE Farmaceutico ADD FOREIGN KEY(idFARMACIA) REFERENCES FARMACIA (idFARMACIA);
