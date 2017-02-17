#Procesamiento de datos 2
##Google Sheets

Las hojas de cálculo de Google son una herramienta muy potente. Las vamos a utilizar para calcular diferentes indicadores y generar archivos de grafo.

###Cálculo de indicadores en una comunidad

- `Ratio de comunidad = seguidos / seguidores` Nos va a servir para poder tener un primer criterio para determinar la calidad de un usuario. 
	- `Ratio > 1` Si la ratio es superior a uno significa que sigue a más usuarios que le siguen a él. Seguramente un usuario qué busca referentes, información, o sencillamente utiliza en su estrategia seguir usuarios con el objetivo de conseguir seguidores. Cuanto mayor sea de `0` la ratio, peor calidad tendrá la comunidad.
	- `Ratio < 1` Si la ratio es inferior a uno, significa que le siguen más usuarios que los que él sigue. Tenemos un usuario que es tomado como referente por otros usuarios y que no les importa seguirlo, sin esperar a que él les siga. Cuanto más cercana sea a `0` más calidad, más referente será ese usuario.
- Actividad diaria
	- Calcularemos la media de tweets por día para determinar:
		- Si es un bot: Un usuario con una media de tweets diaria muy elevada (por encima de `25` tweets diarios de media hay que empezar a desconfiar) es muy probable que sea una cuenta automatizada.
		- Si es un usuario que sólo utiliza twitter para informarse, para leer. No para participar. Estos usuarios tendrán una media muy baja. Podemos empezar a considerarlos como tales cuando la media es inferior a `1` 
		
###Generación de archivos relacionales

	- Utilizaremos Google Sheets para generar archivos relacionales para poder utilizarlos en **Gephi**:
		- *Archivo de grafo de menciones* para poder determinar a los usuarios clave y determinar sub-comunidades.
		- *Archivo de grafo de url* para ver qué usuarios las han compartido
		- *Archivo de grafo de hashtags* para determinar como se han utilizado, y cuales han tenido más relevancia.
	- Es **importante** que la hoja de cálculo tenga la localización de Estados Unidos. Hay diferencia en el carácter que define el decimal en los números. En EEUU es un `.`, mientras que en el sistema no anglosajón el decimal es una `,`.
	- Importar el archivo resultante del proceso con **Open Refine** en un archivo nuevo de **Google Sheets**
	- Para cada tipo de archivo, abriremos una pestaña nueva
	- En la pestaña para el archivo de grafo de menciones pegaremos todas las columnas que contengan nombres de usuario, poniendo siempre la primera la que contiene el nombre de usuario del que ha publicado el tweet.
	- Para el resto de archivos de grafo copiaremos en el mismo orden las columnas correspondientes. Es decir, para el de url pegaremos las columnas de las url y para el de los hashtag, las columnas que contengan hashtags. Tanto en una como en la otra, siempre pondremos al emisor del tweet.
	- Para el caso de las url y de los hashtags lo que obtenemos es un grafo bipartito. Es decir con dos tipos de nodos.
	- Una vez tenemos montados los archivos montados, sólo hay que exportarlos como **csv** y abrirlo en **Gephi**.