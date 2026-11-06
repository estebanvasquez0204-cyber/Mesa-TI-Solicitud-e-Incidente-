# 2. Reglas de Negocio y Requisitos: RF + RN + RNF

> **Guía de seguimiento:** Fase 1 — actividad *2. RF + RN + RNF*.
>
> **Fuente:** documento Word *Proyecto.docx* — «Mesa de Ayuda TI de Nexa Servicios» (F. J. Motta Quintero y E. Vásquez Valencia · Ingeniería de Software II · Docente: Lora Patiño Gloria Amparo · Octubre de 2026), sección 2.

## 2.1 Reglas de Negocio

***De dónde nace:** las reglas fueron delatadas por los criterios de aceptación de RECHAZO (“el sistema no registra y muestra…”) y por los criterios de éxito que fijan una condición permanente. La pregunta “¿esta prohibición existiría sin software?” convierte ese criterio en una RN numerada. Cada RN queda vigilada por al menos un RF (ninguna regla sin vigilante) y se hace visible en los flujos alternativos de los casos de uso.*

**Tabla 52**  
*Regla de negocio RN-01: Datos mínimos del caso*

| **Código**            | **RN-01 — Datos mínimos del caso**                                                                                                                                                     |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Un caso solo puede enviarse si indica qué necesita, dónde ocurre, a quiénes afecta, qué tan urgente es y contar con datos de contacto registrados del solicitante (teléfono o correo). |
| **Origen**            | Criterios de rechazo HU-001 CA-2, HU-021 CA-2 y HU-022 CA-3; entrevista: la información enviada suele estar incompleta (P6).                                                           |
| **RF que la vigilan** | RF-01 y RF-18                                                                                                                                                                          |

**Tabla 53**  
*Regla de negocio RN-02: Número de seguimiento único*

| **Código**            | **RN-02 — Número de seguimiento único**                                                               |
|-----------------------|-------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Todo caso recibe un número de seguimiento con formato MA-AAAA-NNNNNN que nunca se repite entre casos. |
| **Origen**            | HU-001 CA-1 y HU-002 CA-3; entrevista: los usuarios no saben si su solicitud fue recibida (P3).       |
| **RF que la vigilan** | RF-01 y RF-03                                                                                         |

**Tabla 54**  
*Regla de negocio RN-03: Un caso es problema o solicitud, nunca ambos*

| **Código**            | **RN-03 — Un caso es problema o solicitud, nunca ambos**                                                                                                                                |
|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Un caso es un problema o una solicitud. El problema lleva tipo de problema; la solicitud lleva tipo de solicitud y clase de solicitud (nuevo, cambio o consulta). No se pueden mezclar. |
| **Origen**            | Criterios de rechazo HU-004 CA-1 a CA-3, HU-020 CA-2 y CA-3 y HU-049 CA-2; entrevista: los usuarios reportan tanto problemas como solicitudes (P11).                                    |
| **RF que la vigilan** | RF-07, RF-08, RF-31, RF-32 y RF-33                                                                                                                                                      |

**Tabla 55**  
*Regla de negocio RN-04: Clasificación solo con opciones activas*

| **Código**            | **RN-04 — Clasificación solo con opciones activas**                                                                                                                                                      |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Los tipos de problema y de solicitud se eligen únicamente de las opciones activas del catálogo; no se admite texto libre. Una opción inactiva deja de ofrecerse, pero los casos anteriores la conservan. |
| **Origen**            | Criterios de rechazo HU-018 CA-2 y CA-3, HU-019 CA-2 y CA-3 y HU-047 y HU-048 CA-4.                                                                                                                      |
| **RF que la vigilan** | RF-31, RF-32 y RF-48                                                                                                                                                                                     |

**Tabla 56**  
*Regla de negocio RN-05: Importancia calculada y fija*

| **Código**            | **RN-05 — Importancia calculada y fija**                                                                                                                                              |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | La importancia (P1 la más alta, P4 la más baja) se calcula automáticamente combinando afectación y urgencia según la matriz de prioridad. Se fija al crear el caso y no se recalcula. |
| **Origen**            | HU-022 CA-1 y CA-2, HU-021 CA-3 y HU-006 CA-2; entrevista: se espera atención según la necesidad real (P12, P13).                                                                     |
| **RF que la vigilan** | RF-11 y RF-19                                                                                                                                                                         |

**Tabla 57**  
*Regla de negocio RN-06: Visibilidad de los casos propios*

| **Código**            | **RN-06 — Visibilidad de los casos propios**                                                            |
|-----------------------|---------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Un solicitante solo puede consultar sus propios casos y los comentarios marcados como visibles para él. |
| **Origen**            | Criterios de rechazo HU-005 CA-2, HU-009 CA-4 y HU-010 CA-4.                                            |
| **RF que la vigilan** | RF-09, RF-10 y RF-13                                                                                    |

**Tabla 58**  
*Regla de negocio RN-07: Cambios de situación permitidos por perfil*

| **Código**            | **RN-07 — Cambios de situación permitidos por perfil**                                                                                                         |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | La situación de un caso solo cambia siguiendo las transiciones permitidas y por un perfil autorizado. El solicitante no puede cambiar la situación de su caso. |
| **Origen**            | Criterios de rechazo HU-007 CA-2 y CA-3.                                                                                                                       |
| **RF que la vigilan** | RF-12                                                                                                                                                          |

**Tabla 59**  
*Regla de negocio RN-08: Historial inmutable de cambios*

| **Código**            | **RN-08 — Historial inmutable de cambios**                                                                                                                                                                                                  |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Todo cambio relevante de un caso (situación, responsable, clasificación, comentario, adjunto, cierre, reapertura) queda en el historial con quién lo hizo, cuándo, valor anterior y valor nuevo. El historial no se modifica ni se elimina. |
| **Origen**            | HU-049 CA-1, HU-007 CA-1, HU-008 CA-1, HU-026 CA-1, HU-041 CA-1 y CA-3, HU-042 CA-5; entrevista: dificultad para saber el estado del caso (P10).                                                                                            |
| **RF que la vigilan** | RF-08, RF-12, RF-14, RF-15, RF-16, RF-23, RF-37, RF-41, RF-42, RF-43 y RF-49                                                                                                                                                                |

**Tabla 60**  
*Regla de negocio RN-09: Responsable con perfil de soporte*

| **Código**            | **RN-09 — Responsable con perfil de soporte**                            |
|-----------------------|--------------------------------------------------------------------------|
| **Enunciado**         | Solo una persona con perfil de soporte puede ser responsable de un caso. |
| **Origen**            | Criterios de rechazo HU-008 CA-2 y HU-026 CA-2.                          |
| **RF que la vigilan** | RF-14 y RF-15                                                            |

**Tabla 61**  
*Regla de negocio RN-10: Comentarios no vacíos y con visibilidad*

| **Código**            | **RN-10 — Comentarios no vacíos y con visibilidad**                                                                                          |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Un comentario no puede estar vacío y se marca como visible para el usuario o como interno. El solicitante nunca ve los comentarios internos. |
| **Origen**            | Criterios de rechazo HU-009 CA-2, CA-3 y CA-4; entrevista: la información suele complementarse después (P6).                                 |
| **RF que la vigilan** | RF-16 y RF-17                                                                                                                                |

**Tabla 62**  
*Regla de negocio RN-11: Reapertura condicionada*

| **Código**            | **RN-11 — Reapertura condicionada**                                                                                                                                                |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Un caso solo se reabre si está resuelto, dentro de 5 días hábiles desde su solución y con un motivo. Conserva su número, historial, comentarios y adjuntos, y suma una reapertura. |
| **Origen**            | Criterios de rechazo HU-013 CA-2, CA-3 y CA-4; CA-1 y CA-5.                                                                                                                        |
| **RF que la vigilan** | RF-23                                                                                                                                                                              |

**Tabla 63**  
*Regla de negocio RN-12: Cierre automático por vencimiento*

| **Código**            | **RN-12 — Cierre automático por vencimiento**                                                                                  |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Un caso resuelto que no recibe respuesta ni reapertura del usuario pasa automáticamente a cerrado al cumplirse 5 días hábiles. |
| **Origen**            | HU-028 CA-1 y CA-3.                                                                                                            |
| **RF que la vigilan** | RF-37                                                                                                                          |

**Tabla 64**  
*Regla de negocio RN-13: Tiempos de atención versionados*

| **Código**            | **RN-13 — Tiempos de atención versionados**                                                                                                                                                                                |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Los tiempos de respuesta y solución se definen por importancia y tipo de caso, en minutos calendario. Solo hay una regla activa por combinación y cada caso conserva la regla vigente al crearse, aunque después se edite. |
| **Origen**            | Criterios de rechazo HU-029 CA-2 y CA-3, HU-010 CA-2 y HU-040 CA-2; entrevista: se esperan respuestas rápidas (P13).                                                                                                       |
| **RF que la vigilan** | RF-20, RF-38 y RF-39                                                                                                                                                                                                       |

**Tabla 65**  
*Regla de negocio RN-14: Caso atrasado por superar el tiempo definido*

| **Código**            | **RN-14 — Caso atrasado por superar el tiempo definido**                                                                      |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Un caso está atrasado si supera el tiempo de respuesta o de solución definido sin haber recibido la atención correspondiente. |
| **Origen**            | HU-011 CA-2 y CA-3, HU-010 CA-3 y HU-007 CA-5; entrevista: las respuestas se demoran más de lo esperado (P4).                 |
| **RF que la vigilan** | RF-20, RF-21 y RF-50                                                                                                          |

**Tabla 66**  
*Regla de negocio RN-15: Avisos por cambio de situación y reintento*

| **Código**            | **RN-15 — Avisos por cambio de situación y reintento**                                                                                                                         |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Todo cambio de situación genera un aviso al solicitante por correo, aviso emergente y detalle del caso. Si el envío falla, se guarda el motivo y se reintenta automáticamente. |
| **Origen**            | HU-003 CA-1 a CA-3, HU-002 CA-4 y HU-028 CA-2; entrevista: mala comunicación (P10).                                                                                            |
| **RF que la vigilan** | RF-04, RF-05 y RF-37                                                                                                                                                           |

**Tabla 67**  
*Regla de negocio RN-16: El registro del caso no depende del correo*

| **Código**            | **RN-16 — El registro del caso no depende del correo**                                                  |
|-----------------------|---------------------------------------------------------------------------------------------------------|
| **Enunciado**         | El caso queda registrado con su número de seguimiento aunque falle el envío del correo de confirmación. |
| **Origen**            | HU-002 CA-2 y CA-4.                                                                                     |
| **RF que la vigilan** | RF-03 y RF-05                                                                                           |

**Tabla 68**  
*Regla de negocio RN-17: Correo de usuario único*

| **Código**            | **RN-17 — Correo de usuario único**                                      |
|-----------------------|--------------------------------------------------------------------------|
| **Enunciado**         | El correo de cada usuario es único en el sistema y tiene formato válido. |
| **Origen**            | Criterios de rechazo HU-016 CA-2, HU-031 CA-2 y HU-002 CA-5.             |
| **RF que la vigilan** | RF-03, RF-26 y RF-28                                                     |

**Tabla 69**  
*Regla de negocio RN-18: Área obligatoria para solicitantes*

| **Código**            | **RN-18 — Área obligatoria para solicitantes**                     |
|-----------------------|--------------------------------------------------------------------|
| **Enunciado**         | Todo usuario con perfil solicitante debe tener un área registrada. |
| **Origen**            | Criterios de rechazo HU-016 CA-4 y HU-031 CA-3.                    |
| **RF que la vigilan** | RF-26 y RF-28                                                      |

**Tabla 70**  
*Regla de negocio RN-19: Contraseña protegida*

| **Código**            | **RN-19 — Contraseña protegida**                                               |
|-----------------------|--------------------------------------------------------------------------------|
| **Enunciado**         | La contraseña y los códigos de recuperación nunca se guardan en texto legible. |
| **Origen**            | HU-016 CA-1 y HU-024 CA-2.                                                     |
| **RF que la vigilan** | RF-26 y RF-35                                                                  |

**Tabla 71**  
*Regla de negocio RN-20: Bloqueo por intentos fallidos*

| **Código**            | **RN-20 — Bloqueo por intentos fallidos**                                                                                                                                                                                                          |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Ante datos de ingreso incorrectos el sistema muestra un mensaje genérico y cuenta el intento. Al llegar al cuarto intento fallido (límite de 4 intentos definido para el proyecto), la cuenta se bloquea hasta que un administrador la desbloquee. |
| **Origen**            | Criterios de rechazo HU-023 CA-2 y CA-3; HU-033 CA-2. Límite de 4 intentos fallidos (IN-13).                                                                                                                                                       |
| **RF que la vigilan** | RF-30 y RF-34                                                                                                                                                                                                                                      |

**Tabla 72**  
*Regla de negocio RN-21: Usuario inactivo sin acceso*

| **Código**            | **RN-21 — Usuario inactivo sin acceso**                                                                                |
|-----------------------|------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Un usuario inactivo no puede iniciar sesión, pero sus casos y comentarios se conservan sin cambios. Puede reactivarse. |
| **Origen**            | HU-032 CA-2, CA-3 y CA-4.                                                                                              |
| **RF que la vigilan** | RF-29 y RF-34                                                                                                          |

**Tabla 73**  
*Regla de negocio RN-22: Enlace de recuperación temporal y de un solo uso*

| **Código**            | **RN-22 — Enlace de recuperación temporal y de un solo uso**                                                  |
|-----------------------|---------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | El enlace de recuperación de contraseña vence y solo sirve una vez. Solicitar uno nuevo invalida el anterior. |
| **Origen**            | Criterios de rechazo HU-024 CA-3 y CA-4; CA-2.                                                                |
| **RF que la vigilan** | RF-35                                                                                                         |

**Tabla 74**  
*Regla de negocio RN-23: Acceso según perfil y sesión*

| **Código**            | **RN-23 — Acceso según perfil y sesión**                                                                                                                                 |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Cada perfil accede únicamente a las funciones de su rol, y sin sesión iniciada no hay acceso a ninguna pantalla.                                                         |
| **Origen**            | HU-001 CA-5, HU-023 CA-4, HU-025 CA-2, HU-007 CA-3, HU-006 CA-5, HU-033 CA-3, HU-034 CA-3 y HU-049 CA-3; HU-017 y HU-036 (consultas exclusivas del personal de soporte). |
| **RF que la vigilan** | RF-01, RF-08, RF-11, RF-12, RF-25, RF-27, RF-30, RF-34, RF-36 y RF-45                                                                                                    |

**Tabla 75**  
*Regla de negocio RN-24: Número de serie de activo único*

| **Código**            | **RN-24 — Número de serie de activo único**                                                                          |
|-----------------------|----------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | El número de serie de un activo, cuando existe, no puede repetirse. El nombre y el tipo del activo son obligatorios. |
| **Origen**            | Criterios de rechazo HU-035 CA-2 y CA-4, HU-037 CA-2; CA-3 (serie opcional).                                         |
| **RF que la vigilan** | RF-44 y RF-46                                                                                                        |

**Tabla 76**  
*Regla de negocio RN-25: Activo dado de baja no seleccionable*

| **Código**            | **RN-25 — Activo dado de baja no seleccionable**                                                                                              |
|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Un activo dado de baja no puede relacionarse con casos nuevos y los casos anteriores conservan la relación. El activo es opcional en un caso. |
| **Origen**            | HU-038 CA-2 y CA-3; HU-001 CA-3.                                                                                                              |
| **RF que la vigilan** | RF-01 y RF-47                                                                                                                                 |

**Tabla 77**  
*Regla de negocio RN-26: Nombre único dentro de cada catálogo*

| **Código**            | **RN-26 — Nombre único dentro de cada catálogo**                    |
|-----------------------|---------------------------------------------------------------------|
| **Enunciado**         | El nombre de un valor no puede repetirse dentro del mismo catálogo. |
| **Origen**            | Criterio de rechazo HU-043 a HU-048 CA-2.                           |
| **RF que la vigilan** | RF-48                                                               |

**Tabla 78**  
*Regla de negocio RN-27: Adjuntos permitidos*

| **Código**            | **RN-27 — Adjuntos permitidos**                                                                                                                      |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Solo se admiten archivos PNG, JPEG, PDF o texto de máximo 10 MB. Eliminar un adjunto es lógico: deja de mostrarse y el historial conserva el rastro. |
| **Origen**            | Criterios de rechazo HU-042 CA-2 y CA-3; CA-1 y CA-5; entrevista: la información se complementa después (P6).                                        |
| **RF que la vigilan** | RF-42 y RF-43                                                                                                                                        |

**Tabla 79**  
*Regla de negocio RN-28: Disponibilidad vigente del personal de soporte*

| **Código**            | **RN-28 — Disponibilidad vigente del personal de soporte**                                                                                                         |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | La disponibilidad es disponible, ocupado o ausente, y siempre se muestra la más reciente. Si una persona no tiene disponibilidad registrada, el sistema lo indica. |
| **Origen**            | HU-034 CA-2 y HU-015 CA-3; entrevista: los usuarios preguntan a otra persona de TI (P8).                                                                           |
| **RF que la vigilan** | RF-24 y RF-25                                                                                                                                                      |

**Tabla 80**  
*Regla de negocio RN-29: Periodos sin información*

| **Código**            | **RN-29 — Periodos sin información**                                                                                    |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Si un periodo no tiene casos, el sistema lo informa claramente: no muestra un resumen vacío ni genera un reporte vacío. |
| **Origen**            | Criterios de rechazo HU-011 CA-4, HU-012 CA-2 y HU-030 CA-2.                                                            |
| **RF que la vigilan** | RF-21, RF-22 y RF-40                                                                                                    |

**Tabla 81**  
*Regla de negocio RN-30: Inactivación de valores de catálogo*

| **Código**            | **RN-30 — Inactivación de valores de catálogo**                                                                                                                                                              |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Un valor inactivo de un catálogo (área, cargo, rol de empleado, tipo de activo, tipo de problema o tipo de solicitud) deja de ofrecerse en los registros nuevos, pero los registros existentes lo conservan. |
| **Origen**            | HU-043 a HU-048 CA-4 (antes HU-039 CA-4).                                                                                                                                                                    |
| **RF que la vigilan** | RF-48                                                                                                                                                                                                        |

## 2.2 Requisitos Funcionales

Todo RF cita su HU madre. Los RF que implementan una baja se redactan como inactivar o dar de baja, nunca como borrar. Cada HU tiene al menos un RF. Son 50 RF; RF-50 se agregó en la versión 2 para cubrir el método registrarPrimeraRespuesta().

**Tabla 82**  
*Resumen de los requisitos funcionales*

| **Código** | **Descripción**                                                                                                                                                                                                                                               | **HU origen**                          | **RN que vigila**          |
|------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------|----------------------------|
| RF-01      | El sistema debe registrar un caso con qué necesita, dónde ocurre, tipo de caso, afectación, urgencia, datos de contacto y, de forma opcional, un equipo o programa, dejándolo en situación recibido con número de seguimiento y fecha y hora automáticos.     | HU-001, HU-002                         | RN-01, RN-02, RN-23, RN-25 |
| RF-02      | El sistema debe orientar al solicitante con un ejemplo breve de respuesta en cada dato del caso que pueda generar duda, incluida la diferencia entre problema y solicitud.                                                                                    | HU-001, HU-004                         | Ninguna                    |
| RF-03      | El sistema debe confirmar de inmediato al solicitante el registro de su caso con su número de seguimiento y enviarle por correo ese número con el resumen del caso.                                                                                           | HU-002                                 | RN-02, RN-16, RN-17        |
| RF-04      | El sistema debe notificar al solicitante cada cambio de situación de su caso por todos los canales de aviso definidos en RN-15.                                                                                                                               | HU-003                                 | RN-15                      |
| RF-05      | El sistema debe guardar el motivo de un envío fallido de correo y reintentarlo automáticamente, sin afectar el caso registrado.                                                                                                                               | HU-002, HU-003                         | RN-15, RN-16               |
| RF-06      | El sistema debe permitir al solicitante abrir sus avisos, ver el contenido completo y registrar la fecha y hora de lectura.                                                                                                                                   | HU-003                                 | Ninguna                    |
| RF-07      | El sistema debe pedir el tipo de problema cuando el caso es un problema, y el tipo y la clase de solicitud cuando es una solicitud, sin permitir mezclar ambos grupos de datos.                                                                               | HU-004                                 | RN-03                      |
| RF-08      | El sistema debe permitir al personal de soporte corregir el tipo de caso, registrando quién lo hizo, cuándo y el motivo.                                                                                                                                      | HU-049                                 | RN-03, RN-08, RN-23        |
| RF-09      | El sistema debe listar los casos del solicitante ordenados del más reciente al más antiguo, mostrando únicamente los casos propios.                                                                                                                           | HU-005                                 | RN-06                      |
| RF-10      | El sistema debe permitir buscar los casos propios por fecha, situación, tipo o palabra clave, informando cuando no hay coincidencias.                                                                                                                         | HU-005                                 | RN-06                      |
| RF-11      | El sistema debe listar los casos no cerrados, con número de seguimiento, situación e importancia, ordenables por importancia, fecha y tipo de problema.                                                                                                       | HU-006                                 | RN-05, RN-23               |
| RF-12      | El sistema debe cambiar la situación de un caso solo cuando la transición esté permitida para el perfil del usuario, rechazando los demás cambios y explicando el motivo.                                                                                     | HU-007                                 | RN-07, RN-08, RN-23        |
| RF-13      | El sistema debe permitir al solicitante y al personal de soporte consultar la situación actual de un caso, los tiempos de atención aplicados, los comentarios visibles para su rol y los adjuntos.                                                            | HU-007, HU-010                         | RN-06                      |
| RF-14      | El sistema debe asignar o cambiar la persona responsable de un caso, conservando en el historial al responsable anterior.                                                                                                                                     | HU-008                                 | RN-09, RN-08               |
| RF-15      | El sistema debe permitir al responsable pasar su caso a otra persona de soporte, que podrá ver el historial y los comentarios previos.                                                                                                                        | HU-026                                 | RN-09, RN-08               |
| RF-16      | El sistema debe guardar un comentario con su autor, fecha y visibilidad (usuario o interno), rechazando comentarios vacíos.                                                                                                                                   | HU-009                                 | RN-10, RN-08               |
| RF-17      | El sistema debe permitir al personal de soporte consultar todos los comentarios de un caso y al solicitante solo los marcados como visibles para él.                                                                                                          | HU-009                                 | RN-10                      |
| RF-18      | El sistema debe solicitar a cuántas personas afecta el caso (usuario, área o empresa) y qué tan urgente es (baja, media, alta o crítica), sin permitir continuar si falta alguno.                                                                             | HU-001, HU-021, HU-022                 | RN-01                      |
| RF-19      | El sistema debe calcular automáticamente la importancia P1 a P4 combinando afectación y urgencia, y fijarla sin recalcularla después.                                                                                                                         | HU-021, HU-022                         | RN-05                      |
| RF-20      | El sistema debe asociar a cada caso nuevo la regla de tiempos de atención vigente para su importancia y tipo de caso.                                                                                                                                         | HU-010                                 | RN-13, RN-14               |
| RF-21      | El sistema debe permitir al supervisor consultar la cantidad de casos por situación y cuántos cumplen o superan el tiempo de atención.                                                                                                                        | HU-011                                 | RN-14, RN-29               |
| RF-22      | El sistema debe recalcular el resumen de atención para hoy, la semana, el mes o un rango de fechas elegido.                                                                                                                                                   | HU-012                                 | RN-29                      |
| RF-23      | El sistema debe reabrir un caso resuelto dentro de 5 días hábiles, con motivo obligatorio, conservando su número, historial, comentarios y adjuntos.                                                                                                          | HU-013                                 | RN-11, RN-08               |
| RF-24      | El sistema debe permitir al supervisor consultar la disponibilidad actual de una persona de soporte o de todo el equipo.                                                                                                                                      | HU-015                                 | RN-28                      |
| RF-25      | El sistema debe permitir al personal de soporte cambiar su disponibilidad, guardando la fecha y hora del cambio.                                                                                                                                              | HU-034                                 | RN-28, RN-23               |
| RF-26      | El sistema debe registrar un usuario con nombre, correo, cargo, área, rol y perfil de acceso, dejándolo activo con su contraseña protegida.                                                                                                                   | HU-016                                 | RN-17, RN-18, RN-19        |
| RF-27      | El sistema debe listar los usuarios con su cargo, área y rol, y permitir buscarlos por nombre o correo.                                                                                                                                                       | HU-017                                 | RN-23                      |
| RF-28      | El sistema debe actualizar los datos de un usuario existente, registrando la fecha y quién hizo el cambio.                                                                                                                                                    | HU-031                                 | RN-17, RN-18               |
| RF-29      | El sistema debe inactivar a un usuario conservando sus registros, y permitir reactivarlo.                                                                                                                                                                     | HU-032                                 | RN-21                      |
| RF-30      | El sistema debe listar las cuentas bloqueadas y permitir al administrador desbloquearlas, reiniciando el contador de intentos fallidos.                                                                                                                       | HU-033                                 | RN-20, RN-23               |
| RF-31      | El sistema debe ofrecer solo los tipos de problema activos y asociar el elegido al caso.                                                                                                                                                                      | HU-018                                 | RN-03, RN-04               |
| RF-32      | El sistema debe ofrecer solo los tipos de solicitud activos y asociar el elegido al caso.                                                                                                                                                                     | HU-019                                 | RN-03, RN-04               |
| RF-33      | El sistema debe pedir la clase de solicitud (nuevo, cambio o consulta) solo en solicitudes, y exigirla para continuar.                                                                                                                                        | HU-020                                 | RN-03                      |
| RF-34      | El sistema debe validar las credenciales, conceder acceso a las funciones del perfil y contar los intentos fallidos, bloqueando la cuenta según la política.                                                                                                  | HU-023, HU-032                         | RN-20, RN-21, RN-23        |
| RF-35      | El sistema debe enviar al correo registrado un enlace temporal de un solo uso para definir una nueva contraseña.                                                                                                                                              | HU-024                                 | RN-19, RN-22               |
| RF-36      | El sistema debe cerrar la sesión del usuario y bloquear el acceso hasta un nuevo ingreso.                                                                                                                                                                     | HU-025                                 | RN-23                      |
| RF-37      | El sistema debe cerrar los casos resueltos sin respuesta tras 5 días hábiles, registrarlo en el historial y avisar al solicitante.                                                                                                                            | HU-028                                 | RN-12, RN-08, RN-15        |
| RF-38      | El sistema debe crear, editar y desactivar reglas de tiempos de respuesta y solución por importancia y tipo de caso.                                                                                                                                          | HU-029                                 | RN-13                      |
| RF-39      | El sistema debe listar las reglas de tiempos, distinguiendo las vigentes de las anteriores e indicando combinaciones sin regla.                                                                                                                               | HU-040                                 | RN-13                      |
| RF-40      | El sistema debe generar el reporte de atención de un periodo en PDF o Excel con la información del resumen.                                                                                                                                                   | HU-030                                 | RN-29                      |
| RF-41      | El sistema debe permitir al supervisor consultar el historial completo de cambios de un caso, del más antiguo al más reciente.                                                                                                                                | HU-041                                 | RN-08                      |
| RF-42      | El sistema debe guardar los archivos adjuntos permitidos asociados al caso, con quién los cargó y la fecha.                                                                                                                                                   | HU-042                                 | RN-27, RN-08               |
| RF-43      | El sistema debe listar los adjuntos de un caso, permitir abrirlos y eliminarlos de forma lógica.                                                                                                                                                              | HU-042                                 | RN-27, RN-08               |
| RF-44      | El sistema debe registrar un activo con nombre, tipo, marca, modelo, serie y área, dejándolo disponible para asociarse a casos.                                                                                                                               | HU-035                                 | RN-24                      |
| RF-45      | El sistema debe listar los activos con su estado y ubicación y permitir buscarlos por nombre, serie o área.                                                                                                                                                   | HU-036                                 | RN-23                      |
| RF-46      | El sistema debe actualizar los datos de un activo, incluida su ubicación y estado.                                                                                                                                                                            | HU-037                                 | RN-24                      |
| RF-47      | El sistema debe marcar un activo como dado de baja, sin ofrecerlo en casos nuevos y conservando los casos anteriores.                                                                                                                                         | HU-038                                 | RN-25                      |
| RF-48      | El sistema debe permitir al administrador crear, editar e inactivar los valores de cada catálogo de clasificación (áreas, cargos, roles de empleado, tipos de activo, tipos de problema y tipos de solicitud), sin repetir nombres dentro del mismo catálogo. | HU-043 a HU-048                        | RN-26, RN-04, RN-30        |
| RF-49      | El sistema debe guardar de forma automática en el historial cada cambio relevante de un caso, con acción, valor anterior, valor nuevo, autor y fecha.                                                                                                         | HU-007, HU-008, HU-026, HU-041, HU-049 | RN-08                      |
| RF-50      | El sistema debe registrar la fecha y hora de la primera respuesta del personal de soporte a un caso, una sola vez.                                                                                                                                            | HU-007                                 | RN-14                      |

***De dónde nace:** cada RF nace del “quiero” de su historia (una obligación por operación). Los RF compartidos o de apoyo (RF-02, RF-05, RF-19, RF-49) los REVELAN criterios que se repiten en varias HU y serán los «include» o «extend» de los diagramas de casos de uso. Los dos RF sin RN (RF-02 y RF-06) son excepcionales: son ayudas de pantalla y lectura de avisos que no imponen una prohibición.*

### 2.2.1 Fichas de los Requisitos Funcionales

**Tabla 83**  
*Ficha del requisito funcional RF-01*

| **Código**              | **RF-01**                                                                                                                                                                                                                                                 |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Registrar caso de soporte                                                                                                                                                                                                                                 |
| **Descripción**         | El sistema debe registrar un caso con qué necesita, dónde ocurre, tipo de caso, afectación, urgencia, datos de contacto y, de forma opcional, un equipo o programa, dejándolo en situación recibido con número de seguimiento y fecha y hora automáticos. |
| **HU de origen**        | HU-001 y HU-002                                                                                                                                                                                                                                           |
| **RN que hace cumplir** | RN-01, RN-02, RN-23 y RN-25                                                                                                                                                                                                                               |
| **Prioridad**           | Alta                                                                                                                                                                                                                                                      |

**Tabla 84**  
*Ficha del requisito funcional RF-02*

| **Código**              | **RF-02**                                                                                                                                                                  |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Mostrar ejemplos junto a las preguntas                                                                                                                                     |
| **Descripción**         | El sistema debe orientar al solicitante con un ejemplo breve de respuesta en cada dato del caso que pueda generar duda, incluida la diferencia entre problema y solicitud. |
| **HU de origen**        | HU-001 y HU-004                                                                                                                                                            |
| **RN que hace cumplir** | Ninguna                                                                                                                                                                    |
| **Prioridad**           | Alta                                                                                                                                                                       |

**Tabla 85**  
*Ficha del requisito funcional RF-03*

| **Código**              | **RF-03**                                                                                                                                                           |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Confirmar el caso en pantalla y por correo                                                                                                                          |
| **Descripción**         | El sistema debe confirmar de inmediato al solicitante el registro de su caso con su número de seguimiento y enviarle por correo ese número con el resumen del caso. |
| **HU de origen**        | HU-002                                                                                                                                                              |
| **RN que hace cumplir** | RN-02, RN-16 y RN-17                                                                                                                                                |
| **Prioridad**           | Alta                                                                                                                                                                |

**Tabla 86**  
*Ficha del requisito funcional RF-04*

| **Código**              | **RF-04**                                                                                                                       |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Generar avisos por cambio de situación                                                                                          |
| **Descripción**         | El sistema debe notificar al solicitante cada cambio de situación de su caso por todos los canales de aviso definidos en RN-15. |
| **HU de origen**        | HU-003                                                                                                                          |
| **RN que hace cumplir** | RN-15                                                                                                                           |
| **Prioridad**           | Alta                                                                                                                            |

**Tabla 87**  
*Ficha del requisito funcional RF-05*

| **Código**              | **RF-05**                                                                                                                       |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Reintentar el envío de avisos fallidos                                                                                          |
| **Descripción**         | El sistema debe guardar el motivo de un envío fallido de correo y reintentarlo automáticamente, sin afectar el caso registrado. |
| **HU de origen**        | HU-002 y HU-003                                                                                                                 |
| **RN que hace cumplir** | RN-15 y RN-16                                                                                                                   |
| **Prioridad**           | Alta                                                                                                                            |

**Tabla 88**  
*Ficha del requisito funcional RF-06*

| **Código**              | **RF-06**                                                                                                                   |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Consultar y leer avisos                                                                                                     |
| **Descripción**         | El sistema debe permitir al solicitante abrir sus avisos, ver el contenido completo y registrar la fecha y hora de lectura. |
| **HU de origen**        | HU-003                                                                                                                      |
| **RN que hace cumplir** | Ninguna                                                                                                                     |
| **Prioridad**           | Alta                                                                                                                        |

**Tabla 89**  
*Ficha del requisito funcional RF-07*

| **Código**              | **RF-07**                                                                                                                                                                       |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Clasificar el caso como problema o solicitud                                                                                                                                    |
| **Descripción**         | El sistema debe pedir el tipo de problema cuando el caso es un problema, y el tipo y la clase de solicitud cuando es una solicitud, sin permitir mezclar ambos grupos de datos. |
| **HU de origen**        | HU-004                                                                                                                                                                          |
| **RN que hace cumplir** | RN-03                                                                                                                                                                           |
| **Prioridad**           | Alta                                                                                                                                                                            |

**Tabla 90**  
*Ficha del requisito funcional RF-08*

| **Código**              | **RF-08**                                                                                                                |
|-------------------------|--------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Corregir la clasificación de un caso                                                                                     |
| **Descripción**         | El sistema debe permitir al personal de soporte corregir el tipo de caso, registrando quién lo hizo, cuándo y el motivo. |
| **HU de origen**        | HU-049                                                                                                                   |
| **RN que hace cumplir** | RN-03, RN-08 y RN-23                                                                                                     |
| **Prioridad**           | Media                                                                                                                    |

**Tabla 91**  
*Ficha del requisito funcional RF-09*

| **Código**              | **RF-09**                                                                                                                           |
|-------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Listar los casos del solicitante                                                                                                    |
| **Descripción**         | El sistema debe listar los casos del solicitante ordenados del más reciente al más antiguo, mostrando únicamente los casos propios. |
| **HU de origen**        | HU-005                                                                                                                              |
| **RN que hace cumplir** | RN-06                                                                                                                               |
| **Prioridad**           | Alta                                                                                                                                |

**Tabla 92**  
*Ficha del requisito funcional RF-10*

| **Código**              | **RF-10**                                                                                                                             |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Buscar casos por filtros                                                                                                              |
| **Descripción**         | El sistema debe permitir buscar los casos propios por fecha, situación, tipo o palabra clave, informando cuando no hay coincidencias. |
| **HU de origen**        | HU-005                                                                                                                                |
| **RN que hace cumplir** | RN-06                                                                                                                                 |
| **Prioridad**           | Alta                                                                                                                                  |

**Tabla 93**  
*Ficha del requisito funcional RF-11*

| **Código**              | **RF-11**                                                                                                                                               |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Listar casos pendientes                                                                                                                                 |
| **Descripción**         | El sistema debe listar los casos no cerrados, con número de seguimiento, situación e importancia, ordenables por importancia, fecha y tipo de problema. |
| **HU de origen**        | HU-006                                                                                                                                                  |
| **RN que hace cumplir** | RN-05 y RN-23                                                                                                                                           |
| **Prioridad**           | Alta                                                                                                                                                    |

**Tabla 94**  
*Ficha del requisito funcional RF-12*

| **Código**              | **RF-12**                                                                                                                                                                 |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Cambiar la situación del caso                                                                                                                                             |
| **Descripción**         | El sistema debe cambiar la situación de un caso solo cuando la transición esté permitida para el perfil del usuario, rechazando los demás cambios y explicando el motivo. |
| **HU de origen**        | HU-007                                                                                                                                                                    |
| **RN que hace cumplir** | RN-07, RN-08 y RN-23                                                                                                                                                      |
| **Prioridad**           | Alta                                                                                                                                                                      |

**Tabla 95**  
*Ficha del requisito funcional RF-13*

| **Código**              | **RF-13**                                                                                                                                                                                          |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Consultar el detalle del caso                                                                                                                                                                      |
| **Descripción**         | El sistema debe permitir al solicitante y al personal de soporte consultar la situación actual de un caso, los tiempos de atención aplicados, los comentarios visibles para su rol y los adjuntos. |
| **HU de origen**        | HU-007 y HU-010                                                                                                                                                                                    |
| **RN que hace cumplir** | RN-06                                                                                                                                                                                              |
| **Prioridad**           | Alta                                                                                                                                                                                               |

**Tabla 96**  
*Ficha del requisito funcional RF-14*

| **Código**              | **RF-14**                                                                                                                 |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Asignar responsable del caso                                                                                              |
| **Descripción**         | El sistema debe asignar o cambiar la persona responsable de un caso, conservando en el historial al responsable anterior. |
| **HU de origen**        | HU-008                                                                                                                    |
| **RN que hace cumplir** | RN-09 y RN-08                                                                                                             |
| **Prioridad**           | Alta                                                                                                                      |

**Tabla 97**  
*Ficha del requisito funcional RF-15*

| **Código**              | **RF-15**                                                                                                                              |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Pasar un caso a otra persona de soporte                                                                                                |
| **Descripción**         | El sistema debe permitir al responsable pasar su caso a otra persona de soporte, que podrá ver el historial y los comentarios previos. |
| **HU de origen**        | HU-026                                                                                                                                 |
| **RN que hace cumplir** | RN-09 y RN-08                                                                                                                          |
| **Prioridad**           | Media                                                                                                                                  |

**Tabla 98**  
*Ficha del requisito funcional RF-16*

| **Código**              | **RF-16**                                                                                                                   |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Registrar comentarios del caso                                                                                              |
| **Descripción**         | El sistema debe guardar un comentario con su autor, fecha y visibilidad (usuario o interno), rechazando comentarios vacíos. |
| **HU de origen**        | HU-009                                                                                                                      |
| **RN que hace cumplir** | RN-10 y RN-08                                                                                                               |
| **Prioridad**           | Media                                                                                                                       |

**Tabla 99**  
*Ficha del requisito funcional RF-17*

| **Código**              | **RF-17**                                                                                                                                            |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Listar comentarios según visibilidad                                                                                                                 |
| **Descripción**         | El sistema debe permitir al personal de soporte consultar todos los comentarios de un caso y al solicitante solo los marcados como visibles para él. |
| **HU de origen**        | HU-009                                                                                                                                               |
| **RN que hace cumplir** | RN-10                                                                                                                                                |
| **Prioridad**           | Media                                                                                                                                                |

**Tabla 100**  
*Ficha del requisito funcional RF-18*

| **Código**              | **RF-18**                                                                                                                                                                         |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Indicar afectación y urgencia                                                                                                                                                     |
| **Descripción**         | El sistema debe solicitar a cuántas personas afecta el caso (usuario, área o empresa) y qué tan urgente es (baja, media, alta o crítica), sin permitir continuar si falta alguno. |
| **HU de origen**        | HU-001, HU-021 y HU-022                                                                                                                                                           |
| **RN que hace cumplir** | RN-01                                                                                                                                                                             |
| **Prioridad**           | Alta                                                                                                                                                                              |

**Tabla 101**  
*Ficha del requisito funcional RF-19*

| **Código**              | **RF-19**                                                                                                                             |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Calcular la importancia del caso                                                                                                      |
| **Descripción**         | El sistema debe calcular automáticamente la importancia P1 a P4 combinando afectación y urgencia, y fijarla sin recalcularla después. |
| **HU de origen**        | HU-021 y HU-022                                                                                                                       |
| **RN que hace cumplir** | RN-05                                                                                                                                 |
| **Prioridad**           | Alta                                                                                                                                  |

**Tabla 102**  
*Ficha del requisito funcional RF-20*

| **Código**              | **RF-20**                                                                                                             |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Asignar el tiempo de atención al caso                                                                                 |
| **Descripción**         | El sistema debe asociar a cada caso nuevo la regla de tiempos de atención vigente para su importancia y tipo de caso. |
| **HU de origen**        | HU-010                                                                                                                |
| **RN que hace cumplir** | RN-13 y RN-14                                                                                                         |
| **Prioridad**           | Media                                                                                                                 |

**Tabla 103**  
*Ficha del requisito funcional RF-21*

| **Código**              | **RF-21**                                                                                                                              |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Resumen general de atención                                                                                                            |
| **Descripción**         | El sistema debe permitir al supervisor consultar la cantidad de casos por situación y cuántos cumplen o superan el tiempo de atención. |
| **HU de origen**        | HU-011                                                                                                                                 |
| **RN que hace cumplir** | RN-14 y RN-29                                                                                                                          |
| **Prioridad**           | Media                                                                                                                                  |

**Tabla 104**  
*Ficha del requisito funcional RF-22*

| **Código**              | **RF-22**                                                                                                   |
|-------------------------|-------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Resumen de atención por periodo                                                                             |
| **Descripción**         | El sistema debe recalcular el resumen de atención para hoy, la semana, el mes o un rango de fechas elegido. |
| **HU de origen**        | HU-012                                                                                                      |
| **RN que hace cumplir** | RN-29                                                                                                       |
| **Prioridad**           | Media                                                                                                       |

**Tabla 105**  
*Ficha del requisito funcional RF-23*

| **Código**              | **RF-23**                                                                                                                                            |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Reabrir un caso resuelto                                                                                                                             |
| **Descripción**         | El sistema debe reabrir un caso resuelto dentro de 5 días hábiles, con motivo obligatorio, conservando su número, historial, comentarios y adjuntos. |
| **HU de origen**        | HU-013                                                                                                                                               |
| **RN que hace cumplir** | RN-11 y RN-08                                                                                                                                        |
| **Prioridad**           | Media                                                                                                                                                |

**Tabla 106**  
*Ficha del requisito funcional RF-24*

| **Código**              | **RF-24**                                                                                                                |
|-------------------------|--------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Consultar disponibilidad del personal de soporte                                                                         |
| **Descripción**         | El sistema debe permitir al supervisor consultar la disponibilidad actual de una persona de soporte o de todo el equipo. |
| **HU de origen**        | HU-015                                                                                                                   |
| **RN que hace cumplir** | RN-28                                                                                                                    |
| **Prioridad**           | Media                                                                                                                    |

**Tabla 107**  
*Ficha del requisito funcional RF-25*

| **Código**              | **RF-25**                                                                                                        |
|-------------------------|------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Actualizar mi disponibilidad                                                                                     |
| **Descripción**         | El sistema debe permitir al personal de soporte cambiar su disponibilidad, guardando la fecha y hora del cambio. |
| **HU de origen**        | HU-034                                                                                                           |
| **RN que hace cumplir** | RN-28 y RN-23                                                                                                    |
| **Prioridad**           | Media                                                                                                            |

**Tabla 108**  
*Ficha del requisito funcional RF-26*

| **Código**              | **RF-26**                                                                                                                                   |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Registrar usuario                                                                                                                           |
| **Descripción**         | El sistema debe registrar un usuario con nombre, correo, cargo, área, rol y perfil de acceso, dejándolo activo con su contraseña protegida. |
| **HU de origen**        | HU-016                                                                                                                                      |
| **RN que hace cumplir** | RN-17, RN-18 y RN-19                                                                                                                        |
| **Prioridad**           | Alta                                                                                                                                        |

**Tabla 109**  
*Ficha del requisito funcional RF-27*

| **Código**              | **RF-27**                                                                                               |
|-------------------------|---------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Consultar usuarios                                                                                      |
| **Descripción**         | El sistema debe listar los usuarios con su cargo, área y rol, y permitir buscarlos por nombre o correo. |
| **HU de origen**        | HU-017                                                                                                  |
| **RN que hace cumplir** | RN-23                                                                                                   |
| **Prioridad**           | Media                                                                                                   |

**Tabla 110**  
*Ficha del requisito funcional RF-28*

| **Código**              | **RF-28**                                                                                                  |
|-------------------------|------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Actualizar usuario                                                                                         |
| **Descripción**         | El sistema debe actualizar los datos de un usuario existente, registrando la fecha y quién hizo el cambio. |
| **HU de origen**        | HU-031                                                                                                     |
| **RN que hace cumplir** | RN-17 y RN-18                                                                                              |
| **Prioridad**           | Media                                                                                                      |

**Tabla 111**  
*Ficha del requisito funcional RF-29*

| **Código**              | **RF-29**                                                                                 |
|-------------------------|-------------------------------------------------------------------------------------------|
| **Nombre corto**        | Inactivar y reactivar usuario                                                             |
| **Descripción**         | El sistema debe inactivar a un usuario conservando sus registros, y permitir reactivarlo. |
| **HU de origen**        | HU-032                                                                                    |
| **RN que hace cumplir** | RN-21                                                                                     |
| **Prioridad**           | Media                                                                                     |

**Tabla 112**  
*Ficha del requisito funcional RF-30*

| **Código**              | **RF-30**                                                                                                                               |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Listar y desbloquear cuentas                                                                                                            |
| **Descripción**         | El sistema debe listar las cuentas bloqueadas y permitir al administrador desbloquearlas, reiniciando el contador de intentos fallidos. |
| **HU de origen**        | HU-033                                                                                                                                  |
| **RN que hace cumplir** | RN-20 y RN-23                                                                                                                           |
| **Prioridad**           | Media                                                                                                                                   |

**Tabla 113**  
*Ficha del requisito funcional RF-31*

| **Código**              | **RF-31**                                                                                |
|-------------------------|------------------------------------------------------------------------------------------|
| **Nombre corto**        | Seleccionar tipo de problema                                                             |
| **Descripción**         | El sistema debe ofrecer solo los tipos de problema activos y asociar el elegido al caso. |
| **HU de origen**        | HU-018                                                                                   |
| **RN que hace cumplir** | RN-03 y RN-04                                                                            |
| **Prioridad**           | Alta                                                                                     |

**Tabla 114**  
*Ficha del requisito funcional RF-32*

| **Código**              | **RF-32**                                                                                 |
|-------------------------|-------------------------------------------------------------------------------------------|
| **Nombre corto**        | Seleccionar tipo de solicitud                                                             |
| **Descripción**         | El sistema debe ofrecer solo los tipos de solicitud activos y asociar el elegido al caso. |
| **HU de origen**        | HU-019                                                                                    |
| **RN que hace cumplir** | RN-03 y RN-04                                                                             |
| **Prioridad**           | Alta                                                                                      |

**Tabla 115**  
*Ficha del requisito funcional RF-33*

| **Código**              | **RF-33**                                                                                                              |
|-------------------------|------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Indicar clase de solicitud                                                                                             |
| **Descripción**         | El sistema debe pedir la clase de solicitud (nuevo, cambio o consulta) solo en solicitudes, y exigirla para continuar. |
| **HU de origen**        | HU-020                                                                                                                 |
| **RN que hace cumplir** | RN-03                                                                                                                  |
| **Prioridad**           | Media                                                                                                                  |

**Tabla 116**  
*Ficha del requisito funcional RF-34*

| **Código**              | **RF-34**                                                                                                                                                    |
|-------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Iniciar sesión                                                                                                                                               |
| **Descripción**         | El sistema debe validar las credenciales, conceder acceso a las funciones del perfil y contar los intentos fallidos, bloqueando la cuenta según la política. |
| **HU de origen**        | HU-023 y HU-032                                                                                                                                              |
| **RN que hace cumplir** | RN-20, RN-21 y RN-23                                                                                                                                         |
| **Prioridad**           | Alta                                                                                                                                                         |

**Tabla 117**  
*Ficha del requisito funcional RF-35*

| **Código**              | **RF-35**                                                                                                        |
|-------------------------|------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Recuperar contraseña                                                                                             |
| **Descripción**         | El sistema debe enviar al correo registrado un enlace temporal de un solo uso para definir una nueva contraseña. |
| **HU de origen**        | HU-024                                                                                                           |
| **RN que hace cumplir** | RN-19 y RN-22                                                                                                    |
| **Prioridad**           | Alta                                                                                                             |

**Tabla 118**  
*Ficha del requisito funcional RF-36*

| **Código**              | **RF-36**                                                                                 |
|-------------------------|-------------------------------------------------------------------------------------------|
| **Nombre corto**        | Cerrar sesión                                                                             |
| **Descripción**         | El sistema debe cerrar la sesión del usuario y bloquear el acceso hasta un nuevo ingreso. |
| **HU de origen**        | HU-025                                                                                    |
| **RN que hace cumplir** | RN-23                                                                                     |
| **Prioridad**           | Baja                                                                                      |

**Tabla 119**  
*Ficha del requisito funcional RF-37*

| **Código**              | **RF-37**                                                                                                                          |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Cerrar automáticamente casos resueltos vencidos                                                                                    |
| **Descripción**         | El sistema debe cerrar los casos resueltos sin respuesta tras 5 días hábiles, registrarlo en el historial y avisar al solicitante. |
| **HU de origen**        | HU-028                                                                                                                             |
| **RN que hace cumplir** | RN-12, RN-08 y RN-15                                                                                                               |
| **Prioridad**           | Media                                                                                                                              |

**Tabla 120**  
*Ficha del requisito funcional RF-38*

| **Código**              | **RF-38**                                                                                                            |
|-------------------------|----------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Definir reglas de tiempos de atención                                                                                |
| **Descripción**         | El sistema debe crear, editar y desactivar reglas de tiempos de respuesta y solución por importancia y tipo de caso. |
| **HU de origen**        | HU-029                                                                                                               |
| **RN que hace cumplir** | RN-13                                                                                                                |
| **Prioridad**           | Media                                                                                                                |

**Tabla 121**  
*Ficha del requisito funcional RF-39*

| **Código**              | **RF-39**                                                                                                                       |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Consultar reglas de tiempos de atención                                                                                         |
| **Descripción**         | El sistema debe listar las reglas de tiempos, distinguiendo las vigentes de las anteriores e indicando combinaciones sin regla. |
| **HU de origen**        | HU-040                                                                                                                          |
| **RN que hace cumplir** | RN-13                                                                                                                           |
| **Prioridad**           | Baja                                                                                                                            |

**Tabla 122**  
*Ficha del requisito funcional RF-40*

| **Código**              | **RF-40**                                                                                                   |
|-------------------------|-------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Descargar reportes de atención                                                                              |
| **Descripción**         | El sistema debe generar el reporte de atención de un periodo en PDF o Excel con la información del resumen. |
| **HU de origen**        | HU-030                                                                                                      |
| **RN que hace cumplir** | RN-29                                                                                                       |
| **Prioridad**           | Baja                                                                                                        |

**Tabla 123**  
*Ficha del requisito funcional RF-41*

| **Código**              | **RF-41**                                                                                                                      |
|-------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Consultar el historial del caso                                                                                                |
| **Descripción**         | El sistema debe permitir al supervisor consultar el historial completo de cambios de un caso, del más antiguo al más reciente. |
| **HU de origen**        | HU-041                                                                                                                         |
| **RN que hace cumplir** | RN-08                                                                                                                          |
| **Prioridad**           | Media                                                                                                                          |

**Tabla 124**  
*Ficha del requisito funcional RF-42*

| **Código**              | **RF-42**                                                                                                   |
|-------------------------|-------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Adjuntar archivos al caso                                                                                   |
| **Descripción**         | El sistema debe guardar los archivos adjuntos permitidos asociados al caso, con quién los cargó y la fecha. |
| **HU de origen**        | HU-042                                                                                                      |
| **RN que hace cumplir** | RN-27 y RN-08                                                                                               |
| **Prioridad**           | Media                                                                                                       |

**Tabla 125**  
*Ficha del requisito funcional RF-43*

| **Código**              | **RF-43**                                                                                        |
|-------------------------|--------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Consultar y eliminar adjuntos                                                                    |
| **Descripción**         | El sistema debe listar los adjuntos de un caso, permitir abrirlos y eliminarlos de forma lógica. |
| **HU de origen**        | HU-042                                                                                           |
| **RN que hace cumplir** | RN-27 y RN-08                                                                                    |
| **Prioridad**           | Media                                                                                            |

**Tabla 126**  
*Ficha del requisito funcional RF-44*

| **Código**              | **RF-44**                                                                                                                       |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Registrar activo tecnológico                                                                                                    |
| **Descripción**         | El sistema debe registrar un activo con nombre, tipo, marca, modelo, serie y área, dejándolo disponible para asociarse a casos. |
| **HU de origen**        | HU-035                                                                                                                          |
| **RN que hace cumplir** | RN-24                                                                                                                           |
| **Prioridad**           | Media                                                                                                                           |

**Tabla 127**  
*Ficha del requisito funcional RF-45*

| **Código**              | **RF-45**                                                                                                   |
|-------------------------|-------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Consultar activos tecnológicos                                                                              |
| **Descripción**         | El sistema debe listar los activos con su estado y ubicación y permitir buscarlos por nombre, serie o área. |
| **HU de origen**        | HU-036                                                                                                      |
| **RN que hace cumplir** | RN-23                                                                                                       |
| **Prioridad**           | Baja                                                                                                        |

**Tabla 128**  
*Ficha del requisito funcional RF-46*

| **Código**              | **RF-46**                                                                          |
|-------------------------|------------------------------------------------------------------------------------|
| **Nombre corto**        | Actualizar activo tecnológico                                                      |
| **Descripción**         | El sistema debe actualizar los datos de un activo, incluida su ubicación y estado. |
| **HU de origen**        | HU-037                                                                             |
| **RN que hace cumplir** | RN-24                                                                              |
| **Prioridad**           | Baja                                                                               |

**Tabla 129**  
*Ficha del requisito funcional RF-47*

| **Código**              | **RF-47**                                                                                                             |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Dar de baja un activo tecnológico                                                                                     |
| **Descripción**         | El sistema debe marcar un activo como dado de baja, sin ofrecerlo en casos nuevos y conservando los casos anteriores. |
| **HU de origen**        | HU-038                                                                                                                |
| **RN que hace cumplir** | RN-25                                                                                                                 |
| **Prioridad**           | Baja                                                                                                                  |

**Tabla 130**  
*Ficha del requisito funcional RF-48*

| **Código**              | **RF-48**                                                                                                                                                                                                                                                     |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Administrar catálogos de clasificación                                                                                                                                                                                                                        |
| **Descripción**         | El sistema debe permitir al administrador crear, editar e inactivar los valores de cada catálogo de clasificación (áreas, cargos, roles de empleado, tipos de activo, tipos de problema y tipos de solicitud), sin repetir nombres dentro del mismo catálogo. |
| **HU de origen**        | HU-043 a HU-048                                                                                                                                                                                                                                               |
| **RN que hace cumplir** | RN-26, RN-04 y RN-30                                                                                                                                                                                                                                          |
| **Prioridad**           | Media                                                                                                                                                                                                                                                         |

**Tabla 131**  
*Ficha del requisito funcional RF-49*

| **Código**              | **RF-49**                                                                                                                                             |
|-------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Registrar automáticamente el historial del caso                                                                                                       |
| **Descripción**         | El sistema debe guardar de forma automática en el historial cada cambio relevante de un caso, con acción, valor anterior, valor nuevo, autor y fecha. |
| **HU de origen**        | HU-007, HU-008, HU-026, HU-041 y HU-049                                                                                                               |
| **RN que hace cumplir** | RN-08                                                                                                                                                 |
| **Prioridad**           | Media                                                                                                                                                 |

**Tabla 132**  
*Ficha del requisito funcional RF-50*

| **Código**              | **RF-50**                                                                                                          |
|-------------------------|--------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Registrar la primera respuesta del caso                                                                            |
| **Descripción**         | El sistema debe registrar la fecha y hora de la primera respuesta del personal de soporte a un caso, una sola vez. |
| **HU de origen**        | HU-007                                                                                                             |
| **RN que hace cumplir** | RN-14                                                                                                              |
| **Prioridad**           | Media                                                                                                              |

## 2.3 Requisitos No Funcionales

Un RNF sin medida es un deseo. Los diez RNF tienen número verificable y origen en la entrevista (rendimiento, disponibilidad, usabilidad, comunicación, tiempos de respuesta, seguimiento, centralización y seguridad). Los valores numéricos son propuestas de partida que se validan con Nexa Servicios.

**Tabla 133**  
*Requisito no funcional RNF-01*

| **Código**               | **RNF-01**                                                                                                   |
|--------------------------|--------------------------------------------------------------------------------------------------------------|
| **Categoría**            | Rendimiento                                                                                                  |
| **Enunciado con medida** | El listado y la búsqueda de casos deben responder en menos de 2 segundos con hasta 10.000 casos registrados. |
| **Origen**               | Entrevista: las respuestas se demoran más de lo esperado y el seguimiento es difícil (P4, P10).              |

**Tabla 134**  
*Requisito no funcional RNF-02*

| **Código**               | **RNF-02**                                                                                                                                                                              |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Categoría**            | Disponibilidad                                                                                                                                                                          |
| **Enunciado con medida** | El sistema debe estar disponible al menos el 99 % del tiempo cada mes (máximo 7 horas de indisponibilidad mensual), porque los tiempos de atención se miden en minutos calendario 24/7. |
| **Origen**               | Entrevista: se prefiere un sistema único donde registrar y consultar las solicitudes (P9).                                                                                              |

**Tabla 135**  
*Requisito no funcional RNF-03*

| **Código**               | **RNF-03**                                                                                                                                                                      |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Categoría**            | Usabilidad                                                                                                                                                                      |
| **Enunciado con medida** | Un solicitante capacitado debe poder reportar un caso completo en máximo 3 minutos, y al menos el 90 % de los solicitantes de una prueba de usabilidad debe lograrlo sin ayuda. |
| **Origen**               | Entrevista: los usuarios no tienen claridad total sobre cómo solicitar ayuda (P2).                                                                                              |

**Tabla 136**  
*Requisito no funcional RNF-04*

| **Código**               | **RNF-04**                                                                                                                                           |
|--------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Categoría**            | Usabilidad                                                                                                                                           |
| **Enunciado con medida** | El 100 % de las preguntas que pueden generar duda debe mostrar un ejemplo, y todo mensaje de rechazo debe indicar el campo y la corrección esperada. |
| **Origen**               | Entrevista: falta de claridad (P2, P10).                                                                                                             |

**Tabla 137**  
*Requisito no funcional RNF-05*

| **Código**               | **RNF-05**                                                                                                                                                                |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Categoría**            | Comunicación                                                                                                                                                              |
| **Enunciado con medida** | Tras registrar un caso, el sistema debe mostrar la confirmación con el número de seguimiento en máximo 3 segundos y enviar el correo de confirmación en máximo 2 minutos. |
| **Origen**               | Entrevista: los usuarios no siempre reciben confirmación de su solicitud (P3).                                                                                            |

**Tabla 138**  
*Requisito no funcional RNF-06*

| **Código**               | **RNF-06**                                                                                                                                                                                 |
|--------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Categoría**            | Comunicación                                                                                                                                                                               |
| **Enunciado con medida** | Cada cambio de situación debe notificarse en pantalla en máximo 1 minuto y por correo en máximo 5 minutos; un envío fallido debe reintentarse hasta 3 veces, con 5 minutos entre intentos. |
| **Origen**               | Entrevista: mala comunicación y dificultad para saber el estado del caso (P10).                                                                                                            |

**Tabla 139**  
*Requisito no funcional RNF-07*

| **Código**               | **RNF-07**                                                                                                                                                                                                                                                                                                         |
|--------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Categoría**            | Tiempos de respuesta                                                                                                                                                                                                                                                                                               |
| **Enunciado con medida** | Las reglas de tiempos de atención deben medirse en minutos calendario y el sistema debe permitir verificar que al menos el 90 % de los casos recibe su primera respuesta dentro del tiempo definido; la regla inicial de importancia P1 no debe superar 60 minutos de respuesta y la de P4 no debe superar un día. |
| **Origen**               | Entrevista: se esperan respuestas rápidas, desde menos de una hora hasta el mismo día (P13).                                                                                                                                                                                                                       |

**Tabla 140**  
*Requisito no funcional RNF-08*

| **Código**               | **RNF-08**                                                                                                                                                                                   |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Categoría**            | Seguimiento                                                                                                                                                                                  |
| **Enunciado con medida** | Todo cambio de situación debe ser visible al solicitante en máximo 5 segundos tras guardarse, y el 100 % de los cambios relevantes de un caso debe quedar en el historial con autor y fecha. |
| **Origen**               | Entrevista: los usuarios no saben si su solicitud fue atendida (P3, P10).                                                                                                                    |

**Tabla 141**  
*Requisito no funcional RNF-09*

| **Código**               | **RNF-09**                                                                                                                                                                                                      |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Categoría**            | Centralización                                                                                                                                                                                                  |
| **Enunciado con medida** | Al menos el 90 % de los casos nuevos del primer trimestre posterior a la puesta en marcha debe registrarse por el formulario único del sistema, y el 100 % de los casos debe tener número de seguimiento único. |
| **Origen**               | Entrevista: WhatsApp y correo son los canales más usados y el uso de varios canales genera desorden; se prefiere un sistema único (P9).                                                                         |

**Tabla 142**  
*Requisito no funcional RNF-10*

| **Código**               | **RNF-10**                                                                                                                                                                                                    |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Categoría**            | Seguridad                                                                                                                                                                                                     |
| **Enunciado con medida** | El 100 % de las funciones debe estar restringido por perfil de acceso; las contraseñas y los códigos de recuperación deben guardarse protegidos y el enlace de recuperación debe vencer en máximo 30 minutos. |
| **Origen**               | Antecedentes de las HU (el usuario debe haber iniciado sesión) y conclusión de la entrevista: un sistema único requiere controlar el acceso.                                                                  |

***De dónde nace:** la conclusión de la entrevista —una Mesa de Ayuda TI centralizada que registre solicitudes, confirme recepción, permita hacer seguimiento y mejore los tiempos de atención— se traduce en medidas: confirmación (RNF-05), avisos (RNF-06), tiempos (RNF-07), seguimiento (RNF-08) y centralización (RNF-09).*
