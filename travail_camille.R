data_nat_clean$year <- str_pad(data_nat_clean$year,5,"right")
data_nat_clean$year <- str_replace(data_nat_clean$year," ","-31-12")
data_nat_clean$year <- as.Date(data_nat_clean$year, format="%Y-%d-%m")
library(lubridate)

zinedine <- data_nat_clean # %>% filter(year(year) > 1993 & year(year)<2003)
#zinedine$year <- as.factor(zinedine$year)
zinedine1 <- zinedine %>% filter(firstname == "ZINEDINE"  | firstname=="BIXENTE" | firstname=="YOURI")
graph <- ggplot(zinedine1, aes(x = year, y = number, colour = firstname))+ 
  geom_line(size=1.5) + 
  ggtitle("Plot of number of name by years for football player in 1998") +
  xlab("Year") + ylab("Number of name") +
  geom_vline(aes (xintercept =as.numeric(as.Date("1998-01-01"))), linetype = "longdash")+
  geom_label(x=as.numeric(as.Date("1998-01-01")), y=180, label="1998 Football world cup",colour = "black", show.legend=FALSE)
graph

#CM18 <- data_nat_clean %>% filter(year(year) > 2010 )
#CM18 <- CM18  %>% filter(firstname == "ANTOINE"  | firstname=="KYLIAN" | firstname=="BLAISE" | firstname=="BENJAMIN" | firstname=="SAMUEL" | firstname=="HUGO")
#graph <- ggplot(CM18, aes(x = year, y = number, colour = firstname))+ 
 # geom_line(size=1.5) + ggtitle("Plot of number of name by years for football player IN 2018") +
  #xlab("Year") + ylab("Number of name")
#graph

got <- data_nat_clean %>% filter(firstname=="BRAN" |firstname == "SANSA" |firstname == "DAENERYS")
got <- got %>% filter(year(year) > 2004 )
graph <- ggplot(got, aes(x = year, y = number, colour = firstname))+ 
  geom_line(size=1.5) +
  ggtitle("Plot of number of name by years in link with Game of throne") +
  xlab("Year") + ylab("Number of name")+
  geom_vline(aes (xintercept =as.numeric(as.Date("2011-01-01"))), linetype = "longdash")+
  geom_label(x=as.numeric(as.Date("2011-01-01")), y=20, label="Game of throne, season 1",colour = "black", show.legend=FALSE)
graph


cinema <- data_nat_clean %>% filter(firstname=="NEO" |firstname == "BELLA" |firstname == "ANAKIN")
cinema <- cinema%>% filter(year(year) > 1990 )
graph <- ggplot(cinema, aes(x = year, y = number, colour = firstname))+ 
  geom_line(size=1.5) + ggtitle("Plot of number of name by years in link with the cinema") +
  xlab("Year") + ylab("Number of name")+
  geom_vline(aes (xintercept =as.numeric(as.Date("1999-01-01"))), linetype = "longdash")+
  geom_label(x=as.numeric(as.Date("1999-01-01")), y=25, label="Matrix",colour = "black", size = 3, show.legend=FALSE)+
  geom_vline(aes (xintercept =as.numeric(as.Date("2009-01-01"))), linetype = "longdash")+
  geom_label(x=as.numeric(as.Date("2009-01-01")),y=105, label="Twilight",colour = "black", size = 3, show.legend=FALSE)+
  geom_label(x=as.numeric(as.Date("1999-01-01")), y=100, label="Star Wars: Episode I ",colour = "black", size = 3, show.legend=FALSE)
graph

adolphe <- data_nat_clean %>% filter(firstname == "ADOLPHE" & sex=="1")
adolphe <- adolphe %>% filter(year(year) > 1909 & year(year) < 1951 )
victoire <- data_nat_clean %>% filter(firstname == "VICTOIRE" & sex=="2")
victoire <- victoire %>% filter(year(year) > 1909 & year(year) < 1951 )

ww <- data_nat_clean %>% filter(firstname == "JOFFRE" | firstname == "JOFFRETTE"| firstname == "ADOLPHINE")
ww <- ww%>% filter(year(year) > 1909 & year(year) < 1951 )
ww <- bind_rows(ww, adolphe, victoire)
graph <- ggplot(ww, aes(x = year, y = number, colour = firstname))+ 
  geom_line(size=1) + ggtitle("Plot of number of name by years in link with the world wars") +
  xlab("Year") + ylab("Number of name")+
  geom_vline(aes (xintercept =as.numeric(as.Date("1914-01-01"))), linetype = "longdash")+
  geom_label(x=as.numeric(as.Date("1914-01-01")), y=0, label="Marne's Battle",colour = "black", size = 2.5, show.legend=FALSE)+
  geom_vline(aes (xintercept =as.numeric(as.Date("1921-01-01"))), linetype = "longdash")+
  geom_label(x=as.numeric(as.Date("1921-01-01")),y=550, label="Hitler leader of the NSDAP",colour = "black", size = 2.5, show.legend=FALSE)+
  geom_vline(aes (xintercept =as.numeric(as.Date("1918-01-01"))), linetype = "longdash")+
  geom_label(x=as.numeric(as.Date("1918-01-01")), y=500, label="End of the World War I",colour = "black", size = 2.5, show.legend=FALSE)+
  geom_vline(aes (xintercept =as.numeric(as.Date("1945-01-01"))), linetype = "longdash")+
  geom_label(x=as.numeric(as.Date("1945-01-01")), y=200, label="End of the World II",colour = "black", size = 2.5, show.legend=FALSE)
graph

