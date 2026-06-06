## Reglas de Negocio

| Campo | Descripción |
|------|------------|
| ID | RN-001 |
| Título | Datos mínimos para enviar un caso |
| Descripción | Si un usuario quiere enviar un caso, entonces debe completar como mínimo qué necesita, dónde ocurre, qué tan grave es y cómo pueden contactarlo. Si falta alguno de esos datos, el sistema no debe permitir el envío. |
| Origen | HU-001 |

---

| Campo | Descripción |
|------|------------|
| ID | RN-002 |
| Título | Número único de seguimiento |
| Descripción | Si un usuario envía un caso, entonces el sistema debe generar un número único para identificarlo y consultarlo después. |
| Origen | HU-002 |

---

| Campo | Descripción |
|------|------------|
| ID | RN-003 |
| Título | Identificación del caso |
| Descripción | Si un usuario reporta un caso, entonces debe indicar si está reportando un problema o haciendo una solicitud, con ayuda de preguntas y ejemplos del sistema. |
| Origen | HU-004 |

---

| Campo | Descripción |
|------|------------|
| ID | RN-004 |
| Título | Corrección del tipo de caso |
| Descripción | Si el usuario selecciona mal el tipo de caso, entonces el personal de soporte puede corregirlo y debe quedar guardado quién hizo el cambio, cuándo lo hizo y por qué. |
| Origen | HU-004 |

---

| Campo | Descripción |
|------|------------|
| ID | RN-005 |
| Título | Atención de casos importantes |
| Descripción | Si un caso afecta a muchas personas o impide trabajar, entonces debe atenderse antes que un caso que puede esperar. |
| Origen | HU-021, HU-022 |

---

| Campo | Descripción |
|------|------------|
| ID | RN-006 |
| Título | Registro de cambios |
| Descripción | Si un caso cambia de situación, persona encargada o comentario, entonces debe quedar guardado quién hizo el cambio y cuándo lo hizo. |
| Origen | HU-007, HU-008, HU-009 |

---

| Campo | Descripción |
|------|------------|
| ID | RN-007 |
| Título | Reapertura de caso |
| Descripción | Si un caso fue marcado como solucionado y el problema continúa dentro de los 5 días hábiles siguientes, entonces el usuario puede reabrirlo conservando el mismo número de seguimiento. |
| Origen | HU-013 |

---

| Campo | Descripción |
|------|------------|
| ID | RN-008 |
| Título | Cierre del caso |
| Descripción | Si el personal de soporte marca un caso como solucionado, entonces el usuario debe ser avisado. El caso se cierra cuando el usuario confirma o cuando pasan 5 días hábiles sin respuesta. |
| Origen | HU-003, HU-028 |

---

| Campo | Descripción |
|------|------------|
| ID | RN-009 |
| Título | Calificación al finalizar |
| Descripción | Si un caso fue cerrado, entonces el usuario puede calificar la atención de 1 a 5 estrellas y dejar un comentario si lo desea. |
| Origen | HU-014 |

---

| Campo | Descripción |
|------|------------|
| ID | RN-010 |
| Título | Consulta del historial según rol |
| Descripción | Si un usuario consulta el historial, entonces solo puede ver sus propios casos, salvo que tenga rol de soporte, supervisor o administrador. |
| Origen | HU-005 |

---

| Campo | Descripción |
|------|------------|
| ID | RN-011 |
| Título | Resumen para supervisión |
| Descripción | Si un supervisor consulta el resumen de atención, entonces debe ver los casos pendientes, en atención, resueltos y atrasados del área que supervisa. |
| Origen | HU-011, HU-012 |

---

| Campo | Descripción |
|------|------------|
| ID | RN-012 |
| Título | Tiempo aproximado de respuesta |
| Descripción | Si un caso es registrado o asignado, entonces el usuario debe ver un tiempo aproximado de respuesta calculado según la importancia y tipo de caso. |
| Origen | HU-010 |

---

| Campo | Descripción |
|------|------------|
| ID | RN-013 |
| Título | Avisos por cambios |
| Descripción | Si un caso cambia de situación, entonces el sistema debe avisar al usuario por correo, mostrar un aviso emergente dentro del sistema y dejar el cambio visible en el detalle del caso. |
| Origen | HU-003 |

---

| Campo | Descripción |
|------|------------|
| ID | RN-014 |
| Título | Número de seguimiento irrepetible |
| Descripción | Si se registra un caso, entonces el número de seguimiento no puede repetirse en otro caso. |
| Origen | HU-002 |

---

| Campo | Descripción |
|------|------------|
| ID | RN-015 |
| Título | Permisos por rol |
| Descripción | Si una persona ingresa al sistema, entonces solo puede hacer las acciones permitidas para su rol. |
| Origen | HU-023, HU-016 |

---

| Campo | Descripción |
|------|------------|
| ID | RN-016 |
| Título | Cálculo de importancia |
| Descripción | Si un caso tiene indicado a cuántas personas afecta y qué tan rápido necesita atención, entonces el sistema debe usar esos dos datos para definir su importancia. |
| Origen | HU-021, HU-022 |

---

| Campo | Descripción |
|------|------------|
| ID | RN-017 |
| Título | Paso del caso a otra persona o área |
| Descripción | Si un caso no puede ser resuelto por la persona asignada, entonces debe pasarse a otra persona o área que pueda atenderlo mejor. |
| Origen | HU-026 |

---

| Campo | Descripción |
|------|------------|
| ID | RN-018 |
| Título | Reasignación por ausencia |
| Descripción | Si una persona de soporte está ausente, entonces sus casos deben asignarse a otra persona disponible. |
| Origen | Política interna |

---

| Campo | Descripción |
|------|------------|
| ID | RN-019 |
| Título | Cálculo de días hábiles |
| Descripción | Si una regla habla de días, entonces se cuentan solo días hábiles y no se incluyen sábados, domingos ni festivos. |
| Origen | Política interna |

---

| Campo | Descripción |
|------|------------|
| ID | RN-020 |
| Título | Protección de datos personales |
| Descripción | Si el sistema guarda información de usuarios o personal de soporte, entonces debe protegerla y permitir verla solo a quienes tengan permiso. |
| Origen | Política interna |

---

| Campo | Descripción |
|------|------------|
| ID | RN-021 |
| Título | Conservación de casos |
| Descripción | Si un caso fue cerrado, entonces debe conservarse mínimo 5 años para consultas futuras. |
| Origen | Política interna |

---

| Campo | Descripción |
|------|------------|
| ID | RN-022 |
| Título | Comentarios visibles e internos |
| Descripción | Si el personal de soporte agrega un comentario, entonces debe indicar si el usuario puede verlo o si será solo para el equipo de soporte. |
| Origen | HU-009 |

---

| Campo | Descripción |
|------|------------|
| ID | RN-023 |
| Título | Cierre automático por falta de respuesta |
| Descripción | Si un caso fue marcado como solucionado y el usuario no responde durante 5 días hábiles, entonces el sistema debe cerrarlo automáticamente. |
| Origen | HU-028 |

---

| Campo | Descripción |
|------|------------|
| ID | RN-024 |
| Título | Configuración de tipos de casos |
| Descripción | Si la empresa necesita cambiar los tipos de problema o tipos de solicitud, entonces solo el administrador puede crear, editar o desactivar esas opciones. |
| Origen | HU-018, HU-019 |

---

| Campo | Descripción |
|------|------------|
| ID | RN-025 |
| Título | Contraseña segura |
| Descripción | Si un usuario crea o cambia su contraseña, entonces debe cumplir las condiciones mínimas definidas por la empresa. |
| Origen | HU-023, HU-024 |
