# Hipótese que será testada:

# Ho: μa = μb Não há diferença significativa entre as médias de necessidade do medicamento entre o estado mais populoso e menos populoso.
# Ha: μa ≠ μb Há diferença significativa entre as médias de necessidade do medicamento entre o estado mais populoso e menos populoso.

# Pegando o diretório. 
getwd()

# Realizando o teste de hipótese:

# Selecionando a tabela do cloridato.
arq <- read.table(file = 'divisao1cloridato.csv', header = TRUE)

# Pegando a UF que menos aparece/menos necessita da tabela.
min(arq$UF_VENDA)

# Pegando a UF que mais aparece/mais necessita da tabela.
max(arq$UF_VENDA)

# Filtrando a tabela principal com base em SP e coletando sua quantidade de unidade farmacotecnica.
filtro <- arq[arq$UF_VENDA=='SP' & arq$QTD_UNIDADE_FARMACOTECNICA, c("UF_VENDA","QTD_UNIDADE_FARMACOTECNICA")];filtro

# Filtrando a tabela principal com base em AC e coletando sua quantidade de unidade farmacotecnica.
filtro2 <- arq[arq$UF_VENDA=='AC' & arq$QTD_UNIDADE_FARMACOTECNICA, c("UF_VENDA","QTD_UNIDADE_FARMACOTECNICA")];filtro2

# Realizando a média da quantidade de unidade farmacotecnica de SP.
mean(filtro$QTD_UNIDADE_FARMACOTECNICA)

# Realizando a média da quantidade de unidade farmacotecnica de AC.
mean(filtro2$QTD_UNIDADE_FARMACOTECNICA)

# Pegando o tamanho da tabela de SP.
length(filtro$UF_VENDA)

# Pegando o tamanho da tabela de AC.
length(filtro2$UF_VENDA)

# Pegando o desvio padrão da tabela de SP.
sd(filtro$QTD_UNIDADE_FARMACOTECNICA)

# Pegando o desvio padrão da tabela de AC.
sd(filtro2$QTD_UNIDADE_FARMACOTECNICA)

# Realizando a formúla de teste com duas médias.
teste_t <- (1034.659 - 432.6512)/sqrt(1769.088^2/14403 + 180.67^2/86);teste_t

# Realizando o valor crítico.
VC <- 14403 + 86 - 2; VC 
XC <- qt(0.05, 14487);XC

# Apresentação de resultados:

# Segundo os dados descobertos, teste_t  está dentro da região crítica, confirmando a Hipótese alternativa.

# Assim, aceitamos a hipótese alternativa (Ha) e consequentemente negamos a hipótese nula (Ho).

# Concluímos então que há diferença significativa entre as médias de necessidade do medicamento entre o estado mais populoso e menos populoso.


# Ao analisar nosso teste de hipótese podemos então concluir que a distribuição dos medicamentos ocorre de acordo com a demanda do estado mais e menos populoso. Contribuindo assim com os orgãos de saúde, para realizar a devida distribuição apresentando impactos positivos no âmbito da saúde por se tratar de um problema médico cada vez mais alarmante e que quando tratado de forma incorreta pode gerar efeitos colaterais gravíssimos para o paciente.