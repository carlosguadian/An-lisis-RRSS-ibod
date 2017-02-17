#Utilización de *Open Refine*
##Instalación y uso básico

###Instalación

Nos bajaremos e instalaremos **Open Refine**

*url*: http://openrefine.org/download.html

###Datos

Utilizaremos el fichero **tweets-opendata.csv**



###Extracción de URL

- Abrir Open Refine
- Crear un nuevo proyecto importando el csv con los tweets descargados de la bbdd de Cosmos
- Crear una nueva columna basada en “tweets” llamada “links”
- Edit column
- Add column based on this column
- Introducir el nombre de la nueva columna
- Seleccionar como lenguaje GREL
- En expression introducir lo siguiente:
"filter(split(value, " "),v,startsWith(v,"http")).join("||")"

*Para hacer la extracción de “usuarios” se usa la misma expresión pero sustituyendo “http” por “@”. Útil en el caso de tener que montar las relaciones de manera manual.*

Si se generan celdas con múltiples valores hay que utilizar *Split multi-valued cells in column links* definiendo como separador "||", que es el que hemos utilizado anteriormente.
