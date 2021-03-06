######################################
## LISTA 3

rm(list=ls(all=TRUE))
require(ggplot2)

setwd("/Users/cassio/Dropbox/Pos Data Science/Lista_3_Estatistica")

trabalho <- read.table("trabalho.txt",header = TRUE)

# Carregando os dados:
View(trabalho)


########################################################################################################
#1- Construa boxplots representando o número de filhos ate cinco anos para as
#mulheres que trabalham e outro para as que não trabalham. Qual a sua interpretacao sobre o grafico? 
c

#############################################################################
#2. Repita o item anterior para as variáveis FILHOS 6 18, IDADE e RENDA FAMILIA. Interprete os gŕaficos
questao_2 <- subset(trabalho,  select = c(ID_TRABALHA, FILHOS_6_18 ))
View(questao_2)

boxplot(FILHOS_6_18 ~ ID_TRABALHA,data=questao_2)





#############################################################################
#3. Construa uma tabela de referencia cruzada entre ID_ENSINO SUPERIOR e ID_TRABALHA. Interprete os resultados.


table(trabalho$ID_ENSINO_SUPERIOR,trabalho$ID_TRABALHA) 
table(trabalho$ID_TRABALHA,trabalho$ID_ENSINO_SUPERIOR)

#############################################################################
#4- Ajuste o modelo de regress̃ao linear para o conjunto de dados, considerando ID TRABALHA a variável resposta
#e FILHOS 5, FILHOS 6 18, IDADE e RENDA FAMILIA as covariáveis (ou variáveis explicativas do modelo).

modelo <- glm(ID_TRABALHA~FILHOS_5+FILHOS_6_18+IDADE+RENDA_FAMILIA,data = trabalho, family = binomial)
summary(modelo)

#############################################################################
# 5.	Quais os valores dos coeficientes? 

cbind(modelo$coefficients, # Coefficients reporta coef, ep, z e p-value
      razao_chances=exp(coef(modelo))) # coef(fitlog) reporta s? coef

#############################################################################
#6.	Quais variáveis explicativas são significativas para explicar a variável resposta ID TRABALHA? 


#############################################################################
#7.	Calcule e interprete as razões de chances das covariáveis significativas. 
#RESPIDO NO RELATORIO

#############################################################################
# 8.	Calcule a probabilidade da mulher trabalhar para cada pessoa da amostra. 
probs_preditas <- modelo$fitted.values
summary(probs_preditas)

dados_predito <- data.frame(trabalho,probs_preditas)
View(dados_predito)
head(dados_predito)

require(dplyr)
dados_predito_2 <- arrange(dados_predito,desc(probs_preditas))
View(dados_predito_2)


#############################################################################
#9.	Qual o perfil da mulher que possui maior probabilidade de trabalhar fora? 
#E o perfil da mulher que possui menor probabilidade de trabalhar fora? 

#MAIOR PROBABILIDADE
maior_prob <- dados_predito_2[1,]
print(maior_prob)
View(maior_prob)

#MENOR PROBABILIDADE
menor_prob <- dados_predito_2[nrow(dados_predito_2),]
print(menor_prob)
