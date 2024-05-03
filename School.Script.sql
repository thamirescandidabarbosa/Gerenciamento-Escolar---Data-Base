CREATE TABLE Aluno (
    id SERIAL PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL,
    idade INT,
    email VARCHAR(100),
    curso_id INT NOT NULL,
    mensalidade_id INT, 
    FOREIGN KEY (curso_id) REFERENCES Curso(id), 
    FOREIGN KEY (mensalidade_id) REFERENCES Mensalidade(id) 
);


CREATE TABLE Matricula (
    id SERIAL PRIMARY KEY,
    aluno_id INT NOT NULL,
    curso_id INT NOT NULL,
    data_matricula DATE NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES Aluno(id), 
    FOREIGN KEY (curso_id) REFERENCES Curso(id)
);


CREATE TABLE Frequencia (
    id SERIAL PRIMARY KEY,
    aluno_id INT NOT NULL,
    data DATE NOT NULL,
    presente BOOLEAN NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES Aluno(id)
);


CREATE TABLE Disciplina (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);


CREATE TABLE Notas (
    id SERIAL PRIMARY KEY,
    aluno_id INT NOT NULL,
    disciplina_id INT NOT NULL,
    nota NUMERIC(4, 2) NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES Aluno(id),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplina(id)
);


CREATE TABLE Curso (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    duracao INT,
    preco NUMERIC(10, 2) NOT NULL
);

CREATE TABLE Mensalidade (
    id SERIAL PRIMARY KEY,
    curso_id INT NOT NULL,
    valor NUMERIC(10, 2) NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES Curso(id)
);


CREATE TABLE Turma (
    id SERIAL PRIMARY KEY,
    numero INT NOT NULL,
    disciplina_id INT NOT NULL,
    professor_id INT NOT NULL,
    FOREIGN KEY (disciplina_id) REFERENCES Disciplina(id),
    FOREIGN KEY (professor_id) REFERENCES Professor(id)
);


CREATE TABLE Aluno_Turma (
    aluno_id INT,
    turma_id INT,
    FOREIGN KEY (aluno_id) REFERENCES Aluno(id),
    FOREIGN KEY (turma_id) REFERENCES Turma(id),
    PRIMARY KEY (aluno_id, turma_id)
);

CREATE TABLE Professor (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    salario NUMERIC(10, 2) NOT NULL,
    formacao VARCHAR(100) NOT NULL
);

CREATE TABLE Turma_Professor (
    turma_id INT,
    professor_id INT,
    FOREIGN KEY (turma_id) REFERENCES Turma(id),
    FOREIGN KEY (professor_id) REFERENCES Professor(id),
    PRIMARY KEY (turma_id, professor_id)
);

CREATE TABLE Turma_Disciplina (
    turma_id INT,
    disciplina_id INT,
    FOREIGN KEY (turma_id) REFERENCES Turma(id),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplina(id),
    PRIMARY KEY (turma_id, disciplina_id)
);


CREATE TABLE Funcionario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    salario NUMERIC(10, 2) NOT NULL,
    funcao VARCHAR(100) NOT NULL
);



CREATE TABLE UnidadeAcademica (
    id SERIAL PRIMARY KEY,
    codigo INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    data_inicio DATE NOT NULL
);


CREATE TABLE Contratado (
    id SERIAL PRIMARY KEY,
    funcionario_id INT,
    professor_id INT,
    unidade_academica_id INT,
    FOREIGN KEY (funcionario_id) REFERENCES Funcionario(id),
    FOREIGN KEY (professor_id) REFERENCES Professor(id),
    FOREIGN KEY (unidade_academica_id) REFERENCES UnidadeAcademica(id)
);


CREATE TABLE Dependente (
    id SERIAL PRIMARY KEY,
    contratado_id INT,
    nome VARCHAR(100) NOT NULL,
    FOREIGN KEY (contratado_id) REFERENCES Contratado(id)
);


INSERT INTO Curso (nome, descricao, duracao, preco)
VALUES 
    ('Engenharia da Computação', 'Curso de engenharia focado em computação e sistemas', 48, 2500.00),
    ('Ciência da Computação', 'Curso abrangente sobre ciência da computação', 48, 2200.00),
    ('Engenharia de Software', 'Curso voltado para desenvolvimento e gerenciamento de software', 36, 2300.00);
   
-- Inserções adicionais na tabela Disciplina
INSERT INTO Disciplina (nome)
VALUES 
    ('Redes de Computadores'),
    ('Inteligência Artificial'),
    ('Sistemas Distribuídos');

-- Inserções adicionais na tabela Mensalidade
INSERT INTO Mensalidade (curso_id, valor)
VALUES
    (1, 2300.00), -- Mensalidade para o curso de Engenharia de Software
    (2, 2100.00), -- Outros
    (3, 2400.00); -- Outros

-- Inserções adicionais na tabela Professor
INSERT INTO Professor (nome, email, salario, formacao)
VALUES 
    ('Ana Carolina', 'ana.carolina@email.com', 5400.00, 'Mestrado em Engenharia da Computação'), 
    ('Bruno Mars', 'bruno.mars@email.com', 5000.00, 'Doutorado em Ciência da Computação'), 
    ('Paula Oliveira', 'paula@email.com', 4800.00, 'Bacharelado em Sistemas de Informação'); 

-- Inserções adicionais na tabela Turma
INSERT INTO Turma (numero, disciplina_id, professor_id)
VALUES 
    (01, 1, 1), 
    (02, 2, 2), 
    (03, 3, 3);

-- Inserções adicionais na tabela Funcionario
INSERT INTO Funcionario (nome, email, salario, funcao)
VALUES 
    ('José Santos', 'jose.santos@email.com', 3700.00, 'Auxiliar Administrativo'), 
    ('Fernanda Lima', 'fernanda.lima@email.com', 4200.00, 'Analista de Laboratório'), 
    ('Ricardo Souza', 'ricardo.souza@email.com', 4100.00, 'Gerente de Recursos Humanos'); 

-- Inserções adicionais na tabela UnidadeAcademica
INSERT INTO UnidadeAcademica (codigo, nome, data_inicio)
VALUES 
    (654, 'Escola de Engenharia', '2019-09-15'), 
    (789, 'Instituto de Matemática', '2020-05-20'), 
    (234, 'Faculdade de Letras', '2021-08-10');

-- Inserções adicionais na tabela Dependente
INSERT INTO Dependente (contratado_id, nome)
VALUES 
    (1, 'Carlos Silva'), 
    (2, 'Mariana Santos'), 
    (3, 'Gabriel Oliveira');

-- Inserção na tabela Contratado
INSERT INTO Contratado (funcionario_id, professor_id, unidade_academica_id)
VALUES 
    (1, 2, 3); -- Substitua os valores pelos IDs correspondentes dos funcionários, professores e unidades acadêmicas que você deseja vincular
-- Atualização na tabela Contratado
UPDATE Contratado
SET funcionario_id = CASE 
                        WHEN id = 1 THEN 1
                        WHEN id = 2 THEN 2
                        WHEN id = 3 THEN 3
                     END
WHERE id IN (1, 2, 3);

   
-- Inserções adicionais na tabela Aluno
INSERT INTO Aluno (nome, idade, email, curso_id, mensalidade_id)
VALUES 
    ('Pedro', 22 ,'pedro@email.com', 1, 16),
    ('Carla', 28 ,'carla@email.com', 2, 17),
    ('Luiz', 25 ,'luiz@email.com', 3, 18);

-- Inserções adicionais na tabela Matricula
INSERT INTO Matricula (aluno_id, curso_id, data_matricula)
VALUES 
    ((SELECT id FROM Aluno WHERE nome = 'Pedro'), 1, CURRENT_DATE),
    ((SELECT id FROM Aluno WHERE nome = 'Carla'), 2, CURRENT_DATE),
    ((SELECT id FROM Aluno WHERE nome = 'Luiz'), 3, CURRENT_DATE);

-- Inserções adicionais na tabela Frequencia
INSERT INTO Frequencia (aluno_id, data, presente)
VALUES 
(
    (SELECT id FROM Aluno WHERE nome = 'Pedro'),
    '2024-04-29',
    true
),
(
    (SELECT id FROM Aluno WHERE nome = 'Carla'),
    '2024-04-30',
    true
),
(
    (SELECT id FROM Aluno WHERE nome = 'Luiz'),
    '2024-04-28',
    true
);

-- Inserções adicionais na tabela Notas
INSERT INTO Notas (aluno_id, disciplina_id, nota)
VALUES 
(
    (SELECT id FROM Aluno WHERE nome = 'Pedro'),
    (SELECT id FROM Disciplina WHERE nome = 'Redes de Computadores'),
    7.8
),
(
    (SELECT id FROM Aluno WHERE nome = 'Carla'),
    (SELECT id FROM Disciplina WHERE nome = 'Inteligência Artificial'),
    9.2
),
(
    (SELECT id FROM Aluno WHERE nome = 'Luiz'),
    (SELECT id FROM Disciplina WHERE nome = 'Sistemas Distribuídos'),
    8.5
   
);

-- Inserções adicionais na tabela Aluno_Turma
INSERT INTO Aluno_Turma (aluno_id, turma_id) 
VALUES 
    ((SELECT id FROM Aluno WHERE nome = 'Pedro'), 10),
    ((SELECT id FROM Aluno WHERE nome = 'Carla'), 11),
    ((SELECT id FROM Aluno WHERE nome = 'Luiz'), 12);

-- Inserções adicionais na tabela Turma_Professor
INSERT INTO Turma_Professor (turma_id, professor_id)
VALUES 
    (10, 2),
    (11, 3),
    (12, 1);

   
  -- Inserções adicionais na tabela Turma_Disciplina
INSERT INTO Turma_Disciplina (turma_id, disciplina_id)
VALUES 
    (10, 1),
    (11, 2),
    (12, 3);


   
   
   
   
CREATE VIEW Funcionario_Dependentes_View AS
SELECT 
    f.id AS funcionario_id,
    f.nome AS funcionario_nome,
    f.funcao AS funcao,
    f.salario AS salario,
    d.nome AS dependente_nome
FROM 
    Funcionario f
LEFT JOIN 
    Dependente d ON f.id = d.contratado_id;

   
   select * from funcionario_dependentes_view;
  
  
  
  CREATE VIEW Aluno_Curso_Disciplina_View AS
SELECT 
    a.id AS aluno_id,
    a.nome AS aluno_nome,
    c.nome AS curso_nome,
    d.nome AS disciplina_nome,
    m.valor AS mensalidade_valor,
    n.nota AS nota
FROM 
    Aluno a
INNER JOIN 
    Curso c ON a.curso_id = c.id
INNER JOIN 
    Mensalidade m ON a.mensalidade_id = m.id
INNER JOIN 
    Matricula mat ON a.id = mat.aluno_id
INNER JOIN 
    Disciplina d ON mat.curso_id = d.id
INNER JOIN 
    Notas n ON a.id = n.aluno_id AND d.id = n.disciplina_id;

select * from Aluno_Curso_Disciplina_View;




CREATE VIEW Aluno_Professor_View AS
SELECT 
    a.id AS aluno_id,
    a.nome AS aluno_nome,
    p.id AS professor_id,
    p.nome AS professor_nome
FROM 
    Aluno a
INNER JOIN 
    Matricula mat ON a.id = mat.aluno_id
INNER JOIN 
    Turma t ON mat.curso_id = t.disciplina_id
INNER JOIN 
    Turma_Professor tp ON t.id = tp.turma_id
INNER JOIN 
    Professor p ON tp.professor_id = p.id;
   
   
 select * from Aluno_Professor_View;



CREATE VIEW Detalhes_Alunos_Cursos AS
SELECT 
    a.id AS aluno_id,
    a.nome AS aluno_nome,
    a.idade AS aluno_idade,
    c.id AS curso_id,
    c.nome AS curso_nome,
    c.descricao AS curso_descricao,
    c.duracao AS curso_duracao,
    m.id AS mensalidade_id,
    m.valor AS mensalidade_valor,
    d.id AS disciplina_id,
    d.nome AS disciplina_nome,
    n.nota AS nota_aluno,
    p.id AS professor_id,
    p.nome AS professor_nome,
    p.formacao AS professor_formacao
FROM 
    Aluno a
INNER JOIN 
    Curso c ON a.curso_id = c.id
INNER JOIN 
    Mensalidade m ON a.mensalidade_id = m.id
INNER JOIN 
    Matricula mat ON a.id = mat.aluno_id
INNER JOIN 
    Disciplina d ON mat.curso_id = d.id
LEFT JOIN 
    Notas n ON a.id = n.aluno_id AND d.id = n.disciplina_id
LEFT JOIN 
    Turma t ON d.id = t.disciplina_id
LEFT JOIN 
    Turma_Professor tp ON t.id = tp.turma_id
LEFT JOIN 
    Professor p ON tp.professor_id = p.id;

   
select * from Detalhes_Alunos_Cursos;
