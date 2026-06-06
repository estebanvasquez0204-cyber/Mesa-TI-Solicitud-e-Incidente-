# Requisitos Funcionales
 
| ID | HU Relacionada | Descripción |
|----|---------------|-------------|
| RF-001 | HU-001 | El sistema debe permitir al usuario registrar un caso de soporte e indicar si está reportando un problema o haciendo una solicitud. |
| RF-002 | HU-001 | El sistema debe preguntar al usuario cuál es el problema o qué necesita solicitar. |
| RF-003 | HU-001 | El sistema debe preguntar dónde ocurre el problema o dónde se necesita la atención. |
| RF-004 | HU-001 | El sistema debe preguntar si el problema afecta solo al usuario, a varias personas de su área o a toda la empresa. |
| RF-005 | HU-001 | El sistema debe permitir que el usuario agregue una imagen o documento que ayude a explicar mejor el caso. |
| RF-006 | HU-001 | El sistema debe mostrar ejemplos sencillos junto a las preguntas que puedan generar dudas al usuario. |
| RF-007 | HU-002 | El sistema debe crear un número único de seguimiento cuando el usuario envíe un caso. |
| RF-008 | HU-002 | El sistema debe mostrar en pantalla un mensaje confirmando que el caso fue recibido. |
| RF-009 | HU-002 | El sistema debe enviar al correo del usuario la confirmación del caso con su número único de seguimiento. |
| RF-010 | HU-003 | El sistema debe avisar al usuario cuando su caso pase a recibido, en revisión, en atención, resuelto, cerrado o reabierto. |
| RF-011 | HU-003 | El sistema debe enviar los avisos al usuario por correo, mostrar un aviso emergente dentro del sistema y dejar el aviso visible dentro del detalle del caso. |
| RF-012 | HU-004 | El sistema debe preguntar al usuario si está reportando algo que no funciona o si está solicitando algo que necesita. |
| RF-013 | HU-004 | El sistema debe mostrar ejemplos claros de problema y de solicitud para que el usuario pueda elegir correctamente. |
| RF-014 | HU-031 | El sistema debe permitir que el personal de soporte corrija el tipo de caso cuando el usuario lo haya seleccionado de forma equivocada. |
| RF-015 | HU-005 | El sistema debe permitir al usuario ver la lista de sus casos anteriores. |
| RF-016 | HU-005 | El sistema debe mostrar en cada caso anterior el número de seguimiento, título, fecha, tipo de caso, situación actual y persona asignada. |
| RF-017 | HU-005 | El sistema debe mostrar los casos anteriores del más reciente al más antiguo. |
| RF-018 | HU-005 | El sistema debe permitir buscar casos anteriores por fecha. |
| RF-019 | HU-005 | El sistema debe permitir buscar casos anteriores por situación del caso. |
| RF-020 | HU-005 | El sistema debe permitir buscar casos anteriores por tipo de problema o tipo de solicitud. |
| RF-021 | HU-005 | El sistema debe permitir buscar casos anteriores por una palabra escrita en el título o descripción. |
| RF-022 | HU-006 | El sistema debe mostrar al personal de soporte todos los casos pendientes en una sola pantalla. |
| RF-023 | HU-006 | El sistema debe ordenar los casos pendientes según su importancia, fecha de registro y tipo de ayuda requerida. |
| RF-024 | HU-006 | El sistema debe permitir al personal de soporte buscar casos pendientes por tipo de problema, situación actual o fecha. |
| RF-025 | HU-007 | El sistema debe permitir al personal de soporte cambiar la situación actual de un caso según avance su atención. |
| RF-026 | HU-007 | El sistema debe mostrar al personal de soporte las situaciones disponibles para actualizar un caso. |
| RF-027 | HU-008 | El sistema debe permitir asignar un caso a una persona de soporte. |
| RF-028 | HU-008 | El sistema debe permitir cambiar la persona encargada de un caso cuando sea necesario. |
| RF-029 | HU-008 | El sistema debe permitir registrar una explicación breve cuando se cambie la persona encargada de un caso. |
| RF-030 | HU-009 | El sistema debe permitir agregar comentarios visibles para el usuario. |
| RF-031 | HU-009 | El sistema debe permitir agregar comentarios internos que solo pueda ver el personal de soporte. |
| RF-032 | HU-007, HU-008, HU-009 | El sistema debe guardar un registro de cada cambio realizado en el caso, indicando quién lo hizo, cuándo lo hizo, qué cambió y cuál era la información anterior. |
| RF-033 | HU-010 | El sistema debe mostrar al usuario un tiempo aproximado de atención según el tipo de caso y su importancia. |
| RF-034 | HU-010 | El sistema debe actualizar el tiempo aproximado cuando una persona de soporte asuma el caso. |
| RF-035 | HU-011 | El sistema debe mostrar al supervisor la cantidad de casos pendientes, casos en atención, casos resueltos y casos atrasados. |
| RF-036 | HU-011 | El sistema debe mostrar al supervisor los casos agrupados por persona de soporte y por tipo de ayuda requerida. |
| RF-037 | HU-012 | El sistema debe permitir consultar el resumen por día. |
| RF-038 | HU-012 | El sistema debe permitir consultar el resumen por semana. |
| RF-039 | HU-012 | El sistema debe permitir consultar el resumen por mes. |
| RF-040 | HU-012 | El sistema debe permitir consultar el resumen en un periodo elegido por el supervisor. |
| RF-041 | HU-013 | El sistema debe permitir reabrir un caso dentro de los 5 días hábiles siguientes a su solución. |
| RF-042 | HU-013 | El sistema debe conservar el mismo número de seguimiento cuando un caso sea reabierto. |
| RF-043 | HU-014 | El sistema debe permitir calificar la atención con una escala de 1 a 5 estrellas al cerrar el caso. |
| RF-044 | HU-014 | El sistema debe permitir dejar un comentario opcional al calificar la atención. |
| RF-045 | HU-015 | El sistema debe permitir al supervisor ver qué tipo de casos puede atender cada persona de soporte. |
| RF-046 | HU-015 | El sistema debe mostrar la disponibilidad y carga actual de trabajo de cada persona de soporte. |
| RF-047 | HU-016 | El sistema debe permitir registrar nuevos usuarios con nombre, cargo, área y rol. |
| RF-048 | HU-016 | El sistema debe permitir modificar la información de usuarios registrados. |
| RF-049 | HU-016 | El sistema debe permitir desactivar usuarios que ya no deban usar la mesa de ayuda. |
| RF-050 | HU-017 | El sistema debe permitir al personal de soporte consultar el listado de usuarios con su cargo y área. |
| RF-051 | HU-018 | El sistema debe permitir seleccionar el tipo de problema reportado, como equipo, internet, programa o acceso. |
| RF-052 | HU-019 | El sistema debe permitir seleccionar el tipo de solicitud, como acceso, equipo, programa, información u otra ayuda. |
| RF-053 | HU-020 | El sistema debe permitir indicar si la solicitud es para algo nuevo, para cambiar algo existente o para hacer una consulta. |
| RF-054 | HU-021 | El sistema debe permitir indicar si el problema afecta solo al usuario, a su área o a toda la empresa. |
| RF-055 | HU-022 | El sistema debe permitir indicar qué tan rápido se necesita la atención: baja, media, alta o crítica. |
| RF-056 | HU-021, HU-022 | El sistema debe calcular la importancia del caso combinando cuántas personas se ven afectadas y qué tan rápido se necesita la atención. |
| RF-057 | HU-023 | El sistema debe permitir que el usuario ingrese con sus datos de acceso. |
| RF-058 | HU-024 | El sistema debe permitir recuperar la contraseña cuando el usuario la olvide. |
| RF-059 | HU-025 | El sistema debe permitir cerrar la sesión de forma segura. |
| RF-060 | HU-026 | El sistema debe permitir pasar un caso a otra persona o área cuando quien lo atiende no pueda resolverlo. |
| RF-061 | HU-027 | El sistema debe permitir consultar ayudas rápidas antes de crear un caso. |
| RF-062 | HU-027 | El sistema debe permitir buscar soluciones frecuentes por palabra relacionada con el problema. |
| RF-063 | HU-028 | El sistema debe cerrar automáticamente un caso resuelto si el usuario no responde después del plazo definido. |
| RF-064 | HU-029 | El sistema debe permitir al administrador definir tiempos de respuesta según la importancia y tipo de caso. |
| RF-065 | HU-030 | El sistema debe permitir descargar reportes de atención en PDF. |
| RF-066 | HU-030 | El sistema debe permitir descargar reportes de atención en Excel. |
| RF-067 | HU-016 | El sistema debe permitir al administrador definir qué puede hacer cada tipo de usuario dentro de la mesa de ayuda, como crear casos, atenderlos, revisar resúmenes o administrar usuarios. |
| RF-068 | HU-021, HU-022 | El sistema debe permitir al administrador definir una tabla sencilla que combine cuántas personas se ven afectadas y qué tan rápido se necesita atención, para ayudar a ordenar los casos según su importancia. |
| RF-069 | HU-018, HU-019, HU-020 | El sistema debe permitir al administrador crear, cambiar o quitar las opciones que el usuario puede elegir cuando reporta un problema o hace una solicitud. |
| RF-070 | HU-011, HU-012 | El sistema debe avisar al supervisor cuando la cantidad de casos pendientes o atrasados supere la cantidad límite definida por la empresa. |
| RF-071 | HU-001 | El sistema debe revisar que el usuario haya completado la información necesaria antes de enviar el caso y debe mostrar un mensaje claro indicando qué dato falta. |
| RF-072 | HU-003, HU-005 | El sistema debe mostrar al usuario, desde su pantalla principal, cómo va cada uno de sus casos y permitirle ver más detalles. |
 
