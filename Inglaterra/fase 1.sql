--Criação tabela SQL usada
CREATE TABLE restaurantes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  bairro VARCHAR(255) NOT NULL,
  cozinha VARCHAR(255) NOT NULL,
  review INT NOT NULL
);

--Insere os registros
INSERT INTO restaurantes (nome, bairro, cozinha, review) VALUES
('La Pizzaria', 'Vila Olímpia', 'italiana', 4),
('Taco Loco', 'Pinheiros', 'mexicana', 3),
('Churrascaria do Gaucho', 'Mooca', 'brasileira', 5),
('Le French', 'Jardins', 'francesa', 4),
('Sushi House', 'Tatuapé', 'japonesa', 3),
('Cantinho da Vovó', 'Santana', 'caseira', 4),
('Hamburgueria do Rock', 'Vila Madalena', 'hamburgueria', 4),
('Botequim do Zé', 'Lapa', 'brasileira', 3),
('Sabor de Minas', 'Bom Retiro', 'brasileira', 4),
('Thai Garden', 'Moema', 'tailandesa', 5),
('Restaurante Vegetariano', 'Perdizes', 'vegetariana', 3),
('Sabor do Nordeste', 'Brás', 'nordestina', 4),
('Yakisoba House', 'Liberdade', 'japonesa', 3),
('Pizzaria do Cheiro Verde', 'Vila Mariana', 'italiana', 4),
('Feijoada da Tia Cida', 'Vila Guilherme', 'brasileira', 5);

--o comando COUNT em SQL é utilizado para contar o número de
--linhas que correspondem a uma determinada condição em uma tabela.
--Esse comando conta quantos restaurantes tem uma avaliação acima de 3 estrelas
SELECT COUNT(*) FROM restaurantes WHERE review > 3;
--Neste outro exemplo listamos quantos restaurantes estão no bairro Moema
SELECT COUNT(*) FROM restaurantes WHERE bairro = 'Moema';

--O comando SUM em SQL é usado para calcular a soma dos valores de uma coluna numérica
--em uma tabela que atende a uma determinada condição.

--Por exemplo, suponha que precisamos saber a soma das avaliações de todos os restaurantes
--da tabela que estão localizados no bairro "Lapa". Poderiamos usar o seguinte comando
SELECT SUM(review) FROM restaurantes WHERE bairro = 'Lapa';

--O comando MAX em SQL é usado para encontrar o valor máximo em uma coluna específica de uma tabela que atende a uma determinada condição
--Por exemplo para encontrarmos a maior a avaliação na tabela restaurantes podemos usar o seguinte comando
SELECT MAX(review) FROM restaurantes;

--O comando AVG() em SQL é usado para calcular a média dos valores em uma coluna numérica de uma tabela que atende a uma determinada condição.
--O comando abaixo faz a média de avaiação de todos os restaurantes com Cozinha brasileira por exemplo.
SELECT AVG(review) FROM restaurantes WHERE cozinha = 'brasileira';

--O comando ROUND() em SQL é usado para arredondar um valor numérico para um número específico de casas decimais
--Por exemplo, para arredondar a média das avaliações dos restaurantes na tabela "restaurantes"
--com cozinha brasileira para uma casa decimal. Podemos usar o seguinte comando:
SELECT ROUND(AVG(review), 1) FROM restaurantes WHERE cozinha = 'brasileira';

--O comando GROUP BY em SQL é usado para agrupar linhas de uma tabela com base nos valores em uma ou mais colunas
--específicas e permitir que você execute funções agregadas (como COUNT, SUM, AVG, MAX, etc.) em cada grupo de linhas.

--Por exemplo para saber quantos restaurantes com cada tipo de cozinha existem na tabela podemos usar o comando
--GROUP BY para agrupar as linhas com base no valor da coluna "cozinha" e contar o número de restaurantes em cada
--grupo usando a função COUNT(), o comando seri assim:
SELECT cozinha, COUNT(*) as num_restaurantes -- num_restaurantes é o apelido da coluna
FROM restaurantes
GROUP BY cozinha;


--O comando HAVING em SQL é usado para filtrar grupos resultantes do comando GROUP BY
--Por exemplo para saber quais bairros têm restaurantes com uma avaliação média de 4 ou mais estrelas. Para isso,
--vpodemos usar o comando HAVING para filtrar os resultados do GROUP BY pela média de avaliações. o comando seria assim:
SELECT bairro, AVG(review) as media_avaliacao
FROM restaurantes
GROUP BY bairro
HAVING AVG(review) >= 4;




