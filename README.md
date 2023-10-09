# Desafio - API Netflix

Este é o meu projeto para a DesenvolvendoMe, de um desafio Netflix APi, que envolve a criação de uma API RESTful em Ruby on Rails para ler um arquivo CSV, popula o banco de dados com suas informações e fornece uma maneira de listar, filtrar e ordenar esses registros em JSON.

## Tecnologias Utilizadas

- Ruby (v3.1.2)
- Ruby on Rails (v7.0.8)
- PostgreSQL

## Funcionalidades


### 1. Importação de Dados do Arquivo CSV
O projeto inclui uma rota `POST /api/import_csv`, que é tratada pelo controller `ReadCsvController`. Essa rota permite que você faça o upload de um arquivo CSV e importe seus dados para o banco de dados. A lógica de importação está localizada na camada business, no módulo `Api::NetflixShowImporter`.
Aqui está um exemplo de como usar essa rota:
- POST /api/import_csv Form Data:
-   file: (selecione seu arquivo CSV)
- A lógica de importação utiliza a gem CSV para ler o arquivo CSV e, em seguida, armazena os dados no banco de dados na tabela `NetflixShow`.

### 2. Listagem de Registros

A API permite listar todos os registros armazenados no banco de dados. Os registros são ordenados pelo ano de lançamento em ordem decrescente.
- GET /api/shows


### 3. Filtragem de Registros

A API oferece a capacidade de filtrar registros com base em três critérios: ano de lançamento, gênero e país. Você pode usar os seguintes parâmetros de consulta (query parameters) na URL para aplicar filtros:

- `year`: Filtra os registros por ano de lançamento.
- `genre`: Filtra os registros por gênero.
- `country`: Filtra os registros por país.

Por exemplo, para listar apenas os filmes lançados em 2022, você pode fazer a seguinte chamada:

- GET /api/shows?year=2022

## Resposta da API

A resposta do endpoint `/api/shows` segue o padrão JSON:

```json
[
  {
    "id":  "d115bc03-3d5e-4cc8-8a03-0a8f22a53c7e",
	"title":  "A New York Christmas Wedding",
	"genre":  "Movie",
	"year":  2020,
	"country":  "United States",
	"published_at":  "2020-11-05",
	"description":  "As her wedding nears, a bride-to-be is visited by an angel who reveals what could have been if she'd followed feelings for her childhood best friend."
  },
]
```
## [Documentação da API no Postman](https://documenter.getpostman.com/view/28601160/2s9YJhvzJk)

## Testes Automatizados

O projeto inclui testes automatizados usando o RSpec para garantir a qualidade e integridade do código.