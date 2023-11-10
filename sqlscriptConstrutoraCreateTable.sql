CREATE TABLE Trabalhador ( 
    CPF numeric(30) PRIMARY KEY, 
    Nome VARCHAR(50), 
    Salario numeric(6), 
    fk_Obra_Codigo numeric(10) 
);

CREATE TABLE Categoria ( 
    Codigo numeric(10) PRIMARY KEY, 
    Descricao VARCHAR(100) 
);

CREATE TABLE Construtora ( 
    Codigo numeric(10) PRIMARY KEY, 
    Nome VARCHAR(50), 
    Nome_fantasia VARCHAR(50) 
);

CREATE TABLE Obra ( 
    Codigo numeric(10) PRIMARY KEY, 
    Nome VARCHAR(50), 
    Complemento VARCHAR(100), 
    Numero numeric(4), 
    Logradouro VARCHAR(100), 
    fk_Construtora_Codigo numeric(10) 
);

CREATE TABLE Equipamento ( 
    Codigo numeric(10) PRIMARY KEY, 
    Nome VARCHAR(50), 
    Valor_diaria numeric(5), 
    fk_Categoria_Codigo numeric(10) 
);

CREATE TABLE Obra_Equipamento_aluga ( 
    fk_Equipamento_Codigo numeric(10) PRIMARY KEY, 
    fk_Obra_Codigo numeric(10), 
    data_inic DATE, 
    data_term DATE 
);

CREATE TABLE Telefone ( 
    fk_Construtora_Codigo numeric(10) NOT NULL PRIMARY KEY, 
    numero numeric(20) 
);

ALTER TABLE Trabalhador ADD CONSTRAINT FK_Trabalhador_Obra_Codigo 
    FOREIGN KEY (fk_Obra_Codigo) 
    REFERENCES Obra (Codigo);

ALTER TABLE Obra ADD CONSTRAINT FK_Obra_Construtora_Codigo 
    FOREIGN KEY (fk_Construtora_Codigo) 
    REFERENCES Construtora (Codigo);

ALTER TABLE Equipamento ADD CONSTRAINT FK_Equipamento_Categoria_Codigo 
    FOREIGN KEY (fk_Categoria_Codigo) 
    REFERENCES Categoria (Codigo) 
    ON DELETE CASCADE;

ALTER TABLE Obra_Equipamento_aluga ADD CONSTRAINT FK_OE_Equipamento_Codigo 
    FOREIGN KEY (fk_Equipamento_Codigo) 
    REFERENCES Equipamento (Codigo);

ALTER TABLE Obra_Equipamento_aluga ADD CONSTRAINT FK_OE_Obra_Codigo 
    FOREIGN KEY (fk_Obra_Codigo) 
    REFERENCES Obra (Codigo);

ALTER TABLE Telefone ADD CONSTRAINT FK_Telefone_Construtora_Codigo 
    FOREIGN KEY (fk_Construtora_Codigo) 
    REFERENCES Construtora (Codigo);

insert into Construtora 
values (1, 'Nicolas', null);

insert into Obra 
values (1, 'Prédio 2', null, 132, 'Logradouro 1', 1);

insert into Obra 
values (2, 'Prédio 2', null, 209, 'Logradouro 5', 1);

insert into Trabalhador 
values (22218666065, 'Jorge', 4300, 1);

insert into Trabalhador 
values (82267046008, 'Matheus', 4000, 1);

insert into Trabalhador 
values (94280950016, 'William', 3700, 1);

insert into Trabalhador 
values (52061209017, 'Pedro', 10000, 1);

insert into Trabalhador 
values (45461981089, 'Camila', 7000, 1);

insert into Trabalhador 
values (61307098037, 'Fred', 2300, 2);

insert into Trabalhador 
values (64261616084, 'Murilo', 3200, 2);

insert into Trabalhador 
values (17787791071, 'Paulo', 8700, 2);

insert into Trabalhador 
values (07925109092, 'Bruno', 12000, 2);

insert into Trabalhador 
values (97669499052, 'Nicole', 2450, 2);

insert into Categoria 
values (1, 'Concretagem');

insert into Categoria 
values (2, 'Acesso e Elevação');

insert into Categoria 
values (3, 'Geradores e Compressores');

insert into Categoria 
values (4, 'Andaimes');

insert into Equipamento 
values (201, 'Betoneira', 100, 1);

insert into Equipamento 
values (202, 'Guincho', 1000, 2);

insert into Equipamento 
values (203, 'Gerador', 300, 3);

insert into Equipamento 
values (204, 'Piso Metálico', 50, 4);

insert into Equipamento 
values (205, 'Cortadora de Piso', 230, 1);

insert into Equipamento 
values (206, 'Mangote', 25, 1);

insert into Obra_Equipamento_aluga 
values (201, 1, '01-MAR-22', '31-MAR-22');

insert into Obra_Equipamento_aluga 
values (202, 1, '01-MAR-22', '31-MAR-22');

insert into Obra_Equipamento_aluga 
values (203, 1, '01-MAR-22', '31-MAR-22');

insert into Obra_Equipamento_aluga 
values (204, 1, '01-MAR-22', '31-MAR-22');
