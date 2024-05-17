CREATE DATABASE gameOfSelect;

USE gameOfSelect;

CREATE TABLE residencia (
idResidencia int primary key auto_increment,
cep char(8),
logradouro varchar(60),
tipoConstrucao varchar(20), -- Isso inclui "Apartamento" e "Casa";
constraint chkConstrucao check (tipoConstrucao IN ("Apartamento", "Casa")),
tipoPosse varchar(20), -- Isso inclui "Inquilino" e "Proprietário";
constraint chkPosse check (tipoPosse IN ("Inquilino", "Casa Própria"))
);

INSERT INTO residencia VALUES
	(default, '04211005', 'Rua Pedro Gonçalves 114', 'Apartamento', 'Inquilino'),
	(default, '04211015', 'Rua Pedro Gonçalves 210', 'Casa', 'Casa Própria'),
	(default, '04581011', 'Rua João Garcia 99', 'Casa', 'Casa Própria'),
	(default, '04511212', 'Avenida José dos Campos 879', 'Apartamento', 'Inquilino'),
	(default, '03912002', 'Rua Rango Brabo', 'Apartamento', 'Inquilino'),
	(default, '04511212', 'Rua Pode Pah', 'Apartamento', 'Inquilino');
    
CREATE TABLE personagem (
idPersonagem int primary key,
nome varchar(45),
dtNasc date,
genero varchar(45),
fkResidencia int,
constraint fkResidenciaPersonagem foreign key (fkResidencia) references residencia(idResidencia),
fkRelacionamento int,
constraint fkPersonagemRelacionamento foreign key (fkRelacionamento) references personagem(idPersonagem)
);
    
INSERT INTO personagem VALUES 
	(1, 'Chico Cédulas', '1989-01-27', 'Masculino', 6, null),
	(2, 'Luiza Sonsa', '1988-04-17', 'Feminino', 5, null),
	(3, 'Louro Cazé', '2000-02-05', 'Masculino', 4, null),
	(4, 'Diego Elefante', '1996-08-22', 'Masculino', 3, null),
	(5, 'Ana Maria Brega', '1997-11-03', 'Feminino', 3, null);
    
UPDATE personagem SET fkRelacionamento = 2 WHERE idPersonagem = 1;
UPDATE personagem SET fkRelacionamento = 1 WHERE idPersonagem = 2;
UPDATE personagem SET fkRelacionamento = 5 WHERE idPersonagem = 4;
UPDATE personagem SET fkRelacionamento = 4 WHERE idPersonagem = 5;

CREATE TABLE drink (
idDrink int primary key auto_increment,
nome varchar(45),
teorAlcoolico decimal(5,2),
volume decimal(6,2),
preco decimal(5,2));

INSERT INTO drink VALUES 
	(default, 'Batida de coco', 18.00, 920.00, 99.90),
	(default, 'Negroni', 26.00, 350.00, 39.90),
	(default, 'Caipirinha', 40.00, 200.00, 29.90),
	(default, 'Água sem gás', 00.00, 500.00, 8.90),
	(default, 'Água com gás', 00.00, 500.00, 9.90),
	(default, 'Blue Moon', 5.40, 400.00, 21.90),
	(default, 'Corona', 4.60, 400.00, 15.90);
    
CREATE TABLE compra (
idCompra int,
fkDrink int,
fkPersonagem int,
primary key (idCompra, fkDrink, fkPersonagem),
dtCompra DATE
);

INSERT INTO compra VALUES
	(1, 2, 1, '2024-05-10'),
	(1, 5, 1, '2024-05-10'),
	(1, 7, 2, '2024-05-10'),
	(2, 7, 2, '2024-05-10'),
	(3, 7, 2, '2024-05-10'),
	(1, 6, 3, '2024-05-10'),
	(1, 4, 3, '2024-05-10'),
	(1, 1, 4, '2024-05-10'),
	(2, 1, 4, '2024-05-10'),
	(1, 3, 5, '2024-05-10'),
	(2, 3, 5, '2024-05-10'),
	(1, 5, 5, '2024-05-10');