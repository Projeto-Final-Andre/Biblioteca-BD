```mermaid
erDiagram
    PESSOA_USUARIO ||--o{ EMPRESTIMO : faz
    PESSOA_FUNCIONARIO ||--o{ EMPRESTIMO : faz
    EMPRESTIMO ||--|{ LIVRO_EMPRESTADO : tem
    PESSOA_FUNCIONARIO }o--|| CARGO : tem
    PESSOA ||--|| PESSOA_USUARIO : é
    PESSOA ||--|| PESSOA_FUNCIONARIO : é
    PESSOA }|--|| ENDERECO : tem
    PESSOA ||--|{ TELEFONE : tem
    PESSOA ||--|{ EMAIL : tem
    LIVRO_EMPRESTADO }o--|| LIVRO  : tem
    LIVRO }|--|{ LIVRO_AUTOR: tem
    LIVRO_AUTOR }|--|{ AUTOR: tem
    LIVRO }|--|{ LIVRO_GENERO: tem
    LIVRO_GENERO }|--|{ GENERO: tem


    CARGO {
        serial id_cargo PK
        string cargo
        numeric salario
        string carga_horaria
    }

    PESSOA {
        serial id_pessoa PK
        string nome
        int cpf
        date data_nascimento
    }

    PESSOA_FUNCIONARIO {
        int id_pessoa PK, FK
        int id_cargo FK
    }

    PESSOA_USUARIO {
        int id_pessoa PK, FK
        date cadastro_biblioteca
    }

    EMPRESTIMO {
        serial id_emprestimo PK
        int id_funcionario FK
        int id_usuario FK
        date data_emprestimo
        date data_devolucao
    }

    LIVRO_EMPRESTADO {
        serial id_livro_emprestado PK
        string status_livro
        int id_emprestimo FK
        int id_livro FK
    }

    AUTOR {
        serial id_autor PK
        string nome
        string nacionalidade
    }

    LIVRO {
        serial id_livro PK
        string titulo
        int ano
        string editora
        string pais
        string edicao
        string isbn
        string idioma
    }

    GENERO {
        serial id_genero PK
        string genero
    }

    LIVRO_AUTOR {
        int id_livro FK
        int id_autor FK
    }

    LIVRO_GENERO {
        int id_livro FK
        int id_genero FK
    }

    ENDERECO {
        serial id_endereco PK
        string bairro
        int numero
        string complemento
        string cidade
        string rua
        string cep
        string estado
        string pais
        int id_pessoa FK
    }

    TELEFONE {
        serial id_telefone PK
        int ddd
        int numero_telefone
        string tipo_telefone
        int id_pessoa FK
    }

    EMAIL {
        serial id_email PK
        string email
        int id_pessoa FK
    }
```
