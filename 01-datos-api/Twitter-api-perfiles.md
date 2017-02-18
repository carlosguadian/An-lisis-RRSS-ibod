#Extraer info de la API de Twitter
##Información sobre perfiles

###Métodos de acceso a la API

###R

###Ejercicio

- *Instala R* https://cran.rediris.es/
- *Instala RStudio* https://www.rstudio.com/products/rstudio/download/#download

Ahora viene la *parte complicada* :smirk:

####La API Twitter

La API de Twitter es el entorno de programación que nos va a permitir acceder a información de forma directa. Las peticiones de información están limitadas para asegurar

> Los límites de la *API* afecta tanto a nuestras peticiones de información, como a la actividad habitual que podamos hacer con nuestro perfil. Por ejemplo el máximo de mensajes directos diarios que se pueden enviar son 1000, publicar 2400 tweets por día o seguir a 1000 nuevos usuarios cada 24 horas.

Estas *limitaciones* también tienen que ver dependiendo de la API que utilicemos:
- *La API REST* es utilizada por muchas aplicaciones para hacer cosas como publicar Tweets, seguir a alguien, crear listas y más.
- *La API de búsqueda* es para realizar búsquedas, tal como lo haría en Twitter.com.
- *La API Streaming* es para desarrolladores de aplicaciones que desean recibir un flujo en tiempo real de los Tweets públicos en Twitter.

###Definir una app en Twitter

**Primero hay que definir una app en Twitter** para poder tener acceso a la API. Esto es necesario porque sólo puedes pedir peticiones de información a la api un cierto número de veces cada cierto tiempo. 

- Tienes que ir a https://apps.twitter.com
- Te identificas con tu twitter
- Haces clic en el botón "create new app"
- Rellena el primer formulario "application details"
	- name
	- description
	- website (puedes poner la url de tu blog)
- Marca la conformidad de condiciones "developer agreement"
- Haz clic en Create your twitter application
- En la página que aparece tienes que hacer clic en "keys and access tokens"
- Bajas a pie de página y haz clic en "create my access token"
- Deja abierta esta página

#Abrir RStudio y configurar el script

- Abre Rstudio
- abre el archivo adjunto a RStudio `twitter-api.r` desde `file> open file`
- Antes que nada tienes que poner la información de la app de Twitter en las líneas 6,7,8 y 9. Sustituye el que hay entre las comillas, cada valor por el que se indica. Es decir "Consumer Secret" por el valor que te dice en la app de Twitter.

```R
setup_twitter_oauth("Consumer Key", 
                    "Consumer secret", 
                    "Access Token", 
                    "Access Token secret")
```

> Una línea se ejecuta haciendo clic sobre ella y luego haciendo clic en "run", el botón superior.

- Instalar el paquete Twitter y habilitarlo ejecutando las líneas 4 y 5. Esto sólo la primera vez. Si no es la primera vez sólo la 5.

```R
install.packages("twitteR") #usar sólo la primera vez, después comentar con #
library(twitteR)
```
- Identificarse ejecutando las líneas 6,7,8 y 9
- A la pregunta que sale en la parte inferior hay que responder con un "1" (sin las comillas), así ya se identificará automáticamente para próximas veces.
- Para extraer info de un usuario específico, en la línea 14 donde pone "nom-usuari" hay que escribir el nombre de usuario del que se quiera la información.

```R
user <- getUser('nom-usuari')
```
- Para obtener los usuarios que sigue dicho usuario ejecutar de la 32 a la 37

```R
#obtener datos sobre los users que sigue
friendsU <- user$getFriends()
#convertirlo en data frame para su exportación
friends<- twListToDF(friendsU)
#exportarlo como csv
write.csv(friends, file='usuario-seguidos.csv', row.names=F)
```

- Ahora ya tendrás un csv con toda la info que ya puedes analizar con una hoja de cálculo. El csv se habrá guardado en el directorio definido. Si no se ha hecho se guardará en el escritorio.

> En el archivo `twitter-info-perfiles.R` hay diferentes bloques de código preparados para ejecutar diferentes peticiones de información. hay para hacer una búsqueda, pedir los seguidores, etc... Cada bloque está comentado indicando su funcionalidad.

###Recursos

- *Límites de la API de Twitter* https://support.twitter.com/articles/160385
