#Análisis de una conversación de Twitter con Gephi

- Descargar *Gephi* e instalarlo 
- *url*: http://gephi.org
- Abrir *Gephi*
![Abrir archivo con Gephi](/abrir-gephi.png "Abrir archivo con Gephi")
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