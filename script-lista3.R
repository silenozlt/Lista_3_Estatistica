######################################
## LISTA 3

rm(list=ls(all=TRUE))

setwd("/Users/cassio/Dropbox/Pos Data Science/Lista_3_Estatistica")

trabalho <- read.table("trabalho.txt",header = TRUE)

# Carregando os dados:
View(trabalho)


#############################################################################
#1- Construa boxplots representando o número de filhos ate cinco anos para as
#mulheres que trabalham e outro para as que não trabalham. Qual a sua interpretacao sobre o grafico? 
questao_1 <- subset(trabalho, ID_TRABALHA == 1  , select = c(ID_TRABALHA, FILHOS_5 ))
View(questao_1)
trabalha_1 <- sum(questao_1$FILHOS_5)
View(trabalha_1)

questao_1a <- subset(trabalho, ID_TRABALHA == 0  , select = c(ID_TRABALHA, FILHOS_5 ))
View(questao_1a)
trabalha_0 <- sum(questao_1a$FILHOS_5)
View(trabalha_0)

boxplot(trabalha_0 )
boxplot(trabalha_1 )

#############################################################################
#2. Repita o item anterior para as variáveis FILHOS 6 18, IDADE e RENDA FAMILIA. Interprete os gŕaficos



