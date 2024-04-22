# Projeto-Integrado

Status: Finalizado 🏆

![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![Docker](https://img.shields.io/badge/Docker-blue?style=for-the-badge&logo=Docker&logoColor=blue&color=white)
![MySQL](https://img.shields.io/badge/MySQL-00000F?style=for-the-badge&logo=mysql&logoColor=white)
![PowerBI](https://img.shields.io/badge/Power%20BI--yellow?style=for-the-badge&logo=Power%20BI&logoColor=BLUE)

## Contexto

Este projeto realizará análises em uma empresa fictícia do setor de ecommerce, onde serão
analisados dados fictícios relacionados a vendas. 

## Objetivos

Aplicar técnicas de análises de dados para obter insights automáticos. No ambiente do Google Colab, 
foram geradas massa de dados fictícios em Python, formando um DataFrame de 48 meses. O Docker foi utilizado para 
otimizar a eficiência operacional, integrando o MySQL Workbench e o MySQL. Em sequência,  esses dados foram integrados ao 
Power BI, onde foram criados os Dashboards Estratégico, Tático e Operacional. 

![fluxo_trabalho.png](Imagens%2Ffluxo_trabalho.png)

## Geração dos Dados

Os dados foram gerados no Google Colab utilizando Python. Foram criados dados simulados para 48 meses, 
abrangendo o período de 2019 a 2022. A massa de dados consiste em 400.000 linhas e 23 colunas, representando 
transações fictícias de uma empresa de e-commerce. A empresa atua tanto com produtos próprios quanto em um 
modelo de marketplace. Os dados foram automaticamente salvos em um arquivo CSV.

[Dados_shopnow.ipynb](Python%2FDados_shopnow.ipynb)

## Otimização Operacional 

O Docker, uma plataforma de código aberto que automatiza a implantação, escalabilidade e administração de 
aplicativos por meio de contêineres, contribuiu significativamente para a eficiência operacional na utilização do MySQL.

docker run -p 3306:3306 --env MYSQL_DATABASE=shopnow --env MYSQL_PASSWORD=1234 --env MYSQL_ROOT_PASSWORD= # --env MYSQL_USER= #

![Docker.png](Imagens%2FDocker.png) 

## Modelo Dimensional

### As tabelas fato e dimensões foram geradas no MySQL em 4 etapas distintas:

+ Construção do Modelo Dimensional: Utilização do MySQL Workbench para
a construção do modelo dimensional da Shopnow e exportação do modelo para um
arquivo denominado "modelagem_logica" em extensão.mwb.
![modelo_logico.png](Mysql_Workbench%2Fmodelo_logico.png)

+ Importação da Base de Dados: Importação de arquivo em formato CSV com
dados fictícios gerado no Colab, utilizando linguagem Python para o MySQL, através
do script intitulado "import-dados_shopnow_sql".


[import-dados_shopnow_sql.sql](SQL%2Fimport-dados_shopnow_sql.sql)


+ Geração das Tabelas Fato e Dimensões: Criação das tabelas fato e dimensões no MySQL, dentro do Schema intitulado "shopnow", através do script intitulado
"script_modelo_dimensional_sql".

[script_modelo_dimensional_sql.sql](SQL%2Fscript_modelo_dimensional_sql.sql)

+ População das Tabelas Fato e Dimensões: População das tabelas fato e dimensões com dados organizados e execução do script intitulado "insert_modelo_dimensional_sql".

[insert_modelo_dimensional_sql.sql](SQL%2Finsert_modelo_dimensional_sql.sql)

## Camada de Apresentação

As análises nos dashboards concentram-se na avaliação dos resultados de
vendas dos últimos 4 anos da empresa de e-commerce Shopnow e de seus Seller’s
(lojistas que utilizam a plataforma do site para realizar vendas).
As apresentações foram segmentadas em três categorias: Painel Estratégico,
Painel Tático e Painel Operacional

![pb1.png](Power_BI%2Fpb1.png)

![pb2.png](Power_BI%2Fpb2.png)

![pb3.png](Power_BI%2Fpb3.png)

![pb4.png](Power_BI%2Fpb4.png)

### Fórmulas Dax

[Power_BI](Power_BI)

## Projeto Completo 

[Dataframe, Scripts, Relatório Técnico](https://drive.google.com/drive/folders/1ZqWwAkS2neZ7GVkaQiglMVVxm-t8LTWO?q=parent:1ZqWwAkS2neZ7GVkaQiglMVVxm-t8LTWO)

[Power BI](https://app.powerbi.com/view?r=eyJrIjoiNjU0MDRkNGItMjUzZi00OGVmLThmMTktZTYyNmFlYTEzNmRmIiwidCI6IjE0Y2JkNWE3LWVjOTQtNDZiYS1iMzE0LWNjMGZjOTcyYTE2MSIsImMiOjh9)

[Google Colab](https://colab.research.google.com/drive/1Tgd_LaVpxbtFs9Sz4xBJ4Lgeow23fCCd?usp=sharing)




