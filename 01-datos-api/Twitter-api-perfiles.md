#Extraer info de la API de Twitter
##Información sobre perfiles

###Métodos de acceso a la API

A la *API* de Twitter se puede acceder de diferentes maneras. La opción más habitual es mediante una aplicación, o mediante un lenguaje de programación como `R`, `Python`, `Java`...

En nuestro caso lo haremos utilizando *R* y *RStudio* junto con el paquete *TwitteR*

###R

*R* es un **lenguaje y un entorno para la informática estadística y los gráficos**. Es un proyecto GNU que es similar al lenguaje S, el entorno que fue desarrollado en Bell Laboratories (anteriormente AT & T, ahora Lucent Technologies) por John Chambers y colegas.

*R* **proporciona** una amplia variedad de modelos estadísticos (modelos lineales y no lineales, pruebas estadísticas clásicas, análisis de series de tiempo, clasificación, agrupación, ...) y técnicas gráficas, y es muy extensible mediante paquetes.

Una de las **fortalezas** de *R* es la facilidad con la que se pueden producir documentos de calidad de publicación bien diseñados, incluyendo símbolos matemáticos y fórmulas donde sea necesario. Se ha tenido mucho cuidado con los valores predeterminados de las opciones de diseño menores en gráficos, pero el usuario mantiene el control total.

*R* está **disponible como Software Libre** bajo los términos de la *GNU General Public License* de la Fundación de Software Libre en forma de código fuente. Compila y ejecuta en una amplia variedad de plataformas UNIX y sistemas similares (incluyendo FreeBSD y Linux), Windows y MacOS.

###RStudio

*RStudio* es un entorno de desarrollo integrado (IDE) para R (lenguaje de programación) . Incluye una consola, editor de sintaxis que apoya la ejecución de código, así como herramientas para el trazado, la depuración y la gestión del espacio de trabajo.

*RStudio* está disponible para Windows, Mac y Linux o para navegadores conectados a *RStudio Server* o *RStudio Server Pro* (Debian / Ubuntu, RedHat / CentOS, y SUSE Linux).

###Paquete TwitteR

*TwitteR* es un paquete R que proporciona acceso a la API de Twitter. La mayoría de la funcionalidad de la API se admiten, con un sesgo hacia las llamadas API que son más útiles en el análisis de datos en lugar de la interacción diaria.

###Ejercicio

- *Descarga e Instala R* https://cran.rediris.es/
- *Descarga e Instala RStudio* https://www.rstudio.com/products/rstudio/download/#download

Ahora viene la *parte complicada* :smirk:

####La API Twitter

La API de Twitter es el entorno de programación que nos va a permitir acceder a información de forma directa. Las peticiones de información están limitadas para asegurar

> Los límites de la *API* afecta tanto a nuestras peticiones de información, como a la actividad habitual que podamos hacer con nuestro perfil. Por ejemplo el máximo de mensajes directos diarios que se pueden enviar son 1000, publicar 2400 tweets por día o seguir a 1000 nuevos usuarios cada 24 horas.

Estas *limitaciones* también tienen que ver dependiendo de la API que utilicemos:
- *La API REST* es utilizada por muchas aplicaciones para hacer cosas como publicar Tweets, seguir a alguien, crear listas y más.
- *La API de búsqueda* es para realizar búsquedas, tal como lo haría en Twitter.com.
- *La API Streaming* es para desarrolladores de aplicaciones que desean recibir un flujo en tiempo real de los Tweets públicos en Twitter.

####Definir una app en Twitter

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

####Abrir RStudio y configurar el script

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

####Instalación de TwitteR

- Instalar el paquete Twitter y habilitarlo ejecutando las líneas 4 y 5. Esto sólo la primera vez. Si no es la primera vez sólo la 5.

```R
install.packages("twitteR") #usar sólo la primera vez, después comentar con #
library(twitteR)
```

####Identificación, petición de información y exportar resultados

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

- *Documentación sobre R* https://www.r-project.org/about.html
- *Descarga de R* https://cran.rediris.es/
- *RStudio* https://www.rstudio.com/
- *Descarga de RStudio* https://www.rstudio.com/products/rstudio/download/#download
- *Documentación REST API* https://dev.twitter.com/rest/public
- *Límites de la API de Twitter* https://support.twitter.com/articles/160385
- *Documentación del paquete TwitteR* https://cran.r-project.org/web/packages/twitteR/twitteR.pdf