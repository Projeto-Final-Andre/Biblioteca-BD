-- Criação de usuários

-- Perfil do gerente
CREATE USER pessoa_admin WITH PASSWORD 'admin123';

-- Perfil de funcionários no geral
CREATE USER pessoa_funcionario WITH PASSWORD 'funcionario123';

-- Perfil de usuário comum
CREATE USER pessoa_usuario WITH PASSWORD 'usuario123';




-- DCL

-- Concede todos os privilégios ao gerente
GRANT ALL PRIVILEGES ON SCHEMA public TO pessoa_admin;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO pessoa_admin;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO pessoa_admin;

-- Concede todos os privilégios aos funcionários comuns
GRANT ALL PRIVILEGES ON SCHEMA public TO pessoa_funcionario;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO pessoa_funcionario;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO pessoa_funcionario;

-- Concede apenas permissão de leitura as pessoas comuns
GRANT USAGE ON SCHEMA public TO pessoa_usuario;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO pessoa_usuario;

-- Garante que permissões sejam propagadas para futuras tabelas
ALTER DEFAULT PRIVILEGES IN SCHEMA public
    GRANT SELECT ON TABLES TO pessoa_usuario;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
    GRANT SELECT ON TABLES TO pessoa_funcionario;

-- Revoga a permissão de inserção na tabela cargos para pessoa_funcionario
REVOKE INSERT ON public.cargo FROM pessoa_funcionario;

-- Revoga a permissão de atualização na tabela cargos para pessoa_funcionario
REVOKE UPDATE ON public.cargo FROM pessoa_funcionario;

-- Revoga a permissão de exclusão na tabela cargos e pessoa para pessoa_funcionario
REVOKE DELETE ON public.cargo, public.pessoa FROM pessoa_funcionario;