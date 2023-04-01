--CRIANDO A TABELA PRODUTOS
CREATE TABLE Produtos (
  id INT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  descricao TEXT,
  preco DECIMAL(10, 2) NOT NULL,
  fornecedor VARCHAR(255),
  quantidade_estoque INT
);
--CRIANDO A TABELA FILIAIS
CREATE TABLE Filiais (
  id INT PRIMARY KEY,
  endereco VARCHAR(255) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  gerente_responsavel VARCHAR(255)
);
--CRIANDO A TABELA VENDAS
CREATE TABLE Vendas (
  id INT PRIMARY KEY,
  data_venda DATE NOT NULL,
  hora_venda TIME NOT NULL,
  id_filial INT NOT NULL,
  id_produto INT NOT NULL,
  quantidade INT NOT NULL,
  preco_venda DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (id_filial) REFERENCES Filiais(id),
  FOREIGN KEY (id_produto) REFERENCES Produtos(id)
);
--POPULANDO AS TABELAS--
--PRODUTOS
INSERT INTO Produtos (id, nome, descricao, preco, fornecedor, quantidade_estoque)
VALUES 
(1, 'Camiseta', 'Camiseta de algodão', 29.99, 'Fornecedor A', 50000),
(2, 'Calça Jeans', 'Calça jeans masculina', 89.99, 'Fornecedor B', 3000),
(3, 'Vestido Floral', 'Vestido curto estampado', 59.99, 'Fornecedor C', 20000),
(4, 'Tênis Esportivo', 'Tênis para corrida', 129.99, 'Fornecedor D', 40000),
(5, 'Bolsa de Couro', 'Bolsa feminina de couro', 149.99, 'Fornecedor E', 15000),
(6, 'Óculos de Sol', 'Óculos escuros com armação de metal', 79.99, 'Fornecedor F', 25000),
(7, 'Relógio de Pulso', 'Relógio analógico de aço inoxidável', 199.99, 'Fornecedor G', 10000),
(8, 'Chapéu de Palha', 'Chapéu de palha estilo panamá', 39.99, 'Fornecedor H', 30000),
(9, 'Blusa de Frio', 'Blusa de moletom com capuz', 69.99, 'Fornecedor I', 20000),
(10, 'Jaqueta de Couro', 'Jaqueta de couro sintético', 119.99, 'Fornecedor J', 15000),
(11, 'Sapatênis', 'Sapatênis masculino', 79.99, 'Fornecedor K', 25000),
(12, 'Sandália de Salto', 'Sandália feminina de salto alto', 99.99, 'Fornecedor L', 10000),
(13, 'Shorts Jeans', 'Shorts jeans feminino', 49.99, 'Fornecedor M', 30000),
(14, 'Saia Midi', 'Saia midi plissada', 69.99, 'Fornecedor N', 20000),
(15, 'Biquíni', 'Biquíni estampado', 39.99, 'Fornecedor O', 15000),
(16, 'Bota de Cano Curto', 'Bota feminina de cano curto', 129.99, 'Fornecedor P', 10000),
(17, 'Polo', 'Camisa polo masculina', 59.99, 'Fornecedor Q', 30000),
(18, 'Calça Social', 'Calça social masculina', 99.99, 'Fornecedor R', 20000),
(19, 'Blusa de Cetim', 'Blusa feminina de cetim', 49.99, 'Fornecedor S', 15000),
(20, 'Blazer Feminino', 'Blazer feminino de tecido', 119.99, 'Fornecedor T', 10000)
INSERT INTO produtos (id, nome, descricao, preco, fornecedor, quantidade_estoque)
VALUES 
(21, 'Notebook Dell', 'Notebook com processador i5', 3499.99, 'Fornecedor B', 10),
(22, 'Mouse sem fio', 'Mouse óptico sem fio', 79.99, 'Fornecedor C', 20),
(23, 'Teclado Gamer', 'Teclado mecânico para jogos', 249.99, 'Fornecedor D', 15),
(24, 'Monitor LG', 'Monitor LED de 24 polegadas', 899.99, 'Fornecedor B', 5),
(25, 'HD Externo', 'HD externo portátil de 1TB', 299.99, 'Fornecedor E', 8),
(26, 'Webcam', 'Webcam de alta definição', 149.99, 'Fornecedor C', 12),
(27, 'Impressora Multifuncional', 'Impressora jato de tinta com scanner', 499.99, 'Fornecedor F', 6),
(28, 'Caixa de som Bluetooth', 'Caixa de som portátil com conectividade Bluetooth', 149.99, 'Fornecedor G', 10),
(29, 'Roteador Wi-Fi', 'Roteador de alta velocidade para internet sem fio', 199.99, 'Fornecedor H', 5),
(30, 'Cartucho de tinta', 'Cartucho de tinta preta para impressoras jato de tinta', 39.99, 'Fornecedor F', 25)
INSERT INTO produtos (id, nome, descricao, preco, fornecedor, quantidade_estoque)
VALUES 
(31, 'Placa-Mãe Gamer', 'Placa-Mãe para jogos de última geração', 999.99, 'Fornecedor N', 1500),
(32, 'Fonte de Alimentação', 'Fonte de alimentação de alta performance para jogos', 799.99, 'Fornecedor O', 2000),
(33, 'Watercooler', 'Sistema de resfriamento líquido para computadores de jogos', 399.99, 'Fornecedor P', 2800),
(34, 'HD SSD', 'Unidade de armazenamento de estado sólido para jogos', 599.99, 'Fornecedor Q', 10000),
(35, 'Placa de Som', 'Placa de som para jogos de alta fidelidade', 299.99, 'Fornecedor R', 1500),
(36, 'Cadeira Gamer Premium', 'Cadeira ergonômica para jogos de alta qualidade', 1499.99, 'Fornecedor S', 500),
(37, 'Webcam', 'Webcam para transmissões de jogos em alta definição', 249.99, 'Fornecedor T', 5000),
(38, 'Microfone para Streaming', 'Microfone para transmissões de jogos em alta qualidade', 499.99, 'Fornecedor U', 2800),
(39, 'Caixas de Som', 'Sistema de som para jogos de alta qualidade', 799.99, 'Fornecedor V', 1000),
(40, 'Kit de Refrigeração a Ar', 'Sistema de refrigeração a ar para computadores de jogos', 199.99, 'Fornecedor W', 2000)
--FILIAIS
INSERT INTO filiais (id, endereco, telefone, gerente_responsavel)
VALUES
(1, 'Av. Paulista, 1000, São Paulo - SP', '(11) 1111-1111', 'João Silva'),
(2, 'Rua da Consolação, 500, São Paulo - SP', '(11) 2222-2222', 'Maria Santos'),
(3, 'Av. Rio Branco, 100, Rio de Janeiro - RJ', '(21) 3333-3333', 'José Oliveira'),
(4, 'Rua Augusta, 900, São Paulo - SP', '(11) 4444-4444', 'Ana Souza'),
(5, 'Av. Beira Mar, 500, Fortaleza - CE', '(85) 5555-5555', 'Lucas Ferreira'),
(6, 'Av. Presidente Vargas, 500, Rio de Janeiro - RJ', '(21) 6666-6666', 'Carla Lima'),
(7, 'Av. Afonso Pena, 2000, Belo Horizonte - MG', '(31) 7777-7777', 'Renato Costa'),
(8, 'Av. das Américas, 500, Rio de Janeiro - RJ', '(21) 8888-8888', 'Julia Oliveira'),
(9, 'Rua Oscar Freire, 1000, São Paulo - SP', '(11) 9999-9999', 'Paulo Martins'),
(10, 'Av. Brigadeiro Faria Lima, 1500, São Paulo - SP', '(11) 1010-1010', 'Camila Costa'),
(11, 'Av. Sete de Setembro, 100, Curitiba - PR', '(41) 1111-1111', 'Rodrigo Santos'),
(12, 'Av. Boa Viagem, 500, Recife - PE', '(81) 1212-1212', 'Isabela Souza')
--VENDAS
INSERT INTO vendas (id, data_venda, hora_venda, id_filial, id_produto, quantidade, preco_venda)
VALUES 
(1,'2022-01-01', '10:00:00', 1, 1, 5, 39.99),
(2,'2022-01-01', '11:00:00', 1, 2, 2, 89.99),
(3,'2022-01-02', '12:00:00', 2, 1, 3, 39.99),
(4,'2022-01-02', '13:00:00', 2, 3, 1, 129.99),
(5,'2022-01-03', '14:00:00', 3, 2, 4, 89.99),
(6,'2022-01-03', '15:00:00', 3, 4, 2, 199.99),
(7,'2022-01-04', '16:00:00', 4, 3, 1, 129.99),
(8,'2022-01-04', '17:00:00', 4, 5, 3, 19.99),
(9,'2022-01-05', '18:00:00', 5, 4, 2, 199.99),
(10,'2022-01-05', '19:00:00', 5, 6, 4, 9.99),
(11,'2022-01-06', '20:00:00', 6, 5, 1, 19.99),
(12,'2022-01-06', '21:00:00', 6, 7, 3, 69.99),
(13,'2022-01-07', '22:00:00', 7, 6, 2, 9.99),
(14,'2022-01-07', '23:00:00', 7, 8, 1, 149.99),
(15,'2022-01-08', '10:00:00', 8, 7, 4, 69.99);
INSERT INTO vendas (id, data_venda, hora_venda, id_filial, id_produto, quantidade, preco_venda)
VALUES 
(16,'2022-01-09', '11:00:00', 1, 10, 5, 59.99),
(17,'2022-01-09', '12:00:00', 2, 12, 2, 109.99),
(18,'2022-01-10', '13:00:00', 3, 9, 3, 49.99),
(19,'2022-01-10', '14:00:00', 4, 11, 1, 139.99),
(20,'2022-01-11', '15:00:00', 5, 10, 4, 59.99),
(21,'2022-01-11', '16:00:00', 6, 12, 2, 109.99),
(22,'2022-01-12', '17:00:00', 7, 11, 1, 139.99),
(23,'2022-01-12', '18:00:00', 8, 13, 3, 49.99),
(24,'2022-01-13', '19:00:00', 1, 14, 2, 189.99),
(25,'2022-01-13', '20:00:00', 2, 15, 4, 29.99),
(26,'2022-01-14', '21:00:00', 3, 14, 1, 189.99),
(27,'2022-01-14', '22:00:00', 4, 16, 3, 79.99),
(28,'2022-01-15', '23:00:00', 5, 15, 2, 29.99),
(29,'2022-01-15', '10:00:00', 6, 17, 1, 239.99),
(30,'2022-01-16', '11:00:00', 7, 16, 4, 79.99);
INSERT INTO vendas (id, data_venda, hora_venda, id_filial, id_produto, quantidade, preco_venda)
VALUES 
(31, '2022-02-01', '10:00:00', 1, 1, 5, 39.99),
(32, '2022-02-01', '11:00:00', 2, 2, 2, 89.99),
(33, '2022-02-02', '12:00:00', 3, 3, 3, 129.99),
(34, '2022-02-02', '13:00:00', 4, 4, 1, 199.99),
(35, '2022-02-03', '14:00:00', 5, 5, 4, 19.99),
(36, '2022-02-03', '15:00:00', 6, 6, 2, 9.99),
(37, '2022-02-04', '16:00:00', 7, 7, 1, 69.99),
(38, '2022-02-04', '17:00:00', 8, 8, 3, 149.99),
(39, '2022-02-05', '18:00:00', 9, 9, 2, 79.99),
(40, '2022-02-05', '19:00:00', 10, 10, 4, 9.99),
(41, '2022-02-06', '20:00:00', 11, 11, 1, 129.99),
(42, '2022-02-06', '21:00:00', 12, 12, 3, 39.99),
(43, '2022-02-07', '22:00:00', 1, 13, 2, 199.99),
(44, '2022-02-07', '23:00:00', 2, 14, 1, 149.99),
(45, '2022-02-08', '10:00:00', 3, 15, 4, 29.99);

--PARA CONTARQUANTOS PRODUTOS DIFERENTES FORAM VENDIDOS:
SELECT COUNT(DISTINCT id_produto) AS num_produtos_vendidos
FROM vendas;

--PARA CALCULAR O TOTAL DE VENDAS USEI O SEGUINTE COMANDO:
SELECT SUM(preco_venda * quantidade) AS total_vendas
FROM vendas;

--COMANDO PARA ENCONTRAR O MAIOR PREÇO
SELECT MAX(preco_venda) AS maior_preco FROM vendas;

--COMANDO PARA ENCONTRAR O MENOR PREÇO
SELECT MIN(preco_venda) AS menor_preco FROM vendas;

--CALCULAR A MEDIA DE PREÇOS DOS PRODUTOS VENDIDOS
SELECT ROUND(AVG(preco_venda), 2) AS PRECO_MEDIA FROM vendas;
--Já arredondei nesse comando, não tinha visto o proximo passo.

--Para Agrupar as vendas por filial e calcular o total de vendas de cada filial
--separando em uma nova coluna usei a operação GORUP BY e SUM da seguinte forma
UPDATE filiais SET total_vendas = subquery.total_vendas
FROM (
  SELECT id_filial, SUM(preco_venda * quantidade) AS total_vendas
  FROM vendas
  GROUP BY id_filial
) AS subquery
WHERE filiais.id = subquery.id_filial

--para Selecionar apenas as filiais que tiveram um total de vendas
--superior a R$1000,00, já que eu modifique o valor. USei o seguinte comando:
-- com a clasula HAVING
SELECT id_filial, SUM(preco_venda * quantidade) AS total_vendas
FROM vendas
GROUP BY id_filial
HAVING SUM(preco_venda * quantidade) > 1000.00;

