data_dpt_clean$year <- str_pad(data_dpt_clean$year,5,"right")
data_dpt_clean$year <- str_replace(data_dpt_clean$year," ","-31-12")
data_dpt_clean$year <- as.Date(data_dpt_clean$year, format="%Y-%d-%m")
library(lubridate)

eco <- read.csv("eco.csv",sep = ";", encoding = "UTF-8")

dep <- data_dpt_clean %>% filter(year(year)>1989 & year(year)<2013)
dep <-dep %>% mutate(department=case_when(
    department %in% c("95", "78", "91", "77","94","92","93","75") ~ "Ile de France",
    department %in% c("08","51","10","52") ~ "Champagne Ardenne",
    department %in% c("02","60","80") ~ "Picardie",
    department %in% c("76", "27") ~ "Haute normandie",
    department %in% c("18","28","36","37", "41", "45") ~ "Centre",
    department %in% c("14","50","61") ~ "Basse Normandie",
    department %in% c("21", "58", "71", "89") ~ "Bourgogne",
    department %in% c("59","62") ~ "Nord Pas de Calais",
    department %in% c("54","55","57", "88") ~ "Lorraine",
    department %in% c("67", "68") ~ "Alsace",
    department %in% c("25","39","70","90") ~ "Franche Comté",
    department %in% c("44","49","53", "72","85") ~ "Pays de la Loire",
    department %in% c("22", "29", "35", "56") ~ "Bretagne",
    department %in% c("16","17","79","86") ~ "Poitou Charente",
    department %in% c("24","33","40","47","64") ~ "Aquitaine",
    department %in% c("09", "12", "31", "32","46","65","81","82") ~ "Midi-Pyrenées",
    department %in% c("19","23","87") ~ "Limousin",
    department %in% c("01","07","26","38","42","69","73","74") ~ "Rhone-Alpes",
    department %in% c("03", "15", "43", "63") ~ "Auvergne",
    department %in% c("11","30","34","48", "66") ~ "Languedoc Roussillon",
    department %in% c("04","05","06","13", "83","84") ~ "Provence Alpes Cote d'Azur ",
    department %in% c("02") ~ "Corse",
  ))

eco2000 <- dep %>% filter(year(year)==2000) %>% group_by(department, firstname) %>% summarize(sum(number))
