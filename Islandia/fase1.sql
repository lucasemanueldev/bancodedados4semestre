-- CRIANDO AS TABELAS (Usando PRIMARY KEY & FOREIGN KEY)
CREATE TABLE Professor (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  especialidade VARCHAR(50) NOT NULL
);

CREATE TABLE Curso (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  descricao TEXT NOT NULL,
  professor_id INTEGER REFERENCES Professor(id)
);

CREATE TABLE Disciplina (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  curso_id INTEGER REFERENCES Curso(id),
  professor_id INTEGER REFERENCES Professor(id)
);

CREATE TABLE Aluno (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  idade INTEGER NOT NULL,
  curso_id INTEGER REFERENCES Curso(id)
);

CREATE TABLE Matricula (
  id SERIAL PRIMARY KEY,
  aluno_id INTEGER REFERENCES Aluno(id),
  disciplina_id INTEGER REFERENCES Disciplina(id),
  data_matricula DATE NOT NULL
);
-- PREENCHENDO AS TABELAS
INSERT INTO Professor (nome, especialidade) VALUES 
  ('Paula', 'Matemática'),
  ('Carlos', 'Programação'),
  ('Luciana', 'História'),
  ('Ana', 'Química'),
  ('Rafael', 'Física'),
  ('Márcia', 'Biologia'),
  ('Fernando', 'Administração'),
  ('Sandra', 'Psicologia'),
  ('Vladmir', 'Calculo'),
  ('Rafaela','Geografia');
  -----------------------------
  INSERT INTO Curso (nome, descricao, professor_id) VALUES 
('Ciência da Computação', 'Curso de graduação em ciência da computação', 1),
('Engenharia Civil', 'Curso de graduação em engenharia civil', 2),
('Administração', 'Curso de graduação em administração de empresas', 3),
('Medicina', 'Curso de graduação em medicina', 4),
('Direito', 'Curso de graduação em direito', 5),
('Design Gráfico', 'Curso de graduação em design gráfico', 6),
('Psicologia', 'Curso de graduação em psicologia', 7),
('Jornalismo', 'Curso de graduação em jornalismo', 8),
('Arquitetura e Urbanismo', 'Curso de graduação em arquitetura e urbanismo', 9),
('Engenharia de Software', 'Curso de graduação em engenharia de software', 10);
-----------------------------------------------------------------------------------
INSERT INTO Disciplina (nome, curso_id, professor_id) VALUES 
('Programação Orientada a Objetos', 1, 1),
('Cálculo I', 2, 2),
('Gestão de Negócios', 3, 3),
('Anatomia Humana', 4, 4),
('Direito Civil', 5, 5),
('Design de Interface', 6, 6),
('Psicologia do Desenvolvimento', 7, 7),
('Jornalismo Esportivo', 8, 8),
('Teoria da Arquitetura', 9, 9),
('Engenharia de Software Avançada', 10, 10);
--------------------------------------------------
INSERT INTO Aluno (nome, idade, curso_id) VALUES 
('João', 20, 1),
('Maria', 21, 2),
('Pedro', 19, 3),
('Ana', 22, 4),
('Lucas', 20, 5),
('Carla', 19, 6),
('Márcio', 23, 7),
('Julia', 20, 8),
('Luciana', 21, 9),
('Rafael', 22, 10);
-------------------------------------------------
INSERT INTO Matricula (aluno_id, disciplina_id, data_matricula) VALUES 
(1, 1, '2022-01-15'),
(2, 2, '2022-02-01'),
(3, 3, '2022-02-12'),
(4, 4, '2022-03-05'),
(5, 5, '2022-03-20'),
(6, 6, '2022-04-02'),
(7, 7, '2022-04-15'),
(8, 8, '2022-05-01'),
(9, 9, '2022-05-15'),
(10, 10, '2022-06-01');
--------------------------------
------- join --------------
SELECT a.nome AS nome_aluno, c.nome AS nome_curso, d.nome AS nome_disciplina
FROM Aluno a
JOIN Curso c ON a.curso_id = c.id
JOIN Disciplina d ON d.curso_id = c.id
JOIN Matricula m ON m.aluno_id = a.id AND m.disciplina_id = d.id;
-- o comando acima serve para obter informações sobre os alunos,
--seus cursos e as disciplinas em que estão matriculados.

----------Inner Join----------
SELECT Aluno.nome as nome_aluno, Disciplina.nome as nome_disciplina, Curso.nome as nome_curso
FROM Aluno
INNER JOIN Matricula ON Aluno.id = Matricula.aluno_id
INNER JOIN Disciplina ON Matricula.disciplina_id = Disciplina.id
INNER JOIN Curso ON Disciplina.curso_id = Curso.id;
--obter uma lista de todos os alunos matriculados em cada disciplina,
--juntamente com o nome da disciplina e o nome do curso

---------left join----------------
SELECT Aluno.nome, Curso.nome
FROM Aluno
LEFT JOIN Curso ON Aluno.curso_id = Curso.id;
-- obter uma lista de todos os alunos, juntamente com o nome do curso
--em que estão matriculados. No entanto, alguns alunos podem não estar matriculados em nenhum curso.

--------cross join--------------
SELECT Aluno.nome, Disciplina.nome
FROM Aluno
CROSS JOIN Disciplina;
--usando o cross join para combinar todos os alunos com todas as disciplinas

--------union---------------
SELECT nome FROM Disciplina WHERE curso_id = 1
UNION
SELECT nome FROM Disciplina WHERE curso_id = 2;
--Usando o UNION para combinar as disciplinas dos cursos de Informática e de Administração

--------with-------------------
WITH CTE_Alunos AS (
  SELECT id, nome, idade, curso_id
  FROM Aluno
  WHERE idade >= 18
)
SELECT CTE_Alunos.nome, CTE_Alunos.idade, Curso.nome AS curso
FROM CTE_Alunos
INNER JOIN Curso ON CTE_Alunos.curso_id = Curso.id;

-- aqui eu defini uma expressão de tabela temporária chamada CTE_Alunos que seleciona todos os 
--alunos com idade maior ou igual a 18 anos. Em seguida, usei essa expressão em uma consulta 
--posterior que faz um INNER JOIN com a tabela "Curso" para obter o nome do curso do aluno