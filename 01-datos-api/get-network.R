#cargar paquetes

library(rtweet)
library(igraph)

#Búsqueda de tweets
tmls <- search_tweets(
  "poner la búsqueda", n = 100, lang = "ca",
  include_rts = FALSE, 
  retryonratelimit = FALSE
)

## Crear un grafo utilizando retweet/mention/reply conexiones
tmls_net <- network_data(tmls1, "retweet,mention,reply")
## Si igraph está instalado...
## Convertir en una red semántica
  tmls_net <- network_graph(tmls)

write_graph(tmls_net, "grafo.gml", "gml")
