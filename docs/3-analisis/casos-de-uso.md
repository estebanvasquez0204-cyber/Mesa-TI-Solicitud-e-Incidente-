# Casos de Uso

**CU-001 — Iniciar sesión**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-001 |
| **Nombre** | Iniciar sesión |
| **HU Relacionada** | HU-023 |
| **Actor(es)** | Usuario del sistema |
| **Descripción** | Permite que una persona ingrese al sistema con sus datos de acceso para usar las funciones que le corresponden. |
| **Precondiciones** | El usuario debe estar registrado en el sistema. |
| **Postcondiciones** | El usuario ingresa al sistema y ve las opciones permitidas para su tipo de usuario. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Usuario del sistema | Ingresa a la pantalla de acceso. |
| 2 | Sistema | Muestra los espacios para escribir los datos de ingreso. |
| 3 | Usuario del sistema | Escribe sus datos y confirma el ingreso. |
| 4 | Sistema | Verifica los datos y permite entrar a la pantalla principal. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el usuario recuerda sus datos, ingresa normalmente y ve las funciones permitidas. |
| **FA-02** | Si el usuario olvidó su contraseña, puede ir al caso de uso CU-002 Recuperar contraseña. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si los datos son incorrectos, el sistema muestra un mensaje claro indicando que debe revisarlos. |
| **FE-02** | Si el usuario está desactivado, el sistema no permite el ingreso e informa que debe contactar al administrador. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Alta |
| **Frecuencia de uso** | Diaria |
| **RN Relacionadas** | RN-015, RN-025 |
| **RNF Relacionados** | RNF-006 |
| **Notas / Observaciones** | Este caso evita que cualquier persona use funciones que no le corresponden. |

---

**CU-002 — Recuperar contraseña**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-002 |
| **Nombre** | Recuperar contraseña |
| **HU Relacionada** | HU-024 |
| **Actor(es)** | Usuario del sistema |
| **Descripción** | Permite que el usuario recupere su contraseña cuando no recuerda sus datos de ingreso. |
| **Precondiciones** | El usuario debe estar registrado en el sistema. |
| **Postcondiciones** | El usuario recibe una forma segura para recuperar el acceso. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Usuario del sistema | Selecciona la opción de recuperar contraseña. |
| 2 | Sistema | Solicita el correo o dato de identificación del usuario. |
| 3 | Usuario del sistema | Ingresa la información solicitada. |
| 4 | Sistema | Envía las instrucciones para recuperar el acceso. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el usuario recuerda la contraseña, puede volver a la pantalla de ingreso. |
| **FA-02** | Si el usuario no recibe el correo, puede solicitar el envío nuevamente. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si el correo no está registrado, el sistema informa que no encontró una cuenta asociada. |
| **FE-02** | Si ocurre un error al enviar el mensaje, el sistema informa que debe intentarse nuevamente. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Media |
| **Frecuencia de uso** | Ocasional |
| **RN Relacionadas** | RN-025 |
| **RNF Relacionados** | RNF-006 |
| **Notas / Observaciones** | Este caso evita que el usuario tenga que pedir ayuda por WhatsApp, correo o de palabra para recuperar su acceso. |

---

**CU-003 — Cerrar sesión**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-003 |
| **Nombre** | Cerrar sesión |
| **HU Relacionada** | HU-025 |
| **Actor(es)** | Usuario del sistema |
| **Descripción** | Permite que el usuario cierre su sesión al terminar de usar el sistema. |
| **Precondiciones** | El usuario debe haber ingresado al sistema. |
| **Postcondiciones** | La sesión queda cerrada y otra persona no puede usar esa cuenta desde el mismo equipo. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Usuario del sistema | Selecciona la opción de cerrar sesión. |
| 2 | Sistema | Pide confirmación de salida si es necesario. |
| 3 | Usuario del sistema | Confirma que desea salir. |
| 4 | Sistema | Cierra la sesión y vuelve a la pantalla de ingreso. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el usuario no confirma la salida, permanece dentro del sistema. |
| **FA-02** | Si el usuario deja el sistema abierto por mucho tiempo sin usarlo, la empresa puede definir cierre automático. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si ocurre un error al cerrar sesión, el sistema informa al usuario y permite intentarlo nuevamente. |
| **FE-02** | Si la sesión ya fue cerrada, el sistema muestra la pantalla de ingreso. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Media |
| **Frecuencia de uso** | Diaria |
| **RN Relacionadas** | RN-015 |
| **RNF Relacionados** | RNF-006 |
| **Notas / Observaciones** | Este caso ayuda a proteger la información del usuario. |

---

**CU-004 — Registrar caso de soporte**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-004 |
| **Nombre** | Registrar caso de soporte |
| **HU Relacionada** | HU-001 |
| **Actor(es)** | Usuario solicitante |
| **Descripción** | Permite registrar los datos básicos de un caso de soporte, explicando qué necesita el usuario, dónde ocurre y agregando información que ayude a entender el caso. |
| **Precondiciones** | El usuario debe haber ingresado al sistema. |
| **Postcondiciones** | El caso queda registrado con los datos básicos necesarios para continuar con su clasificación. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Usuario solicitante | Selecciona la opción para crear un nuevo caso. |
| 2 | Sistema | Muestra una pantalla con preguntas claras para registrar los datos básicos. |
| 3 | Usuario solicitante | Escribe qué necesita, dónde ocurre y agrega una imagen o documento si lo considera necesario. |
| 4 | Sistema | Guarda la información básica del caso. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el usuario tiene una imagen o documento que ayude a explicar el caso, puede agregarlo antes de continuar. |
| **FA-02** | Si el usuario no tiene archivo de apoyo, puede continuar solo con la información escrita. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si falta información necesaria, el sistema indica qué dato falta y no permite enviar el caso hasta completarlo. |
| **FE-02** | Si el caso no se puede guardar, el sistema muestra un mensaje claro y permite intentarlo nuevamente. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Alta |
| **Frecuencia de uso** | Diaria |
| **RN Relacionadas** | RN-001, RN-014 |
| **RNF Relacionados** | RNF-001, RNF-002, RNF-003, RNF-004, RNF-012 |
| **Notas / Observaciones** | Este caso queda separado de la clasificación para que sea más claro y verificable. |

---

**CU-005 — Confirmar caso enviado**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-005 |
| **Nombre** | Confirmar caso enviado |
| **HU Relacionada** | HU-002 |
| **Actor(es)** | Usuario solicitante / Sistema de avisos |
| **Descripción** | Permite que el usuario sepa que su caso fue recibido y que tiene un número único para consultarlo después. |
| **Precondiciones** | El caso debe haberse enviado correctamente. |
| **Postcondiciones** | El usuario recibe confirmación en pantalla y por correo. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Usuario solicitante | Envía el caso. |
| 2 | Sistema | Crea un número único de seguimiento. |
| 3 | Sistema | Muestra confirmación en pantalla. |
| 4 | Sistema de avisos | Envía la confirmación al correo del usuario. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el correo no llega inmediatamente, el usuario puede ver la confirmación dentro del sistema. |
| **FA-02** | Si el usuario desea revisar el número después, puede consultarlo en sus casos anteriores. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si el caso no se guardó, el sistema no genera número y muestra un mensaje de error. |
| **FE-02** | Si el correo no puede enviarse, la confirmación queda visible dentro del sistema. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Alta |
| **Frecuencia de uso** | Diaria |
| **RN Relacionadas** | RN-002, RN-014 |
| **RNF Relacionados** | RNF-009, RNF-012 |
| **Notas / Observaciones** | Este caso evita que el usuario piense que su solicitud se perdió. |

---

**CU-006 — Avisar avance del caso**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-006 |
| **Nombre** | Avisar avance del caso |
| **HU Relacionada** | HU-003 |
| **Actor(es)** | Usuario solicitante / Sistema de avisos |
| **Descripción** | Permite avisar al usuario cuando su caso cambia de situación, por ejemplo cuando pasa a revisión, atención o solución. |
| **Precondiciones** | El caso debe existir y cambiar de situación. |
| **Postcondiciones** | El usuario recibe un aviso por correo y dentro del sistema. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Personal de soporte | Cambia la situación del caso. |
| 2 | Sistema | Guarda el cambio realizado. |
| 3 | Sistema de avisos | Envía un aviso al usuario. |
| 4 | Usuario solicitante | Recibe el aviso y puede revisar más detalles. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el cambio incluye comentario visible, el usuario puede leerlo desde el detalle del caso. |
| **FA-02** | Si el usuario no revisa el correo, puede ver el aviso dentro del sistema. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si el aviso por correo falla, el aviso queda disponible dentro del sistema. |
| **FE-02** | Si no existe medio de contacto, el sistema solo muestra el avance al ingresar. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Alta |
| **Frecuencia de uso** | Diaria |
| **RN Relacionadas** | RN-013 |
| **RNF Relacionados** | RNF-009, RNF-013 |
| **Notas / Observaciones** | Este caso reduce la necesidad de que el usuario pregunte por otros medios. |

---

**CU-007 — Consultar casos anteriores**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-007 |
| **Nombre** | Consultar casos anteriores |
| **HU Relacionada** | HU-005 |
| **Actor(es)** | Usuario solicitante |
| **Descripción** | Permite que el usuario revise sus casos anteriores, qué pidió, cuándo lo pidió, cómo fue atendido y qué respuesta recibió. |
| **Precondiciones** | El usuario debe haber ingresado al sistema y tener casos registrados. |
| **Postcondiciones** | El usuario visualiza la lista de sus casos anteriores. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Usuario solicitante | Ingresa a la sección de casos anteriores. |
| 2 | Sistema | Muestra la lista de casos ordenada del más reciente al más antiguo. |
| 3 | Usuario solicitante | Busca o selecciona un caso. |
| 4 | Sistema | Muestra el detalle del caso seleccionado. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el usuario tiene muchos casos, puede buscar por fecha, situación, tipo de problema o palabra relacionada. |
| **FA-02** | Si el usuario solo quiere revisar los más recientes, puede usar el orden mostrado por el sistema. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si el usuario no tiene casos anteriores, el sistema muestra un mensaje indicando que no hay información para mostrar. |
| **FE-02** | Si el historial no carga, el sistema permite intentarlo nuevamente. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Media |
| **Frecuencia de uso** | Ocasional |
| **RN Relacionadas** | RN-010, RN-021 |
| **RNF Relacionados** | RNF-005, RNF-011 |
| **Notas / Observaciones** | Este caso evita que el usuario dependa de chats o correos anteriores para recordar qué ocurrió. |

---

**CU-008 — Ver mis casos desde la pantalla principal**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-008 |
| **Nombre** | Ver mis casos desde la pantalla principal |
| **HU Relacionada** | HU-003, HU-005 |
| **Actor(es)** | Usuario solicitante |
| **Descripción** | Permite que el usuario vea rápidamente cómo van sus casos desde la pantalla principal. |
| **Precondiciones** | El usuario debe haber ingresado al sistema. |
| **Postcondiciones** | El usuario visualiza la situación actual de sus casos y puede abrir el detalle. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Usuario solicitante | Ingresa al sistema. |
| 2 | Sistema | Muestra en la pantalla principal los casos del usuario. |
| 3 | Usuario solicitante | Selecciona un caso para ver más información. |
| 4 | Sistema | Muestra el detalle del caso seleccionado. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el usuario no quiere abrir el detalle, puede ver la situación general desde la pantalla principal. |
| **FA-02** | Si el usuario tiene varios casos, puede buscar el que necesita revisar. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si no hay casos registrados, el sistema muestra un mensaje indicando que no tiene casos activos. |
| **FE-02** | Si el detalle no carga, el sistema muestra un mensaje y permite intentarlo otra vez. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Alta |
| **Frecuencia de uso** | Diaria |
| **RN Relacionadas** | RN-010 |
| **RNF Relacionados** | RNF-013 |
| **Notas / Observaciones** | Este caso ayuda a que el usuario no tenga que preguntar por WhatsApp, correo o de palabra cómo va su caso. |

---

**CU-009 — Revisar casos pendientes**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-009 |
| **Nombre** | Revisar casos pendientes |
| **HU Relacionada** | HU-006 |
| **Actor(es)** | Personal de soporte |
| **Descripción** | Permite que soporte vea los casos que aún faltan por atender y los organice según su importancia. |
| **Precondiciones** | Deben existir casos registrados. |
| **Postcondiciones** | El personal de soporte identifica qué casos debe atender primero. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Personal de soporte | Ingresa a la pantalla de casos pendientes. |
| 2 | Sistema | Muestra todos los casos pendientes. |
| 3 | Personal de soporte | Revisa los casos más importantes. |
| 4 | Sistema | Permite abrir un caso para atenderlo. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si hay muchos casos, el personal de soporte puede buscar por tipo de problema, situación o fecha. |
| **FA-02** | Si no hay casos urgentes, el personal puede atender según orden de llegada. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si no hay casos pendientes, el sistema muestra que no existen casos por atender. |
| **FE-02** | Si la lista no carga, el sistema informa que debe intentarse nuevamente. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Alta |
| **Frecuencia de uso** | Diaria |
| **RN Relacionadas** | RN-005, RN-016 |
| **RNF Relacionados** | RNF-010 |
| **Notas / Observaciones** | Este caso ayuda a evitar que los casos queden olvidados. |

---

**CU-010 — Cambiar situación del caso**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-010 |
| **Nombre** | Cambiar situación del caso |
| **HU Relacionada** | HU-007 |
| **Actor(es)** | Personal de soporte |
| **Descripción** | Permite actualizar cómo va un caso según avance su atención. |
| **Precondiciones** | El caso debe existir y estar asignado o disponible para soporte. |
| **Postcondiciones** | El caso queda actualizado con su nueva situación. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Personal de soporte | Abre el caso que está atendiendo. |
| 2 | Sistema | Muestra la situación actual del caso. |
| 3 | Personal de soporte | Selecciona la nueva situación del caso. |
| 4 | Sistema | Guarda el cambio y lo deja visible para el usuario. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el caso necesita revisión antes de atención, soporte puede cambiarlo a en revisión. |
| **FA-02** | Si el caso ya fue solucionado, soporte puede cambiarlo a resuelto. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si se intenta hacer un cambio que no corresponde al orden normal, el sistema no lo permite. |
| **FE-02** | Si no se puede guardar el cambio, el sistema muestra un mensaje de error. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Alta |
| **Frecuencia de uso** | Diaria |
| **RN Relacionadas** | RN-006, RN-008 |
| **RNF Relacionados** | RNF-007, RNF-009 |
| **Notas / Observaciones** | Este caso permite que el usuario vea cómo avanza su caso. |

---

**CU-011 — Asignar persona encargada**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-011 |
| **Nombre** | Asignar persona encargada |
| **HU Relacionada** | HU-008 |
| **Actor(es)** | Personal de soporte |
| **Descripción** | Permite asignar o cambiar la persona que revisará un caso. |
| **Precondiciones** | El caso debe existir en el sistema. |
| **Postcondiciones** | El caso queda con una persona encargada. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Personal de soporte | Abre el caso. |
| 2 | Sistema | Muestra las personas disponibles para atenderlo. |
| 3 | Personal de soporte | Selecciona la persona encargada. |
| 4 | Sistema | Guarda la asignación del caso. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si la persona asignada no puede atenderlo, se puede cambiar por otra persona. |
| **FA-02** | Si el caso requiere otra área, puede pasarse mediante el caso de uso CU-020. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si se cambia la persona encargada sin explicación, el sistema solicita una razón breve. |
| **FE-02** | Si la persona seleccionada no está disponible, el sistema informa que debe elegirse otra. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Alta |
| **Frecuencia de uso** | Diaria |
| **RN Relacionadas** | RN-006, RN-018 |
| **RNF Relacionados** | RNF-007 |
| **Notas / Observaciones** | Este caso evita que un caso quede sin responsable. |

---

**CU-012 — Agregar comentarios al caso**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-012 |
| **Nombre** | Agregar comentarios al caso |
| **HU Relacionada** | HU-009 |
| **Actor(es)** | Personal de soporte |
| **Descripción** | Permite escribir comentarios sobre avances, aclaraciones o información faltante dentro de un caso. |
| **Precondiciones** | El caso debe existir en el sistema. |
| **Postcondiciones** | El comentario queda guardado en el caso. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Personal de soporte | Abre el caso. |
| 2 | Sistema | Muestra la opción para agregar comentario. |
| 3 | Personal de soporte | Escribe el comentario y elige si será visible para el usuario o solo para soporte. |
| 4 | Sistema | Guarda el comentario en el caso. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el comentario es para el usuario, queda visible en el detalle del caso. |
| **FA-02** | Si el comentario es interno, solo lo ve el personal de soporte. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si el comentario está vacío, el sistema pide escribir información antes de guardar. |
| **FE-02** | Si el comentario no se guarda, el sistema muestra un mensaje y permite intentarlo nuevamente. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Media |
| **Frecuencia de uso** | Diaria |
| **RN Relacionadas** | RN-006, RN-022 |
| **RNF Relacionados** | RNF-007 |
| **Notas / Observaciones** | Este caso ayuda a dejar claro qué se ha hecho y qué falta por revisar. |

---

**CU-013 — Consultar tiempo aproximado**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-013 |
| **Nombre** | Consultar tiempo aproximado |
| **HU Relacionada** | HU-010 |
| **Actor(es)** | Usuario solicitante |
| **Descripción** | Permite que el usuario vea un tiempo aproximado de atención según la importancia del caso y el tipo de ayuda que necesita. |
| **Precondiciones** | El caso debe estar registrado. |
| **Postcondiciones** | El usuario ve una referencia de tiempo aproximado. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Usuario solicitante | Consulta su caso. |
| 2 | Sistema | Revisa la importancia y tipo del caso. |
| 3 | Sistema | Muestra el tiempo aproximado de atención. |
| 4 | Usuario solicitante | Usa esa información para organizar sus actividades. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el tiempo cambia cuando soporte asume el caso, el sistema lo actualiza. |
| **FA-02** | Si el caso no tiene tiempo definido, el sistema informa que está pendiente de revisión. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si el sistema no puede mostrar el tiempo, informa que no está disponible. |
| **FE-02** | Si el caso no existe, el sistema indica que no encontró información. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Media |
| **Frecuencia de uso** | Ocasional |
| **RN Relacionadas** | RN-012 |
| **RNF Relacionados** | RNF-005, RNF-013 |
| **Notas / Observaciones** | El tiempo es una orientación para el usuario, no una promesa absoluta de solución. |

---

**CU-014 — Consultar resumen de atención**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-014 |
| **Nombre** | Consultar resumen de atención |
| **HU Relacionada** | HU-011, HU-012 |
| **Actor(es)** | Supervisor de soporte |
| **Descripción** | Permite que el supervisor revise cómo va la atención, cuántos casos hay pendientes, en atención, resueltos o atrasados. |
| **Precondiciones** | Deben existir casos registrados en el sistema. |
| **Postcondiciones** | El supervisor ve el resumen de atención y puede detectar acumulaciones o atrasos. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Supervisor de soporte | Ingresa al resumen de atención. |
| 2 | Sistema | Muestra la cantidad de casos por situación. |
| 3 | Supervisor de soporte | Revisa si hay acumulación o retrasos. |
| 4 | Sistema | Permite consultar el resumen por día, semana, mes o periodo elegido. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el supervisor quiere revisar un periodo específico, elige las fechas de consulta. |
| **FA-02** | Si hay muchos casos pendientes o atrasados, el sistema puede mostrar un aviso al supervisor. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si no hay datos en el periodo elegido, el sistema muestra que no hay información para ese periodo. |
| **FE-02** | Si el resumen no carga, el sistema informa que debe intentarse nuevamente. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Media |
| **Frecuencia de uso** | Semanal |
| **RN Relacionadas** | RN-011 |
| **RNF Relacionados** | RNF-005, RNF-010 |
| **Notas / Observaciones** | Este caso ayuda a que el supervisor vea si la atención está funcionando bien o si se están acumulando casos. |

---

**CU-015 — Consultar información del personal de soporte**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-015 |
| **Nombre** | Consultar información del personal de soporte |
| **HU Relacionada** | HU-015 |
| **Actor(es)** | Supervisor de soporte |
| **Descripción** | Permite ver qué tipo de casos puede atender cada persona de soporte, si está disponible y cuántos casos tiene asignados. |
| **Precondiciones** | Debe existir personal de soporte registrado. |
| **Postcondiciones** | El supervisor identifica a quién puede asignarse mejor un caso. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Supervisor de soporte | Ingresa a la sección del personal de soporte. |
| 2 | Sistema | Muestra la lista de personas de soporte. |
| 3 | Supervisor de soporte | Revisa disponibilidad y carga de trabajo. |
| 4 | Sistema | Muestra el tipo de casos que cada persona puede atender. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si una persona no está disponible, el supervisor puede revisar otras opciones. |
| **FA-02** | Si varias personas pueden atender el mismo caso, el supervisor puede elegir la que tenga menos carga. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si no hay personal registrado, el sistema muestra que no hay información disponible. |
| **FE-02** | Si la información no carga, el sistema permite intentarlo nuevamente. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Media |
| **Frecuencia de uso** | Semanal |
| **RN Relacionadas** | RN-018 |
| **RNF Relacionados** | RNF-010 |
| **Notas / Observaciones** | Este caso ayuda a repartir mejor la atención de los casos. |

---

**CU-016 — Administrar usuarios**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-016 |
| **Nombre** | Administrar usuarios |
| **HU Relacionada** | HU-016 |
| **Actor(es)** | Administrador |
| **Descripción** | Permite registrar, modificar o desactivar usuarios, y definir qué puede hacer cada tipo de usuario dentro de la mesa de ayuda. |
| **Precondiciones** | El administrador debe haber ingresado al sistema. |
| **Postcondiciones** | La información de usuarios queda actualizada. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Administrador | Ingresa a la administración de usuarios. |
| 2 | Sistema | Muestra la lista de usuarios registrados. |
| 3 | Administrador | Registra, modifica, desactiva usuarios o define qué puede hacer cada tipo de usuario. |
| 4 | Sistema | Guarda los cambios realizados. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el administrador solo necesita cambiar el área o cargo de un usuario, modifica esos datos sin crear una cuenta nueva. |
| **FA-02** | Si un usuario ya no debe usar el sistema, el administrador puede desactivarlo. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si falta información necesaria del usuario, el sistema indica qué dato falta. |
| **FE-02** | Si se intenta asignar una acción no permitida, el sistema muestra un mensaje de advertencia. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Alta |
| **Frecuencia de uso** | Ocasional |
| **RN Relacionadas** | RN-015, RN-020, RN-025 |
| **RNF Relacionados** | RNF-006 |
| **Notas / Observaciones** | Este caso garantiza que cada persona use solo las funciones que le corresponden. |

---

**CU-017 — Consultar usuarios registrados**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-017 |
| **Nombre** | Consultar usuarios registrados |
| **HU Relacionada** | HU-017 |
| **Actor(es)** | Personal de soporte |
| **Descripción** | Permite consultar el listado de usuarios registrados con su cargo y área para entender mejor quién está solicitando ayuda. |
| **Precondiciones** | Deben existir usuarios registrados. |
| **Postcondiciones** | El personal de soporte identifica al usuario y su área. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Personal de soporte | Busca al usuario que hizo la solicitud. |
| 2 | Sistema | Muestra el listado de usuarios registrados. |
| 3 | Personal de soporte | Selecciona al usuario. |
| 4 | Sistema | Muestra su cargo y área. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el usuario tiene varios casos, el personal puede revisar sus casos relacionados. |
| **FA-02** | Si el usuario pertenece a un área específica, soporte puede entender mejor el contexto del caso. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si el usuario no aparece registrado, el sistema muestra que no fue encontrado. |
| **FE-02** | Si la información del usuario está incompleta, el sistema muestra solo los datos disponibles. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Media |
| **Frecuencia de uso** | Diaria |
| **RN Relacionadas** | RN-020 |
| **RNF Relacionados** | RNF-006 |
| **Notas / Observaciones** | Este caso ayuda a entender quién solicita ayuda y a qué área pertenece. |

---

**CU-018 — Reabrir caso**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-018 |
| **Nombre** | Reabrir caso |
| **HU Relacionada** | HU-013 |
| **Actor(es)** | Usuario solicitante |
| **Descripción** | Permite que el usuario reabra un caso cuando el problema continúa dentro del plazo definido. |
| **Precondiciones** | El caso debe estar marcado como solucionado y no haber superado los 5 días hábiles. |
| **Postcondiciones** | El caso queda nuevamente disponible para atención. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Usuario solicitante | Ingresa al caso solucionado. |
| 2 | Sistema | Muestra la opción para reabrir si aún está dentro del plazo. |
| 3 | Usuario solicitante | Explica por qué el problema continúa. |
| 4 | Sistema | Reabre el caso y conserva el mismo número de seguimiento. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el usuario tiene nuevos detalles, puede agregarlos al reabrir el caso. |
| **FA-02** | Si el usuario prefiere, puede crear un caso nuevo. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si ya pasaron los 5 días hábiles, el sistema informa que debe crear un caso nuevo. |
| **FE-02** | Si el usuario no explica por qué reabre, el sistema pide completar esa información. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Media |
| **Frecuencia de uso** | Ocasional |
| **RN Relacionadas** | RN-007, RN-019 |
| **RNF Relacionados** | RNF-011 |
| **Notas / Observaciones** | Este caso evita que el usuario repita toda la información desde cero. |

---

**CU-019 — Calificar atención recibida**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-019 |
| **Nombre** | Calificar atención recibida |
| **HU Relacionada** | HU-014 |
| **Actor(es)** | Usuario solicitante |
| **Descripción** | Permite que el usuario califique la atención recibida y deje un comentario si lo desea. |
| **Precondiciones** | El caso debe estar cerrado. |
| **Postcondiciones** | La calificación queda guardada para revisión de la empresa. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Sistema | Muestra la opción de calificar al cerrar el caso. |
| 2 | Usuario solicitante | Selecciona una calificación de 1 a 5 estrellas. |
| 3 | Usuario solicitante | Escribe un comentario opcional si lo desea. |
| 4 | Sistema | Guarda la calificación y el comentario. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el usuario no quiere comentar, puede enviar solo la calificación. |
| **FA-02** | Si el usuario no quiere calificar, puede omitir la acción si la empresa lo permite. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si el caso no está cerrado, el sistema no muestra la opción de calificar. |
| **FE-02** | Si la calificación no se guarda, el sistema informa que debe intentarse nuevamente. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Baja |
| **Frecuencia de uso** | Ocasional |
| **RN Relacionadas** | RN-009 |
| **RNF Relacionados** | RNF-002 |
| **Notas / Observaciones** | Este caso ayuda a saber si la atención fue clara y útil para el usuario. |

---

**CU-020 — Pasar caso a otra persona o área**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-020 |
| **Nombre** | Pasar caso a otra persona o área |
| **HU Relacionada** | HU-026 |
| **Actor(es)** | Personal de soporte |
| **Descripción** | Permite que soporte pase un caso a otra persona o área cuando no pueda resolverlo. |
| **Precondiciones** | El caso debe estar registrado y en atención. |
| **Postcondiciones** | El caso queda asignado a otra persona o área que pueda atenderlo mejor. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Personal de soporte | Revisa el caso y determina que no puede resolverlo. |
| 2 | Sistema | Muestra la opción para pasarlo a otra persona o área. |
| 3 | Personal de soporte | Selecciona la nueva persona o área y explica el motivo. |
| 4 | Sistema | Guarda el cambio y deja el caso asignado nuevamente. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el caso requiere apoyo de otra área, se envía a esa área. |
| **FA-02** | Si otra persona de soporte tiene mayor conocimiento del tema, se le asigna el caso. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si no se indica motivo del cambio, el sistema pide completarlo. |
| **FE-02** | Si no hay persona disponible, el sistema informa que debe elegirse otra opción. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Alta |
| **Frecuencia de uso** | Ocasional |
| **RN Relacionadas** | RN-017, RN-018 |
| **RNF Relacionados** | RNF-007 |
| **Notas / Observaciones** | Este caso evita que un caso quede detenido con una persona que no puede resolverlo. |

---

**CU-021 — Consultar ayudas rápidas**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-021 |
| **Nombre** | Consultar ayudas rápidas |
| **HU Relacionada** | HU-027 |
| **Actor(es)** | Usuario solicitante |
| **Descripción** | Permite que el usuario revise soluciones frecuentes antes de crear un caso. |
| **Precondiciones** | Deben existir ayudas rápidas registradas. |
| **Postcondiciones** | El usuario puede resolver una duda sencilla o decidir crear un caso si no encuentra solución. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Usuario solicitante | Ingresa a la sección de ayudas rápidas. |
| 2 | Sistema | Muestra soluciones frecuentes. |
| 3 | Usuario solicitante | Busca una ayuda relacionada con su problema. |
| 4 | Sistema | Muestra la solución o explicación seleccionada. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el usuario encuentra una solución útil, puede aplicarla sin crear caso. |
| **FA-02** | Si no encuentra solución, puede crear un nuevo caso de soporte. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si no hay ayudas disponibles, el sistema informa que no existen soluciones registradas. |
| **FE-02** | Si la búsqueda no encuentra resultados, el sistema sugiere crear un caso. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Media |
| **Frecuencia de uso** | Ocasional |
| **RN Relacionadas** | RN-024 |
| **RNF Relacionados** | RNF-002 |
| **Notas / Observaciones** | Este caso puede reducir casos repetidos cuando el problema tiene una solución sencilla. |

---

**CU-022 — Cerrar caso sin respuesta**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-022 |
| **Nombre** | Cerrar caso sin respuesta |
| **HU Relacionada** | HU-028 |
| **Actor(es)** | Sistema / Personal de soporte |
| **Descripción** | Permite cerrar un caso resuelto cuando el usuario no responde después del plazo definido. |
| **Precondiciones** | El caso debe estar marcado como solucionado y el usuario debe haber sido avisado. |
| **Postcondiciones** | El caso queda cerrado automáticamente. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Personal de soporte | Marca el caso como solucionado. |
| 2 | Sistema | Avisa al usuario y espera respuesta. |
| 3 | Sistema | Verifica si pasan 5 días hábiles sin respuesta. |
| 4 | Sistema | Cierra el caso automáticamente. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el usuario responde que el problema continúa, puede reabrir el caso. |
| **FA-02** | Si el usuario confirma que todo quedó bien, el caso se cierra antes del plazo. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si no se puede enviar el aviso, el sistema deja el mensaje visible dentro del caso. |
| **FE-02** | Si el caso no está solucionado, no puede cerrarse por falta de respuesta. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Media |
| **Frecuencia de uso** | Diaria |
| **RN Relacionadas** | RN-008, RN-023, RN-019 |
| **RNF Relacionados** | RNF-009, RNF-011 |
| **Notas / Observaciones** | Este caso evita que queden casos abiertos sin necesidad. |

---

**CU-023 — Definir tiempos de atención**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-023 |
| **Nombre** | Definir tiempos de atención |
| **HU Relacionada** | HU-029 |
| **Actor(es)** | Administrador |
| **Descripción** | Permite definir cuánto debería tardar la atención según la importancia del caso y el tipo de ayuda solicitada. |
| **Precondiciones** | El administrador debe haber ingresado al sistema. |
| **Postcondiciones** | Los tiempos quedan disponibles para mostrar tiempos aproximados al usuario. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Administrador | Ingresa a la sección de tiempos de atención. |
| 2 | Sistema | Muestra las opciones de importancia y tipo de caso. |
| 3 | Administrador | Define los tiempos correspondientes. |
| 4 | Sistema | Guarda los tiempos definidos. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si la empresa cambia sus reglas de atención, el administrador puede actualizar los tiempos. |
| **FA-02** | Si un tipo de caso no tiene tiempo definido, puede quedar pendiente hasta que se complete. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si falta un tiempo obligatorio, el sistema indica qué información falta. |
| **FE-02** | Si el tiempo ingresado no es válido, el sistema pide corregirlo. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Alta |
| **Frecuencia de uso** | Ocasional |
| **RN Relacionadas** | RN-012, RN-016 |
| **RNF Relacionados** | RNF-002 |
| **Notas / Observaciones** | Este caso permite que el usuario vea tiempos aproximados más claros. |

---

**CU-024 — Administrar opciones de registro**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-024 |
| **Nombre** | Administrar opciones de registro |
| **HU Relacionada** | HU-018, HU-019, HU-020 |
| **Actor(es)** | Administrador |
| **Descripción** | Permite crear, cambiar o quitar las opciones que el usuario puede elegir cuando registra un problema o solicitud. |
| **Precondiciones** | El administrador debe haber ingresado al sistema. |
| **Postcondiciones** | Las opciones de registro quedan actualizadas. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Administrador | Ingresa a la sección de opciones de registro. |
| 2 | Sistema | Muestra las opciones existentes. |
| 3 | Administrador | Crea, cambia o quita una opción. |
| 4 | Sistema | Guarda los cambios y actualiza las opciones del registro. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si una opción ya no se usa, el administrador puede quitarla para que no aparezca al usuario. |
| **FA-02** | Si aparece un nuevo tipo de ayuda, el administrador puede agregarlo. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si la opción está siendo usada en casos existentes, el sistema puede impedir eliminarla y sugerir desactivarla. |
| **FE-02** | Si falta el nombre de la opción, el sistema pide completarlo. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Media |
| **Frecuencia de uso** | Ocasional |
| **RN Relacionadas** | RN-024 |
| **RNF Relacionados** | RNF-002 |
| **Notas / Observaciones** | Este caso ayuda a mantener actualizado el registro de casos según las necesidades de la empresa. |

---

**CU-025 — Descargar reportes de atención**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-025 |
| **Nombre** | Descargar reportes de atención |
| **HU Relacionada** | HU-030 |
| **Actor(es)** | Supervisor de soporte |
| **Descripción** | Permite descargar reportes de atención para compartir resultados en reuniones o informes. |
| **Precondiciones** | Deben existir datos de atención registrados. |
| **Postcondiciones** | El supervisor obtiene un archivo descargado en PDF o Excel. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Supervisor de soporte | Ingresa al resumen de atención. |
| 2 | Sistema | Muestra la opción para descargar el reporte. |
| 3 | Supervisor de soporte | Elige si desea descargarlo en PDF o Excel. |
| 4 | Sistema | Genera y descarga el archivo. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el supervisor quiere un periodo específico, primero selecciona el periodo y luego descarga el reporte. |
| **FA-02** | Si solo necesita revisar la información, puede verla en pantalla sin descargarla. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si no hay datos para el periodo elegido, el sistema informa que no hay información para descargar. |
| **FE-02** | Si el archivo no se genera, el sistema informa que debe intentarse nuevamente. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Media |
| **Frecuencia de uso** | Semanal |
| **RN Relacionadas** | RN-011 |
| **RNF Relacionados** | RNF-005 |
| **Notas / Observaciones** | Este caso facilita compartir resultados de atención sin tener que copiar información manualmente. |

---

**CU-026 — Definir tabla de importancia del caso**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-026 |
| **Nombre** | Definir tabla de importancia del caso |
| **HU Relacionada** | HU-021, HU-022 |
| **Actor(es)** | Administrador |
| **Descripción** | Permite definir cómo el sistema debe reconocer la importancia de un caso usando dos datos: cuántas personas se ven afectadas y qué tan rápido se necesita atención. |
| **Precondiciones** | El administrador debe haber ingresado al sistema. |
| **Postcondiciones** | La tabla queda disponible para que el sistema pueda ordenar los casos según su importancia. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Administrador | Ingresa a la sección donde se define la importancia de los casos. |
| 2 | Sistema | Muestra las opciones relacionadas con cuántas personas se ven afectadas y qué tan rápido se necesita atención. |
| 3 | Administrador | Define cómo se debe ordenar la importancia del caso cuando se combinan esos dos datos. |
| 4 | Sistema | Guarda la tabla de importancia para usarla cuando se registren nuevos casos. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si la empresa cambia la forma de ordenar los casos importantes, el administrador puede actualizar la tabla. |
| **FA-02** | Si una combinación todavía no tiene una importancia definida, el administrador puede completarla antes de guardar los cambios. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si falta una combinación por definir, el sistema muestra qué información falta antes de guardar. |
| **FE-02** | Si el sistema no puede guardar los cambios, muestra un mensaje claro y permite intentarlo nuevamente. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Alta |
| **Frecuencia de uso** | Ocasional |
| **RN Relacionadas** | RN-005, RN-016 |
| **RNF Relacionados** | RNF-002 |
| **Notas / Observaciones** | Este caso de uso no define tiempos de atención. Solo define cómo reconocer qué casos son más importantes según cuántas personas se ven afectadas y qué tan rápido se necesita atención. |

---

**CU-027 — Clasificar caso**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-027 |
| **Nombre** | Clasificar caso |
| **HU Relacionada** | HU-004, HU-018, HU-019, HU-020, HU-021, HU-022, HU-031 |
| **Actor(es)** | Usuario solicitante / Personal de soporte |
| **Descripción** | Permite indicar si el caso es un problema o una solicitud, seleccionar las opciones correspondientes y corregir la clasificación cuando sea necesario. |
| **Precondiciones** | El usuario debe haber iniciado el registro del caso. |
| **Postcondiciones** | El caso queda clasificado para que pueda ordenarse y atenderse correctamente. |

**2. Flujo Principal**
| Paso | Actor | Acción |
|------|-------|--------|
| 1 | Usuario solicitante | Indica si está reportando un problema o haciendo una solicitud. |
| 2 | Sistema | Muestra ejemplos claros para ayudar a elegir. |
| 3 | Usuario solicitante | Selecciona el tipo de problema o solicitud, la clase de solicitud, cuántas personas se ven afectadas y qué tan rápido necesita atención. |
| 4 | Sistema | Calcula la importancia del caso y guarda la clasificación. |

**3. Flujos Alternativos**
| Campo | Descripción |
|-------|-------------|
| **FA-01** | Si el usuario no sabe qué opción elegir, el sistema muestra ejemplos para orientar la selección. |
| **FA-02** | Si el personal de soporte encuentra que el tipo de caso fue elegido de forma equivocada, puede corregirlo. |

**4. Flujos de Excepción**
| Campo | Descripción |
|-------|-------------|
| **FE-01** | Si falta una opción necesaria para clasificar el caso, el sistema indica qué información falta. |
| **FE-02** | Si la clasificación no se puede guardar, el sistema muestra un mensaje claro y permite intentarlo nuevamente. |

**5. Información Adicional**
| Campo | Descripción |
|-------|-------------|
| **Prioridad** | Alta |
| **Frecuencia de uso** | Diaria |
| **RN Relacionadas** | RN-003, RN-004, RN-005, RN-016 |
| **RNF Relacionados** | RNF-002, RNF-003, RNF-010 |
| **Notas / Observaciones** | Este caso separa la clasificación del registro básico para que cada acción sea más clara y verificable. |

---

**CU-028 — Registrar información del personal de soporte**

**1. Identificación del Caso de Uso**
| Campo | Descripción |
|-------|-------------|
| **ID** | CU-028 |
| **Nombre** | Registrar información del personal de soporte |
| **HU Relacionada** | HU-032 |
| **Actor(es)** | Administrador |
| **Descripción** | Permite registrar y actualizar qué tipo de casos puede atender cada persona de soporte, su disponibilidad y su carga actual de trabajo. |
| **Precondiciones** | El administrador debe haber ingresado al sistema. |
| **Postcondiciones** | La información del personal de soporte queda disponible para consulta del supervisor. |

---

# Historias de Usuario

**HU-031**
| Campo | Descripción |
|-------|-------------|
| **ID** | HU-031 |
| **Título** | Corregir clasificación del caso |
| **Como** | Personal de soporte |
| **Quiero** | Corregir si un caso fue marcado como problema o solicitud de forma equivocada |
| **Para** | Dejar el caso organizado correctamente para que pueda ser atendido por la persona adecuada |

**HU-032**
| Campo | Descripción |
|-------|-------------|
| **ID** | HU-032 |
| **Título** | Registrar información del personal de soporte |
| **Como** | Administrador |
| **Quiero** | Registrar y actualizar qué tipo de casos puede atender cada persona de soporte, su disponibilidad y su carga de trabajo |
| **Para** | Permitir que el supervisor consulte información confiable para asignar los casos de forma adecuada |

---

# Requisito Funcional

**RF-073**
| Campo | Descripción |
|-------|-------------|
| **ID** | RF-073 |
| **HU Relacionada** | HU-032 |
| **Descripción** | El sistema debe permitir al administrador registrar y actualizar qué tipo de casos puede atender cada persona de soporte, su disponibilidad y su carga actual de trabajo. |

---

# Reglas de Negocio

**RN-026**
| Campo | Descripción |
|-------|-------------|
| **ID** | RN-026 |
| **Título** | Cambios permitidos de situación |
| **Descripción** | Si un caso cambia de situación, entonces el cambio debe seguir la tabla de situaciones permitidas definida para el proceso de atención. |
| **Origen** | HU-007 |

**RN-027**
| Campo | Descripción |
|-------|-------------|
| **ID** | RN-027 |
| **Título** | Explicación al cambiar la persona encargada |
| **Descripción** | Si se cambia la persona encargada de un caso, entonces debe registrarse una explicación breve del cambio. |
| **Origen** | HU-008 |

---

# Tabla de cambios permitidos entre situaciones del caso

| Situación actual | Situación permitida | Explicación |
|------------------|--------------------| ------------|
| Recibido | En revisión / En atención | El caso puede empezar con revisión o pasar directamente a atención según la información recibida. |
| En revisión | En atención | Después de revisar el caso, soporte puede iniciar la atención. |
| En atención | Resuelto | Cuando soporte encuentra una solución, el caso pasa a resuelto. |
| Resuelto | Cerrado / Reabierto | El caso se cierra si el usuario confirma o si no responde dentro del plazo definido. Se reabre si el problema continúa dentro del plazo permitido. |
| Reabierto | En revisión / En atención | Un caso reabierto vuelve a revisión o atención según lo que indique el usuario. |
| Cerrado | Sin cambio posterior | Un caso cerrado no debe cambiar de situación dentro del flujo normal. |
