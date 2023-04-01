--- Criando as tabelas do projeto ---
CREATE TABLE fazendas (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  endereco VARCHAR(200),
  telefone VARCHAR(20),
  email VARCHAR(100)
);
CREATE TABLE frutas (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(50),
  descricao TEXT
);
CREATE TABLE colheitas (
  id SERIAL PRIMARY KEY,
  fazenda_id INTEGER REFERENCES fazendas(id),
  fruta_id INTEGER REFERENCES frutas(id),
  data_colheita DATE,
  quantidade INTEGER
);

--- Preenchendo a tabela fazendas ---
INSERT INTO fazendas (nome, endereco, telefone, email) 
VALUES 
  ('Fazenda São José', 'Rua das Palmeiras, 123', '(87) 5555-5555', 'fazendascontato@fazendasaojose.com.br'),
  ('Fazenda Esperança', 'Estrada da Esperança, 456', '(87) 6666-6666', 'fazendascontato@fazendaesperanca.com.br'),
  ('Fazenda Nova Vida', 'Avenida da Vida, 789', '(87) 7777-7777', 'fazendascontato@fazendanovavida.com.br'),
  ('Fazenda Boa Vista', 'Rua das Flores, 789', '(87) 8888-8888', 'fazendascontato@fazendaboavista.com.br'),
  ('Fazenda São Francisco', 'Avenida São Francisco, 456', '(87) 9999-9999', 'fazendascontato@fazendasaoFrancisco.com.br'),
  ('Fazenda Céu Azul', 'Rua do Céu Azul, 123', '(87) 1010-1010', 'fazendascontato@fazendaceuazul.com.br'),
  ('Fazenda da Serra', 'Estrada da Serra, 456', '(87) 1212-1212', 'fazendascontato@fazendadaserra.com.br'),
  ('Fazenda das Águas', 'Avenida das Águas, 789', '(87) 1313-1313', 'fazendascontato@fazendadasaguas.com.br'),
  ('Fazenda do Sol', 'Rua do Sol, 123', '(87) 1414-1414', 'fazendascontato@fazendadosol.com.br'),
  ('Fazenda do Vale', 'Estrada do Vale, 456', '(87) 1515-1515', 'fazendascontato@fazendadovale.com.br'),
  ('Fazenda Rio Verde', 'Avenida Rio Verde, 789', '(87) 1616-1616', 'fazendascontato@fazendarioverde.com.br'),
  ('Fazenda Recanto Feliz', 'Rua do Recanto Feliz, 123', '(87) 1717-1717', 'fazendascontato@fazendarecantofeliz.com.br'),
  ('Fazenda Vida Nova', 'Estrada Vida Nova, 456', '(87) 1818-1818', 'fazendascontato@fazendavidanova.com.br');

--- Preenchendo a tabela frutas ---
INSERT INTO frutas (nome, descricao) 
VALUES 
  ('Maçã', 'Fruta doce e crocante'),
  ('Banana', 'Fruta rica em potássio e vitaminas'),
  ('Morango', 'Fruta vermelha e saborosa'),
  ('Abacate', 'Fruta rica em gorduras boas e vitaminas'),
  ('Caju', 'Fruta típica do nordeste brasileiro'),
  ('Kiwi', 'Fruta exótica e rica em vitamina C'),
  ('Laranja', 'Fruta cítrica e rica em vitamina C'),
  ('Limão', 'Fruta ácida e rica em vitamina C'),
  ('Manga', 'Fruta doce e suculenta'),
  ('Melancia', 'Fruta refrescante e rica em água'),
  ('Pera', 'Fruta doce e suculenta'),
  ('Pêssego', 'Fruta doce e saborosa'),
  ('Uva', 'Fruta pequena e doce, usada para fazer vinho');

--- Preenchendo a tabela colheitas ---
INSERT INTO colheitas (fazenda_id, fruta_id, data_colheita, quantidade)
VALUES 
  (1, 1, '2023-03-20', 500),
  (1, 2, '2023-01-21', 1000),
  (2, 2, '2022-09-22', 1500),
  (3, 3, '2020-10-23', 800),
  (3, 1, '2023-01-24', 1200),
  (1, 3, '2023-03-25', 300),
  (2, 6, '2023-03-26', 400),
  (1, 3, '2021-07-25', 300),
  (2, 6, '2021-05-26', 400),
  (3, 10, '2023-03-27', 150),
  (4, 2, '2022-04-28', 250),
  (5, 9, '2023-01-29', 350),
  (6, 4, '2019-06-30', 200),
  (7, 7, '2022-12-31', 500),
  (8, 1, '2022-04-01', 100),
  (9, 8, '2020-09-02', 450),
  (10, 5, '2021-04-03', 300);

-- JOIN: para juntar informações de duas ou mais tabelas com base em uma coluna em comum --
SELECT f.nome as fazenda, fr.nome as fruta, c.data_colheita, c.quantidade
FROM fazendas f
JOIN colheitas c ON f.id = c.fazenda_id
JOIN frutas fr ON fr.id = c.fruta_id;

-- INNER JOIN: para obter informações que existem em ambas as tabelas --
SELECT fr.nome as fruta, c.data_colheita, c.quantidade
FROM frutas fr
INNER JOIN colheitas c ON fr.id = c.fruta_id;

-- LEFT JOIN: para obter todas as informações de uma tabela e apenas as informações correspondentes de outra tabela --
SELECT f.nome as fazenda, c.data_colheita, c.quantidade
FROM fazendas f
LEFT JOIN colheitas c ON f.id = c.fazenda_id;

-- CROSS JOIN: para combinar todas as linhas de duas ou mais tabelas --
SELECT f.nome as fazenda, fr.nome as fruta
FROM fazendas f
CROSS JOIN frutas fr;

-- Combinando as informações das tabelas "Colheitas" onde a fruta é "Maçã" e das colheitas onde a fruta é "Banana" usando o comando UNION --
SELECT fazendas.nome, frutas.nome AS fruta, colheitas.data_colheita, colheitas.quantidade
FROM colheitas
INNER JOIN fazendas ON colheitas.fazenda_id = fazendas.id
INNER JOIN frutas ON colheitas.fruta_id = frutas.id
WHERE frutas.nome = 'Maçã'
UNION
SELECT fazendas.nome, frutas.nome AS fruta, colheitas.data_colheita, colheitas.quantidade
FROM colheitas
INNER JOIN fazendas ON colheitas.fazenda_id = fazendas.id
INNER JOIN frutas ON colheitas.fruta_id = frutas.id
WHERE frutas.nome = 'Banana';

-- WITH: para criar uma consulta recursiva que exibe todas as frutas cultivadas em uma fazenda e a quantidade colhida em cada estação do ano --
WITH RECURSIVE fazenda_frutas AS (
  SELECT fazendas.nome AS fazenda, frutas.nome AS fruta, colheitas.quantidade, 
         date_part('quarter', colheitas.data_colheita) AS trimestre
  FROM fazendas 
  JOIN colheitas ON fazendas.id = colheitas.fazenda_id 
  JOIN frutas ON colheitas.fruta_id = frutas.id
), estacoes AS (
  SELECT 1 AS trimestre, 'Inverno' AS estacao
  UNION SELECT 2, 'Primavera'
  UNION SELECT 3, 'Verão'
  UNION SELECT 4, 'Outono'
)
SELECT fazenda, fruta, COALESCE(SUM(quantidade), 0) AS quantidade, estacao 
FROM fazenda_frutas 
RIGHT JOIN estacoes ON fazenda_frutas.trimestre = estacoes.trimestre
GROUP BY fazenda, fruta, estacao
ORDER BY fazenda, fruta, estacao;



