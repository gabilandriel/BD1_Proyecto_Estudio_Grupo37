# CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS

En este capítulo se presentan los resultados obtenidos a partir del desarrollo práctico de los cuatro temas asignados:

1. Procedimientos y funciones almacenadas  
2. Optimización de consultas mediante índices  
3. Manejo de transacciones y transacciones anidadas  
4. Manejo de permisos a nivel de usuarios y roles  

La información se expone de manera objetiva, mostrando los datos, pruebas, gráficos, capturas y scripts que evidencian el desarrollo técnico realizado sobre la base de datos del sistema veterinario.

---

## Resultados del Tema 1: Procedimientos y Funciones Almacenadas

### Implementación de procedimientos CRUD sobre Mascota

Se desarrollaron tres procedimientos almacenados para la gestión de la tabla **Mascota**.  
Las pruebas se realizaron sobre registros reales de la base de datos.

### Inserción de Mascotas
Se ejecutó el procedimiento `usp_InsertarMascota`, validando correctamente cliente, raza, sexo y fecha.

<img width="480" height="213" alt="Imagen1" src="https://github.com/user-attachments/assets/2284f797-c566-4fb7-830d-fc483a24d03d" />


### Modificación de Mascotas
Se probó el procedimiento `usp_ModificarMascota` sobre un registro existente, mostrando la correcta actualización.

<img width="485" height="102" alt="Imagen2" src="https://github.com/user-attachments/assets/f13f3b15-2e41-4a95-baf1-6e56c2e159c3" />


### Baja lógica
Se utilizó el procedimiento `usp_BajaLogicaMascota`, marcando el campo **baja = 1**.

**Tabla antes de la baja lógica:**  
<img width="269" height="72" alt="Imagen3" src="https://github.com/user-attachments/assets/ee06bb9c-04c6-47fe-bab0-eb48b2f2b6ee" />


**Después de la baja lógica:**  
<img width="270" height="65" alt="Imagen4" src="https://github.com/user-attachments/assets/0b5d5bf5-1e2e-4022-a69f-0c81bd7d9db7" />


---

## Funciones Almacenadas

Se implementaron tres funciones:

- `fn_CalcularEdadMascota`  
- `fn_ContarMascotasPorCliente`  
- `fn_MascotaDescripcion`  

### Resultado edad mascota:
<img width="567" height="147" alt="Imagen5" src="https://github.com/user-attachments/assets/0d409e18-f2b8-4a86-9e63-e8091cbf0cd0" />


### Resultado contar mascotas por cliente:

<img width="567" height="111" alt="Imagen6" src="https://github.com/user-attachments/assets/d5ebac0e-9fc5-482d-b306-89b28c6ce6cb" />


### Resultado descripción mascota:
<img width="556" height="157" alt="Imagen7" src="https://github.com/user-attachments/assets/857adf81-64ad-4a8e-8148-f3bbe6d599f6" />


---

## Comparativa de rendimiento: inserción directa vs SP

Se activaron métricas de SQL Server (STATISTICS IO/TIME) y se realizaron dos operaciones equivalentes:

### Resultado del INSERT directo:

<img width="385" height="388" alt="Imagen8" src="https://github.com/user-attachments/assets/d993656f-b28d-4b49-9d0e-9ede38e68c91" />


### Resultado del INSERT vía SP:

<img width="383" height="469" alt="Imagen9" src="https://github.com/user-attachments/assets/2d9c9419-c002-41ca-96df-7425e23073a5" />

### Hallazgos:

- La diferencia en milisegundos es mínima.  
- El SP realiza más validaciones, lo cual se refleja en el consumo de CPU.  
- La ejecución mediante SP centraliza la lógica y evita errores.

---

## Resultados del Tema 2: Optimización de Consultas mediante Índices

Se evaluó el rendimiento de una consulta sobre la tabla **Turno** con 200.000 registros, en tres escenarios:

### Consulta sin índice:

<img width="567" height="137" alt="Imagen10" src="https://github.com/user-attachments/assets/f663d71e-a48a-4777-baca-6bb244c82be8" />


**Se observa:**
- Lecturas lógicas elevadas  
- Mayor tiempo de CPU  
- Búsqueda completa de tabla  

### Consulta con índice agrupado:

<img width="567" height="95" alt="Imagen11" src="https://github.com/user-attachments/assets/49e1afb2-5e40-46b2-ac3e-8d6becbb5420" />


Se reducen las lecturas lógicas, mejorando la eficiencia del acceso.

### Consulta con índice agrupado con columnas incluidas:

<img width="567" height="150" alt="Imagen12" src="https://github.com/user-attachments/assets/56c6f439-750d-4db4-89d0-630f60ff666e" />


Se obtiene la mejor lectura lógica al cubrir todas las columnas necesarias para la consulta.

### Resultados observados

- Las búsquedas con índices con columnas incluidas reducen accesos a la tabla.  
- La consulta con índice agrupado con columnas incluidas consume menos CPU.  
- Sin índices, SQL Server debe leer la tabla completa.

---

## Resultados del Tema 3: Transacciones y Transacciones Anidadas

### Transacción exitosa

Se implementó un bloque transaccional que:

1. Inserta un certificado  
2. Inserta medicamento aplicado  
3. Actualiza stock  
4. Confirma con COMMIT  

Antes de ejecutar la transacción, se obtuvieron métricas iniciales.


### Certificados antes, stock antes:

<img width="211" height="126" alt="imagen" src="https://github.com/user-attachments/assets/5cc93e87-777f-4a53-a3dd-784021d55264" />


### Ejecución exitosa:

<img width="378" height="158" alt="imagen" src="https://github.com/user-attachments/assets/5ed7133f-e74c-4232-8a55-b78e94d90818" />


### Valores después del commit:

<img width="453" height="148" alt="imagen" src="https://github.com/user-attachments/assets/ad0c076e-a29f-4e8a-a4c1-79fab000dc1c" />

---

## Transacción fallida (con rollback)

Se forzó un error mediante un stock negativo para validar comportamiento ACID.

<img width="325" height="165" alt="imagen" src="https://github.com/user-attachments/assets/dff84341-ccec-4022-a03a-da79da822f94" />

  
### Error intencional y mensaje de rollback:

<img width="567" height="66" alt="imagen" src="https://github.com/user-attachments/assets/d240030f-acb5-421e-a4c7-e166783c0e41" />


### Estado posterior (sin cambios aplicados):

<img width="384" height="226" alt="imagen" src="https://github.com/user-attachments/assets/b27cc0c7-1b2f-4828-ae3b-5d96a415e2da" />

---

## Transacción anidada

Se mostró el comportamiento del contador `@@TRANCOUNT`.

### Impresión de niveles de transacción (1 → 2 → 1):

<img width="275" height="302" alt="imagen" src="https://github.com/user-attachments/assets/4281f537-cc1a-4e27-a768-4eb3d942b666" />


### Hallazgo:
Solo la transacción externa confirma los cambios, la interna solo incrementa el contador.

---

## Resultados del Tema 4: Manejo de Permisos a Nivel de Usuarios y Roles

### Configuración y creación de usuarios

Se habilitó el modo mixto y se crearon dos logins:

- `Login_Admin`  
- `Login_Lector`  

### Verificación de modo mixto:

<img width="407" height="378" alt="imagen" src="https://github.com/user-attachments/assets/188cea81-7ea9-4766-afec-a37822923d57" />


### Inicio sesión con usuario sa:

<img width="293" height="309" alt="imagen" src="https://github.com/user-attachments/assets/f4cf656b-678e-47ab-bbaa-f889a3b1f7a4" />


---

## Prueba con principio de mínimo privilegio

Se otorgó:

- Usuario_Admin → CONTROL  
- Usuario_Lector → SELECT sobre Cliente  

### Prueba A: intento de INSERT directo:

<img width="567" height="197" alt="imagen" src="https://github.com/user-attachments/assets/f396699a-4420-4c05-9d4f-cca9c4cbcf9c" />


---

## Prueba de seguridad por encapsulamiento

Al usuario lector se le otorgó permiso de `EXECUTE` sobre el SP.

### Prueba B: INSERT vía SP (funciona):

<img width="478" height="235" alt="imagen" src="https://github.com/user-attachments/assets/af406ab8-0837-47d7-8c07-053a2ca4904a" />


---

## Pruebas con roles

Se creó el rol `Rol_Lector`.  
Solo `Usuario_a` fue agregado.

### Prueba A: Usuario_a ejecuta SELECT:

<img width="567" height="211" alt="imagen" src="https://github.com/user-attachments/assets/c8afad35-1dfc-4f89-b764-d34b68a5361c" />


### Prueba B: Usuario_b ejecuta SELECT:

<img width="567" height="250" alt="imagen" src="https://github.com/user-attachments/assets/32b42f4d-a6ef-4c19-a213-f9d40ac60f22" />

### Hallazgo:
Los permisos asignados al rol se heredan correctamente a sus miembros.

