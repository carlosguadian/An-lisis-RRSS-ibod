#Google Sheets

> Las hojas de cálculo de Google son una herramienta muy potente. Las vamos a utilizar para calcular diferentes indicadores y generar archivos de grafo.


- Antes de proceder al análisis de datos comprobar la localización de la página `archivo > configuración hoja de cálculo > locale`
- Es **importante** que la hoja de cálculo tenga la localización de Estados Unidos. 
- Hay diferencia en el carácter que define el decimal en los números. 
- En EEUU es un `.`, mientras que en el sistema no anglosajón el decimal es una `,`.
- La mayoría de aplicaciones / apis trabajan por defecto con el `.` para definir los decimales.


##Cálculo de indicadores en una comunidad

- `Ratio de comunidad = seguidos / seguidores` Nos va a servir para poder tener un primer criterio para determinar la calidad de un usuario. 
	- `Ratio > 1` Si la ratio es superior a uno significa que sigue a más usuarios que le siguen a él. Seguramente un usuario qué busca referentes, información, o sencillamente utiliza en su estrategia seguir usuarios con el objetivo de conseguir seguidores. Cuanto mayor sea de `0` la ratio, peor calidad tendrá la comunidad.
	- `Ratio < 1` Si la ratio es inferior a uno, significa que le siguen más usuarios que los que él sigue. Tenemos un usuario que es tomado como referente por otros usuarios y que no les importa seguirlo, sin esperar a que él les siga. Cuanto más cercana sea a `0` más calidad, más referente será ese usuario.
- Para la actividad diaria calcularemos la media de tweets por día para determinar:
	- Si es un bot: Un usuario con una media de tweets diaria muy elevada (por encima de `25` tweets diarios de media hay que empezar a desconfiar) es muy probable que sea una cuenta automatizada.
	- Si es un usuario que sólo utiliza twitter para informarse, para leer. No para participar. Estos usuarios tendrán una media muy baja. Podemos empezar a considerarlos como tales cuando la media es inferior a `1`
	
##Ejercicio

- **Para realizar estos cálculos utilizaremos** el archivo de seguidores generado en el primer módulo con los seguidores de un perfil de Twitter.
- Abrirlo en un archivo nuevo de **Google Sheets**
- Generar una columna llamada `Ratio Comunidad` y generar la fórmula para dividir los usuarios seguidos entre los seguidores.
- Para calcular la actividad media diaria de los usuarios:
	- Mediante `datos > split texto en columnas...` utilizando como separador un espacio en blanco ` `, convertir la columna `create` en `fecha` y `hora`.
	- Generar una columna nueva con la `fecha actual`. Para tener siempre el fichero actualizado a la fecha de uso utilizar la función `=TODAY()`
	- Obtener en una nueva columna el `total de días` que hace que está activo. Se resta la columna `Fecha Actual`, de la `Fecha de Creación`.
	- Cálculo de la actividad media diaria `Total de días / Statuses Count`
	
		
##Generación de archivos relacionales

- Utilizaremos Google Sheets para generar archivos relacionales para poder utilizarlos en **Gephi**:
	- *Archivo de grafo de menciones* para poder determinar a los usuarios clave y determinar sub-comunidades.
	- *Archivo de grafo de url* para ver qué usuarios las han compartido
	- *Archivo de grafo de hashtags* para determinar como se han utilizado, y cuales han tenido más relevancia.

##Ejercicio

- Importar el archivo resultante del proceso con **Open Refine** en un archivo nuevo de **Google Sheets**
- Para cada tipo de archivo, abriremos una pestaña nueva
- En la pestaña para el archivo de grafo de menciones pegaremos todas las columnas que contengan nombres de usuario, poniendo siempre la primera la que contiene el nombre de usuario del que ha publicado el tweet.
- Para el resto de archivos de grafo copiaremos en el mismo orden las columnas correspondientes. Es decir, para el de url pegaremos las columnas de las url y para el de los hashtag, las columnas que contengan hashtags. 
- Para el caso de las url pondremos al emisor del tweet primero. De esta manera lo que obtenemos es un *grafo bipartito*. Es decir, un grafo con dos tipos de nodos. Este tipo de grafo nos permitirá analizar qué url han sido compartidas por qué usuarios.
- Una vez tenemos montados los archivos, sólo hay que exportarlos como `.csv` y abrirlo en **Gephi**.