CREATE DATABASE biblioteca;

-- Tabela principal de livros
CREATE TABLE livro (
    id_livro SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    ano INTEGER,
    editora VARCHAR(100) NOT NULL,
    pais VARCHAR(50),
    edicao VARCHAR(50),
    isbn VARCHAR(13) NOT NULL,
    idioma VARCHAR(50)
);

-- Tabela de autores
CREATE TABLE autor (
    id_autor SERIAL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    sobrenome VARCHAR(200) NOT NULL,
    nacionalidade VARCHAR(100)
);

-- Tabela associativa entre livros e autores
CREATE TABLE livro_autor (
    id_livro INTEGER NOT NULL,
    id_autor INTEGER NOT NULL,
    PRIMARY KEY (id_livro, id_autor),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro) ON DELETE CASCADE,
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor) ON DELETE CASCADE
);

-- Tabela de gêneros
CREATE TABLE genero (
    id_genero SERIAL PRIMARY KEY,
    genero VARCHAR(100) NOT NULL
);

-- Tabela associativa entre livros e gêneros
CREATE TABLE livro_genero (
    id_livro INTEGER NOT NULL,
    id_genero INTEGER NOT NULL,
    PRIMARY KEY (id_livro, id_genero),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro) ON DELETE CASCADE,
    FOREIGN KEY (id_genero) REFERENCES genero(id_genero) ON DELETE CASCADE
);

-- Tabela de cargos
CREATE TABLE cargo (
    id_cargo SERIAL PRIMARY KEY,
    cargo VARCHAR(100) NOT NULL,
    carga_horaria VARCHAR(100) NOT NULL,
    salario numeric NOT NULL
);

-- Tabela Pessoa
CREATE TABLE pessoa (
    id_pessoa SERIAL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    sobrenome VARCHAR(200) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL
);

-- Tabela especialização de Pessoa - Funcionário
CREATE TABLE pessoa_funcionario (
    id_pessoa INTEGER PRIMARY KEY,
    id_cargo INTEGER NOT NULL,
    admissao DATE NOT NULL,
    FOREIGN KEY (id_cargo) REFERENCES cargo(id_cargo),
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa) ON DELETE CASCADE
);

-- Tabela especialização de Pessoa - Usuário
CREATE TABLE pessoa_usuario (
    id_pessoa INTEGER PRIMARY KEY,
    cadastro_biblioteca DATE NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa) ON DELETE CASCADE
);

-- Tabela de endereço
CREATE TABLE endereco (
    id_endereco SERIAL PRIMARY KEY,
    bairro VARCHAR(100) NOT NULL,
    numero INTEGER,
    complemento VARCHAR(100),
    cidade VARCHAR(100) NOT NULL,
    rua VARCHAR(100) NOT NULL,
    cep VARCHAR(20) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    id_pessoa INTEGER NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa) ON DELETE CASCADE
);

-- Tabela de telefone genérica
CREATE TABLE telefone (
    id_telefone SERIAL PRIMARY KEY,
    ddd VARCHAR(5) NOT NULL,
    numero_telefone VARCHAR(20) NOT NULL,
    tipo_telefone VARCHAR(20) NOT NULL DEFAULT 'Celular'
        CHECK (tipo_telefone IN ('Celular', 'Fixo', 'Recado')),
    id_pessoa INTEGER NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa) ON DELETE CASCADE
);

-- Tabela de email genérica
CREATE TABLE email (
    id_email SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    id_pessoa INTEGER NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa) ON DELETE CASCADE
);

-- Empréstimos
CREATE TABLE emprestimo (
    id_emprestimo SERIAL PRIMARY KEY,
    id_funcionario INTEGER NOT NULL,
    id_usuario INTEGER NOT NULL,
    data_devolucao DATE NOT NULL,
    FOREIGN KEY (id_funcionario) REFERENCES pessoa_funcionario(id_pessoa) ON DELETE CASCADE,
    FOREIGN KEY (id_usuario) REFERENCES pessoa_usuario(id_pessoa) ON DELETE CASCADE
);

-- Histórico de status do empréstimo
CREATE TABLE historico_emprestimo (
    id_historico_emprestimo SERIAL PRIMARY KEY,
    id_emprestimo INTEGER NOT NULL,
    data_evento TIMESTAMP NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    status_historico BOOLEAN NOT NULL,
    ordem INTEGER NOT NULL,
    FOREIGN KEY (id_emprestimo) REFERENCES emprestimo(id_emprestimo) ON DELETE CASCADE
);

-- Livros emprestados
CREATE TABLE livro_emprestado (
    id_livro_emprestado SERIAL PRIMARY KEY,
    id_emprestimo INTEGER NOT NULL,
    id_livro INTEGER NOT NULL,
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro) ON DELETE CASCADE,
    FOREIGN KEY (id_emprestimo) REFERENCES emprestimo(id_emprestimo) ON DELETE CASCADE
);

-- Histórico de status dos livros emprestados
CREATE TABLE historico_livro_emprestado (
    id_historico_livro_emprestado SERIAL PRIMARY KEY,
    id_livro_emprestado INTEGER NOT NULL,
    data_evento TIMESTAMP NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    status_historico BOOLEAN NOT NULL,
    ordem INTEGER NOT NULL,
    FOREIGN KEY (id_livro_emprestado) REFERENCES livro_emprestado(id_livro_emprestado) ON DELETE CASCADE
);