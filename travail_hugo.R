#Mettre le year format date
data_nat_clean$year <- str_pad(data_nat_clean$year,5,"right")
data_nat_clean$year <- str_replace(data_nat_clean$year," ","-31-12")
data_nat_clean$year <- as.Date(data_nat_clean$year, format="%Y-%d-%m")

#Calculer le nombre de prénom unique
distinct_names <- data_nat_clean %>% 
                  group_by(year) %>% 
                  distinct(firstname) %>%
                  summarise(n_names = n())

#Plot le résultat                  
plot_distinct_names <- 
  distinct_names %>% 
  ggplot(aes(x=year, y=n_names)) + 
  geom_line(size=1.2, color="blue") +         
  ggtitle("Number of French unique names from 1900 to 2018") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Year") + ylab("Number of unique names")

plot_distinct_names

#Ajoute la différence selon l'année
distinct_names$ratio <- ((distinct_names$n_names-lag(distinct_names$n_names))/
                           (distinct_names$n_names+lag(distinct_names$n_names))*100)

#Plot la différence d'augmentation
plot_ratio <- distinct_names %>% 
  ggplot(aes(x=year, y=ratio)) + 
  geom_hline(yintercept=0, size = 1) +
  geom_line(size = 1.2, color = "red") +
  ggtitle("Evolution of names from 1900 to 2018") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Year") + ylab("Percentage of difference")
plot_ratio