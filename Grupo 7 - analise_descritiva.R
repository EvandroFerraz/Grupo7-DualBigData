#3- Análise Descritiva dos Dados: Análise Descritiva é a descrição da base de dados de um data frame, apontando o que cada coluna/atributo representa. Um exemplo de análise descritiva pode ser encontrado no link abaixo (utilizando R), os alunos devem seguir os passos abordados no 
#exemplo. A Análise Descritiva dos Dados também pode ser entregue utilizando o Power BI


# 1 - Explicar o conjunto de dados 

library(readr)
arq <- read_csv("divisao1cloridato.csv") 

#Este conjunto de dados foi apenas a compilação de todos os arquivos mensais da seguinte página do Portal de Dados Abertos em um único conjunto de dados:
#https://dados.gov.br/dados/conjuntos-dados/venda-de-medicamentos-controlados-e-antimicrobianos---medicamentos-manipulados
#Todos os créditos para este conjunto de dados são para os autores. Eu apenas automatizo o download dos arquivos e os concateno.
#basicamente este conjunto de dados contém o histórico de medicamentos manipulados controlados pela ANVISA vendidos de 2014 a novembro de 2021. 
#Cada linha é uma operação de venda individual, com informações detalhadas da composição do medicamento vendido. algumas sugestões de uso e dúvidas em que estou trabalhando:
#Que drogas estão em/diminuindo seu consumo?
#Tem algum efeito sazonal, como as estações?
#Podemos medir a saúde mental pelo consumo de drogas de fusão?
#Qual o efeito da pandemia de COVID no consumo de drogas, mesmo que não tenham correlação com o tratamento da doença?
#Modelos de regressão para prever vendas futuras

# 2 - Explicar as variáveis 
# explicar cada uma delas, mostrando o tipo, categorizando-a como
# quantitativa (discreta ou contínua) ou qualitativa (nominal ou ordinal)
# e explicando o quê cada uma quer dizer

str(arq)

#"PRINCIPIO_ATIVO"  - Qualitativo nominal
#É o componente farmacologicamente ativo destinado a um medicamento, ou seja, o cloridrato de nortriptilina.


#"DCB"  - Qualitativa nominal
#Define a denominação do medicamento aprovado pelo órgão federal que é responsável pela vigilância sanitária.



#"ANO_VENDA"    - Qualitativo nominal 
#Define o ano de venda do fármaco. 


#"SEXO"  - Qualitativa nominal
#Define o gênero, em masculino ou feminino, de quem comprou o medicamento.


#"IDADE" - Quantitatia contínua 
#Define a idade de quem comprou o fármaco.


#"UF_VENDA" -  Qualitativa nominal
#Se refere em siglas a Unidade Federativa de venda entre os 26 estados brasileiros.


#"MUNICIPIO_VENDA" - Qualitativa nominal 
#Se refere ao município onde foi vendido o medicamento.


#"QTD_UNIDADE_FARMACOTECNICA" - Quantitativa discreta
#Como o  medicamento é apresentado para sua ingestão, contendo muitas formas, como estados (líquido, sólido, gasoso)


#"TIPO_RECEITUARIO" -  Qualitativa nominal
#É um modo de prescrição dedicada para medicamentos que não precisam obrigatoriamente de receita para serem comprados nas farmácias, assim recomenda-se que eles sejam adquiridos somente depois de um profissional habilitado tenha recomendado.  



# 3 - Descrever cada variável 
# se a variável for qualitativa, fazer a tabela de frequências de cada valor

table(arq$Grupo)

table(arq$PRINCIPIO_ATIVO)
table(arq$DCB)
table(arq$ANO_VENDA)
table(arq$SEXO)
table(arq$UF_VENDA)
table(arq$MUNICIPIO_VENDA)
table(arq$TIPO_RECEITUARIO)
table(arq$ANO_VENDA)
table(arq$IDADE)



# se a variável for quantitativa, mostrar as medidas de posição e de dispersão

summary(arq$QTD_UNIDADE_FARMACOTECNICA)
var(arq$QTD_UNIDADE_FARMACOTECNICA)
sd(arq$QTD_UNIDADE_FARMACOTECNICA)


# 4 - Verificar as relações entre variáveis
# criar um conjunto somente com as variáveis quantitativas
# fazer a matriz de correlação

#Assim como auxiliado pelo professor, de acordo com a nossa base de dados, não há um devido processamento 
#com ênfase nos dados subsistentes para criação de uma correlação e executar os códigos acionados, 
#e com isso abaixo representamos a tentativa de uma possível correlação entre os devidos dados presentes.


#instalar pacotes 
install.packages("corrplot")
library(corrplot)

#tipos das variáveis 
str(arq)

# verificar se há dados faltantes
is.na(arq)
sum(is.na(arq))

# estatísticas descritivas do conjunto de dados
summary(arq)

#excluindo colunas que nao agragam relacao para nosso conceito de correlacao, colunas repetidas e valores do tipo “chr”
arq$QTD_UNIDADE_FARMACOTECNICA.1 <- NULL 
arq$PRINCIPIO_ATIVO <- NULL 
arq$MUNICIPIO_VENDA <- NULL 
arq$UF_VENDA <- NULL 
arq$DCB <- NULL
arq$ANO_VENDA <- NULL
arq$TIPO_RECEITUARIO <- NULL
arq$SEXO <- NULL

#correlação entre os dados da base de dados
cor(arq)

# Criar matriz de correlação de dados
res <- cor(arq)
round(res, 2)

#matrix de correlação 
corrplot(cor(arq), method ='number')





