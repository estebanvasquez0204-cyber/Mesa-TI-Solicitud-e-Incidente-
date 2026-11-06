# 1. Historias de usuario y criterios de aceptación

> **Guía de seguimiento:** Fase 1 — actividad *1. HU + Criterios de aceptación*.
>
> **Fuente:** documento Word *Fase 1 — Historias de Usuario y Criterios de Aceptación, Reglas de Negocio, Requisitos Funcionales y No Funcionales, Casos de Uso, Mockups y Matriz de Trazabilidad* (F. J. Motta Quintero y E. Vásquez Valencia · Docente: Lora Patiño Gloria Amparo · Octubre de 2026).


*De dónde nace:* este documento parte de las 40 historias de usuario (HU-001 a HU-042, sin HU-014 ni HU-027, que no existen en el documento de HU) con sus criterios de aceptación, del diccionario de datos v4 y de los resultados de la [entrevista](../fase_0/0.4.1-entrevista-resultados.md). Cada elemento cita su padre: HU → RN/RF → CU → MK.


Los criterios de aceptación están escritos en formato Gherkin (Dado / Cuando / Entonces). Las líneas que empiezan con `#` indican el método, la restricción o la regla del diseño que respalda cada escenario.


## Índice

| HU | Título | Prioridad | RF derivados |
|---|---|:---:|---|
| [HU-001](#hu-001) | Reportar un caso de soporte | Alta | [RF-01](2.2-requisitos-funcionales.md#rf-01), [RF-02](2.2-requisitos-funcionales.md#rf-02), [RF-18](2.2-requisitos-funcionales.md#rf-18) |
| [HU-002](#hu-002) | Recibir confirmación del caso enviado | Alta | [RF-01](2.2-requisitos-funcionales.md#rf-01), [RF-03](2.2-requisitos-funcionales.md#rf-03), [RF-05](2.2-requisitos-funcionales.md#rf-05) |
| [HU-003](#hu-003) | Recibir avisos sobre el avance del caso | Alta | [RF-04](2.2-requisitos-funcionales.md#rf-04), [RF-05](2.2-requisitos-funcionales.md#rf-05), [RF-06](2.2-requisitos-funcionales.md#rf-06) |
| [HU-004](#hu-004) | Identificar si el caso es un problema o una solicitud | Alta | [RF-02](2.2-requisitos-funcionales.md#rf-02), [RF-07](2.2-requisitos-funcionales.md#rf-07), [RF-08](2.2-requisitos-funcionales.md#rf-08) |
| [HU-005](#hu-005) | Consultar casos anteriores | Alta | [RF-09](2.2-requisitos-funcionales.md#rf-09), [RF-10](2.2-requisitos-funcionales.md#rf-10) |
| [HU-006](#hu-006) | Revisar casos pendientes | Alta | [RF-11](2.2-requisitos-funcionales.md#rf-11) |
| [HU-007](#hu-007) | Cambiar la situación actual del caso | Alta | [RF-12](2.2-requisitos-funcionales.md#rf-12), [RF-13](2.2-requisitos-funcionales.md#rf-13), [RF-49](2.2-requisitos-funcionales.md#rf-49) |
| [HU-008](#hu-008) | Asignar una persona encargada del caso | Alta | [RF-14](2.2-requisitos-funcionales.md#rf-14), [RF-49](2.2-requisitos-funcionales.md#rf-49) |
| [HU-009](#hu-009) | Agregar comentarios al caso | Media | [RF-16](2.2-requisitos-funcionales.md#rf-16), [RF-17](2.2-requisitos-funcionales.md#rf-17) |
| [HU-010](#hu-010) | Ver tiempo aproximado de atención | Media | [RF-13](2.2-requisitos-funcionales.md#rf-13), [RF-20](2.2-requisitos-funcionales.md#rf-20) |
| [HU-011](#hu-011) | Revisar resumen general de atención | Media | [RF-21](2.2-requisitos-funcionales.md#rf-21) |
| [HU-012](#hu-012) | Revisar resumen por periodo | Media | [RF-22](2.2-requisitos-funcionales.md#rf-22) |
| [HU-013](#hu-013) | Reabrir un caso | Media | [RF-23](2.2-requisitos-funcionales.md#rf-23) |
| [HU-015](#hu-015) | Consultar información del personal de soporte | Media | [RF-24](2.2-requisitos-funcionales.md#rf-24) |
| [HU-016](#hu-016) | Registrar usuarios del sistema | Alta | [RF-26](2.2-requisitos-funcionales.md#rf-26) |
| [HU-017](#hu-017) | Consultar usuarios registrados | Media | [RF-27](2.2-requisitos-funcionales.md#rf-27) |
| [HU-018](#hu-018) | Indicar tipo de problema | Alta | [RF-31](2.2-requisitos-funcionales.md#rf-31) |
| [HU-019](#hu-019) | Indicar tipo de solicitud | Alta | [RF-32](2.2-requisitos-funcionales.md#rf-32) |
| [HU-020](#hu-020) | Indicar clase de solicitud | Media | [RF-33](2.2-requisitos-funcionales.md#rf-33) |
| [HU-021](#hu-021) | Indicar cuántas personas se ven afectadas | Alta | [RF-18](2.2-requisitos-funcionales.md#rf-18), [RF-19](2.2-requisitos-funcionales.md#rf-19) |
| [HU-022](#hu-022) | Indicar qué tan rápido necesito atención | Alta | [RF-18](2.2-requisitos-funcionales.md#rf-18), [RF-19](2.2-requisitos-funcionales.md#rf-19) |
| [HU-023](#hu-023) | Iniciar sesión | Alta | [RF-34](2.2-requisitos-funcionales.md#rf-34) |
| [HU-024](#hu-024) | Recuperar contraseña | Alta | [RF-35](2.2-requisitos-funcionales.md#rf-35) |
| [HU-025](#hu-025) | Cerrar sesión | Baja | [RF-36](2.2-requisitos-funcionales.md#rf-36) |
| [HU-026](#hu-026) | Pasar un caso a otra persona de soporte | Media | [RF-15](2.2-requisitos-funcionales.md#rf-15), [RF-49](2.2-requisitos-funcionales.md#rf-49) |
| [HU-028](#hu-028) | Cerrar casos sin respuesta del usuario | Media | [RF-37](2.2-requisitos-funcionales.md#rf-37) |
| [HU-029](#hu-029) | Definir tiempos de atención | Media | [RF-38](2.2-requisitos-funcionales.md#rf-38) |
| [HU-030](#hu-030) | Descargar reportes de atención | Baja | [RF-40](2.2-requisitos-funcionales.md#rf-40) |
| [HU-031](#hu-031) | Actualizar la información de un usuario registrado | Media | [RF-28](2.2-requisitos-funcionales.md#rf-28) |
| [HU-032](#hu-032) | Inactivar un usuario que ya no debe tener acceso | Media | [RF-29](2.2-requisitos-funcionales.md#rf-29), [RF-34](2.2-requisitos-funcionales.md#rf-34) |
| [HU-033](#hu-033) | Desbloquear una cuenta de usuario | Media | [RF-30](2.2-requisitos-funcionales.md#rf-30) |
| [HU-034](#hu-034) | Actualizar mi disponibilidad para recibir casos | Media | [RF-25](2.2-requisitos-funcionales.md#rf-25) |
| [HU-035](#hu-035) | Registrar un activo tecnológico de la empresa | Media | [RF-44](2.2-requisitos-funcionales.md#rf-44) |
| [HU-036](#hu-036) | Consultar los activos tecnológicos registrados | Baja | [RF-45](2.2-requisitos-funcionales.md#rf-45) |
| [HU-037](#hu-037) | Actualizar la información de un activo tecnológico | Baja | [RF-46](2.2-requisitos-funcionales.md#rf-46) |
| [HU-038](#hu-038) | Dar de baja un activo tecnológico | Baja | [RF-47](2.2-requisitos-funcionales.md#rf-47) |
| [HU-039](#hu-039) | Administrar los catálogos de clasificación del sistema | Media | [RF-48](2.2-requisitos-funcionales.md#rf-48) |
| [HU-040](#hu-040) | Consultar las reglas de tiempos de atención configuradas | Baja | [RF-39](2.2-requisitos-funcionales.md#rf-39) |
| [HU-041](#hu-041) | Consultar el historial de cambios de un caso | Media | [RF-41](2.2-requisitos-funcionales.md#rf-41), [RF-49](2.2-requisitos-funcionales.md#rf-49) |
| [HU-042](#hu-042) | Adjuntar y consultar evidencias de un caso | Media | [RF-42](2.2-requisitos-funcionales.md#rf-42), [RF-43](2.2-requisitos-funcionales.md#rf-43) |

---

<a id="hu-001"></a>
## HU-001 — Reportar un caso de soporte

| Campo | Contenido |
|---|---|
| **Código** | HU-001 |
| **Título corto** | Reportar un caso de soporte |
| **Historia** | Como Usuario solicitante, quiero contar con una pantalla con preguntas claras que me ayude a explicar qué problema tengo, dónde ocurre, qué equipo o programa está afectado y qué tan importante es, para enviar mi caso correctamente sin olvidar información importante. |
| **Origen de la necesidad** | Entrevista a usuarios — P2 y P9 de los resultados por pregunta (P2: "muchos usuarios no tienen claridad total sobre cómo solicitar ayuda"; P9: "la mayoría prefiere un único sistema o formulario centralizado para registrar las solicitudes"). |
| **RF derivados** | [RF-01](2.2-requisitos-funcionales.md#rf-01), [RF-02](2.2-requisitos-funcionales.md#rf-02), [RF-18](2.2-requisitos-funcionales.md#rf-18) |
| **Prioridad** | Alta |

**Criterios de aceptación**

```gherkin
Antecedentes:
  # Se cumple antes de cada escenario de esta historia
  Dado que la usuaria solicitante "Marcela Ríos" (área Contabilidad) ha iniciado sesión

Escenario: CA-1 Envío exitoso con todos los datos obligatorios
  # crearCaso() · RN-001 (datos mínimos para enviar un caso)
  Dado que Marcela aún no ha enviado ningún caso hoy
  Cuando Marcela completa el formulario con estos datos:
    | Campo            | Valor                           |
    | Qué necesita     | El computador no enciende       |
    | Dónde ocurre     | Oficina de Contabilidad, piso 3 |
    | Tipo de problema | Hardware                        |
    | A quiénes afecta | Solo a ella (usuario)           |
    | Qué tan urgente  | Alta                            |
    | Cómo contactarla | Teléfono 601-555-0110           |
  Y confirma el envío
  Entonces el sistema registra el caso en la situación inicial "recibido"
  Y le asigna un número de seguimiento único con formato MA-AAAA-NNNNNN (por ejemplo, MA-2026-000145)
  Y guarda la fecha y hora de creación de forma automática, sin que Marcela la escriba

Esquema del escenario: CA-2 Rechazo por falta de un dato obligatorio
  # RN-001 · el sistema no debe permitir el envío si falta un dato mínimo
  Cuando Marcela deja vacío el campo <campo> y confirma el envío
  Entonces el sistema no registra el caso
  Y señala el campo con el mensaje "<mensaje>"
  Ejemplos:
    | campo            | mensaje                                                      |
    | qué necesita     | Debes indicar qué necesitas o qué problema tienes.           |
    | dónde ocurre     | Debes indicar dónde ocurre el problema.                      |
    | qué tan urgente  | Debes indicar qué tan urgente es tu caso.                    |
    | cómo contactarla | Debes indicar un teléfono o correo donde podamos contactarte. |

Escenario: CA-3 Registro sin un equipo o programa asociado
  # id_activo es opcional en caso_soporte: no todos los casos tienen un activo relacionado
  Cuando Marcela completa todos los datos obligatorios sin seleccionar ningún equipo o programa
  Entonces el caso queda registrado igual, sin ningún activo asociado

Escenario: CA-4 El sistema muestra ejemplos junto a las preguntas
  # RF-006 (apoyo esperado por los usuarios, P2 de la entrevista: falta de claridad)
  Cuando Marcela abre el formulario de un nuevo caso
  Entonces cada pregunta que puede generar duda (por ejemplo, "a quiénes afecta" o "qué tan urgente") muestra un ejemplo breve de cómo responderla
```

---

<a id="hu-002"></a>
## HU-002 — Recibir confirmación del caso enviado

| Campo | Contenido |
|---|---|
| **Código** | HU-002 |
| **Título corto** | Recibir confirmación del caso enviado |
| **Historia** | Como Usuario solicitante, quiero recibir una confirmación en pantalla y por correo con un número único de seguimiento después de enviar mi caso, para saber que mi caso fue recibido y que puedo consultarlo después. |
| **Origen de la necesidad** | Entrevista a usuarios — P3 de los resultados por pregunta (P3: "en varios casos los usuarios no saben si su solicitud fue recibida o atendida"). |
| **RF derivados** | [RF-01](2.2-requisitos-funcionales.md#rf-01), [RF-03](2.2-requisitos-funcionales.md#rf-03), [RF-05](2.2-requisitos-funcionales.md#rf-05) |
| **Prioridad** | Alta |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que Marcela Ríos ha iniciado sesión como usuaria solicitante

Escenario: CA-1 Confirmación inmediata en pantalla
  # crearCaso() · RN-002 (número único de seguimiento)
  Cuando Marcela completa y envía su caso
  Entonces el sistema muestra en pantalla el número de seguimiento generado, por ejemplo "MA-2026-000145"

Escenario: CA-2 Confirmación enviada por correo
  # Aviso.crearAviso() · canal = correo
  Dado que el correo registrado de Marcela es marcela.rios@nexaservicios.com
  Cuando su caso queda registrado con el número MA-2026-000145
  Entonces el sistema envía a ese correo un mensaje con el número de seguimiento y el resumen del caso

Escenario: CA-3 El número de seguimiento nunca se repite
  # RN-014 · UNIQUE(numero_seguimiento)
  Dado que ya existe un caso registrado con el número MA-2026-000145
  Cuando se registra un nuevo caso de cualquier otro usuario
  Entonces el sistema le asigna un número de seguimiento distinto, nunca MA-2026-000145

Escenario: CA-4 Reintento automático si falla el envío del correo
  # Aviso.reintentarEnvio() · el caso ya quedó registrado antes del envío
  Dado que el primer intento de envío del correo de confirmación falló
  Cuando el sistema detecta la falla de entrega
  Entonces reintenta el envío automáticamente
  Y el caso de Marcela permanece registrado con su número de seguimiento, sin importar el resultado del envío
```

---

<a id="hu-003"></a>
## HU-003 — Recibir avisos sobre el avance del caso

| Campo | Contenido |
|---|---|
| **Código** | HU-003 |
| **Título corto** | Recibir avisos sobre el avance del caso |
| **Historia** | Como Usuario solicitante, quiero recibir avisos por correo, notificación emergente y dentro del sistema cuando mi caso pase a recibido, en revisión, en atención, resuelto, cerrado o reabierto, para mantenerme informado sin tener que preguntar por otros medios. |
| **Origen de la necesidad** | Entrevista a usuarios — P3 y P10 de los resultados por pregunta (P3: "en varios casos los usuarios no saben si su solicitud fue recibida o atendida"; P10: "se destacan como dificultades actuales las demoras, la falta de claridad, la mala comunicación y la dificultad para saber el estado del caso"). |
| **RF derivados** | [RF-04](2.2-requisitos-funcionales.md#rf-04), [RF-05](2.2-requisitos-funcionales.md#rf-05), [RF-06](2.2-requisitos-funcionales.md#rf-06) |
| **Prioridad** | Alta |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que Marcela Ríos tiene un caso registrado con número MA-2026-000145

Esquema del escenario: CA-1 Aviso ante cada cambio de situación del caso
  # RN-013 · Aviso.crearAviso() · estado_caso
  Cuando el caso de Marcela pasa de <situación anterior> a <situación nueva>
  Entonces el sistema le genera un aviso informando el cambio
  Ejemplos:
    | situación anterior | situación nueva |
    | recibido           | en revisión     |
    | en revisión        | en atención     |
    | en atención        | resuelto        |
    | resuelto           | cerrado         |
    | resuelto           | reabierto       |

Escenario: CA-2 El aviso llega por los tres medios definidos
  # RN-013 · canal: correo, aviso emergente, detalle del caso
  Cuando el caso de Marcela pasa a "en atención"
  Entonces el sistema le envía un correo
  Y le muestra un aviso emergente dentro del sistema
  Y deja el cambio visible en el detalle del caso

Escenario: CA-3 Reintento ante una falla de envío
  # Aviso.actualizarEstadoEnvio(), reintentarEnvio()
  Dado que el envío del aviso por correo falló en el primer intento
  Cuando el sistema registra la falla
  Entonces guarda el motivo del fallo
  Y reintenta el envío automáticamente

Escenario: CA-4 Marcela consulta y lee un aviso
  # Aviso.obtenerAviso(), marcarLeido()
  Dado que Marcela tiene un aviso sin leer sobre su caso MA-2026-000145
  Cuando abre ese aviso desde el sistema
  Entonces ve el contenido completo del aviso
  Y el sistema lo registra como leído, con la fecha y hora de lectura
```

---

<a id="hu-004"></a>
## HU-004 — Identificar si el caso es un problema o una solicitud

| Campo | Contenido |
|---|---|
| **Código** | HU-004 |
| **Título corto** | Identificar si el caso es un problema o una solicitud |
| **Historia** | Como Usuario solicitante, quiero que el sistema me haga preguntas sencillas y me muestre ejemplos para saber si estoy reportando un problema o haciendo una solicitud, para enviar mi caso al proceso correcto desde el inicio. |
| **Origen de la necesidad** | Entrevista a usuarios — P11 y P12 de los resultados por pregunta (P11: "los usuarios reportan tanto problemas urgentes como solicitudes de nuevos servicios"; P12: "muchos prefieren describir el problema y que el sistema o el área de TI lo clasifique"). |
| **RF derivados** | [RF-02](2.2-requisitos-funcionales.md#rf-02), [RF-07](2.2-requisitos-funcionales.md#rf-07), [RF-08](2.2-requisitos-funcionales.md#rf-08) |
| **Prioridad** | Alta |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que Marcela Ríos ha iniciado sesión y está reportando un caso nuevo

Escenario: CA-1 Marcela identifica que tiene un problema
  # crearCaso() · tipo_caso = problema · RN-003
  Cuando Marcela indica que algo no está funcionando
  Entonces el sistema le pide el tipo de problema
  Y no le pide la clase de solicitud

Escenario: CA-2 Marcela identifica que tiene una solicitud
  # crearCaso() · tipo_caso = solicitud
  Cuando Marcela indica que necesita algo nuevo, en lugar de reportar una falla
  Entonces el sistema le pide el tipo de solicitud y la clase de solicitud
  Y no le pide el tipo de problema

Escenario: CA-3 El sistema no permite mezclar datos de problema y de solicitud
  # RN-003 · CHECK de exclusión mutua tipo_problema / tipo_solicitud
  Cuando Marcela selecciona que está reportando un problema
  Entonces el formulario no permite además elegir un tipo de solicitud o una clase de solicitud para el mismo caso

Escenario: CA-4 El personal de soporte corrige una clasificación equivocada
  # RN-004 · corrección del tipo de caso con registro de quién, cuándo y por qué
  Dado que Marcela registró por error su caso MA-2026-000145 como solicitud, cuando en realidad es un problema
  Cuando el técnico Carlos Peña corrige el tipo de caso a "problema"
  Entonces el sistema guarda el nuevo tipo de caso
  Y registra en el historial del caso quién hizo la corrección, cuándo la hizo y el motivo indicado por Carlos

Escenario: CA-5 Ejemplos que ayudan a elegir correctamente
  # RF-006, RF-013 · apoyo ante la falta de claridad reportada en la entrevista (P2)
  Cuando Marcela duda entre indicar un problema o una solicitud
  Entonces el sistema le muestra ejemplos claros de cada caso (por ejemplo, "mi computador no enciende" como problema y "necesito acceso a una carpeta" como solicitud)
```

---

<a id="hu-005"></a>
## HU-005 — Consultar casos anteriores

| Campo | Contenido |
|---|---|
| **Código** | HU-005 |
| **Título corto** | Consultar casos anteriores |
| **Historia** | Como Usuario solicitante, quiero ver la lista de mis casos anteriores ordenados del más reciente al más antiguo y buscar por fecha, situación del caso o tipo de ayuda solicitada, para revisar qué pedí antes, qué respuesta recibí y cómo fue atendido mi caso. |
| **Origen de la necesidad** | Entrevista a usuarios — P3 y P9 de los resultados por pregunta (P3: "en varios casos los usuarios no saben si su solicitud fue recibida o atendida"; P9: "la mayoría prefiere un único sistema o formulario centralizado para registrar las solicitudes"). (conclusión: los usuarios requieren un sistema único donde puedan registrar y conocer el estado de sus solicitudes). |
| **RF derivados** | [RF-09](2.2-requisitos-funcionales.md#rf-09), [RF-10](2.2-requisitos-funcionales.md#rf-10) |
| **Prioridad** | Alta |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que Marcela Ríos ha iniciado sesión como usuaria solicitante
  Y tiene registrados los casos MA-2026-000101 (cerrado, 10 de enero), MA-2026-000130 (resuelto, 5 de febrero) y MA-2026-000145 (en atención, 3 de marzo)

Escenario: CA-1 Listado ordenado del más reciente al más antiguo
  # obtenerCaso() · orden por fecha_creacion
  Cuando Marcela consulta sus casos anteriores
  Entonces el sistema le muestra primero MA-2026-000145, luego MA-2026-000130 y por último MA-2026-000101

Escenario: CA-2 Un usuario solo ve sus propios casos
  # RN-010 · un solicitante solo consulta sus propios casos
  Dado que el caso MA-2026-000199 pertenece a Diego Salazar, no a Marcela
  Cuando Marcela consulta su listado de casos
  Entonces el sistema no le muestra el caso MA-2026-000199

Esquema del escenario: CA-3 Búsqueda por distintos filtros
  # RF-018 a RF-021 · filtro por fecha, situación, tipo o palabra clave
  Cuando Marcela busca sus casos por <filtro> con el valor "<valor>"
  Entonces el sistema le muestra únicamente los casos que cumplen ese filtro
  Ejemplos:
    | filtro                            | valor              |
    | fecha                             | 3 de marzo de 2026 |
    | situación                         | en atención        |
    | tipo de problema                  | Hardware           |
    | palabra en el título o la descripción | computador     |

Escenario: CA-4 Búsqueda sin resultados
  Cuando Marcela busca sus casos con la palabra "impresora" y ninguno la contiene
  Entonces el sistema le informa que no encontró casos que coincidan, sin mostrar registros que no correspondan
```

---

<a id="hu-006"></a>
## HU-006 — Revisar casos pendientes

| Campo | Contenido |
|---|---|
| **Código** | HU-006 |
| **Título corto** | Revisar casos pendientes |
| **Historia** | Como Técnico de soporte TI, quiero ver en un solo lugar los casos que todavía están pendientes, ordenados por importancia, fecha y tipo de problema, para saber cuáles debo atender primero y evitar retrasos. |
| **Origen de la necesidad** | Entrevista a usuarios — P4 y P10 de los resultados por pregunta (P4: "en muchos casos las respuestas se demoran más de lo esperado"; P10: "se destacan como dificultades actuales las demoras, la falta de claridad, la mala comunicación y la dificultad para saber el estado del caso"). (desde la perspectiva del personal de TI, que debe responder a estas demoras organizando su propia carga de trabajo). |
| **RF derivados** | [RF-11](2.2-requisitos-funcionales.md#rf-11) |
| **Prioridad** | Alta |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que el técnico Carlos Peña ha iniciado sesión como personal de soporte

Escenario: CA-1 Un solo lugar con los casos pendientes
  # obtenerCaso() · excluye estado_caso = cerrado
  Dado que existen los casos MA-2026-000145 (en atención), MA-2026-000150 (recibido) y MA-2026-000101 (cerrado)
  Cuando Carlos abre la pantalla de casos pendientes
  Entonces ve MA-2026-000145 y MA-2026-000150
  Y no ve MA-2026-000101, porque ya está cerrado

Escenario: CA-2 Orden por importancia, fecha y tipo de problema
  # TablaImportancia.calcularResultadoImportancia() · P1 es la prioridad más alta
  Dado que MA-2026-000150 tiene importancia P1 y MA-2026-000145 tiene importancia P3
  Cuando Carlos ordena la lista por importancia
  Entonces MA-2026-000150 aparece antes que MA-2026-000145

Escenario: CA-3 Información visible por caso
  Cuando Carlos revisa la lista de pendientes
  Entonces cada caso muestra su número de seguimiento, su situación actual y su nivel de importancia

Escenario: CA-4 No hay casos pendientes
  Dado que todos los casos están en situación "cerrado"
  Cuando Carlos abre la pantalla de casos pendientes
  Entonces el sistema le indica claramente que no hay casos pendientes
```

---

<a id="hu-007"></a>
## HU-007 — Cambiar la situación actual del caso

| Campo | Contenido |
|---|---|
| **Código** | HU-007 |
| **Título corto** | Cambiar la situación actual del caso |
| **Historia** | Como Personal de soporte, quiero cambiar la situación actual de un caso siguiendo únicamente los cambios permitidos para mi rol, dejando registrado quién hizo la actualización y cuándo se realizó, para mantener el proceso organizado, conservar el historial del caso y permitir que el usuario conozca su avance. |
| **Origen de la necesidad** | Entrevista a usuarios — P3 y P10 de los resultados por pregunta (P3: "en varios casos los usuarios no saben si su solicitud fue recibida o atendida"; P10: "se destacan como dificultades actuales las demoras, la falta de claridad, la mala comunicación y la dificultad para saber el estado del caso"). |
| **RF derivados** | [RF-12](2.2-requisitos-funcionales.md#rf-12), [RF-13](2.2-requisitos-funcionales.md#rf-13), [RF-49](2.2-requisitos-funcionales.md#rf-49) |
| **Prioridad** | Alta |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que el técnico Carlos Peña (perfil de soporte) ha iniciado sesión
  Y el caso MA-2026-000145 está en situación "en atención"

Escenario: CA-1 Cambio permitido y autorizado
  # TransicionEstadoCaso.esTransicionValida() · actualizarCaso() · HistorialCaso.registrarHistorial() · RN-006
  Cuando Carlos cambia la situación del caso MA-2026-000145 a "resuelto" el 10 de marzo de 2026 a las 3:40 p. m.
  Entonces el sistema actualiza la situación del caso
  Y registra en el historial que fue Carlos Peña quien hizo el cambio, el 10 de marzo de 2026 a las 3:40 p. m.
  Y guarda la fecha de solución del caso

Escenario: CA-2 Rechazo de un cambio no permitido
  # esTransicionValida() devuelve falso
  Dado que el caso MA-2026-000150 está en situación "recibido"
  Cuando Carlos intenta cambiarlo directamente a "cerrado"
  Entonces el sistema rechaza el cambio
  Y explica que esa situación no puede pasar directamente a "cerrado"
  Y el caso MA-2026-000150 sigue en "recibido"

Escenario: CA-3 Rechazo por rol no autorizado
  # perfil_autorizado de TransicionEstadoCaso
  Dado que Marcela Ríos tiene perfil de acceso "solicitante"
  Cuando Marcela intenta cambiar la situación de su propio caso MA-2026-000145
  Entonces el sistema impide el cambio
  Y conserva la situación anterior del caso

Escenario: CA-4 El solicitante ve el cambio de inmediato
  Cuando Carlos marca el caso MA-2026-000145 como resuelto
  Entonces Marcela puede ver la nueva situación "resuelto" al consultar su caso, sin demora
```

---

<a id="hu-008"></a>
## HU-008 — Asignar una persona encargada del caso

| Campo | Contenido |
|---|---|
| **Código** | HU-008 |
| **Título corto** | Asignar una persona encargada del caso |
| **Historia** | Como Personal de soporte, quiero asignar o cambiar la persona encargada de atender un caso, para asegurar que cada caso tenga alguien responsable de revisarlo. |
| **Origen de la necesidad** | La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (P10: "mala comunicación y dificultad para saber el estado del caso", que exige que cada caso tenga un responsable identificable). |
| **RF derivados** | [RF-14](2.2-requisitos-funcionales.md#rf-14), [RF-49](2.2-requisitos-funcionales.md#rf-49) |
| **Prioridad** | Alta |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que la supervisora Patricia Londoño ha iniciado sesión
  Y el caso MA-2026-000150 aún no tiene persona asignada

Escenario: CA-1 Asignación a personal de soporte
  # actualizarCaso() · relación caso_soporte-usuario (rol asignado)
  Cuando Patricia asigna el caso MA-2026-000150 al técnico Carlos Peña
  Entonces el sistema registra a Carlos como responsable del caso
  Y guarda en el historial quién hizo la asignación y en qué momento

Escenario: CA-2 Rechazo al intentar asignar a alguien sin perfil de soporte
  # solo perfil_acceso = soporte puede ser asignado
  Cuando Patricia intenta asignar el caso MA-2026-000150 a Marcela Ríos, cuyo perfil es "solicitante"
  Entonces el sistema no permite la asignación

Escenario: CA-3 Cambio de responsable
  Dado que el caso MA-2026-000145 está asignado a Carlos Peña
  Cuando Patricia lo reasigna a la técnica Juliana Gómez
  Entonces Juliana queda como nueva responsable
  Y el sistema conserva en el historial que antes era responsable Carlos Peña

Escenario: CA-4 Caso sin responsable definido
  Cuando Patricia revisa un caso recién recibido que aún no tiene responsable
  Entonces el sistema lo muestra sin persona asignada, sin impedir su consulta
```

---

<a id="hu-009"></a>
## HU-009 — Agregar comentarios al caso

| Campo | Contenido |
|---|---|
| **Código** | HU-009 |
| **Título corto** | Agregar comentarios al caso |
| **Historia** | Como Personal de soporte, quiero agregar comentarios que expliquen avances, aclaraciones o información faltante del caso, para dejar claro qué se ha hecho y qué falta por revisar. |
| **Origen de la necesidad** | Entrevista a usuarios — P6 de los resultados por pregunta (P6: "algunos usuarios envían información completa, pero muchos deben complementarla después"). |
| **RF derivados** | [RF-16](2.2-requisitos-funcionales.md#rf-16), [RF-17](2.2-requisitos-funcionales.md#rf-17) |
| **Prioridad** | Media |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que el técnico Carlos Peña ha iniciado sesión
  Y atiende el caso MA-2026-000145 de Marcela Ríos

Escenario: CA-1 Comentario visible para el usuario
  # ComentarioCaso.registrarComentario() · visibilidad = usuario
  Cuando Carlos agrega el comentario "Ya revisamos el equipo, se cambiará una pieza" y lo marca visible para el usuario
  Entonces el comentario queda guardado con su nombre y la fecha
  Y Marcela puede verlo al consultar su caso

Escenario: CA-2 Comentario interno, solo para soporte
  # visibilidad = interno_soporte · RN-022
  Cuando Carlos agrega el comentario "Falta repuesto, pedir a bodega" y lo marca como interno
  Entonces el comentario queda guardado
  Y Marcela no puede verlo al consultar su caso
  Y otra persona de soporte, como Juliana Gómez, sí puede verlo

Escenario: CA-3 Rechazo de un comentario vacío
  Cuando Carlos intenta guardar un comentario sin escribir ningún texto
  Entonces el sistema no registra el comentario

Escenario: CA-4 Consulta del hilo completo de comentarios
  # listarComentarios()
  Dado que el caso MA-2026-000145 tiene dos comentarios visibles y uno interno
  Cuando Carlos abre el hilo de comentarios del caso
  Entonces ve los tres comentarios
  Pero Marcela, al abrir el mismo caso, solo ve los dos comentarios visibles para ella
```

---

<a id="hu-010"></a>
## HU-010 — Ver tiempo aproximado de atención

| Campo | Contenido |
|---|---|
| **Código** | HU-010 |
| **Título corto** | Ver tiempo aproximado de atención |
| **Historia** | Como Usuario solicitante, quiero ver un tiempo aproximado de atención calculado según la importancia y el tipo de mi caso, para organizar mejor mis actividades mientras espero respuesta. |
| **Origen de la necesidad** | Entrevista a usuarios — P4 y P13 de los resultados por pregunta (P4: "en muchos casos las respuestas se demoran más de lo esperado"; P13: "la mayoría espera respuestas rápidas, desde menos de una hora hasta el mismo día"). |
| **RF derivados** | [RF-13](2.2-requisitos-funcionales.md#rf-13), [RF-20](2.2-requisitos-funcionales.md#rf-20) |
| **Prioridad** | Media |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que Marcela Ríos tiene el caso MA-2026-000145 con importancia P2 y tipo "problema"
  Y la regla de tiempos vigente para P2 y problema define 120 minutos de respuesta y 480 minutos de solución

Escenario: CA-1 Tiempo aproximado visible para el solicitante
  # TiempoAtencionSLA
  Cuando Marcela consulta el detalle de su caso
  Entonces el sistema le muestra que el tiempo máximo de respuesta es de 120 minutos y el de solución de 480 minutos

Escenario: CA-2 El tiempo mostrado no cambia aunque la regla se actualice después
  # versión de la regla vigente al momento de crear el caso
  Dado que después de creado el caso el administrador cambia la regla de P2-problema a 90 minutos de respuesta
  Cuando Marcela vuelve a consultar su caso MA-2026-000145
  Entonces sigue viendo 120 minutos de respuesta, la regla vigente cuando se creó su caso

Escenario: CA-3 Indicación de cumplimiento una vez hay primera respuesta
  # CasoSoporte.cumpleSLA()
  Dado que el caso MA-2026-000145 recibió su primera respuesta 90 minutos después de creado
  Cuando Marcela consulta su caso
  Entonces el sistema le indica que la primera respuesta se dio dentro del tiempo definido
```

---

<a id="hu-011"></a>
## HU-011 — Revisar resumen general de atención

| Campo | Contenido |
|---|---|
| **Código** | HU-011 |
| **Título corto** | Revisar resumen general de atención |
| **Historia** | Como Supervisor de soporte, quiero ver un resumen claro de los casos pendientes, casos en atención, casos resueltos y casos atrasados, para saber si la atención está avanzando bien o si se están acumulando retrasos. |
| **Origen de la necesidad** | Entrevista a usuarios — P4 y P10 de los resultados por pregunta (P4: "en muchos casos las respuestas se demoran más de lo esperado"; P10: "se destacan como dificultades actuales las demoras, la falta de claridad, la mala comunicación y la dificultad para saber el estado del caso"). (vista de supervisión sobre las demoras y dificultades reportadas por los usuarios). |
| **RF derivados** | [RF-21](2.2-requisitos-funcionales.md#rf-21) |
| **Prioridad** | Media |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que la supervisora Patricia Londoño ha iniciado sesión

Escenario: CA-1 Conteo de casos por situación
  # obtenerCaso() agrupado por estado_caso
  Dado que hoy hay 5 casos recibidos, 8 en atención, 12 resueltos y 2 cerrados
  Cuando Patricia abre el resumen general de atención
  Entonces ve esas cuatro cantidades correctamente reflejadas

Escenario: CA-2 Casos que cumplen y que incumplen el tiempo definido
  # CasoSoporte.cumpleSLA()
  Dado que de los 8 casos en atención, 6 están dentro del tiempo definido y 2 ya lo superaron
  Cuando Patricia abre el resumen general
  Entonces ve que 6 casos cumplen el tiempo de atención y 2 están atrasados

Escenario: CA-3 Un caso atrasado se identifica por superar el tiempo definido
  # registrarPrimeraRespuesta() aún no ejecutado dentro del tiempo límite
  Dado que el caso MA-2026-000150 lleva más del tiempo de respuesta definido sin haber recibido atención
  Entonces el resumen lo cuenta como atrasado

Escenario: CA-4 Periodo sin casos registrados
  Cuando Patricia consulta el resumen de un periodo sin ningún caso registrado
  Entonces el sistema se lo indica claramente, en lugar de mostrar un resumen vacío sin explicación
```

---

<a id="hu-012"></a>
## HU-012 — Revisar resumen por periodo

| Campo | Contenido |
|---|---|
| **Código** | HU-012 |
| **Título corto** | Revisar resumen por periodo |
| **Historia** | Como Supervisor de soporte, quiero consultar el resumen de atención por día, semana, mes o un periodo elegido, para comparar cómo se ha comportado la atención en diferentes momentos. |
| **Origen de la necesidad** | Entrevista a usuarios — P4 de los resultados por pregunta (P4: "en muchos casos las respuestas se demoran más de lo esperado"). (seguimiento histórico de la misma demora reportada por los usuarios). |
| **RF derivados** | [RF-22](2.2-requisitos-funcionales.md#rf-22) |
| **Prioridad** | Media |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que la supervisora Patricia Londoño ha iniciado sesión

Esquema del escenario: CA-1 Resumen según el periodo elegido
  Cuando Patricia elige consultar el resumen por <periodo>
  Entonces el sistema recalcula el resumen usando únicamente los casos de ese periodo
  Ejemplos:
    | periodo                                                                   |
    | el día de hoy                                                             |
    | esta semana                                                               |
    | este mes                                                                  |
    | un rango de fechas elegido por ella, por ejemplo del 1 al 15 de marzo de 2026 |

Escenario: CA-2 Periodo sin casos
  Cuando Patricia consulta el resumen de un periodo en el que no se registró ningún caso
  Entonces el sistema se lo indica claramente
```

---

<a id="hu-013"></a>
## HU-013 — Reabrir un caso

| Campo | Contenido |
|---|---|
| **Código** | HU-013 |
| **Título corto** | Reabrir un caso |
| **Historia** | Como Usuario solicitante, quiero reabrir un caso dentro de los 5 días hábiles siguientes a su solución si el problema continúa, para retomar el mismo caso sin tener que empezar desde cero. |
| **Origen de la necesidad** | Entrevista a usuarios — P3 de los resultados por pregunta (P3: "en varios casos los usuarios no saben si su solicitud fue recibida o atendida"). |
| **RF derivados** | [RF-23](2.2-requisitos-funcionales.md#rf-23) |
| **Prioridad** | Media |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que Marcela Ríos ha iniciado sesión
  Y su caso MA-2026-000130 fue marcado como "resuelto" el 1 de marzo de 2026

Escenario: CA-1 Reapertura dentro del plazo permitido
  # reabrirCaso() · RN-007 (5 días hábiles)
  Cuando Marcela solicita reabrir el caso MA-2026-000130 el 4 de marzo de 2026, indicando el motivo "el problema volvió a presentarse"
  Entonces el sistema reabre el caso conservando el mismo número de seguimiento MA-2026-000130
  Y aumenta en uno el número de veces que el caso ha sido reabierto
  Y guarda el motivo indicado por Marcela

Escenario: CA-2 Rechazo por vencimiento del plazo
  Dado que han pasado más de 5 días hábiles desde que el caso MA-2026-000130 fue resuelto
  Cuando Marcela intenta reabrirlo
  Entonces el sistema no permite la reapertura
  Y le explica que el plazo para reabrir ya venció

Escenario: CA-3 El motivo de reapertura es obligatorio
  Cuando Marcela intenta reabrir el caso MA-2026-000130 sin escribir ningún motivo
  Entonces el sistema no permite continuar hasta que indique un motivo

Escenario: CA-4 Solo puede reabrirse un caso resuelto
  Dado que el caso MA-2026-000145 está en situación "en atención", no "resuelto"
  Cuando Marcela intenta reabrirlo
  Entonces el sistema no lo permite

Escenario: CA-5 El caso reabierto conserva su historial, comentarios y adjuntos
  Cuando el caso MA-2026-000130 queda reabierto
  Entonces conserva todo su historial, comentarios y archivos adjuntos anteriores
```

---

<a id="hu-015"></a>
## HU-015 — Consultar información del personal de soporte

| Campo | Contenido |
|---|---|
| **Código** | HU-015 |
| **Título corto** | Consultar información del personal de soporte |
| **Historia** | Como Supervisor de soporte, quiero ver qué tipo de casos puede atender cada persona de soporte y su disponibilidad actual, para asignar cada caso a la persona más adecuada. |
| **Origen de la necesidad** | Entrevista a usuarios — P8 de los resultados por pregunta (P8: "ante la falta de respuesta, los usuarios suelen volver a escribir, usar otro medio o preguntar a otra persona de TI"). (los usuarios recurren a preguntar a otra persona de TI; el supervisor necesita saber quién puede atender). |
| **RF derivados** | [RF-24](2.2-requisitos-funcionales.md#rf-24) |
| **Prioridad** | Media |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que la supervisora Patricia Londoño ha iniciado sesión

Escenario: CA-1 Disponibilidad de una persona específica
  # InfoPersonalSoporte.obtenerInfoSoporte()
  Dado que el técnico Carlos Peña tiene disponibilidad "disponible"
  Cuando Patricia consulta la disponibilidad de Carlos
  Entonces el sistema le muestra "disponible"

Escenario: CA-2 Disponibilidad de todo el equipo de soporte
  Cuando Patricia consulta la disponibilidad de todo el equipo
  Entonces ve el estado de cada persona de soporte: disponible, ocupado o ausente

Escenario: CA-3 Persona sin información de disponibilidad registrada
  Dado que la técnica Juliana Gómez nunca ha actualizado su disponibilidad
  Cuando Patricia consulta su disponibilidad
  Entonces el sistema le indica que no hay información registrada, en lugar de mostrar un dato incorrecto
```

---

<a id="hu-016"></a>
## HU-016 — Registrar usuarios del sistema

| Campo | Contenido |
|---|---|
| **Código** | HU-016 |
| **Título corto** | Registrar usuarios del sistema |
| **Historia** | Como Administrador, quiero registrar nuevos usuarios con su nombre, cargo, área y rol dentro del sistema, para mantener actualizada la información de las personas que pueden usar la mesa de ayuda. |
| **Origen de la necesidad** | La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (conclusión general: la empresa requiere un sistema único e implica administrar quiénes pueden usarlo). |
| **RF derivados** | [RF-26](2.2-requisitos-funcionales.md#rf-26) |
| **Prioridad** | Alta |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que el administrador Jorge Ramírez ha iniciado sesión

Escenario: CA-1 Registro exitoso de un usuario
  # Usuario.crearUsuario(), validarCorreoUnico(), encriptarContrasena()
  Cuando Jorge registra un usuario con estos datos:
    | Campo              | Valor                           |
    | Nombre             | Diego Salazar                   |
    | Correo             | diego.salazar@nexaservicios.com |
    | Cargo              | Auxiliar de Logística           |
    | Área               | Logística                       |
    | Rol organizacional | Operativo                       |
    | Perfil de acceso   | solicitante                     |
  Entonces el sistema registra a Diego como usuario activo
  Y guarda su contraseña inicial de forma protegida, nunca en texto legible

Escenario: CA-2 Rechazo por correo duplicado
  # validarCorreoUnico() · UNIQUE(correo)
  Dado que ya existe un usuario con el correo diego.salazar@nexaservicios.com
  Cuando Jorge intenta registrar otro usuario con ese mismo correo
  Entonces el sistema no registra el usuario
  Y le explica que ese correo ya está en uso

Esquema del escenario: CA-3 Datos obligatorios incompletos
  Cuando Jorge deja vacío el campo <campo> y confirma el registro
  Entonces el sistema no registra el usuario y señala "<mensaje>"
  Ejemplos:
    | campo            | mensaje                              |
    | nombre           | El nombre es obligatorio.            |
    | correo           | El correo es obligatorio.            |
    | perfil de acceso | Debe seleccionar un perfil de acceso. |

Escenario: CA-4 El área es obligatoria para un perfil solicitante
  # D21/RN04 · id_area obligatorio cuando perfil_acceso = solicitante
  Cuando Jorge registra un usuario con perfil "solicitante" y no indica su área
  Entonces el sistema no permite completar el registro hasta que indique el área
```

---

<a id="hu-017"></a>
## HU-017 — Consultar usuarios registrados

| Campo | Contenido |
|---|---|
| **Código** | HU-017 |
| **Título corto** | Consultar usuarios registrados |
| **Historia** | Como Personal de soporte, quiero consultar el listado de usuarios registrados con su cargo y área, para saber quién hace la solicitud y a qué área pertenece. |
| **Origen de la necesidad** | La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (P1: "los participantes son mayoritariamente usuarios que solicitan ayuda, aunque también hay personal de TI y roles de coordinación", lo que exige identificar a cada solicitante). |
| **RF derivados** | [RF-27](2.2-requisitos-funcionales.md#rf-27) |
| **Prioridad** | Media |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que el técnico Carlos Peña ha iniciado sesión

Escenario: CA-1 Listado con cargo y área
  # Usuario.obtenerUsuario()
  Cuando Carlos consulta el listado de usuarios registrados
  Entonces ve el nombre, cargo, área y rol de cada uno, incluyendo a Marcela Ríos (Contabilidad) y Diego Salazar (Logística)

Escenario: CA-2 Búsqueda por nombre o correo
  Cuando Carlos busca "Marcela"
  Entonces el sistema le muestra a Marcela Ríos con su cargo y área

Escenario: CA-3 Búsqueda sin resultados
  Cuando Carlos busca un nombre que no corresponde a ningún usuario registrado
  Entonces el sistema le indica que no encontró resultados, sin mostrar registros que no correspondan
```

---

<a id="hu-018"></a>
## HU-018 — Indicar tipo de problema

| Campo | Contenido |
|---|---|
| **Código** | HU-018 |
| **Título corto** | Indicar tipo de problema |
| **Historia** | Como Usuario solicitante, quiero seleccionar el tipo de problema que estoy reportando, como equipo, internet, programa o acceso, para que mi caso llegue a la persona que mejor pueda ayudarme. |
| **Origen de la necesidad** | Entrevista a usuarios — P11 y P12 de los resultados por pregunta (P11: "los usuarios reportan tanto problemas urgentes como solicitudes de nuevos servicios"; P12: "muchos prefieren describir el problema y que el sistema o el área de TI lo clasifique"). |
| **RF derivados** | [RF-31](2.2-requisitos-funcionales.md#rf-31) |
| **Prioridad** | Alta |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que Marcela Ríos está reportando un problema
  Y los tipos de problema activos son Internet, Hardware, Programa y Acceso

Escenario: CA-1 Selección de un tipo de problema activo
  Cuando Marcela selecciona el tipo de problema "Hardware"
  Entonces el sistema asocia ese tipo de problema a su caso

Escenario: CA-2 Solo se muestran tipos activos
  # tipo_problema.estado = activo
  Dado que el tipo de problema "Fax" está inactivo
  Cuando Marcela abre la lista de tipos de problema
  Entonces no ve "Fax" entre las opciones disponibles

Escenario: CA-3 No se permite escribir un tipo libre
  Cuando Marcela intenta escribir un tipo de problema que no está en la lista
  Entonces el sistema no se lo permite; debe elegir una de las opciones disponibles
```

---

<a id="hu-019"></a>
## HU-019 — Indicar tipo de solicitud

| Campo | Contenido |
|---|---|
| **Código** | HU-019 |
| **Título corto** | Indicar tipo de solicitud |
| **Historia** | Como Usuario solicitante, quiero seleccionar el tipo de solicitud que necesito, como acceso, equipo, programa, información u otra ayuda, para que el equipo entienda mejor qué estoy pidiendo. |
| **Origen de la necesidad** | Entrevista a usuarios — P11 y P12 de los resultados por pregunta (P11: "los usuarios reportan tanto problemas urgentes como solicitudes de nuevos servicios"; P12: "muchos prefieren describir el problema y que el sistema o el área de TI lo clasifique"). |
| **RF derivados** | [RF-32](2.2-requisitos-funcionales.md#rf-32) |
| **Prioridad** | Alta |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que Diego Salazar está haciendo una solicitud
  Y los tipos de solicitud activos son Acceso, Equipo, Información y Otra ayuda

Escenario: CA-1 Selección de un tipo de solicitud activo
  Cuando Diego selecciona el tipo de solicitud "Acceso"
  Entonces el sistema asocia ese tipo de solicitud a su caso

Escenario: CA-2 Solo se muestran tipos activos
  Dado que el tipo de solicitud "Capacitación" está inactivo
  Cuando Diego abre la lista de tipos de solicitud
  Entonces no ve "Capacitación" entre las opciones disponibles

Escenario: CA-3 No se permite escribir un tipo libre
  Cuando Diego intenta escribir un tipo de solicitud que no está en la lista
  Entonces el sistema no se lo permite
```

---

<a id="hu-020"></a>
## HU-020 — Indicar clase de solicitud

| Campo | Contenido |
|---|---|
| **Código** | HU-020 |
| **Título corto** | Indicar clase de solicitud |
| **Historia** | Como Usuario solicitante, quiero indicar si necesito algo nuevo, cambiar algo que ya existe o hacer una consulta, para que el equipo de soporte entienda desde el inicio qué tipo de atención necesito. |
| **Origen de la necesidad** | Entrevista a usuarios — P12 de los resultados por pregunta (P12: "muchos prefieren describir el problema y que el sistema o el área de TI lo clasifique"). |
| **RF derivados** | [RF-33](2.2-requisitos-funcionales.md#rf-33) |
| **Prioridad** | Media |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que Diego Salazar está registrando una solicitud

Esquema del escenario: CA-1 Clase de solicitud disponible
  Cuando Diego indica que su solicitud es de clase <clase>
  Entonces el sistema la asocia a su caso
  Ejemplos:
    | clase    |
    | nuevo    |
    | cambio   |
    | consulta |

Escenario: CA-2 La clase de solicitud solo se pide para solicitudes
  # clase_solicitud solo aplica si tipo_caso = solicitud
  Cuando Diego está reportando un problema, no una solicitud
  Entonces el sistema no le pide la clase de solicitud

Escenario: CA-3 Dato obligatorio para solicitudes
  Cuando Diego registra una solicitud sin elegir ninguna clase
  Entonces el sistema no le permite continuar hasta que elija una
```

---

<a id="hu-021"></a>
## HU-021 — Indicar cuántas personas se ven afectadas

| Campo | Contenido |
|---|---|
| **Código** | HU-021 |
| **Título corto** | Indicar cuántas personas se ven afectadas |
| **Historia** | Como Usuario solicitante, quiero indicar si el problema me afecta solo a mí, a mi área o a toda la empresa, para que el sistema ayude a reconocer qué tan importante es atender el caso. |
| **Origen de la necesidad** | Entrevista a usuarios — P12 de los resultados por pregunta (P12: "muchos prefieren describir el problema y que el sistema o el área de TI lo clasifique"). |
| **RF derivados** | [RF-18](2.2-requisitos-funcionales.md#rf-18), [RF-19](2.2-requisitos-funcionales.md#rf-19) |
| **Prioridad** | Alta |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que Marcela Ríos está registrando un caso

Esquema del escenario: CA-1 Registro de la afectación indicada
  # TablaImportancia.afectacion
  Cuando Marcela indica que el problema afecta a <afectación>
  Entonces el sistema guarda esa afectación para su caso
  Ejemplos:
    | afectación            |
    | solo a ella (usuario) |
    | a su área             |
    | a toda la empresa     |

Escenario: CA-2 Dato obligatorio
  Cuando Marcela intenta enviar su caso sin indicar a quién afecta
  Entonces el sistema no le permite continuar hasta que lo indique

Escenario: CA-3 La afectación se usa para calcular la importancia
  # calcularResultadoImportancia() combina afectación y urgencia
  Cuando Marcela indica que el problema afecta a toda la empresa
  Entonces ese dato se combina con la urgencia indicada para calcular el nivel de importancia del caso
```

---

<a id="hu-022"></a>
## HU-022 — Indicar qué tan rápido necesito atención

| Campo | Contenido |
|---|---|
| **Código** | HU-022 |
| **Título corto** | Indicar qué tan rápido necesito atención |
| **Historia** | Como Usuario solicitante, quiero indicar si necesito atención baja, media, alta o crítica según la urgencia del caso, para que el sistema ayude a ordenar los casos según la necesidad real de atención. |
| **Origen de la necesidad** | Entrevista a usuarios — P12 y P13 de los resultados por pregunta (P12: "muchos prefieren describir el problema y que el sistema o el área de TI lo clasifique"; P13: "la mayoría espera respuestas rápidas, desde menos de una hora hasta el mismo día"). |
| **RF derivados** | [RF-18](2.2-requisitos-funcionales.md#rf-18), [RF-19](2.2-requisitos-funcionales.md#rf-19) |
| **Prioridad** | Alta |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que Marcela Ríos está registrando un caso

Esquema del escenario: CA-1 Combinación de afectación y urgencia
  # calcularResultadoImportancia() · matriz de prioridad (P1 = más alta, P4 = más baja)
  Cuando Marcela indica afectación <afectación> y urgencia <urgencia>
  Entonces el sistema calcula automáticamente la importancia <resultado>, sin que ella tenga que calcularla
  Ejemplos:
    | afectación | urgencia | resultado |
    | usuario    | baja     | P4        |
    | área       | crítica  | P1        |
    | empresa    | crítica  | P1        |
    | empresa    | baja     | P3        |

Escenario: CA-2 La importancia calculada no cambia después
  # resultado_importancia se fija una sola vez, no se recalcula
  Dado que el caso MA-2026-000145 quedó con importancia P2
  Cuando el administrador cambia más adelante las reglas generales de prioridad
  Entonces el caso MA-2026-000145 conserva su importancia P2

Escenario: CA-3 Urgencia obligatoria
  Cuando Marcela intenta enviar su caso sin indicar la urgencia
  Entonces el sistema no le permite continuar hasta que la indique
```

---

<a id="hu-023"></a>
## HU-023 — Iniciar sesión

| Campo | Contenido |
|---|---|
| **Código** | HU-023 |
| **Título corto** | Iniciar sesión |
| **Historia** | Como Usuario del sistema, quiero ingresar al sistema con mis datos de acceso, validados de forma segura y con protección ante intentos repetidos incorrectos, para usar solo las funciones que corresponden a mi rol. |
| **Origen de la necesidad** | La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (conclusión general: un sistema único centralizado requiere controlar el acceso de cada usuario). |
| **RF derivados** | [RF-34](2.2-requisitos-funcionales.md#rf-34) |
| **Prioridad** | Alta |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que Marcela Ríos está registrada con correo marcela.rios@nexaservicios.com y cuenta activa

Escenario: CA-1 Ingreso exitoso
  # autenticar() · resetearIntentosFallidos()
  Cuando Marcela ingresa su correo y su contraseña correcta
  Entonces el sistema le concede acceso a las funciones de su rol de solicitante
  Y reinicia su contador de intentos fallidos

Escenario: CA-2 Rechazo por datos incorrectos
  # autenticar() devuelve falso · registrarIntentoFallido()
  Cuando Marcela ingresa su correo correcto con una contraseña equivocada
  Entonces el sistema rechaza el ingreso
  Y le muestra un mensaje genérico, sin indicar si el error fue el correo o la contraseña
  Y aumenta su contador de intentos fallidos

Escenario: CA-3 Bloqueo por intentos fallidos repetidos
  # bloquearCuenta() · según la política de seguridad de la empresa
  Dado que Marcela ha fallado el ingreso el número de veces que define la política de seguridad de la empresa
  Cuando intenta ingresar una vez más
  Entonces el sistema bloquea su cuenta temporalmente
  Y le informa que su cuenta quedó bloqueada

Escenario: CA-4 Cada rol ve solo sus funciones permitidas
  Cuando el técnico Carlos Peña inicia sesión con sus datos correctos
  Entonces ve las funciones de personal de soporte
  Pero no ve las funciones exclusivas de administrador, como registrar nuevos usuarios
```

---

<a id="hu-024"></a>
## HU-024 — Recuperar contraseña

| Campo | Contenido |
|---|---|
| **Código** | HU-024 |
| **Título corto** | Recuperar contraseña |
| **Historia** | Como Usuario del sistema, quiero recuperar mi contraseña mediante un enlace o código temporal, protegido y de un solo uso, enviado a mi correo registrado, para volver a ingresar al sistema de forma segura sin pedir ayuda por otros medios. |
| **Origen de la necesidad** | La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (conclusión general: el control de acceso del sistema único requiere un mecanismo de recuperación de acceso). |
| **RF derivados** | [RF-35](2.2-requisitos-funcionales.md#rf-35) |
| **Prioridad** | Alta |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que Marcela Ríos está registrada con correo marcela.rios@nexaservicios.com

Escenario: CA-1 Solicitud del enlace de recuperación
  # generarTokenRecuperacion()
  Cuando Marcela solicita recuperar su contraseña indicando su correo registrado
  Entonces el sistema le envía a ese correo un enlace temporal y protegido para restablecerla

Escenario: CA-2 Restablecimiento exitoso dentro del tiempo límite
  # restablecerContrasena() · TokenRecuperacion.esValido()
  Dado que el enlace enviado a Marcela todavía está vigente y no ha sido usado
  Cuando Marcela lo abre y define una nueva contraseña
  Entonces el sistema actualiza su contraseña
  Y le permite ingresar con la nueva contraseña

Escenario: CA-3 Rechazo por enlace vencido o ya usado
  # esValido() devuelve falso · marcarUsado()
  Dado que el enlace enviado a Marcela ya fue usado una vez, o ya venció
  Cuando Marcela intenta usarlo de nuevo
  Entonces el sistema rechaza el restablecimiento
  Y le explica que debe solicitar un enlace nuevo

Escenario: CA-4 Un enlace nuevo invalida el anterior
  # TokenRecuperacion.revocar()
  Dado que Marcela ya había solicitado un enlace de recuperación sin usarlo
  Cuando vuelve a solicitar otro enlace
  Entonces el enlace anterior queda invalidado
  Y solo el enlace nuevo permite restablecer la contraseña
```

---

<a id="hu-025"></a>
## HU-025 — Cerrar sesión

| Campo | Contenido |
|---|---|
| **Código** | HU-025 |
| **Título corto** | Cerrar sesión |
| **Historia** | Como Usuario del sistema, quiero cerrar mi sesión cuando termine de usar el sistema, para proteger mi información y evitar que otra persona use mi cuenta. |
| **Origen de la necesidad** | La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (conclusión general: el control de acceso del sistema único requiere poder cerrar la sesión). |
| **RF derivados** | [RF-36](2.2-requisitos-funcionales.md#rf-36) |
| **Prioridad** | Baja |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que Marcela Ríos tiene una sesión abierta en el sistema

Escenario: CA-1 Cierre de sesión exitoso
  Cuando Marcela selecciona cerrar sesión
  Entonces el sistema cierra su sesión
  Y la devuelve a la pantalla de ingreso

Escenario: CA-2 Las funciones quedan bloqueadas tras el cierre
  Dado que Marcela cerró su sesión
  Cuando intenta volver a una pantalla del sistema sin iniciar sesión de nuevo
  Entonces el sistema no le permite el acceso hasta que vuelva a ingresar sus datos
```

---

<a id="hu-026"></a>
## HU-026 — Pasar un caso a otra persona de soporte

| Campo | Contenido |
|---|---|
| **Código** | HU-026 |
| **Título corto** | Pasar un caso a otra persona de soporte |
| **Historia** | Como Personal de soporte, quiero pasar un caso a otra persona de soporte cuando no pueda resolverlo, para asegurar que el caso sea atendido por quien tenga mayor capacidad de resolverlo. |
| **Origen de la necesidad** | Entrevista a usuarios — P8 y P10 de los resultados por pregunta (P8: "ante la falta de respuesta, los usuarios suelen volver a escribir, usar otro medio o preguntar a otra persona de TI"; P10: "se destacan como dificultades actuales las demoras, la falta de claridad, la mala comunicación y la dificultad para saber el estado del caso"). |
| **RF derivados** | [RF-15](2.2-requisitos-funcionales.md#rf-15), [RF-49](2.2-requisitos-funcionales.md#rf-49) |
| **Prioridad** | Media |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que el técnico Carlos Peña tiene asignado el caso MA-2026-000145

Escenario: CA-1 Reasignación a otro técnico
  # actualizarCaso() · RN-017 · HistorialCaso.registrarHistorial()
  Cuando Carlos pasa el caso MA-2026-000145 a la técnica Juliana Gómez porque no puede resolverlo
  Entonces Juliana queda como nueva responsable del caso
  Y el sistema registra en el historial quién hizo el cambio, a quién se asignó y en qué momento

Escenario: CA-2 Rechazo si el nuevo responsable no es personal de soporte
  Cuando Carlos intenta pasar el caso a Marcela Ríos, cuyo perfil es "solicitante"
  Entonces el sistema no permite la reasignación

Escenario: CA-3 El nuevo responsable ve el historial previo
  Cuando Juliana recibe el caso MA-2026-000145
  Entonces puede ver el historial y los comentarios que Carlos ya había registrado
```

---

<a id="hu-028"></a>
## HU-028 — Cerrar casos sin respuesta del usuario

| Campo | Contenido |
|---|---|
| **Código** | HU-028 |
| **Título corto** | Cerrar casos sin respuesta del usuario |
| **Historia** | Como Personal de soporte, quiero que el sistema cierre un caso resuelto si el usuario no responde después del plazo definido, para evitar que queden casos abiertos sin necesidad. |
| **Origen de la necesidad** | Entrevista a usuarios — P3 y P10 de los resultados por pregunta (P3: "en varios casos los usuarios no saben si su solicitud fue recibida o atendida"; P10: "se destacan como dificultades actuales las demoras, la falta de claridad, la mala comunicación y la dificultad para saber el estado del caso"). |
| **RF derivados** | [RF-37](2.2-requisitos-funcionales.md#rf-37) |
| **Prioridad** | Media |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que el caso MA-2026-000130 de Marcela Ríos fue marcado como "resuelto"

Escenario: CA-1 Cierre automático tras el plazo sin respuesta
  # cerrarCaso() automático · RN-008, RN-023 (5 días hábiles)
  Dado que pasaron 5 días hábiles desde que el caso quedó "resuelto" sin que Marcela respondiera ni lo reabriera
  Cuando el sistema revisa los casos resueltos vencidos
  Entonces cambia automáticamente el caso MA-2026-000130 a "cerrado"
  Y registra en el historial que el cierre fue automático, por vencimiento del plazo

Escenario: CA-2 Aviso al solicitante por el cierre automático
  Cuando el caso MA-2026-000130 se cierra automáticamente
  Entonces Marcela recibe un aviso informándole que su caso fue cerrado por falta de respuesta

Escenario: CA-3 Un caso resuelto dentro del plazo no se cierra solo
  Dado que el caso MA-2026-000145 fue resuelto hace 2 días hábiles
  Cuando el sistema revisa los casos resueltos vencidos
  Entonces el caso MA-2026-000145 permanece en "resuelto", porque aún no se cumplen los 5 días hábiles
```

---

<a id="hu-029"></a>
## HU-029 — Definir tiempos de atención

| Campo | Contenido |
|---|---|
| **Código** | HU-029 |
| **Título corto** | Definir tiempos de atención |
| **Historia** | Como Administrador, quiero definir los tiempos de respuesta y solución según la importancia y tipo de caso, para tener reglas claras sobre cuánto debería tardar la atención. |
| **Origen de la necesidad** | Entrevista a usuarios — P4 y P13 de los resultados por pregunta (P4: "en muchos casos las respuestas se demoran más de lo esperado"; P13: "la mayoría espera respuestas rápidas, desde menos de una hora hasta el mismo día"). |
| **RF derivados** | [RF-38](2.2-requisitos-funcionales.md#rf-38) |
| **Prioridad** | Media |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que el administrador Jorge Ramírez ha iniciado sesión

Escenario: CA-1 Creación de una nueva regla de tiempos
  # TiempoAtencionSLA.crearSLA()
  Cuando Jorge crea una regla para importancia P1 y tipo "problema" con 30 minutos de respuesta y 240 minutos de solución
  Entonces el sistema guarda la regla como vigente para los nuevos casos P1-problema

Escenario: CA-2 No se permiten dos reglas activas para la misma combinación
  Dado que ya existe una regla activa para P1 y "problema"
  Cuando Jorge intenta crear otra regla activa para esa misma combinación
  Entonces el sistema no se lo permite

Escenario: CA-3 Edición sin afectar casos ya cerrados
  # actualizarSLA() · versión vigente desde la fecha del cambio
  Dado que el caso MA-2026-000101 se cerró usando la regla anterior de 30 minutos
  Cuando Jorge edita la regla de P1-problema a 20 minutos de respuesta
  Entonces los nuevos casos P1-problema usan 20 minutos
  Y el caso MA-2026-000101, ya cerrado, conserva su referencia a los 30 minutos originales

Escenario: CA-4 Desactivación de una regla
  # inactivarSLA()
  Cuando Jorge desactiva la regla de P4-solicitud porque ya no debe usarse
  Entonces esa regla deja de aplicarse a los casos nuevos
```

---

<a id="hu-030"></a>
## HU-030 — Descargar reportes de atención

| Campo | Contenido |
|---|---|
| **Código** | HU-030 |
| **Título corto** | Descargar reportes de atención |
| **Historia** | Como Supervisor de soporte, quiero descargar reportes de atención en PDF o Excel, para compartir resultados en reuniones o informes de seguimiento. |
| **Origen de la necesidad** | La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (P4 y P10: las demoras y dificultades reportadas motivan que el supervisor pueda documentar y compartir resultados de la atención). |
| **RF derivados** | [RF-40](2.2-requisitos-funcionales.md#rf-40) |
| **Prioridad** | Baja |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que la supervisora Patricia Londoño ha iniciado sesión

Esquema del escenario: CA-1 Descarga en el formato elegido
  Cuando Patricia descarga el reporte de atención del mes de marzo en formato <formato>
  Entonces el sistema genera el archivo en ese formato con la misma información del resumen de atención
  Ejemplos:
    | formato |
    | PDF     |
    | Excel   |

Escenario: CA-2 Periodo sin información
  Cuando Patricia intenta descargar el reporte de un periodo sin ningún caso registrado
  Entonces el sistema le informa que no hay información para ese periodo, en lugar de generar un archivo vacío
```

---

<a id="hu-031"></a>
## HU-031 — Actualizar la información de un usuario registrado

| Campo | Contenido |
|---|---|
| **Código** | HU-031 |
| **Título corto** | Actualizar la información de un usuario registrado |
| **Historia** | Como Administrador, quiero actualizar los datos de un usuario ya registrado, como su cargo, área, rol o estado, para mantener correcta la información de las personas que usan el sistema. |
| **Origen de la necesidad** | La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (conclusión general: mantener actualizada la información de quienes usan el sistema único). |
| **RF derivados** | [RF-28](2.2-requisitos-funcionales.md#rf-28) |
| **Prioridad** | Media |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que el administrador Jorge Ramírez ha iniciado sesión
  Y el usuario Diego Salazar está registrado con cargo "Auxiliar de Logística" y área "Logística"

Escenario: CA-1 Actualización exitosa de los datos
  # Usuario.actualizarUsuario()
  Cuando Jorge cambia el cargo de Diego a "Coordinador de Logística"
  Entonces el sistema guarda el nuevo cargo
  Y registra la fecha del cambio y que fue Jorge quien lo hizo

Escenario: CA-2 Rechazo por correo duplicado
  # validarCorreoUnico()
  Dado que el correo marcela.rios@nexaservicios.com ya pertenece a otro usuario
  Cuando Jorge intenta cambiar el correo de Diego a ese mismo correo
  Entonces el sistema no guarda el cambio
  Y conserva el correo anterior de Diego

Escenario: CA-3 Área obligatoria al pasar a perfil solicitante
  Cuando Jorge cambia el perfil de acceso de un usuario a "solicitante" sin indicarle un área
  Entonces el sistema no permite guardar el cambio hasta que se indique el área
```

---

<a id="hu-032"></a>
## HU-032 — Inactivar un usuario que ya no debe tener acceso

| Campo | Contenido |
|---|---|
| **Código** | HU-032 |
| **Título corto** | Inactivar un usuario que ya no debe tener acceso |
| **Historia** | Como Administrador, quiero inactivar a un usuario que ya no debe tener acceso al sistema, para evitar que personas que salieron de la empresa o cambiaron de función sigan usando la mesa de ayuda. |
| **Origen de la necesidad** | La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (conclusión general: mantener actualizada la información de quienes usan el sistema único). |
| **RF derivados** | [RF-29](2.2-requisitos-funcionales.md#rf-29), [RF-34](2.2-requisitos-funcionales.md#rf-34) |
| **Prioridad** | Media |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que el administrador Jorge Ramírez ha iniciado sesión
  Y el usuario Diego Salazar está activo

Escenario: CA-1 Inactivación de un usuario
  # Usuario.inactivarUsuario()
  Cuando Jorge inactiva a Diego porque ya no trabaja en la empresa
  Entonces el sistema marca a Diego como inactivo

Escenario: CA-2 Un usuario inactivo no puede ingresar
  Cuando Diego, ya inactivo, intenta iniciar sesión con sus datos
  Entonces el sistema no le permite ingresar

Escenario: CA-3 La información histórica se conserva
  Dado que Diego, antes de ser inactivado, tenía casos y comentarios registrados
  Cuando Jorge lo inactiva
  Entonces esos casos y comentarios siguen existiendo sin cambios

Escenario: CA-4 Reactivación
  Dado que Diego está inactivo
  Cuando Jorge decide reactivarlo
  Entonces Diego vuelve a poder iniciar sesión normalmente
```

---

<a id="hu-033"></a>
## HU-033 — Desbloquear una cuenta de usuario

| Campo | Contenido |
|---|---|
| **Código** | HU-033 |
| **Título corto** | Desbloquear una cuenta de usuario |
| **Historia** | Como Administrador, quiero desbloquear la cuenta de un usuario que quedó bloqueada por intentos fallidos de ingreso, para que esa persona pueda volver a acceder al sistema sin tener que crear una cuenta nueva. |
| **Origen de la necesidad** | La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (conclusión general: el control de acceso del sistema único requiere poder restituirlo cuando se bloquea). |
| **RF derivados** | [RF-30](2.2-requisitos-funcionales.md#rf-30) |
| **Prioridad** | Media |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que el administrador Jorge Ramírez ha iniciado sesión
  Y la cuenta de Marcela Ríos quedó bloqueada por intentos fallidos

Escenario: CA-1 Ver las cuentas bloqueadas
  Cuando Jorge consulta la lista de cuentas bloqueadas
  Entonces ve a Marcela Ríos entre ellas

Escenario: CA-2 Desbloqueo exitoso
  # Usuario.desbloquearCuenta()
  Cuando Jorge desbloquea la cuenta de Marcela
  Entonces el sistema reinicia su contador de intentos fallidos
  Y Marcela puede volver a iniciar sesión con sus datos correctos
```

---

<a id="hu-034"></a>
## HU-034 — Actualizar mi disponibilidad para recibir casos

| Campo | Contenido |
|---|---|
| **Código** | HU-034 |
| **Título corto** | Actualizar mi disponibilidad para recibir casos |
| **Historia** | Como Técnico de soporte TI, quiero actualizar mi disponibilidad entre disponible, ocupado o ausente, para que el personal que asigna casos sepa si puedo recibir más trabajo en este momento. |
| **Origen de la necesidad** | Entrevista a usuarios — P8 de los resultados por pregunta (P8: "ante la falta de respuesta, los usuarios suelen volver a escribir, usar otro medio o preguntar a otra persona de TI"). (saber a quién recurrir en TI depende de que el propio personal de soporte mantenga su disponibilidad al día). |
| **RF derivados** | [RF-25](2.2-requisitos-funcionales.md#rf-25) |
| **Prioridad** | Media |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que el técnico Carlos Peña ha iniciado sesión

Esquema del escenario: CA-1 Cambio de disponibilidad
  # InfoPersonalSoporte.actualizarDisponibilidad()
  Cuando Carlos cambia su disponibilidad a <disponibilidad>
  Entonces el sistema guarda ese estado junto con la fecha y hora del cambio
  Ejemplos:
    | disponibilidad |
    | disponible     |
    | ocupado        |
    | ausente        |

Escenario: CA-2 La disponibilidad más reciente es la que se ve
  Dado que Carlos cambió su disponibilidad a "ocupado" a las 9:00 a. m. y a "disponible" a las 11:00 a. m.
  Cuando la supervisora Patricia Londoño consulta su disponibilidad después de las 11:00 a. m.
  Entonces ve "disponible", el estado más reciente
```

---

<a id="hu-035"></a>
## HU-035 — Registrar un activo tecnológico de la empresa

| Campo | Contenido |
|---|---|
| **Código** | HU-035 |
| **Título corto** | Registrar un activo tecnológico de la empresa |
| **Historia** | Como Administrador, quiero registrar los equipos y programas de la empresa con sus datos principales, para poder relacionarlos con los casos que los afectan y llevar un control de ellos. |
| **Origen de la necesidad** | La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (P11: "los usuarios reportan tanto problemas urgentes como solicitudes de nuevos servicios", muchos de ellos relacionados con equipos o programas que deben poder identificarse). |
| **RF derivados** | [RF-44](2.2-requisitos-funcionales.md#rf-44) |
| **Prioridad** | Media |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que el administrador Jorge Ramírez ha iniciado sesión

Escenario: CA-1 Registro exitoso de un activo
  # Activo.crearActivo()
  Cuando Jorge registra un activo con estos datos:
    | Campo            | Valor                       |
    | Nombre           | Computador portátil HP-2301 |
    | Tipo de activo   | Hardware                    |
    | Marca            | HP                          |
    | Modelo           | ProBook 440                 |
    | Número de serie  | HPX-00234                   |
    | Área             | Contabilidad                |
  Entonces el sistema registra el activo
  Y lo deja disponible para asociarse a futuros casos

Escenario: CA-2 Rechazo por número de serie repetido
  # UNIQUE(numero_serie), admite múltiples NULL
  Dado que ya existe un activo registrado con número de serie "HPX-00234"
  Cuando Jorge intenta registrar otro activo con ese mismo número de serie
  Entonces el sistema no lo permite

Escenario: CA-3 Registro sin número de serie
  Cuando Jorge registra un activo que no tiene número de serie visible y deja ese campo vacío
  Entonces el sistema lo registra igual, sin exigir ese dato

Escenario: CA-4 Datos obligatorios
  Cuando Jorge intenta registrar un activo sin indicar su nombre o su tipo
  Entonces el sistema no lo registra hasta que complete esos datos
```

---

<a id="hu-036"></a>
## HU-036 — Consultar los activos tecnológicos registrados

| Campo | Contenido |
|---|---|
| **Código** | HU-036 |
| **Título corto** | Consultar los activos tecnológicos registrados |
| **Historia** | Como Personal de soporte, quiero consultar el listado de equipos y programas registrados con su estado y ubicación, para saber qué activos existen al momento de atender o revisar un caso. |
| **Origen de la necesidad** | La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (P11, por la misma razón que HU-035: los casos reportados suelen involucrar equipos o programas que deben poder consultarse). |
| **RF derivados** | [RF-45](2.2-requisitos-funcionales.md#rf-45) |
| **Prioridad** | Baja |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que el técnico Carlos Peña ha iniciado sesión

Escenario: CA-1 Listado con estado y ubicación
  # Activo.obtenerActivo()
  Cuando Carlos consulta el listado de activos registrados
  Entonces ve cada activo con su nombre, tipo, estado y área donde está ubicado

Escenario: CA-2 Búsqueda por nombre, número de serie o área
  Cuando Carlos busca el activo "HPX-00234"
  Entonces el sistema le muestra el computador portátil HP-2301 asociado a ese número de serie

Escenario: CA-3 Búsqueda sin resultados
  Cuando Carlos busca un activo que no existe
  Entonces el sistema le indica que no encontró resultados
```

---

<a id="hu-037"></a>
## HU-037 — Actualizar la información de un activo tecnológico

| Campo | Contenido |
|---|---|
| **Código** | HU-037 |
| **Título corto** | Actualizar la información de un activo tecnológico |
| **Historia** | Como Administrador, quiero actualizar los datos de un activo ya registrado, como su marca, modelo, ubicación o estado, para mantener correcta la información del inventario tecnológico. |
| **Origen de la necesidad** | La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (P11, por la misma razón que HU-035 y HU-036). |
| **RF derivados** | [RF-46](2.2-requisitos-funcionales.md#rf-46) |
| **Prioridad** | Baja |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que el administrador Jorge Ramírez ha iniciado sesión
  Y el activo HPX-00234 está ubicado en Contabilidad

Escenario: CA-1 Actualización de ubicación y estado
  # Activo.actualizarActivo()
  Cuando Jorge traslada el activo HPX-00234 al área de Logística y lo marca como "en reparación"
  Entonces el sistema guarda la nueva ubicación y el nuevo estado

Escenario: CA-2 Rechazo por número de serie en uso
  Dado que el número de serie "HPX-00500" ya pertenece a otro activo
  Cuando Jorge intenta asignar ese mismo número de serie al activo HPX-00234
  Entonces el sistema no guarda el cambio
  Y conserva el número de serie anterior del activo
```

---

<a id="hu-038"></a>
## HU-038 — Dar de baja un activo tecnológico

| Campo | Contenido |
|---|---|
| **Código** | HU-038 |
| **Título corto** | Dar de baja un activo tecnológico |
| **Historia** | Como Administrador, quiero dar de baja un activo que ya no está en uso, para que deje de aparecer como disponible para relacionarlo con nuevos casos. |
| **Origen de la necesidad** | La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (P11, por la misma razón que HU-035 a HU-037). |
| **RF derivados** | [RF-47](2.2-requisitos-funcionales.md#rf-47) |
| **Prioridad** | Baja |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que el administrador Jorge Ramírez ha iniciado sesión
  Y el activo HPX-00234 está activo

Escenario: CA-1 Dar de baja un activo
  # Activo.darDeBajaActivo()
  Cuando Jorge da de baja el activo HPX-00234 porque ya no está en uso
  Entonces el sistema lo marca como "dado de baja"

Escenario: CA-2 Un activo dado de baja no puede elegirse en casos nuevos
  Dado que el activo HPX-00234 está dado de baja
  Cuando Marcela intenta relacionar ese activo con un caso nuevo
  Entonces no aparece entre las opciones disponibles

Escenario: CA-3 Los casos anteriores conservan la relación
  Dado que el caso MA-2026-000101, ya cerrado, estaba relacionado con el activo HPX-00234
  Cuando el activo se da de baja
  Entonces el caso MA-2026-000101 conserva esa relación sin cambios
```

---

<a id="hu-039"></a>
## HU-039 — Administrar los catálogos de clasificación del sistema

| Campo | Contenido |
|---|---|
| **Código** | HU-039 |
| **Título corto** | Administrar los catálogos de clasificación del sistema |
| **Historia** | Como Administrador, quiero crear, editar e inactivar los valores de las listas de clasificación del sistema (áreas, cargos, roles de empleado, tipos de activo, tipos de problema y tipos de solicitud), para mantener actualizadas las opciones que usan los demás usuarios al registrar información. |
| **Origen de la necesidad** | La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (conclusión general: mantener actualizadas las listas de clasificación que usa el sistema único). |
| **RF derivados** | [RF-48](2.2-requisitos-funcionales.md#rf-48) |
| **Prioridad** | Media |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que el administrador Jorge Ramírez ha iniciado sesión

Esquema del escenario: CA-1 Creación de un valor nuevo en un catálogo
  # Catalogo.crear() · aplica a Área, Cargo, Rol de empleado, Tipo de activo, Tipo de problema, Tipo de solicitud
  Cuando Jorge crea el valor "<valor>" en el catálogo de <catálogo>
  Entonces ese valor queda disponible como opción para los demás usuarios
  Ejemplos:
    | catálogo           | valor               |
    | áreas              | Mercadeo            |
    | cargos             | Analista de Mercadeo |
    | tipos de problema  | Correo electrónico  |
    | tipos de solicitud | Capacitación        |

Escenario: CA-2 Rechazo por nombre repetido en el mismo catálogo
  Dado que ya existe el área "Mercadeo"
  Cuando Jorge intenta crear otra área también llamada "Mercadeo"
  Entonces el sistema no lo permite

Escenario: CA-3 Edición de un valor existente
  Cuando Jorge cambia el nombre del tipo de problema "Programa" por "Software"
  Entonces el sistema guarda el nuevo nombre

Escenario: CA-4 Inactivación sin perder los registros que ya lo usan
  Dado que el tipo de problema "Fax" ya fue usado en casos anteriores
  Cuando Jorge lo inactiva
  Entonces deja de aparecer como opción para casos nuevos
  Y los casos anteriores que ya lo tenían lo conservan sin cambios
```

---

<a id="hu-040"></a>
## HU-040 — Consultar las reglas de tiempos de atención configuradas

| Campo | Contenido |
|---|---|
| **Código** | HU-040 |
| **Título corto** | Consultar las reglas de tiempos de atención configuradas |
| **Historia** | Como Supervisor de soporte, quiero consultar las reglas de tiempos de respuesta y solución configuradas para cada importancia y tipo de caso, para verificar que están completas y son adecuadas antes de que se apliquen a nuevos casos. |
| **Origen de la necesidad** | Entrevista a usuarios — P4 y P13 de los resultados por pregunta (P4: "en muchos casos las respuestas se demoran más de lo esperado"; P13: "la mayoría espera respuestas rápidas, desde menos de una hora hasta el mismo día"). (verificación, por parte del supervisor, de que las reglas configuradas sostienen los tiempos esperados por los usuarios). |
| **RF derivados** | [RF-39](2.2-requisitos-funcionales.md#rf-39) |
| **Prioridad** | Baja |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que la supervisora Patricia Londoño ha iniciado sesión

Escenario: CA-1 Listado de reglas vigentes
  # TiempoAtencionSLA.obtenerSLA()
  Cuando Patricia consulta las reglas de tiempos de atención configuradas
  Entonces ve cada regla con su importancia, tipo de caso, tiempo de respuesta y tiempo de solución

Escenario: CA-2 Distinción entre reglas activas y reglas anteriores
  Dado que la regla de P2-problema fue editada y la versión anterior quedó inactiva
  Cuando Patricia consulta las reglas
  Entonces puede distinguir cuál es la vigente y cuál ya no se usa

Escenario: CA-3 Combinación sin regla definida
  Dado que no existe ninguna regla para importancia P4 y tipo "solicitud"
  Cuando Patricia revisa esa combinación
  Entonces el sistema le indica que no hay una regla definida
```

---

<a id="hu-041"></a>
## HU-041 — Consultar el historial de cambios de un caso

| Campo | Contenido |
|---|---|
| **Código** | HU-041 |
| **Título corto** | Consultar el historial de cambios de un caso |
| **Historia** | Como Supervisor de soporte, quiero consultar el historial completo de cambios realizados sobre un caso, para revisar cómo fue atendido y verificar que el proceso se siguió correctamente. |
| **Origen de la necesidad** | Entrevista a usuarios — P10 de los resultados por pregunta (P10: "se destacan como dificultades actuales las demoras, la falta de claridad, la mala comunicación y la dificultad para saber el estado del caso"). |
| **RF derivados** | [RF-41](2.2-requisitos-funcionales.md#rf-41), [RF-49](2.2-requisitos-funcionales.md#rf-49) |
| **Prioridad** | Media |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que la supervisora Patricia Londoño ha iniciado sesión
  Y el caso MA-2026-000145 ha tenido varios cambios desde que se creó

Escenario: CA-1 Registro automático de cada cambio relevante
  # HistorialCaso.registrarHistorial()
  Cuando el caso MA-2026-000145 cambia de situación, cambia de responsable o recibe un comentario
  Entonces el sistema guarda automáticamente ese cambio en el historial, con qué cambió, el valor anterior, el valor nuevo, quién lo hizo y la fecha

Escenario: CA-2 Consulta del historial completo
  # HistorialCaso.listarHistorial()
  Cuando Patricia abre el historial del caso MA-2026-000145
  Entonces ve todos los cambios registrados, ordenados desde el más antiguo hasta el más reciente

Escenario: CA-3 El historial no puede modificarse ni eliminarse
  Cuando cualquier persona intenta modificar o borrar un registro ya guardado en el historial
  Entonces el sistema no se lo permite
```

---

<a id="hu-042"></a>
## HU-042 — Adjuntar y consultar evidencias de un caso

| Campo | Contenido |
|---|---|
| **Código** | HU-042 |
| **Título corto** | Adjuntar y consultar evidencias de un caso |
| **Historia** | Como Usuario solicitante, quiero adjuntar archivos como capturas de pantalla o documentos a mi caso y consultarlos después, para que el personal de soporte cuente con la evidencia necesaria para atenderlo. |
| **Origen de la necesidad** | Entrevista a usuarios — P6 de los resultados por pregunta (P6: "algunos usuarios envían información completa, pero muchos deben complementarla después"). (adjuntar evidencia reduce la necesidad de complementar la información después). |
| **RF derivados** | [RF-42](2.2-requisitos-funcionales.md#rf-42), [RF-43](2.2-requisitos-funcionales.md#rf-43) |
| **Prioridad** | Media |

**Criterios de aceptación**

```gherkin
Antecedentes:
  Dado que Marcela Ríos tiene el caso MA-2026-000145 abierto

Escenario: CA-1 Carga exitosa de un archivo permitido
  # AdjuntoCaso.cargarAdjunto() · CHECK tipo_archivo IN (image/png, image/jpeg, application/pdf, text/plain)
  Cuando Marcela adjunta una captura de pantalla en formato PNG de 850 KB
  Entonces el sistema guarda el archivo asociado a su caso
  Y registra quién lo cargó y la fecha de carga

Escenario: CA-2 Rechazo por tamaño máximo excedido
  # CHECK(tamano_kb > 0 AND tamano_kb <= 10240) · máximo 10 MB
  Cuando Marcela intenta adjuntar un archivo de 12 000 KB
  Entonces el sistema lo rechaza
  Y le explica que el tamaño máximo permitido es de 10 MB

Escenario: CA-3 Rechazo por tipo de archivo no permitido
  Cuando Marcela intenta adjuntar un archivo de video en formato MP4
  Entonces el sistema lo rechaza
  Y le explica qué tipos de archivo sí están permitidos

Escenario: CA-4 Consulta de los adjuntos de un caso
  # obtenerAdjunto(), listarAdjuntos()
  Dado que el caso MA-2026-000145 tiene dos archivos adjuntos
  Cuando el técnico Carlos Peña abre el caso
  Entonces ve el listado de los dos adjuntos y puede abrir cada uno

Escenario: CA-5 Eliminación de un adjunto cargado por error
  # eliminarAdjunto() · baja lógica, no elimina el registro del historial
  Dado que Marcela cargó por error un archivo que no corresponde a su caso
  Cuando lo elimina
  Entonces el archivo deja de mostrarse en el caso
  Y el historial conserva el registro de que ese archivo fue cargado y luego eliminado
```

---

La justificación de la trazabilidad de cada HU y las matrices HU ↔ RF están en [1.1 Anexos de trazabilidad](1.1-anexos-trazabilidad-hu-rf.md).
