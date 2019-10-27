rm(list=ls()) #remove everything that is in the environment

#Importe les données d'un site et on donne un nom à notre dataframe
library(readr)
library(tidyverse)

data_nat <- read.csv("nat2018.csv",sep = ";", encoding = "UTF-8")
data_dpt <- read.csv("dpt2018.csv",sep = ";", encoding = "UTF-8")

data_nat_clean <- data_nat %>% filter(!is.na(preusuel)) %>% #Remove empty firstname
  filter(preusuel != "_PRENOMS_RARES") %>% #Remove rare firstnames
  filter(annais != "XXXX") %>% #Remove year 2019
  rename(sex = X.U.FEFF.sexe, year = annais, firstname = preusuel, number = nombre) #Rename variables to english

data_dpt_clean <- data_dpt %>% filter(!is.na(preusuel)) %>% #Remove empty firstname
  filter(preusuel != "_PRENOMS_RARES") %>% #Remove rare firstnames
  filter(annais != "XXXX") %>% #Remove year 2019
  rename(sex = X.U.FEFF.sexe, year = annais, firstname = preusuel, department = dpt, number = nombre) #Rename variables to english
