###extraer info de perfiles

#primero poner en marcha el acceso a la api
install.packages("twitteR") #usar sólo la primera vez, después comentar con #
library(twitteR)
setup_twitter_oauth("Consumer Key", 
                    "Consumer secret", 
                    "Access Token", 
                    "Access Token secret")

#seleccionar la opción 1 para loguarse automáticamente posteriores veces

#obtener info de un perfil
user <- getUser('nom-usuari')

#si se quiere info de varios perfiles
users <- lookupUsers(c('usuario1','usuario2'))
infousers <- twListToDF(users)
write.csv(infousers, "datos-usuarios.csv")

#obtener tweets del usuario
tweetsuser <- userTimeline(user, includeRts=FALSE, n=500)
Usuaritweets <- twListToDF(tweetsuser)
write.csv(Usuaritweets, file='tweets-usuario.csv', row.names=F)

#obtener tweets de una búsqueda
mentionsU <- searchTwitter('busqueda que se quiera realizar', resultType="recent",
                           n=100)
busquedatweets <- twListToDF(mentionsU)
write.csv(busquedatweets, file='tweets-busqueda.csv', row.names=F)

#obtener datos sobre los users que sigue
friendsU <- user$getFriends()
#convertirlo en data frame para su exportación
friends<- twListToDF(friendsU)
#exportarlo como csv
write.csv(friends, file='usuario-seguidos.csv', row.names=F)

#obtener datos sobre los users que le siguen
followU <- user$getFollowers()
#convertirlo en data frame para su exportación
followers <- twListToDF(followU)
#exportarlo como csv
write.csv(followers, file='usuario-seguidores.csv', row.names=F)
