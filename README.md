# Pajarracos

Se nos pide desarrollar parte del modelo de un juego inspirado en el viejo Angry Birds.
Las definiciones incluyen varias etapas en el desarrollo.

## Algunas aves

En esta etapa tenemos que modelar algunas de las aves que pueden aparecer en el juego.
De cada ave nos interesa saber su **fuerza** (que es un número). Por otra parte,
la dinámica del juego incluye circunstancias en las que un ave **recibe un disgusto**;
para cada ave se define qué debe hacer en tal caso.

Se definen tres especies de aves: aguiluchos, albatros y palomas.

#### Aguiluchos
De cada aguilucho se conoce su velocidad, que inicialmente es de 20 km/h pero puede variar en cualquier momento.  

La **fuerza** se calcula en base a su velocidad:
si es de 60 km/h o menos entonces es 180; en caso contrario, es el triple de la velocidad.

Al **recibir un disgusto**, duplica su velocidad.    
O sea, un aguilucho cuya velocidad es 40 km/h tiene 180 de fuerza.
Si recibe un disgusto, su velocidad pasa a 80 km/h, y por lo tanto, su fuerza se calcula como 240.

#### Albatros
Para los albatros, la fuerza se define en base al peso y la masa muscular.
Cuando se crea, un albatros pesa 4000 gramos, y tiene 600 de masa muscular.
  
Su **fuerza** se calcula así: si pesa menos de 6000 gramos,
entonces coincide con la masa muscular; en caso contrario, es la mitad.

Cuando **recibe un disgusto**, su peso aumenta en 800 gramos.  
Para los albatros se define una acción adicional que es _ir al gimnasio_:
el efecto es que la masa muscular y el peso aumentan en 500 gramos.

#### Palomas
Para las palomas, la fuerza se calcula a partir de su ira.
Cuando se crea una paloma, su ira es de 200 unidades.  
La **fuerza** de una paloma es el doble de su ira.
Cuando **recibe un disgusto**, su ira aumenta en 300 unidades.

## Aves especiales

También debemos contemplar dos tipos especiales de aves: los aguiluchos colorados y las palomas torcazas.

La fuerza de un **aguilucho colorado** es de 400 unidades más de lo que correspondería 
según el cálculo de un aguilucho común de sus mismas características.

Para una **paloma torcaza**, la fuerza aumenta en 100 unidades por cada uno de sus huevos.
Una paloma torcaza nace con 3 huevos. Cuando recibe un disgusto,
además de la acción común a todas las palomas, pone un huevo.


## Islas

El mapa del juego incluye muchas **islas**. En cada isla hay aves.

Se pide modelar las islas, de forma de poder realizar lo que sigue:

- obtener las _aves débiles_ de una isla, son aquellas cuya fuerza sea menor a 1000.
- obtener la _fuerza total_ de una isla, que es la suma de la fuerza de cada una de sus aves.
- poder averiguar si una isla _es robusta_: la condición es que todas sus aves tenga una fuerza mayor a 300.
- indicar que hubo un _terremoto_: todas las aves deben recibir un disgusto.
- indicar que hubo una _tormenta_: todas las _aves débiles_ deben recibir un disgusto.


## Test de isla y aves

Armar un test con el siguiente escenario inicial
- crear un aguilucho colorado, un albatros y una paloma torcaza.
Después, hacer que el albatros vaya al gimnasio.
- crear una isla, y agregar a las tres aves.

Verificar que
- la fuerza del aguilucho debe ser 580, la del albatros 1100, y la de la paloma 700 respectivamente.
- el peso del albatros debe ser 4500.
- la fuerza total de la isla es 2380.
- las aves débiles de la isla son el aguilucho y la paloma.

A partir de la situación inicial, indicar que en la isla hubo un terremoto. Después de esto:
* la velocidad del aguilucho debe aumentar a 40,
* el peso del albatros a 5300,
* y la ira de la paloma a 500.

La fuerza del aguilucho sigue siendo 580, la del albatros sigue siendo 1100,
la de la paloma pasa a 1400. Por lo tanto, la única ave débil es ahora el aguilucho.

Finalmente, indicar que en la isla hubo una tormenta después del terremoto.
La velocidad del aguilucho debe pasar a 80, y su fuerza a 640. 
El peso del albatros y la ira de la paloma deben ser igual que antes.  
Este último test se puede hacer también partiendo de la situación inicial,
e indicando un terremoto seguido de una tormenta.


## Más sobre la isla

Agregar a cada isla una cantidad de alpiste y una de maíz, las dos nacen en 10.

Agregar dos nuevas consultas sobre la isla,su _ave capitana_ y si _está en paz_ o no;
y dos nuevas acciones, la _sesión de relax_ y la _alimentación_.

-El _ave capitana_ de una isla es la que tiene más fuerza,
considerando solamente aquellas cuya fuerza esté entre 1000 y 3000.
**Ojo:** un ave de 4000 nunca va a ser capitana, porque se excede de los 3000,
tampoco una de 800 (ni aunque sean las más fuertes).

- El efecto de una _sesión de relax_ es indicarle a cada ave que _se relaje_. Qué pasa con cada ave cuando se relaja:
	- un aguilucho disminuye su velocidad en 10 km/h.
	- un albatros pierde 300 gramos de peso.
	- una paloma disminuye su ira en 50 unidades.

- La condición para que una isla _esté en paz_ es que todas las aves estén conformes con la isla,
  de acuerdo a esta definición
	- un aguilucho está conforme con una isla, si en la isla hay al menos 8 unidades de alpiste.
	- un albatros está conforme con una isla, si en la isla hay a lo sumo 2 aves que tengan más fuerza que él.
	- una paloma está conforme con una isla, si en la isla hay a lo sumo 1 ave débil.

- El efecto de la _alimentación_ es indicarle a cada ave que _tome alimento **de la isla**_.
Qué pasa con cada ave cuando se le indica que tome alimento de una isla:

- un aguilucho saca 3 unidades de alpiste, que se restan de la cantidad que tiene la isla,
y aumenta su velocidad en 15 km/h.

- un albatros saca 4 unidades de maíz, que se restan de la cantidad que tiene la isla, 
y aumenta tanto su peso como su masa muscular en 700 gramos.

- una paloma no hace nada.



## Más sobre las palomas

Agregar una nueva acción sobre las palomas, _equilibrarse_, que hace lo siguiente:
- si la fuerza de la paloma es 700 o menos, entonces recibe un disgusto
- caso contrario, se relaja.

Además, agregar las siguientes variantes de paloma: la paloma montera y la paloma manchada.

Para cada **paloma montera** se define un _tope de fuerza_,
que nace en 2000, pero puede variarse libremente.
La fuerza de una paloma montera no puede superar el tope indicado.

De cada **paloma manchada** se conoce el conjunto de sus nidos, puede tener más de uno.

A su vez, de cada nido se conoce el grosor y la resistencia del material;
los valores iniciales son 5 y 3 respectivamente.
Una paloma manchada nace sin ningún nido.

Cuando _recibe un disgusto_, además de lo que hacen todas las palomas, una paloma manchada construye un nuevo nido.
 
Cuando _se relaja_ hace lo mismo que cualquier otra paloma, excepto si tiene más de 2 nidos, en cuyo caso aumenta 
el grosor de todos los que tenga en 1 unidad.  
A la _ira_, sumarle la suma de la potencia de todos sus nidos. 
La potencia de un nido se obtiene multiplicando grosor por resistencia,
y sumando 20 al resultado. P.ej. la potencia de un nido con 5 de grosor y 3 de resistencia es de 35.
