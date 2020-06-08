#Obtención de datos de la API
##Twitter y Facebook

> En esta carpeta se encuentran los archivos correspondientes al primer módulo del curso. Los tres archivos siguientes están pensados para trabajar con el paquete TwitteR para el que hace falta obtener claves de acceso a la API. Además también está el archivo para trabajar con Netvizz que actualmente ya no es funcional.

- El archivo `Twitter-api-perfiles.md`con la información y recursos necesarios para obtener info de la *API* de Twitter y exportar la información a un `.csv`.
- El archivo `twitter-info-perfiles.R` contiene los scripts necesarios para acceder a la api de Twitter y obtener información de perfiles.
- El archivo `facebook-api-pagina.md` con la info al respecto de Netvizz, que ofrece y como obtener datos de una página de Facebook.

> Se han incorporado tres nuevos archivos para trabajar con el paquete RTweet:

- `get-tweets-basic-analysis-RTweet.R` Está el código para hacer una búsqueda, dibujar la serie, generar una tabla con los 20 hashtags más populares, obtener los tuits y los usuarios más populares y la procedencia de los usuarios.
- `get-timelines-RTweet.R` obtiene el timeline de varios usuarios a la vez y dibuja las series para ver la comparativa.
- `get-profiles-info-RTweets.R` Permite la obtención de información de perfiles, ya sea de una lista o de los seguidores de un usuario en concreto.
- `get-network.R` Convierte la búsqueda en un archivo de grafo para su análisis en Gephi.
