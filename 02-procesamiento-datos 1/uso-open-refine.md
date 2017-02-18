#Utilización de Open Refine
##Instalación y uso básico

###¿Porqué hay que arreglar los datos?

Los datos si no proceden de una fuente estandarizada es necesario procesarlos primero, antes de poder analizarlos.

Por ejemplo, en una conversación de twitter donde se producen menciones entre usuarios, unos pueden mencionarlo como `@Usuario`, mientras que otro hacerlo como `@usuario`. Esta diferencia entre mayúsculas y minúsculas puede provocar que a la hora de hacer un recuento de usuarios o establecer relaciones entre ellos, se puedan identificar como dos usuarios diferentes.

Un ejemplo que también ilustra esta necesidad es cuando hay que procesar los datos de un formulario abierto. Si en uno de los campos se pide que digan en qué población viven, seguramente encontraremos referencias diferentes para la misma población. *Open Refine* nos ayudará a aglutinar y homogeneizar dicha información.

###¿Qué es Open Refine?

*OpenRefine (antes Google Refine)* es una poderosa herramienta para trabajar con datos desordenados: limpiarlo; Transformándolo de un formato a otro; Y ampliarlo con servicios web y datos externos.

Desde el 2 de octubre de 2012, Google no está apoyando activamente este proyecto, que ahora se ha renombrado a OpenRefine. El desarrollo de proyectos, la documentación y la promoción están ahora plenamente apoyados por voluntarios.

**url**: http://openrefine.org/

###Instalación

Nos bajaremos e instalaremos **Open Refine**

*url*: http://openrefine.org/download.html

###Datos

Utilizaremos el fichero **tweets-opendata.csv**

###Extracción de URL

1. Abrir Open Refine
2. Crear un nuevo proyecto importando el csv con los tweets
3. Crear una nueva columna basada en “tweets” llamada “links”
4. Edit column
5. Add column based on this column
6. Introducir el nombre de la nueva columna
7. Seleccionar como lenguaje GREL
8. En expression introducir lo siguiente:
`filter(split(value, " "),v,startsWith(v,"http")).join("||")`

> Si se generan celdas con múltiples valores hay que utilizar `edit column > split into several columns` definiendo como separador `||`, que es el que hemos utilizado anteriormente. Esta acción nos generará tantas columnas como el máximo de valores que hayan en una celda. Es decir, si el máximo de hashtags utilizados en un tweet han sido tres, al realizar esta acción tendremos como resultado tres columnas con hashtags.

###Extracción de usuarios

> Para hacer la extracción de “usuarios” se usa la misma expresión pero sustituyendo “http” por “@”. Útil en el caso de tener que montar las relaciones de manera manual.

**Antes** de proceder con los pasos del punto anterior para la extracción de usuarios (del 3 al 8), hay que **homogeneizar el texto**. Es decir, convertir todo el texto a minúsculas. 

De esta manera evitaremos que a la hora de hacer una table, el mismo usuario pero escrito de forma diferente sea considerado como dos usuarios diferentes.

Para hacerlo en la columna del texto de los tweets realizar la siguiente acción:
 `edit cells > common transforms > to littlecase`
 
 Si se quiere, se puede también cambiar a UPPERCASE. El objetivo es que todo el texto sea igual. 
 
###Extracción de hashtags
 
> Exactamente lo mismo que con los usuarios
 
###Archivo resultante
 
Al acabar la operación deseada, en nuestro caso las tres. Exportaremos el resultado a un fichero csv con el que poder trabajar en Google Sheets.
 
El resultado es el archivo original con una serie de columnas añadidas que contendrán las url compartidas, las menciones realizadas y los hashtags utilizados.
