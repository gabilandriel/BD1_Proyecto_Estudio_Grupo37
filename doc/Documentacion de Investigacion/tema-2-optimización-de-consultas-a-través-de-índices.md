# TEMA 2


## OPTIMIZACIÓN DE CONSULTAS A TRAVÉS DE ÍNDICES


En **SQL Server**, los **índices** son estructuras especiales que se crean con el propósito de **mejorar la velocidad y eficiencia** de las consultas sobre una tabla. Funcionan como un "mapa" que permite
localizar los datos de manera más rápida, evitando recorrer toda la tabla.\
Esto resulta muy útil especialmente en bases de datos con gran cantidad de registros, donde las consultas pueden volverse lentas y costosas en tiempo de ejecución.

Agregar índices correctamente puede **acelerar el acceso a los datos**, optimizar el rendimiento general del sistema y reducir la carga del motor de base de datos. Sin embargo, su uso debe planificarse con
cuidado, ya que demasiados índices o índices mal diseñados pueden afectar el rendimiento de las operaciones de inserción o actualización.

## TIPOS DE ÍNDICES EN SQL SERVER


Existen diferentes tipos de índices que pueden aplicarse según las necesidades de la tabla y el tipo de consultas que se deseen optimizar:

### 1. Clustered Index (Índice Agrupado)

Este índice **determina el orden físico** en el que los datos se almacenan dentro de la tabla. Solo puede existir **uno por tabla**, y los registros se ordenan físicamente de acuerdo con el valor de la
columna clave (usualmente la clave primaria).

### 2. Nonclustered Index (Índice No Agrupado)

A diferencia del índice agrupado, este tipo **no altera el orden físico** de los datos en la tabla. Crea una estructura aparte que contiene una copia de las columnas del índice junto con punteros a los
registros originales, lo que **acelera las búsquedas específicas**.

### 3. Unique Index (Índice Único)

Su función es **evitar valores duplicados** en una columna o conjunto de columnas. Garantiza que cada valor en el índice sea único.

### 4. Filtered Index (Índice Filtrado)

Se usa para **indexar (Registrar ordenadamente datos e informaciones) solo una parte de los datos** que cumplen con una condición determinada, lo que reduce el tamaño del índice y mejora el rendimiento de ciertas consultas.

### 5. Full-Text Index (Índice de Texto Completo)

Permite realizar **búsquedas de texto avanzado**, como frases completas o palabras similares, en lugar de simples coincidencias exactas. Es ideal para búsquedas dentro de descripciones o textos largos.

## RENDIMIENTOS DE CONSULTAS

### Rendimiento de consulta sin índice:

<img width="1538" height="370" alt="1era" src="https://github.com/user-attachments/assets/092d25de-6aab-4f4b-810c-be318cb8a931" />

### Rendimiento de consulta con índice agrupado:

<img width="1531" height="256" alt="2da" src="https://github.com/user-attachments/assets/76153a09-5d82-42bc-a6e1-7c226123205b" />

### Rendimiento de consulta con índice agrupado con columnas incluidas:

<img width="1571" height="404" alt="3ra" src="https://github.com/user-attachments/assets/8f676832-6d36-4f60-8ac6-bd2a1729cbf3" />


## CONCLUSIONES DEL TEMA

El uso adecuado de los índices puede **mejorar significativamente el rendimiento** de una base de datos, reduciendo los tiempos de respuesta en las consultas y aumentando la eficiencia del sistema.  
Sin embargo, hay que tener en cuenta que **crear demasiados índices o hacerlo sin planificación** puede afectar negativamente las operaciones de escritura (insertar, actualizar o eliminar), ya que el sistema debe mantener los índices actualizados.

En las pruebas de rendimiento sobre la tabla *Turno*, se observó una mejora significativa al aplicar índices.  
El tiempo de respuesta pasó de **538 ms sin índice** a **550 ms con índice agrupado con columnas extendidas**, manteniendo un uso más eficiente del CPU y las lecturas lógicas.  
Aunque la diferencia en milisegundos pueda parecer pequeña con 200.000 registros, esta diferencia **se amplificaría exponencialmente** en escenarios con millones de filas, donde el uso de índices adecuados reduce drásticamente la carga del sistema y mejora la escalabilidad.

---

### **Resumen general**

En resumen, los índices permiten que una base de datos responda de forma más rápida y eficiente, especialmente cuando el volumen de información crece.  
Una buena elección de índices ayuda a reducir la carga del sistema y mejora la experiencia en consultas habituales.  
Sin embargo, su uso debe ser equilibrado, analizando qué consultas se realizan con más frecuencia para evitar índices innecesarios que puedan afectar el rendimiento de escritura.

