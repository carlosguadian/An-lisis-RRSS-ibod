Para acceder a la api de Facebook tenemos varias opciones.

La más fácil y sencilla es utilizar Netvizz

- Netvizz -

Es una aplicación que se encuentra en Facebook.

url: https://apps.facebook.com/netvizz/

Netvizz es una herramienta que extrae datos de diferentes secciones de la plataforma de Facebook, en particular grupos y páginas, con fines de investigación. Las salidas de archivos se pueden analizar fácilmente en el software estándar.

Actualmente (febrero 2017) están disponibles los siguientes módulos:

- Datos de grupo - crea redes y archivos tabulares para la actividad del usuario alrededor de las publicaciones de los grupos
- Datos de página - crea redes y archivos tabulares para la actividad del usuario alrededor de las publicaciones en las páginas
- Página como red - crea una red de páginas conectadas a través de los gustos entre ellos
- Page timeline images - crea una lista de todas las imágenes del álbum "Timeline Photos" en las páginas
- Búsqueda - interfaz a la función de búsqueda de Facebook
- Estadísticas de vínculos - proporciona estadísticas de los enlaces compartidos en Facebook

Las páginas o grupos grandes pueden tardar algún tiempo en procesarse (minutos u horas). Sea paciente y trate de no recargar!

- Módulo de datos de página -

Este módulo obtiene mensajes (especifique el último n o un intervalo de fechas) en una página y crea una serie de archivos:

- Un archivo tabular (tsv) que lista una serie de métricas para cada publicación.
- Un archivo tabular (tsv) que lista las estadísticas básicas por día para el período cubierto por las publicaciones seleccionadas.
- Un archivo tabular (tsv) que enumera el número de usuarios de página por país (sólo para los 45 principales países).
- Un archivo tabular (tsv) que contiene el texto de los comentarios de los usuarios (usuarios anónimos).
- Un archivo de gráfico bipartito (gdf) que muestra mensajes, usuarios (anónimos) y conexiones entre los dos. Un usuario está conectado a un puesto si ha comentado o reaccionado en él.

Atención: El tiempo de procesamiento depende mucho del tamaño de la página, puede tardar hasta una hora o más. El script puede quedarse sin memoria o acceder a créditos para páginas muy grandes (> 1M comentarios / gustos). Considere la posibilidad de acumular estadísticas sólo o trabajar con bloques de fecha más pequeños.

En la primera ejecución, seleccione siempre "estadísticas posteriores" para tener una idea del tamaño de la página.

Las publicaciones que se recuperan dependen de si te gusta la página o no. En algunos casos, incluso si te gusta la página, Facebook ahora sólo permite el acceso a los 600 puestos más recientes en un año determinado. Si no te gusta la página, sólo podrás obtener los 600 mensajes que Facebook considera los más relevantes. Consulte la documentación de referencia api para el punto final de página / feed en el que se basa este módulo.

- Obtener ID de la página -

Para ejecutar la aplicación es necesario obtener el ID de la página

https://lookup-id.com/

- Para el ejercicio - 

- Seleccionaremos una página, buscaremos su ID y la introducimos en el formulario
- En "date scope" seleccionamos "post between"
- En "data to get" seleccionamos full data
- finalmente seleccionamos "posts by page and users"

Dependiendo del rango de fecha que hayamos pedido y de la actividad de la página, la aplicación tardará más o menos. Al terminar habrá un fichero zip disponible con toda la información.