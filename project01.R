library(rvest)
library(dplyr)
library(robotstxt)

path = paths_allowed("https://rvest.tidyverse.org/articles/starwars.html")

link <- "https://rvest.tidyverse.org/articles/starwars.html"

web <- read_html(link)

name <- web%>% html_nodes("#main h2") %>% html_text()

release <- web%>% html_nodes("section > p:nth-child(2)") %>% html_text()

directors <- web%>% html_nodes("#the-force-awakens~ p+ p , #return-of-the-jedi~ p+ p , #the-empire-strikes-back~ p+ p , #a-new-hope~ p+ p , #revenge-of-the-sith~ p+ p , #attack-of-the-clones~ p+ p , .director , #the-phantom-menace~ p+ p") %>% html_text()

View(name)

View(release)

View(directors)

film.starwars <- data.frame(name, release, directors)

View(film.starwars)

write.csv(film.starwars, "film_starwars.csv")