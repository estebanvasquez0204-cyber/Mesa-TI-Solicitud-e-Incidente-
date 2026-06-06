## ACTORES DEL SISTEMA

| Campo | Descripción |
|------|------------|
| ID Actor | ACT-001 |
| Nombre del Actor | Usuario solicitante |
| Tipo | Primario |
| Descripción | Es la persona que necesita pedir ayuda porque tiene un problema con un equipo, programa, acceso o servicio, o porque necesita hacer una solicitud al área de soporte. También representa a usuarios que pueden no tener conocimientos técnicos. |
| Responsabilidades | Registrar casos, explicar qué necesita, consultar sus casos anteriores, recibir avisos, reabrir casos cuando el problema continúe, calificar la atención recibida y responder preguntas claras sin depender de términos técnicos. |
| Permisos / Rol | Solicitante |
| CU Relacionados | CU-004, CU-005, CU-006, CU-007, CU-008, CU-013, CU-018, CU-019, CU-021, CU-027 |
| HU Relacionadas | HU-001, HU-002, HU-003, HU-004, HU-005, HU-010, HU-013, HU-014, HU-018, HU-019, HU-020, HU-021, HU-022, HU-027 |
| Restricciones | Solo puede ver y modificar la información de sus propios casos. No puede cambiar casos de otros usuarios ni asignar responsables. El sistema debe guiarlo con preguntas y ejemplos claros. |

---

| Campo | Descripción |
|------|------------|
| ID Actor | ACT-002 |
| Nombre del Actor | Personal de soporte |
| Tipo | Primario |
| Descripción | Es la persona encargada de revisar, organizar y atender los casos registrados por los usuarios. |
| Responsabilidades | Revisar casos pendientes, cambiar la situación del caso, asignar o cambiar la persona encargada, agregar comentarios, pasar casos a otra persona o área y corregir información cuando sea necesario. |
| Permisos / Rol | Soporte |
| CU Relacionados | CU-009, CU-010, CU-011, CU-012, CU-017, CU-020, CU-022, CU-027 |
| HU Relacionadas | HU-006, HU-007, HU-008, HU-009, HU-017, HU-026, HU-028, HU-031 |
| Restricciones | Solo debe modificar casos relacionados con la atención de soporte. Cada cambio importante debe quedar registrado. |

---

| Campo | Descripción |
|------|------------|
| ID Actor | ACT-003 |
| Nombre del Actor | Supervisor de soporte |
| Tipo | Primario |
| Descripción | Es la persona que revisa cómo va la atención de los casos y detecta si hay atrasos o acumulación de trabajo. |
| Responsabilidades | Consultar resúmenes, revisar casos pendientes, casos en atención, casos resueltos, casos atrasados, descargar reportes y revisar la carga del personal de soporte. |
| Permisos / Rol | Consultor |
| CU Relacionados | CU-014, CU-015, CU-025 |
| HU Relacionadas | HU-011, HU-012, HU-015, HU-030 |
| Restricciones | Puede consultar información general de la atención. No debe modificar casos, salvo que la empresa le asigne ese permiso. |

---

| Campo | Descripción |
|------|------------|
| ID Actor | ACT-004 |
| Nombre del Actor | Administrador |
| Tipo | Primario |
| Descripción | Es la persona encargada de mantener organizada la información básica del sistema, como usuarios, tipos de usuario, opciones de registro y tiempos de atención. |
| Responsabilidades | Registrar usuarios, modificar usuarios, desactivar usuarios, definir qué puede hacer cada tipo de usuario, administrar opciones de registro y definir tiempos de respuesta. |
| Permisos / Rol | Administrador |
| CU Relacionados | CU-016, CU-023, CU-024, CU-026, CU-028 |
| HU Relacionadas | HU-016, HU-018, HU-019, HU-020, HU-021, HU-022, HU-029, HU-032 |
| Restricciones | Debe realizar cambios de administración solo cuando estén autorizados por la empresa. |

---

| Campo | Descripción |
|------|------------|
| ID Actor | ACT-005 |
| Nombre del Actor | Sistema de avisos |
| Tipo | Sistema externo |
| Descripción | Es el medio que ayuda a enviar avisos al usuario cuando ocurre algo importante con su caso. |
| Responsabilidades | Enviar confirmaciones y avisos cuando un caso se registra o cambia de situación. |
| Permisos / Rol | Envío de avisos |
| CU Relacionados | CU-005, CU-006 |
| HU Relacionadas | HU-002, HU-003 |
| Restricciones | No crea ni atiende casos. Solo envía avisos cuando el sistema principal lo solicita. |

---

| Campo | Descripción |
|------|------------|
| ID Actor | ACT-006 |
| Nombre del Actor | Usuario del sistema |
| Tipo | Primario |
| Descripción | Es cualquier persona registrada que necesita ingresar al sistema para usar las funciones que le corresponden según su tipo de usuario. |
| Responsabilidades | Ingresar al sistema, recuperar su contraseña si la olvida y cerrar su sesión al terminar. |
| Permisos / Rol | Solicitante / Soporte / Consultor / Administrador |
| CU Relacionados | CU-001, CU-002, CU-003 |
| HU Relacionadas | HU-023, HU-024, HU-025 |
| Restricciones | Solo se usa como actor general para iniciar sesión, recuperar contraseña y cerrar sesión. |
