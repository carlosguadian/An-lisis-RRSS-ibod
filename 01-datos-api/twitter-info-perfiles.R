###extraer info de perfiles

#primero poner en marcha el acceso a la api
install.packages("twitteR") #usar sólo la primera vez, después comentar con #
library(twitteR)
setup_twitter_oauth("4WtK0KdogKav5zDW2y5Edg", 
                    "lHvkW4ZcVxLZV7oISX2Onh7QscZo5HvFj6SxWQ", 
                    "3136731-XlYkEH0CaTQLLWe0Xb1Ufo5FoSDT66MUq8CzJkiTYM", 
                    "g14eiVvpxXNFCATqeuIEOVPFmARQNoLQeS1gbTvo30")

#seleccionar la opción 1 para loguarse automáticamente posteriores veces

#obtener info de un perfil. Sustituir "nomusuari" por el que correspoonda
user <- getUser('nomusuari')
nomusuari <- lookupUsers('nomusuari')
nomusuari <- twListToDF(nomusuari)
write.csv(nomusuari, "datos-nomusuari.csv")

#si se quiere info de varios perfiles
users <- lookupUsers(c('nomusuari1','nomusuari2'))
infousers <- twListToDF(users)
write.csv(infousers, "datos-usuarios.csv")

#obtener tweets del usuario
tweetsuser <- userTimeline(user, includeRts=FALSE, n=50)
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
