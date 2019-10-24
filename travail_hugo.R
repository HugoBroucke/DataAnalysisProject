rm(list=ls()) #remove everything that is in the environment

#Importe les données d'un site et on donne un nom à notre dataframe
library(readr)
library(tidyverse)
library(stats)
getwd()
data <- read.csv("nat2018.csv",sep = ";", encoding = "UTF-8")

data2 <- data %>% filter(!is.na(preusuel)) %>% #Remove empty firstname
  filter(preusuel != "_PRENOMS_RARES") %>% #Remove rare firstnames
  filter(annais != "XXXX") %>% #Remove year 2019
  rename(sex = sexe, year = annais, firstname = preusuel, number = nombre) #Rename variables to english

# Statistiques de bases
n <- data2 %>% select(firstname) %>% distinct() %>% nrow() 
ngirls <- data2 %>% filter(sex==2) %>% select(firstname) %>% distinct() %>% nrow() 
nboys <- data2 %>% filter(sex==1) %>% select(firstname) %>% distinct() %>% nrow()

# Graphique des prénoms différents par années



rm(list=ls()) #remove everything that is in the environment

#Importe les données d'un site et on donne un nom à notre dataframe
library(readr)
library(tidyverse)
library(stats)
getwd()
data <- read.csv("nat2018.csv",sep = ";", encoding = "UTF-8")


#mettre la date au format année
test <- data %>% filter(preusuel == "ZINEDINE")
test$annais <- str_replace(test$annais,"XXXX","2019-15-07")
test$annais <- str_pad(test$annais,5,"right")
test$annais <- str_replace(test$annais," ","-31-12")
test$annais <- as.Date(test$annais, format="%Y-%d-%m")


#obtenir le lag
test$lag <- lag(test$nombre)
#obtenir la diff d'une aannée à l'autre
test <- test %>% mutate(diff = nombre-lag)

ggplot(test)+geom_line(aes(x=annais, y=nombre), col="black")+geom_line(aes(x=annais, y =diff), col="red")  

#Nombre de prénom différents existant
n <- data %>% select(preusuel) %>% distinct() %>% nrow() 
n



#####
data2 <- data %>% filter(!is.na(preusuel)) %>% #Remove empty firstname
  filter(preusuel != "_PRENOMS_RARES") %>% #Remove rare firstnames
  filter(annais != "XXXX") %>% #Remove year 2019
  rename(sex = sexe, year = annais, firstname = preusuel, number = nombre) #Rename variables to english

#Transform factor variables to characters
data2$firstname <- as.character(data2$firstname)
data2$year <- as.character(data2$year)

data2$lag <- 0
nr <- nrow(data2)

for(i in 1:nr) {
  if (i == data2$sex){
    data2[i,data2$lag] <- data2[i,data2$number]
  } else {
    if (data2[i,data2$firstname] == data2[i-1,data2$firstname]){
      data2[i,data2$lag] <- data2[i-1,data2$number]
    } else {
      data2[i,data2$lag] <- data2[i,data2$number]
    }
  }
  print(i)
}  

data$diff <- nom-lag

