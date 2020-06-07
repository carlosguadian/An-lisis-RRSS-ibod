###búsqueda tuits####
library(rtweet)
library(tidyverse)
library(lattice)
library(udpipe)
library(magick)
library(cowplot)
library(ggimage)
library(ggplot2)
library(grid)
library(ggthemes)

#info
# https://rtweet.info/
# api google maps AIzaSyBMkgWTPYq753SKOhL9-9qp26NZaUHKQLw

#búsqueda#
tmls <- search_tweets(
  "Cambiar por la búsqueda", n = 10000, lang = "es",
  include_rts = FALSE, 
  retryonratelimit = TRUE
)

#Si se quiere incluir una búsqueda geolocalizada añadir (, geocode='40.41654,-3.70348,434mi') sustituyendo las coordenadas y la distancia.

#Guardar el archivo de resultado como CSV
write_as_csv(tmls, 'tmls', prepend_ids = TRUE, na = "",
             fileEncoding = "UTF-8")
             
#Dibujar la serie para ver la incidencia temporal
tmls %>%
  ts_plot("3 hours") +
  ggplot2::theme_minimal() +
  ggplot2::theme(plot.title = ggplot2::element_text(face = "bold")) +
  ggplot2::labs(
    x = NULL, y = NULL,
    title = "Frecuencia de los Tuits",
    subtitle = "Agregados en intervalos de tres horas",
    caption = "\nSource: Data collected from Twitter's REST API via rtweet"
  )
  
# Generar tabla con los Top 20 Hashtags
tmls %>% 
  unnest(hashtags) %>% 
  count(hashtags = tolower(hashtags)) %>% 
  arrange(desc(n)) %>% 
  mutate(hashtags = fct_reorder(hashtags,-n, .desc = TRUE)) %>% 
  drop_na() %>% 
  slice(1:20) %>% 
  ggplot() + geom_bar(aes(hashtags,n), stat = "identity", fill = "#000080") +
  coord_flip() +
  ggplot2::theme_minimal()+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.text.y = element_text(face = c('bold'),
                                   size = 14,
                                   color = "#000080")) +
  labs(title = "Top 20 Hashtags",
       subtitle = "",
       caption = "Data Source: twitter",
       y = "Número de Tweets",
       x = "Hashtags") -> top20_plot

top20_plot

#Usuarios más populares
tmls %>% 
  top_n(5, followers_count) %>% 
  arrange(desc(followers_count)) %>% 
  select(screen_name, followers_count, location, text)

#El tweet más popular
tuitpopular = tmls %>% 
  filter(!is_retweet) %>% 
  filter(retweet_count == max(retweet_count)) %>% 
  select(screen_name, retweet_count, followers_count, location, text)


#top ten tuits
#ConRT
toptentuitsRT = tmls %>% 
  top_n(76647, retweet_count) %>% 
  arrange(desc(retweet_count)) %>% 
  select(screen_name, text, retweet_count)

toptentuitsRT = unique(toptentuitsRT)

#Procedencia de los usuarios
tmls %>%
  filter(location != "", !is.na(location)) %>% 
  count(location) %>% 
  top_n(10, n) %>% 
  ggplot() +
  geom_col(aes(x = reorder(location, n), y = n)) + 
  coord_flip() +
  labs(title = "Procedencia de los usuarios",
       x = "ubicación",
       y = "cantidad")
