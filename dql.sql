-- Consultas simples
SELECT * FROM cargo
ORDER BY id_cargo DESC;

SELECT * FROM pessoa
ORDER BY id_pessoa ASC;

SELECT * FROM pessoa_funcionario
ORDER BY id_pessoa ASC;

SELECT * FROM pessoa_usuario
ORDER BY id_pessoa ASC;

SELECT * FROM emprestimo
ORDER BY id_emprestimo DESC;

SELECT * FROM historico_emprestimo
ORDER BY data_evento DESC, ordem DESC;

SELECT * FROM livro_emprestado
ORDER BY id_livro_emprestado DESC;

SELECT * FROM historico_livro_emprestado
ORDER BY data_evento DESC, ordem DESC;

SELECT * FROM autor
ORDER BY id_autor ASC;

SELECT * FROM livro
ORDER BY id_livro ASC;

SELECT * FROM genero
ORDER BY id_genero ASC;

SELECT * FROM livro_autor
ORDER BY id_livro ASC;

SELECT * FROM livro_genero
ORDER BY id_livro ASC;

SELECT * FROM endereco
ORDER BY cep ASC;

SELECT * FROM telefone
ORDER BY ddd ASC;

SELECT * FROM email
ORDER BY id_email ASC;

SELECT nome, sobrenome, cpf
FROM pessoa
WHERE nome LIKE 'J%';

SELECT titulo, ano
FROM livro
LIMIT 3;

-- Views

-- View para listar os livros emprestados e em qual empréstimos estão
CREATE VIEW vw_livros_emprestimos AS
SELECT 
	e.id_emprestimo, 
	l.titulo
FROM emprestimo e
JOIN livro_emprestado le ON e.id_emprestimo = le.id_emprestimo
JOIN livro l ON le.id_livro = l.id_livro;

SELECT * FROM vw_livros_emprestimos;

-- View para listar os titulos dos livros emprestados conforme o usuário e seu status atual
CREATE VIEW vw_emprestimos_livros_usuario AS
SELECT 
  e.id_emprestimo, 
  e.id_usuario,
  l.titulo,
  h.descricao AS status_livro
FROM emprestimo e
JOIN livro_emprestado le ON e.id_emprestimo = le.id_emprestimo
JOIN livro l ON le.id_livro = l.id_livro
JOIN historico_livro_emprestado h ON le.id_livro_emprestado = h.id_livro_emprestado
WHERE h.status_historico = TRUE
GROUP BY e.id_emprestimo, e.id_usuario, l.titulo, h.descricao;

SELECT * FROM vw_emprestimos_livros_usuario
WHERE id_usuario = 1;