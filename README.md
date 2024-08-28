# Projeto de Cálculo de Lucro Líquido

Este repositório contém o código SQL necessário para criar um banco de dados e calcular o lucro líquido mensal de uma empresa, levando em conta as receitas, custos, despesas e impostos. O projeto envolve a criação de tabelas para registrar solicitações de atendimento técnico, materiais utilizados e os atendimentos realizados.

## Fórmula do Lucro Líquido

O lucro líquido da empresa é calculado usando a seguinte fórmula:

```
Lucro líquido = Receita total – Custos totais – Despesas totais – Impostos
```

## Estrutura do Banco de Dados

### Tabelas Criadas

1. **solicitacao_atendimento**:
   - `id`: Identificador único da solicitação.
   - `data`: Data da solicitação.
   - `cliente`: Nome do cliente que fez a solicitação.
   - `descricao`: Descrição do problema técnico relatado pelo cliente.

2. **material**:
   - `id`: Identificador único do material.
   - `nome`: Nome do material (ex.: parafuso, fita adesiva).
   - `valor_pago`: Valor pago pelo material.

3. **atendimento_realizado**:
   - `id`: Identificador único do atendimento.
   - `solicitacao_id`: Referência à solicitação atendida.
   - `material_id`: Referência ao material utilizado.
   - `data_atendimento`: Data em que o atendimento foi realizado.

## Stored Procedure para Cálculo de Lucro

Foi criada uma **Stored Procedure** que consulta o lucro líquido que a empresa obteve em um determinado mês. A receita para cada atendimento é calculada como:

```
Receita do atendimento = R$ 50,00 + (valor do produto * 1,2)
```

### Considerações

- **Imposto**: A procedure leva em consideração o imposto, calculado como 20% sobre o lucro bruto.
- **Lucro Bruto**: Calculado subtraindo os custos totais das receitas totais.
- **Lucro Líquido**: Calculado subtraindo os impostos do lucro bruto.

## Como Executar

1. **Criação das Tabelas**: Use os scripts SQL fornecidos para criar as tabelas no seu banco de dados.
2. **Inserção de Dados**: Popule as tabelas com dados de exemplo.
3. **Execução da Procedure**: Execute a stored procedure fornecendo o mês e ano para calcular o lucro líquido.

---
