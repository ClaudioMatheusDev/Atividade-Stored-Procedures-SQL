create DATABASE Atividade_Stored_Procedures

use Atividade_Stored_Procedures

CREATE TABLE solicitacao_atendimento (
    id INT PRIMARY KEY IDENTITY(1,1),
    data DATE NOT NULL,
    cliente VARCHAR(100) NOT NULL,
    descricao TEXT
);

CREATE TABLE material (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    valor_pago DECIMAL(10,2) NOT NULL
);

CREATE TABLE atendimento_realizado (
    id INT PRIMARY KEY IDENTITY(1,1),
    solicitacao_id INT NOT NULL,
    material_id INT NOT NULL,
    data_atendimento DATE NOT NULL,
    FOREIGN KEY (solicitacao_id) REFERENCES solicitacao_atendimento(id),
    FOREIGN KEY (material_id) REFERENCES material(id)
);

go

INSERT INTO solicitacao_atendimento (data, cliente, descricao) -- INSERÇÃO DE DADOS UTILIZANDO INTELIGENCIA ARTIFICIAL
VALUES 
('2023-08-01', 'Cliente 1', 'Problema com o sistema de gestão.'),
('2023-08-02', 'Cliente 2', 'Atualização de software solicitada.'),
('2023-08-03', 'Cliente 3', 'Consultoria em melhorias de TI.'),
('2023-08-04', 'Cliente 4', 'Reparo de hardware necessário.'),
('2023-08-05', 'Cliente 5', 'Configuração de novo servidor.'),
('2023-08-06', 'Cliente 6', 'Instalação de software antivírus.'),
('2023-08-07', 'Cliente 7', 'Problema de conectividade de rede.'),
('2023-08-08', 'Cliente 8', 'Backup de dados solicitado.'),
('2023-08-09', 'Cliente 9', 'Revisão de segurança de TI.'),
('2023-08-10', 'Cliente 10', 'Suporte técnico geral.'),
('2023-08-11', 'Cliente 11', 'Problemas de desempenho do sistema.'),
('2023-08-12', 'Cliente 12', 'Configuração de e-mails.'),
('2023-08-13', 'Cliente 13', 'Troca de componentes de hardware.'),
('2023-08-14', 'Cliente 14', 'Análise de vulnerabilidades.'),
('2023-08-15', 'Cliente 15', 'Migração de dados.'),
('2023-08-16', 'Cliente 16', 'Otimização de banco de dados.'),
('2023-08-17', 'Cliente 17', 'Problemas de software.'),
('2023-08-18', 'Cliente 18', 'Treinamento de equipe em TI.'),
('2023-08-19', 'Cliente 19', 'Instalação de sistema ERP.'),
('2023-08-20', 'Cliente 20', 'Suporte a software de terceiros.');


INSERT INTO material (nome, valor_pago)-- INSERÇÃO DE DADOS UTILIZANDO INTELIGENCIA ARTIFICIAL
VALUES 
('Cabo de rede', 15.00),
('Memória RAM 8GB', 250.00),
('HD Externo 1TB', 350.00),
('SSD 500GB', 400.00),
('Placa-mãe', 550.00),
('Processador', 1200.00),
('Fonte de alimentação', 200.00),
('Teclado mecânico', 300.00),
('Mouse óptico', 50.00),
('Monitor 24"', 800.00),
('Webcam HD', 120.00),
('Roteador Wi-Fi', 180.00),
('Pendrive 64GB', 40.00),
('Switch de rede', 220.00),
('Nobreak', 600.00),
('Impressora multifuncional', 700.00),
('Headset', 150.00),
('Caixa de som', 100.00),
('Cabo HDMI', 30.00),
('Adaptador USB', 20.00);


INSERT INTO atendimento_realizado (solicitacao_id, material_id, data_atendimento)-- INSERÇÃO DE DADOS UTILIZANDO INTELIGENCIA ARTIFICIAL
VALUES 
(1, 1, '2023-08-02'),
(2, 2, '2023-08-03'),
(3, 3, '2023-08-04'),
(4, 4, '2023-08-05'),
(5, 5, '2023-08-06'),
(6, 6, '2023-08-07'),
(7, 7, '2023-08-08'),
(8, 8, '2023-08-09'),
(9, 9, '2023-08-10'),
(10, 10, '2023-08-11'),
(11, 11, '2023-08-12'),
(12, 12, '2023-08-13'),
(13, 13, '2023-08-14'),
(14, 14, '2023-08-15'),
(15, 15, '2023-08-16'),
(16, 16, '2023-08-17'),
(17, 17, '2023-08-18'),
(18, 18, '2023-08-19'),
(19, 19, '2023-08-20'),
(20, 20, '2023-08-21');


go

CREATE PROCEDURE calcular_lucro_mensal 
    @mes INT,
    @ano INT
AS
BEGIN
    DECLARE @total_receitas DECIMAL(10,2);
    DECLARE @total_custos DECIMAL(10,2);
    DECLARE @lucro_bruto DECIMAL(10,2);
    DECLARE @imposto DECIMAL(10,2);
    DECLARE @lucro_liquido DECIMAL(10,2);

    -- Calcula o total de receitas
    SELECT @total_receitas = SUM(50 + m.valor_pago * 1.2)
    FROM atendimento_realizado ar
    INNER JOIN material m ON ar.material_id = m.id
    WHERE MONTH(ar.data_atendimento) = @mes AND YEAR(ar.data_atendimento) = @ano;

    -- Calcula o total de custos (considerando apenas os materiais)
    SELECT @total_custos = SUM(m.valor_pago)
    FROM atendimento_realizado ar
    INNER JOIN material m ON ar.material_id = m.id
    WHERE MONTH(ar.data_atendimento) = @mes AND YEAR(ar.data_atendimento) = @ano;

    -- Calcula o lucro bruto
    SET @lucro_bruto = @total_receitas - @total_custos;

    -- Calcula o imposto (20% sobre o lucro bruto)
    SET @imposto = @lucro_bruto * 0.2;

    -- Calcula o lucro líquido
    SET @lucro_liquido = @lucro_bruto - @imposto;

    -- Retorna o lucro líquido
    SELECT @lucro_liquido AS 'Lucro Líquido';
END;

go

EXEC calcular_lucro_mensal @mes = 8, @ano = 2023;
