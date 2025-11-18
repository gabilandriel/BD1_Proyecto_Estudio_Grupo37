# CAPÍTULO III: METODOLOGÍA SEGUIDA

Este capítulo describe el proceso seguido para la realización del Trabajo Práctico, detallando las actividades ejecutadas, las herramientas utilizadas y la organización metodológica del equipo. El objetivo es proporcionar una visión clara del enfoque aplicado para integrar los cuatro temas: procedimientos y funciones almacenadas, índices, transacciones y permisos.

---

## a. Descripción de cómo se realizó el Trabajo Práctico

El trabajo se realizó siguiendo una metodología incremental, práctica y colaborativa, combinando investigación teórica, desarrollo técnico y verificación experimental dentro del motor SQL Server.

### 1. Análisis del modelo de datos existente
Se inició con una revisión de la estructura de la base de datos de la Clínica Veterinaria.  
Se identificaron las entidades principales (Mascota, Cliente, Raza, Turno, Certificado_Medico, Factura) y se determinó cuáles serían utilizadas para cada tema.

### 2. Investigación teórica individual
Cada integrante del equipo investigó su tema asignado:

- **Tema 1:** Procedimientos y funciones almacenadas.  
- **Tema 2:** Índices y optimización mediante OLP.  
- **Tema 3:** Transacciones (exitosas, fallidas y anidadas).  
- **Tema 4:** Permisos mediante usuarios y roles.

El contenido teórico se integró al Marco Conceptual para asegurar coherencia y correlación entre temas.

### 3. Desarrollo práctico dentro de SQL Server
Cada tema incluyó la implementación de scripts reales:

- Procedimientos CRUD y funciones UDF aplicados a la tabla *Mascota*.
- Índices agrupados, no agrupados y filtrados sobre la tabla *Turno*.
- Transacciones explícitas con COMMIT y ROLLBACK, además de transacciones anidadas.
- Configuración de seguridad mediante creación de logins, usuarios y roles con GRANT, REVOKE y DENY.

Las pruebas se realizaron en la base **DB_Integrador_Grupo37**, utilizando datos existentes y datos generados.

### 4. Trabajo colaborativo utilizando Git y GitHub
El equipo trabajó de forma conjunta usando control de versiones:

- Cada integrante utilizó su **rama personal**.
- Se realizaron commits descriptivos.
- Las ramas se integraron al repositorio mediante **pull requests**.
- Se resolvieron conflictos para mantener la coherencia de la carpeta de documentación y scripts.
- Cada tema quedó alojado en su carpeta correspondiente (Tema 1, Tema 2, Tema 3, Tema 4).

Esto permitió mantener orden y trazabilidad del trabajo realizado.

### 5. Validación y recolección de evidencias
Cada implementación se probó varias veces para verificar su funcionamiento. Se recopilaron:

- Resultados antes y después de transacciones.
- Rendimiento de consultas con y sin índices.
- Ejecución correcta de procedimientos con distintos permisos.
- Tiempos medidos mediante `SET STATISTICS IO / TIME`.
- Inserción de lotes de datos tanto directos como usando SP.
- Capturas de pantalla para documentar resultados.

Todas las evidencias fueron incorporadas a la documentación final.

---

## b. Herramientas (Instrumentos y procedimientos)

### 1. SQL Server Management Studio (SSMS)
Usado para:
- Ejecutar scripts T-SQL
- Analizar planes de ejecución
- Configurar usuarios y roles
- Verificar resultados de transacciones e índices

### 2. Git y GitHub
Herramientas clave de colaboración:

- Control de versiones mediante ramas
- Gestión de conflictos
- Integración del trabajo con pull requests
- Historial claro y organizado del desarrollo

### 3. Fuentes de información consultadas
El marco teórico se apoyó en:

- Documentación oficial de SQL Server
- Material teórico proporcionado por la cátedra
- Bibliografía técnica
- Artículos y blogs de especialistas
- Pruebas experimentales dentro del motor

### 4. Procedimientos de recolección y validación
Se utilizaron métodos como:

- Ejecuciones repetidas de pruebas
- Generación de datos masivos para índices
- Verificación visual mediante SELECTs comparativos
- Pruebas con distintos usuarios para validar permisos
- Comparación de tiempos y estadísticas del motor

### 5. Criterios de documentación
Para el informe final se siguieron criterios de:

- Claridad técnica
- Normalización de capítulos
- Coherencia con la introducción y el marco teórico
- Inclusión equilibrada de imágenes y código
- Lenguaje formal y académico

---

## Conclusión del capítulo

La metodología aplicada permitió abordar el trabajo de manera ordenada y progresiva.  
La combinación de teoría, práctica, experimentación y validación colaborativa garantizó que los cuatro temas se integraran coherentemente dentro de un mismo sistema real, cumpliendo los objetivos planteados en la introducción.


