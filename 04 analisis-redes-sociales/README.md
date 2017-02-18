#Análisis de una conversación de Twitter con Gephi

> El **objetivo** de este módulo es tener el conocimiento básico de uso de *Gephi* para procesar un archivo de grafo, poder determinar los nodos relevantes en base a medidas de centralidad y el cálculo de subcomunidades.

##¿Qué es Gephi?

*Gephi* es una herramienta open source que permite analizar y visualizar archivos de grafo. Está desarrollada en java y es multiplataforma.

Permite trabajar con diferentes tipos de archivos de grafo; `.graphml`, `.gexf`, `.gdf`, `.gephi`... E importar datos desde archivos csv tanto para la generación de nodos, como la de aristas.

##Recursos

###Análisis de Redes Sociales

- **Análisis de Redes** https://es.wikipedia.org/wiki/An%C3%A1lisis_de_redes
- **Medidas de Centralidad** https://es.wikipedia.org/wiki/Centralidad#Medidas_de_centralidad
- **Detección de comunidades en redes sociales** Estudio realizado sobre las elecciones catalanas y elecciones generales de 2015 en Twitter https://repositorio.uam.es/bitstream/handle/10486/673431/Lorenzo_Mateo_Adrian_tfg.pdf?sequence=1
- **Herramientas de análisis de Redes Sociales** http://www.k-government.com/2016/06/28/100-herramientas-analisis-redes-sna-ars/
- **Networks, Crowds and Markets** Es uno de los manuales de referencia que además de hacer una gran introducción a la *teoría de grafos* y las *redes sociales*, también incluye una visión amplia relacional sobre mercados y multitudes, teniendo en cuenta elementos como la teoría de juegos **imprescindible** https://www.cs.cornell.edu/home/kleinber/networks-book/networks-book.pdf

###Gephi

- Guía de inicio rápida https://gephi.org/users/quick-start/
- Tutorial de visualización https://gephi.org/users/tutorial-visualization/
- Tutorial de layouts https://gephi.org/users/tutorial-layouts/
- Directorio de recursos *Gephi* dónde encontrar tutoriales, ejemplos y recursos. Por ejemplo como importar un `.csv`, realizar un text mining o un análisis SEO con datos de analytics.
- Descargar *Gephi* https://gephi.org/users/download/

##Conceptos básicos del Análisis de Redes

- **Análisis de Redes** Es el área encargada de analizar las redes mediante la *teoría de redes* (conocida más genéricamente como *teoría de grafos*). Las redes pueden ser de diversos tipos: social, transporte, eléctrica, biológica, internet, información, epidemiología, etc. Las redes sociales son objeto de estudio particular en diversos campos que van desde la sociología hasta la gestión del conocimiento en las empresas. El estudio se centra en la asociación y medida de las relaciones y flujos entre las personas, grupos, organizaciones, computadoras, sitios web, así como cualquier otra entidad de procesamiento de información/conocimiento. Los nodos en la red en este caso son personas y grupos mientras que los enlaces muestran relaciones o flujos entre los nodos. El análisis de redes sociales proporciona herramientas tanto visuales como matemáticas para el estudio de de las relaciones humanas.
- **Nodo** Representa cada uno de los elementos relacionados que vamos a analizar. Si analizamos una conversación de Twitter, los nodos son los *usuarios*. Si analizamos en esa misma conversación como se han utilizado los *hashtags*, los nodos serán estos. En una red viaria entre *poblaciones*, los nodos serán las poblaciones.
- **Arista** Representa la relación entre dos nodos. Por ejemplo en la conversación de Twitter, esta puede ser representada por *RT* o *menciones* entre usuarios. El grosor de las aristas nos mostrará la intensidad con la que se ha producido, es decir, la arista entre dos usuarios que se hayan mencionado 4 veces, será menor que la que se ha que se genera entro otros dos usuarios que se hayan mencionado 8 veces.
- **Comunidades** Saber cómo se han relacionado los nodos en el grafo analizado nos puede aportar una visión clara de lo que ha sucedido. En función de la intensidad de las relaciones y de la cercanía con otros nodos se puede determinar que sub-comunidades se han generado y mediante la visualización poder determinar si una conversación ha estado muy polarizada, o qué subtemas han movido cada una de estas subcomunidades.
- **Tipo de grafo** 
	- **Por el tipo de relación** Encontramos dos tipos de grafo en función de si las relaciones son direccionales o no. Por lo tanto hay *dirigidos* y *no dirigidos*.
	- **Si hay uno o dos tipos de nodos** En el caso de analizar sólo las menciones entre usuarios, tenemos un sólo tipo de nodos. En el caso de analizar cómo han utilizado los hashtags los usuarios, nos encontramos ante un grafo *bipartito*.
- **Medidas de centralidad** Éstas nos permitirán determinar la importancia de los nodos en función de su posición estructural en un grafo. Es decir, en función de las relaciones establecidas. Hay cuatro medidas de centralidad ampliamente utilizadas:
	- *La centralidad de grado («degree centrality»)*: Tiene en cuenta el número de relaciones entre los nodos. Puede ser entrante, saliente o conjunta. Nos ayuda a determinar usuarios denominados *hub*, que concentran muchas relaciones. 
	- *La cercanía («closeness»)* Tiene en cuenta la distancia de un nodo respecto del resto de los componentes del grafo. Es útil para poder determinar qué usuarios son los mejor posicionados para poder llegar al resto del conjunto.
	- *La intermediación («betweenness»)* Determina qué usuarios son esenciales en la unión entre diferentes grupos del grafo. Son los que hacen de puente y que son vitales para poder hacer llegar una información entre comunidades.
	- *La centralidad de vector propio («eigenvector centrality»)* Nos muestra que nodos son los más relevantes. Aquellos que son tomados por referencia por la mayoría de usuarios. No es sólo qué nodo recibe más relaciones entrantes, es qué nodo recibe más enlaces entrantes de nodos con más enlaces entrantes.

##Ejercicio

- Descargar *Gephi* e instalarlo 
- Abrir *Gephi*
- Abrir el csv generado en el módulo anterior con las menciones `Archivo > Abrir`
- Aceptar el cuadro emergente que aparece con los datos de número de nodos, de aristas, si es dirigido, etc...
- Aplicar el layout `Force Atlas 2` y cuando el grafo esté estirado parar el script.
- En *Estadísticas* realizar los siguientes cálculos
	- Centralidad de vector propio
	- Modularidad
- Aplicar formato a los nodos
	- Para el tamaño utilizaremos la *medida de centralidad Eigenvector*
	- Para el color utilizaremos el valor *Modularity Class*
- Ir a *previsualización* y configurar para obtener el grafo deseado
- Exportar archivo
	- *SVG* en vectorial, se abre con cualquier navegador y permite hacer zoom sin perder calidad de imagen
	- *PNG* cuando queramos obtener una imagen en alta resolución para una publicación. Definiremos el tamaño en píxeles de la imagen.