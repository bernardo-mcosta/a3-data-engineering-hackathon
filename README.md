# A3 Data Engineering Hackathon

## Português
Este é um desafio de engenharia de dados em que a tarefa é implementar um pipeline de extração, transformação e disponibilização de dados. A fonte dos dados consiste em uma base de dados aberta do Cadastro Nacional da Pessoa Jurídica (CNPJ), disponibilizada pela Receita Federal Brasileira. O objetivo final é responder as seguintes perguntas de maneira visual:

1. Número de indústrias ativas por mês/ano entre 2010 - 2021, discriminado por MEI ou Simples, em cada município brasileiro
2. Número de comércios que fecharam por mês/ano entre 2010 - 2021, discriminado por MEI ou Simples, em cada município brasileiro
3. Número de CNPJ novos por mês/ano entre 2010 - 2021, discriminado por MEI ou Simples, em cada município brasileiro
4. Qual o número de CNPJ que surgiram do grupo de educação superior, entre 2015 e 2021, discriminado por ano, em cada estado brasileiro?
5. Qual a classe de CNAE com o maior capital social médio no Brasil no último ano?
6. Qual a média do capital social das empresas de pequeno porte por natureza jurídica no último ano?

### Solução
O ecossistema do Google foi escolhido para realizar todo o desafio pela facilidade de acesso, integração de ferramentas e proporcionar um crédito de 300 dólares para novas contas. 

A solução utilizou as seguintes ferramentas:
- Google Colab para escrita e execução de códigos em um ambiente pré-configurado com diversas bibliotecas de Python
- Google Cloud Storage para armazenamento dos dados
- Google BigQuery como banco de dados para análises, consultas SQL e integração com o Data Studio
- Google Data Studio para visualização de maneira dinâmica

O script de python `hackathon_extraction.ipynb` foi escrito para realizar um scrapping na página da web a procura dos links para fazer o download dos arquivos .CSV comprimidos em um formato .ZIP diretamente para um bucket do Google Colab, que em seguida são extraídos para uma nova pasta dentro do mesmo bucket. O script `hackathon_transformation.ipynb` faz uso da biblioteca PySpark para realizar a modelagem e transformação dos dados para então envia-los para o Google BigQuery, onde foi possível realizar consultas SQL para responder a cada questão, salvando-as no formato de tabelas, que são facilmente importadas por meio da integração com o Google Data Studio.

Para conferir os resultados da análise e a visualização de dados no Data Studio, siga o link para a [Solução Final](https://lookerstudio.google.com/s/uoH8418-jsE).

---
## English
This is a data engineering challenge where the task is to implement a data extraction, transformation, and provisioning pipeline. The data source consists of an open database from the Brazilian Federal Revenue Service known as "Cadastro Nacional da Pessoa Jurídica" (CNPJ). The ultimate goal is to visually answer the following questions:

1. Number of active industries per month/year between 2010 - 2021, categorized as MEI or Simples, in each Brazilian municipality.
2. Number of closed businesses per month/year between 2010 - 2021, categorized as MEI or Simples, in each Brazilian municipality.
3. Number of new CNPJs per month/year between 2010 - 2021, categorized as MEI or Simples, in each Brazilian municipality.
4. What is the number of CNPJs that emerged from the higher education group between 2015 and 2021, categorized by year, in each Brazilian state?
5. Which CNAE class has the highest average social capital in Brazil in the last year?
6. What is the average social capital of small-sized companies by legal nature in the last year?

> MEI stands for "Microempreendedor Individual," which translates to "Individual Microentrepreneur" in English. It is a simplified legal status for small businesses and self-employed individuals in Brazil. Simples Nacional, often referred to simply as "Simples," is a simplified tax regime for small and micro businesses in Brazil. It unifies several taxes into a single payment, simplifying tax obligations for eligible companies.

### Solution
The Google ecosystem was chosen to carry out the entire challenge due to its ease of access, integrated tools, and providing a $300 credit for new accounts.

The solution used the following tools:
- Google Colab for writing and executing code in a pre-configured environment with various Python libraries.
- Google Cloud Storage for data storage.
- Google BigQuery as a database for analysis, SQL queries, and integration with Data Studio.
- Google Data Studio for dynamic data visualization.

The Python script `hackathon_extraction.ipynb` was written to scrape the web page for links to download the compressed .CSV files in .ZIP format directly to a Google Colab bucket. These files are then extracted into a new folder within the same bucket. The `hackathon_transformation.ipynb` script uses the PySpark library to model and transform the data, which is then sent to Google BigQuery. SQL queries were performed to answer each question, and the results were saved in table format, easily imported through integration with Google Data Studio.

To view the analysis results and data visualization in Data Studio, follow the link to the [Final Solution](https://lookerstudio.google.com/s/uoH8418-jsE).
