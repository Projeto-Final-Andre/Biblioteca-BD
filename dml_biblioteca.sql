-- Inserir um novo gênero:
INSERT INTO genero (genero) VALUES ('Fantasia');

-- Inserir um novo autor:
INSERT INTO autor (nome, nacionalidade)
VALUES ('J.K. Rowling', 'Britânica');

-- Inserir um novo livro:
INSERT INTO livro (titulo, ano, editora, pais, edicao, isbn, idioma)
VALUES ('Harry Potter e a Pedra Filosofal', 1997, 'Rocco', 'Reino Unido', '1ª', '9788532530783', 'Português');

-- Associação entre livro, autor e gênero:
INSERT INTO livro_autor (id_livro, id_autor) VALUES (1, 1);
INSERT INTO livro_genero (id_livro, id_genero) VALUES (1, 1);

-- Inserir cargo:
INSERT INTO cargo (cargo, carga_horaria, salario)
VALUES ('Bibliotecário', '25 horas semanais', 2200);

-- Inserir um novo usuário:
INSERT INTO pessoa (nome, cpf, data_nascimento)
VALUES ('Ana Clara', '12345678901', '2001-03-15');

INSERT INTO pessoa_usuario (id_pessoa, cadastro_biblioteca)
VALUES (1, '2023-03-15');

INSERT INTO pessoa (nome, cpf, data_nascimento)
VALUES ('João Pedro', '47565670001', '2002-11-09');

INSERT INTO pessoa_funcionario (id_pessoa, id_cargo)
VALUES (2, 1);

-- Inserir um novo empréstimo:
INSERT INTO emprestimo (id_funcionario, id_usuario, data_emprestimo, data_devolucao)
VALUES (2, 1, '2025-06-20', '2025-07-07');

-- Inserir um novo telefone:
INSERT INTO telefone (ddd, numero_telefone, tipo_telefone, id_pessoa)
VALUES ('11', '998622463', 'Celular', 1);

-- Inserir um novo e-mail:
INSERT INTO email (email, id_pessoa)
VALUES ('fulano@gmail.com', 1);

-- Inserir um novo endereço:
INSERT INTO endereco (bairro, numero, complemento, cidade, rua, cep, estado, pais, id_pessoa)
VALUES ('Andador 123', 42, 'Bloco 1', 'Jandira', 'Boas vistas', '17821321', 'São Paulo', 'Brasil', 1);

-- Inserir um novo livro emprestado:
INSERT INTO livro_emprestado (status_livro, id_emprestimo, id_livro)
VALUES ('Disponível', 2, 1);






-- Atualizar o status de um livro:
UPDATE livro
SET idioma = 'Francês'
WHERE id_livro = 1;

-- Corrigir o nome de um autor:
UPDATE autor
SET nome = 'Joanne Rowling'
WHERE id_autor = 2;

-- Atualizar o e-mail de um usuário:
UPDATE email
SET email = 'ana.clara.novo@email.com'
WHERE id_email = 2;

-- Atualizar a data de devolução do empréstimo:
UPDATE emprestimo
SET data_devolucao = CURRENT_DATE + INTERVAL '7 days'
WHERE id_emprestimo = 1;




-- Excluir um gênero:
DELETE FROM genero
WHERE id_genero = 4;

-- Excluir um empréstimo:
DELETE FROM emprestimo
WHERE id_emprestimo = 1;

-- Excluir um livro:
DELETE FROM livro WHERE id_livro = 2;
