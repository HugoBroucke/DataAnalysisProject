data_dpt_clean$year <- str_pad(data_dpt_clean$year,5,"right")
data_dpt_clean$year <- str_replace(data_dpt_clean$year," ","-31-12")
data_dpt_clean$year <- as.Date(data_dpt_clean$year, format="%Y-%d-%m")
library(lubridate)

eco <- read.csv("eco.csv",sep = ";", encoding = "UTF-8")

dep <- data_dpt_clean %>% filter(year(year)>1989 & year(year)<2013)
dep <-dep %>% mutate(department=case_when(
    department %in% c("95", "78", "91", "77","94","92","93","75") ~ "R11 Ile-de-France",
    department %in% c("08","51","10","52") ~ "R21 Champagne-Ardenne",
    department %in% c("02","60","80") ~ "R22 Picardie",
    department %in% c("76", "27") ~ "R23 Haute-normandie",
    department %in% c("18","28","36","37", "41", "45") ~ "R24 Centre",
    department %in% c("14","50","61") ~ "R25 Basse-Normandie",
    department %in% c("21", "58", "71", "89") ~ "R26 Bourgogne",
    department %in% c("59","62") ~ "R31 Nord-Pas-de-Calais",
    department %in% c("54","55","57", "88") ~ "R41 Lorraine",
    department %in% c("67", "68") ~ "R42 Alsace",
    department %in% c("25","39","70","90") ~ "R43 Franche-Comté",
    department %in% c("44","49","53", "72","85") ~ "R52 Pays de la Loire",
    department %in% c("22", "29", "35", "56") ~ "R53 Bretagne",
    department %in% c("16","17","79","86") ~ "R54 Poitou-CharenteS",
    department %in% c("24","33","40","47","64") ~ "R72 Aquitaine",
    department %in% c("09", "12", "31", "32","46","65","81","82") ~ "R73 Midi-Pyrenées",
    department %in% c("19","23","87") ~ "R74 Limousin",
    department %in% c("01","07","26","38","42","69","73","74") ~ "R82 Rhone-Alpes",
    department %in% c("03", "15", "43", "63") ~ "R83 Auvergne",
    department %in% c("11","30","34","48", "66") ~ "R91 Languedoc-Roussillon",
    department %in% c("04","05","06","13", "83","84") ~ "R93 Provence-Alpes-Cote d'Azur ",
    department %in% c("20") ~ "R94 Corse",
    department %in% c("971", "972", "973", "974") ~ "ROM Départements d'Outre-Mer",
  ))
dep <- dep %>% rename(Region = department)

eco1990boy <- dep %>% filter(sex==1, year(year)==1990) %>% 
  group_by(Region) %>%
  filter(number ==max(number))
eco1990boy <- merge(eco1990boy, eco, by = "Region")
eco1990girl <- dep %>% filter(sex==2, year(year)==1990) %>% 
  group_by(Region) %>%
  filter(number ==max(number))
eco1990girl <- merge(eco1990girl, eco, by = "Region")
eco1990 <- bind_rows(eco1990boy, eco1990girl)

graph <- ggplot(eco1990boy, aes(x = firstname, y = X1990, color=Region))+ 
  geom_point(size=1.5) + ggtitle("Plot of more popular boys firstnames in 1990 by Region and GDP") +
  xlab("GDP") + ylab("Number of name")+ theme(axis.text.x = element_text(angle = 60, hjust = 1))
graph

graph <- ggplot(eco1990girl, aes(x = firstname, y = X1990, color=Region))+ 
  geom_point(size=1.5) + ggtitle("Plot of more popular boys firstnames in 1990 by Region and GDP") +
  xlab("GDP") + ylab("Number of name")+ theme(axis.text.x = element_text(angle = 60, hjust = 1))
graph

eco2000boy <- dep %>% filter(sex==1, year(year)==2000) %>% 
  group_by(Region) %>%
  filter(number ==max(number))
eco2000boy <- merge(eco2000boy, eco, by = "Region")
eco2000girl <- dep %>% filter(sex==2, year(year)==2000) %>% 
  group_by(Region) %>%
  filter(number ==max(number))
eco2000girl <- merge(eco2000girl, eco, by = "Region")
eco2000 <- bind_rows(eco2000boy, eco2000girl)

graph <- ggplot(eco2000boy, aes(x = firstname, y = X2000, color=Region))+ 
  geom_point(size=1.5) + ggtitle("Plot of more popular boys firstnames in 2000 by Region and GDP") +
  xlab("GDP") + ylab("Number of name")+ theme(axis.text.x = element_text(angle = 60, hjust = 1))
graph

graph <- ggplot(eco2000girl, aes(x = firstname, y = X2000, color=Region))+ 
  geom_point(size=1.5) + ggtitle("Plot of more popular boys firstnames in 2000 by Region and GDP") +
  xlab("GDP") + ylab("Number of name")+ theme(axis.text.x = element_text(angle = 60, hjust = 1))
graph

eco2010boy <- dep %>% filter(sex==1, year(year)==2010) %>% 
  group_by(Region) %>%
  filter(number ==max(number))
eco2010boy <- merge(eco2010boy, eco, by = "Region")
eco2010girl <- dep %>% filter(sex==2, year(year)==2010) %>% 
  group_by(Region) %>%
  filter(number ==max(number))
eco2010girl <- merge(eco2010girl, eco, by = "Region")
eco2010 <- bind_rows(eco2010boy, eco2010girl)

graph <- ggplot(eco2010boy, aes(x = firstname, y = X2010, color=Region))+ 
  geom_point(size=1.5) + ggtitle("Plot of more popular boys firstnames in 2010 by Region and GDP") +
  xlab("GDP") + ylab("Number of name")+ theme(axis.text.x = element_text(angle = 60, hjust = 1))
graph

graph <- ggplot(eco2010girl, aes(x = firstname, y = X2010, color=Region))+ 
  geom_point(size=1.5) + ggtitle("Plot of more popular boys firstnames in 2010 by Region and GDP") +
  xlab("GDP") + ylab("Number of name")+ theme(axis.text.x = element_text(angle = 60, hjust = 1))
graph

