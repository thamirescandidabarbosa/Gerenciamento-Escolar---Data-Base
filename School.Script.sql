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


