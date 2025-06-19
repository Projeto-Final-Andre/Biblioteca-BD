-- Inserir um novo gênero:
INSERT INTO genero (id_genero, genero) VALUES (1, 'Fantasia');
INSERT INTO genero (id_genero, genero) VALUES (2, 'Romance');
INSERT INTO genero (id_genero, genero) VALUES (3, 'Terror');
INSERT INTO genero (id_genero, genero) VALUES (4, 'Ficção Científica');
INSERT INTO genero (id_genero, genero) VALUES (5, 'Aventura');
-- Inserir um novo autor:
INSERT INTO autor (id_autor, nome, nacionalidade) VALUES (1, 'J.K. Rowling', 'Britânica');

INSERT INTO autor (id_autor, nome, nacionalidade) VALUES (2, 'George Orwell', 'Britânica');

INSERT INTO autor (id_autor, nome, nacionalidade) VALUES (3, 'Machado de Assis', 'Brasileira');

INSERT INTO autor (id_autor, nome, nacionalidade) VALUES (4, 'Stephen King', 'Americana');

INSERT INTO autor (id_autor, nome, nacionalidade) VALUES (5, 'Clarice Lispector', 'Brasileira');

INSERT INTO autor (id_autor, nome, nacionalidade) VALUES (6, 'Isaac Asimov', 'Russo-americana');
-- Inserir um novo livro:
INSERT INTO livro (id_livro, titulo, ano, editora, pais, edicao, isbn, idioma)
VALUES (1, 'Harry Potter e a Pedra Filosofal', 1997, 'Rocco', 'Reino Unido', '1ª', '9788532530783', 'Português');

INSERT INTO livro (id_livro, titulo, ano, editora, pais, edicao, isbn, idioma)
VALUES (2, '1984', 1949, 'Companhia das Letras', 'Reino Unido', '1ª', '9788571644040', 'Português');

INSERT INTO livro (id_livro, titulo, ano, editora, pais, edicao, isbn, idioma)
VALUES (3, 'Dom Casmurro', 1899, 'Saraiva', 'Brasil', '3ª', '9788502117203', 'Português');

INSERT INTO livro (id_livro, titulo, ano, editora, pais, edicao, isbn, idioma)
VALUES (4, 'It: A Coisa', 1986, 'Suma', 'EUA', '1ª', '9788556510780', 'Português');

INSERT INTO livro (id_livro, titulo, ano, editora, pais, edicao, isbn, idioma)
VALUES (5, 'A Hora da Estrela', 1977, 'Rocco', 'Brasil', '1ª', '9788532525437', 'Português');
-- Associação entre livro, autor e gênero:
INSERT INTO livro_autor (id_livro, id_autor) VALUES (1, 1);
INSERT INTO livro_genero (id_livro, id_genero) VALUES (1, 1);

INSERT INTO livro_autor (id_livro, id_autor) VALUES (2, 2);
INSERT INTO livro_genero (id_livro, id_genero) VALUES (2, 2);

INSERT INTO livro_autor (id_livro, id_autor) VALUES (3, 3);
INSERT INTO livro_genero (id_livro, id_genero) VALUES (3, 3);

INSERT INTO livro_autor (id_livro, id_autor) VALUES (4, 4);
INSERT INTO livro_genero (id_livro, id_genero) VALUES (4, 4);

INSERT INTO livro_autor (id_livro, id_autor) VALUES (5, 5);
INSERT INTO livro_genero (id_livro, id_genero) VALUES (5, 5);

INSERT INTO livro_autor (id_livro, id_autor) VALUES (4, 6);

-- Inserir cargo:

INSERT INTO cargo (id_cargo, cargo, carga_horaria, salario)
VALUES (1, 'Bibliotecário', '25 horas semanais', 2200);

INSERT INTO cargo (id_cargo, cargo, carga_horaria, salario) 
VALUES (2, 'Atendente', '20 horas semanais', 1800);

INSERT INTO cargo (id_cargo, cargo, carga_horaria, salario) 
VALUES (3, 'Auxiliar de Biblioteca', '30 horas semanais', 2000);

INSERT INTO cargo (id_cargo, cargo, carga_horaria, salario) 
VALUES (4, 'Técnico de Informação', '40 horas semanais', 2600);

INSERT INTO cargo (id_cargo, cargo, carga_horaria, salario) 
VALUES (5, 'Gerente', '40 horas semanais', 4000);

-- Inserir um novo usuário:

INSERT INTO pessoa (id_pessoa, nome, cpf, data_nascimento)
VALUES (1, 'Ana Clara', '12345678901', '2001-03-15');

INSERT INTO pessoa_usuario (id_pessoa, cadastro_biblioteca)
VALUES (1, '2023-03-15');

INSERT INTO pessoa (id_pessoa, nome, cpf, data_nascimento)
VALUES (2, 'João Pedro', '47565670001', '2002-11-09');

INSERT INTO pessoa_funcionario (id_pessoa, id_cargo)
VALUES (2, 1);

INSERT INTO pessoa (id_pessoa, nome, cpf, data_nascimento)
VALUES (3, 'Julia Castanhas', '3465670001', '2006-10-06');

INSERT INTO pessoa_usuario (id_pessoa, cadastro_biblioteca) 
VALUES (3, '2024-01-10');

INSERT INTO pessoa (id_pessoa, nome, cpf, data_nascimento)
VALUES (4, 'Rodrigo Soares', '22565670001', '2004-07-19');

INSERT INTO pessoa_funcionario (id_pessoa, id_cargo)
VALUES (4, 1);

INSERT INTO pessoa (id_pessoa, nome, cpf, data_nascimento)
VALUES (5, 'Maria Barbosa', '74656704301', '1990-06-26');

INSERT INTO pessoa_usuario (id_pessoa, cadastro_biblioteca) 
VALUES (5, '2025-04-12');



-- Inserir um novo empréstimo:

INSERT INTO emprestimo (id_emprestimo, id_funcionario, id_usuario, data_emprestimo, data_devolucao)
VALUES (1, 2, 1, '2025-06-20', '2025-07-07');

INSERT INTO emprestimo (id_emprestimo, id_funcionario, id_usuario, data_emprestimo, data_devolucao)
VALUES (2, 2, 1, '2025-07-01', '2025-07-15');

INSERT INTO emprestimo (id_emprestimo, id_funcionario, id_usuario, data_emprestimo, data_devolucao)
VALUES (3, 2, 3, '2025-07-02', '2025-07-16');

INSERT INTO emprestimo (id_emprestimo, id_funcionario, id_usuario, data_emprestimo, data_devolucao)
VALUES (4, 2, 5, '2025-07-03', '2025-07-17');

INSERT INTO emprestimo (id_emprestimo, id_funcionario, id_usuario, data_emprestimo, data_devolucao)
VALUES (5, 2, 3, '2025-07-04', '2025-07-18');
-- Inserir um novo telefone:

INSERT INTO telefone (id_telefone, ddd, numero_telefone, tipo_telefone, id_pessoa)
VALUES (1, '11', '998622463', 'Celular', 1);

INSERT INTO telefone (id_telefone, ddd, numero_telefone, tipo_telefone, id_pessoa)
VALUES (2, '11', '987654321', 'Celular', 2);

INSERT INTO telefone (id_telefone, ddd, numero_telefone, tipo_telefone, id_pessoa)
VALUES (3, '21', '999888777', 'Fixo', 3);

INSERT INTO telefone (id_telefone, ddd, numero_telefone, tipo_telefone, id_pessoa)
VALUES (4, '31', '912345678', 'Fixo', 4);

INSERT INTO telefone (id_telefone, ddd, numero_telefone, tipo_telefone, id_pessoa)
VALUES (5, '41', '976543210', 'Celular', 5);





-- Inserir um novo e-mail:

INSERT INTO email (id_email, email, id_pessoa)VALUES (1, 'fulano@gmail.com', 1);
INSERT INTO email (id_email, email, id_pessoa) VALUES (2, 'natalia@email.com',2);
INSERT INTO email (id_email, email, id_pessoa) VALUES (3, 'marcela@email.com',3);
INSERT INTO email (id_email, email, id_pessoa) VALUES (4, 'pedro@email.com', 4);
INSERT INTO email (id_email, email, id_pessoa) VALUES (5, 'lucas@email.com', 5);



-- Inserir um novo endereço:

INSERT INTO endereco (id_endereco, bairro, numero, complemento, cidade, rua, cep, estado, pais, id_pessoa)
VALUES (1, 'Andador 123', 42, 'Bloco 1', 'Jandira', 'Boas vistas', '17821321', 'São Paulo', 'Brasil', 1);

INSERT INTO endereco (id_endereco, bairro, numero, complemento, cidade, rua, cep, estado, pais, id_pessoa)
VALUES (2, 'Centro', 100, 'Apto 1', 'São Paulo', 'Rua A', '01001000', 'SP', 'Brasil', 2);

INSERT INTO endereco (id_endereco, bairro, numero, complemento, cidade, rua, cep, estado, pais, id_pessoa)
VALUES (3, 'Jardins', 200, 'Casa', 'Rio de Janeiro', 'Rua B', '22020000', 'RJ', 'Brasil', 3);

INSERT INTO endereco (id_endereco, bairro, numero, complemento, cidade, rua, cep, estado, pais, id_pessoa)
VALUES (4, 'Savassi', 300, 'Apto 501', 'Belo Horizonte', 'Av. C', '30130000', 'MG', 'Brasil', 4);

INSERT INTO endereco (id_endereco, bairro, numero, complemento, cidade, rua, cep, estado, pais, id_pessoa)
VALUES (5, 'Batel', 400, NULL, 'Curitiba', 'Rua D', '80240000', 'PR', 'Brasil', 5);


-- Inserir um novo livro emprestado:

INSERT INTO livro_emprestado (status_livro, id_emprestimo, id_livro)
VALUES ('Disponível', 1, 2);

INSERT INTO livro_emprestado (status_livro, id_emprestimo, id_livro)
VALUES ('Emprestado', 2, 4);

INSERT INTO livro_emprestado (status_livro, id_emprestimo, id_livro)
VALUES ('Emprestado', 3, 1);

INSERT INTO livro_emprestado (status_livro, id_emprestimo, id_livro)
VALUES ('Disponível', 4, 3);

INSERT INTO livro_emprestado (status_livro, id_emprestimo, id_livro)
VALUES ('Emprestado', 5, 5);
