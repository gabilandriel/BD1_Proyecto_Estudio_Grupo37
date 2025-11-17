# CAPÍTULO I: INTRODUCCIÓN

Este capítulo introduce el Trabajo Práctico con el fin de proporcionar una idea del por qué y para qué se realiza el mismo.

---

### a. Tema 

El tema central del trabajo práctico es la **implementación y validación de una arquitectura de base de datos relacional** robusta y eficiente para un sistema de gestión transaccional. El problema sobre el cual se investiga es la necesidad de garantizar simultáneamente la **seguridad de la información**, la **integridad de las operaciones** y la **eficiencia en la recuperación de datos** en un entorno de negocio real.

El proyecto toma como base el modelo de datos de un **Sistema de Gestión para una Clínica Veterinaria**, donde se manipulan datos sensibles de pacientes (`Mascota`) y transacciones (`Turno`, `Certificado_Medico`, `Factura`).

**Título del Trabajo Práctico:**

**Implementación y Evaluación de Arquitecturas Avanzadas de T-SQL para Garantizar Seguridad, Consistencia y Optimización en un Sistema de Gestión para Clínica Veterinaria.**

---

### b. Definición o Planteamiento del Problema

El Trabajo Práctico se plantea como un problema de investigación aplicada que busca esclarecer cómo las herramientas avanzadas de gestión de bases de datos abordan los desafíos de la seguridad, la integridad y el rendimiento.

La implementación de un sistema transaccional como el de la Clínica Veterinaria exige que el DBMS pueda manejar concurrencia y fallos de manera segura, al mismo tiempo que ofrece un rendimiento analítico óptimo.

*   **Declaración del Problema:** ¿De qué manera la aplicación de herramientas avanzadas de T-SQL (Permisos, Transacciones, Procedimientos y Optimización de Consultas) puede garantizar la **integridad, la seguridad y la eficiencia** operativa en el sistema de gestión de la Clínica Veterinaria?

*   **Preguntas de Investigación:**
    1.  **Seguridad (Tema 4):** ¿Cómo se debe configurar la **Autorización** (Control) mediante **roles y permisos** (`GRANT`, `REVOKE`) para implementar el **Principio de Mínimo Privilegio**, asegurando que solo el personal autorizado acceda a la información sensible de los certificados médicos?
    2.  **Integridad y Consistencia (Tema 3):** ¿Cómo se pueden utilizar las **transacciones** para asegurar que un conjunto de operaciones se ejecute de manera atómica, garantizando que ante un fallo, los datos permanezcan consistentes?
    3.  **Modularidad y Encapsulamiento (Tema 1):** ¿Cómo contribuyen los **procedimientos y funciones almacenadas** a la estandarización de las operaciones y al **encapsulamiento de la seguridad**, permitiendo la ejecución de lógica de negocio sin otorgar permisos directos sobre las tablas base?
    4.  **Eficiencia y Rendimiento (Tema 2):** ¿Cómo se debe aplicar el concepto del **Orden Lógico de Procesamiento (OLP)** y la correcta **indexación** para evaluar y optimizar el rendimiento de consultas que operan sobre grandes lotes de datos, reduciendo los tiempos de respuesta?

---

### c. Objetivo del Trabajo Práctico

#### i. Objetivo General

**Desarrollar, implementar y evaluar** la base de datos relacional para la Clínica Veterinaria, focalizando la implementación en la integración exitosa de los mecanismos de **Autorización (Tema 4)**, **Transacciones (Tema 3)**, **Modularidad (Tema 1)** y **Optimización (Tema 2)**, cumpliendo con los criterios de seguridad, integridad y eficiencia.

#### ii. Objetivos Específicos

1.  **Implementar la arquitectura de seguridad** basada en la jerarquía de Principales de Seguridad, Roles y Permisos, siguiendo el **Principio de Mínimo Privilegio**.
2.  **Modularizar y estandarizar** las operaciones DML mediante la **implementación y prueba de procedimientos y funciones almacenadas**, incluyendo la inserción de lotes de datos mediante estos.
3.  **Configurar permisos granulares** (utilizando `GRANT`) y el permiso **`EXECUTE`** sobre procedimientos almacenados para demostrar el encapsulamiento y el control de acceso diferenciado a nivel de usuarios y roles.
4.  **Implementar y validar transacciones T-SQL** que aseguren la **atomicidad y consistencia** de las operaciones DML compuestas, incluyendo el control explícito de fallos y *rollbacks*.
5.  **Medir y comparar** la eficiencia de las consultas sobre grandes conjuntos de datos, evaluando el impacto de diferentes configuraciones de **índices** y documentando los planes de ejecución.
