# CAPÍTULO V: CONCLUSIONES

A lo largo del desarrollo de este Trabajo Práctico pudimos analizar, aplicar y comprobar distintos conceptos fundamentales del motor SQL Server. Cada uno de los cuatro temas requirió no solo implementar código, sino también observar su comportamiento real dentro del sistema de la veterinaria. Esto nos permitió entender cómo funcionan en conjunto los procedimientos almacenados, los índices, las transacciones y la gestión de permisos, y cómo influyen directamente en la calidad, seguridad y rendimiento de una base de datos.

En el caso de los procedimientos y funciones almacenadas, pudimos ver que encapsular la lógica mejora la organización del sistema y evita errores al validar los datos antes de insertarlos. Comprobamos que un SP rechaza datos inválidos y que una función puede reutilizarse en distintas consultas reforzó la importancia de centralizar reglas de negocio en el motor.

En el tema de índices, los resultados mostraron claramente la diferencia entre consultar una tabla sin índices y hacerlo con distintos tipos de índices aplicados. Aunque en las pruebas los tiempos variaban por pocos milisegundos, entendimos que en tablas más grandes esto tiene un impacto enorme en el rendimiento general del sistema. Esto confirma que el diseño de índices no es un agregado opcional, sino parte clave de la optimización.

Con respecto al manejo de transacciones, pudimos comprobar el cumplimiento del modelo ACID en situaciones reales. Tanto la transacción exitosa como la fallida mostraron que SQL Server garantiza la integridad de los datos incluso frente a errores. Además, observar el funcionamiento de @@TRANCOUNT en una transacción anidada nos ayudó a entender mejor cómo se organizan internamente las operaciones del motor.

Finalmente, en el tema de permisos y roles, las pruebas demostraron que la seguridad no solo depende de limitar accesos, sino de hacerlo de forma ordenada y escalable. Ver cómo un usuario sin privilegios podía ejecutar una operación compleja solo a través de un procedimiento almacenado nos permitió entender la importancia del encapsulamiento. Y al usar roles, comprobamos que administrar permisos de manera grupal simplifica mucho la gestión y reduce errores.

En conjunto, consideramos que los objetivos del trabajo fueron alcanzados. No solo por implementar los temas solicitados, sino que pudimos interpretar los resultados y comprender por qué cada concepto es necesario dentro de un sistema real. Este proyecto nos permitió conectar teoría con práctica y entender cómo cada decisión técnica impacta en el funcionamiento, rendimiento y seguridad de la base de datos.

