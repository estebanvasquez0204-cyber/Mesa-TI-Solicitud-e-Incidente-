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
| **Precondi
