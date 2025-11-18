# CAPÍTULO II: MARCO CONCEPTUAL

Este capítulo presenta los conceptos teóricos fundamentales que sustentan el desarrollo del Trabajo Práctico. El objetivo es situar el problema planteado en el Capítulo I dentro de un marco de conocimientos sólidos sobre bases de datos, seguridad, integridad, modularidad y optimización en motores SQL.

---

## 2.1. Bases de Datos Relacionales

Una base de datos relacional es un modelo estructurado basado en tablas, relaciones y restricciones formales. Este modelo organiza la información de manera que sea accesible mediante operaciones declarativas (SQL) y garantiza ACID en entornos transaccionales.

Características principales:
- Uso de tablas vinculadas mediante claves primarias y foráneas.
- Integridad referencial asegurada por el motor.
- Lenguaje SQL para manipulación y consulta.
- Independencia lógica y física de los datos.

---

## 2.2. Lenguaje T-SQL

T-SQL (Transact-SQL) es una extensión del estándar SQL utilizada por Microsoft SQL Server. Incorpora:

- Variables locales  
- Control de flujo  
- Procedimientos almacenados  
- Funciones definidas por el usuario  
- Manejo explícito de transacciones  
- Manejo avanzado de errores (TRY/CATCH)

T-SQL permite implementar lógica de negocio compleja directamente dentro del motor de base de datos.

---

## 2.3. Seguridad en SQL Server: Principales, Roles y Permisos

La seguridad en SQL Server se basa en los siguientes elementos:

### • Principales (Principals)
Son entidades que pueden solicitar acceso al servidor:
- Logins (nivel servidor)
- Usuarios (nivel base de datos)
- Roles (agrupación de permisos)

### • Roles
Permiten asignar permisos de forma colectiva. Se dividen en:
- Roles fijos de servidor
- Roles fijos de base de datos
- Roles definidos por el usuario

### • Permisos (GRANT, REVOKE, DENY)
Permiten controlar qué operaciones puede realizar un usuario sobre un objeto.

Ejemplos:
- GRANT SELECT ON Mascota TO recepcionista  
- REVOKE INSERT FROM invitado  
- DENY DELETE TO pasante  

La filosofía aplicada es el **Principio de Mínimo Privilegio**, que busca otorgar únicamente los permisos estrictamente necesarios.

---

## 2.4. Transacciones: Atomicidad e Integridad

Una transacción es una unidad lógica de trabajo que agrupa una o varias instrucciones T-SQL.  
Su propósito es asegurar que todas las operaciones se ejecuten de manera **segura**, **consistente** y **controlada**, especialmente en sistemas transaccionales como el de la Clínica Veterinaria.

Las transacciones garantizan las propiedades **ACID**:

- **Atomicidad:**  
  La transacción se ejecuta por completo o no se ejecuta. Si ocurre un error, todo se revierte.

- **Consistencia:**  
  El estado final de la base de datos siempre debe ser válido, cumpliendo restricciones y reglas de negocio.

- **Aislamiento:**  
  Evita que transacciones concurrentes interfieran entre sí, dependiendo del nivel de aislamiento configurado.

- **Durabilidad:**  
  Una vez ejecutado un `COMMIT`, los cambios quedan guardados de forma permanente incluso ante fallos del sistema.

### Ejemplo genérico de manejo de transacciones

```sql
BEGIN TRY
    BEGIN TRAN;

        -- Operaciones DML
        -- INSERT / UPDATE / DELETE
        -- Validaciones

    COMMIT;   -- Si todo salió bien
END TRY
BEGIN CATCH
    ROLLBACK; -- Si ocurre un error, se revierte todo

    -- Mensaje de error opcional
    SELECT ERROR_MESSAGE() AS Error;
END CATCH;
```

**En entornos reales (como una clínica veterinaria), su uso es esencial para garantizar consistencia durante operaciones críticas como facturación o registro de turnos.**

## 2.5. Procedimientos Almacenados (Stored Procedures)

Los procedimientos almacenados (SP) son bloques de código T-SQL precompilado que encapsulan operaciones repetitivas o sensibles dentro del motor SQL Server.

**Ventajas principales:**

- Reutilización de lógica de negocio.  
- Reducción del tráfico entre cliente y servidor.  
- Permiten validar datos antes de ejecutar operaciones DML.  
- Mejoran la seguridad mediante permisos `EXECUTE`.  
- Reducen el riesgo de inyección SQL.  

En este proyecto, los SP permiten estandarizar operaciones como el alta, modificación y baja lógica de mascotas, evitando que los usuarios interactúen directamente con las tablas base.

---

## 2.6. Funciones Definidas por el Usuario (UDF)

Las funciones almacenadas devuelven siempre un valor, ya sea:

- **Escalar:** retorna un único dato (INT, VARCHAR, DATE, etc.).  
- **De tabla:** retorna un conjunto de filas, similar a una vista parametrizada.

Se utilizan para cálculos y operaciones reutilizables, como:

- Obtener la edad de una mascota.  
- Contar cuántos registros activos tiene un cliente.  
- Generar descripciones legibles o formateadas.  

Las UDF centralizan la lógica de consulta y evitan duplicación de código en distintas partes del sistema.

---

## 2.7. Optimización de Consultas y Orden Lógico de Procesamiento (OLP)

El Orden Lógico de Procesamiento (OLP) describe **cómo SQL Server evalúa una consulta internamente**, lo cual no coincide con el orden en el que el usuario escribe la sentencia.

**Orden conceptual del OLP:**

1. `FROM`  
2. `ON`  
3. `JOIN`  
4. `WHERE`  
5. `GROUP BY`  
6. `HAVING`  
7. `SELECT`  
8. `ORDER BY`

Comprender este orden permite:

- Evitar errores comunes como usar columnas no disponibles en determinadas fases.  
- Escribir consultas más eficientes y predecibles.  
- Reducir operaciones costosas en tiempo y memoria.  

Además, SQL Server mejora los tiempos de respuesta utilizando **índices**, que agilizan:

- Búsquedas  
- Ordenamientos  
- Filtrados  

Una correcta indexación es fundamental cuando se trabaja con grandes volúmenes de datos.

---

## 2.8. Integridad de Datos

La integridad asegura que los datos permanezcan correctos, coherentes y válidos en todo momento.  
Se implementa mediante:

- **Claves primarias**  
- **Claves foráneas**  
- **Restricciones CHECK**  
- **Campos NOT NULL**  
- **Reglas de actualización y eliminación en cascada**  
- **Triggers**  

Estos mecanismos garantizan que la base de datos mantenga su coherencia incluso ante operaciones complejas o simultáneas.

---

## 2.9. Baja Lógica

La baja lógica consiste en marcar un registro como inactivo (`baja = 1`) en lugar de eliminarlo físicamente de la tabla.

**Ventajas:**

- Mantiene trazabilidad histórica.  
- Evita la pérdida irreversible de información.  
- Facilita auditorías.  
- Reduce riesgos de romper integridad referencial.  

Es un patrón ampliamente utilizado en sistemas que manejan información sensible o que requieren conservar historial de las operaciones.

---

Con estos conceptos se establecen las bases teóricas necesarias para comprender la implementación detallada en los capítulos siguientes.


