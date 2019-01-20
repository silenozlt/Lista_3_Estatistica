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
questao_1 <- subset(trabalho, ID_TRABALHA == 1 & FILHOS_5 > 1 , select = c(ID_TRABALHA, FILHOS_5 ))
View(questao_1)

?subset
#EXEMPLO
#questao8_data <- subset(rais_completo, sg_estado == "MG" & Codigo ==3, select = c(descricao, renda_mensal_total, total_empregos) )

questao6 <- aggregate(cbind( trabalho$ID_TRABALHA == 1, trabalho$FILHOS_5)
                      ,by = list(trabalho$FILHOS_5), FUN = "sum" )
View(questao6)

