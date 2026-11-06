# 1. Historias de Usuario + Criterios de aceptación

> **Guía de seguimiento:** Fase 1 — actividad *1. HU + Criterios de aceptación*.
>
> **Fuente:** documento Word *Proyecto.docx* — «Mesa de Ayuda TI de Nexa Servicios» (F. J. Motta Quintero y E. Vásquez Valencia · Ingeniería de Software II · Docente: Lora Patiño Gloria Amparo · Octubre de 2026), sección 1.1.

***De dónde nace:** este documento parte de las 46 historias de usuario (HU-001 a HU-049, sin HU-014 ni HU-027, que no existen en el documento de HU, y sin HU-039, que se dividió en HU-043 a HU-048 y cuyo código no se reutiliza) con sus criterios de aceptación, del diccionario de datos y de los resultados de la entrevista. Cada elemento cita su padre: HU → RN/RF → CU → MK.*

## 1.1 Historias de usuario

<a id="hu-001"></a>

### HU-001 — Reportar un caso de soporte

**Tabla 4**  
*Historia de usuario HU-001: Reportar un caso de soporte*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-001</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Reportar un caso de soporte</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Usuario solicitante, quiero describir mi problema o necesidad indicando dónde ocurre, qué equipo o programa está afectado y qué tan importante es, para que mi caso llegue completo al área de TI sin tener que complementarlo después.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<em># Se cumple antes de cada escenario de esta historia</em>
<strong>Dado</strong> que la usuaria solicitante “Marcela Ríos” (área Contabilidad) ha iniciado sesión
</blockquote>
<a id="hu-001-ca-1"></a><strong>Escenario: CA-1 Envío exitoso con todos los datos obligatorios</strong>
<blockquote>
<em># crearCaso() · RN-001 (datos mínimos para enviar un caso) · RF-18 (afectación y urgencia) · Activo.obtenerActivo(id) (equipo o programa, RN-25) · TiempoAtencionSLA.obtenerSLA(id) (tiempo vigente, CU-S01, RN-13) · HistorialCaso.registrarHistorial() (CU-S02)</em>
<strong>Dado</strong> que Marcela aún no ha enviado ningún caso hoy
<strong>Cuando</strong> Marcela completa el formulario con estos datos: Campo Valor Qué necesita El computador no enciende Dónde ocurre Oficina de Contabilidad, piso 3 Tipo de problema Hardware A quiénes afecta Solo a ella (usuario) Qué tan urgente Alta Cómo contactarla Los datos de contacto registrados en su usuario (teléfono 601-555-0110 y correo marcela.rios@nexaservicios.com), sin escribirlos de nuevo
<strong>Y</strong> confirma el envío
<strong>Entonces</strong> el sistema registra el caso en la situación inicial “recibido”
<strong>Y</strong> le asigna un número de seguimiento único con formato MA-AAAA-NNNNNN (por ejemplo, MA-2026-000145)
<strong>Y</strong> guarda la fecha y hora de creación de forma automática, sin que Marcela la escriba
</blockquote>
<a id="hu-001-ca-2"></a><strong>Esquema del escenario: CA-2 Rechazo por falta de un dato obligatorio</strong>
<blockquote>
<em># RN-001 · el sistema no debe permitir el envío si falta un dato mínimo</em>
<strong>Cuando</strong> Marcela deja vacío el campo y confirma el envío
<strong>Entonces</strong> el sistema no registra el caso
<strong>Y</strong> señala el campo con el mensaje “” campo mensaje qué necesita Debes indicar qué necesitas o qué problema tienes. dónde ocurre Debes indicar dónde ocurre el problema. qué tan urgente Debes indicar qué tan urgente es tu caso.
</blockquote>
<a id="hu-001-ca-3"></a><strong>Escenario: CA-3 Registro sin un equipo o programa asociado</strong>
<blockquote>
<em># id_activo es opcional en caso_soporte: no todos los casos tienen un activo relacionado</em>
<strong>Cuando</strong> Marcela completa todos los datos obligatorios sin seleccionar ningún equipo o programa
<strong>Entonces</strong> el caso queda registrado igual, sin ningún activo asociado
</blockquote>
<a id="hu-001-ca-4"></a><strong>Escenario: CA-4 El sistema orienta con ejemplos</strong>
<blockquote>
<em># RF-02 (apoyo esperado por los usuarios, P2 de la entrevista: falta de claridad)</em>
<strong>Cuando</strong> Marcela inicia el reporte de un nuevo caso
<strong>Entonces</strong> el sistema le ofrece un ejemplo breve de respuesta para cada dato que puede generar duda (por ejemplo, “a quiénes afecta” o “qué tan urgente”)
</blockquote>
<a id="hu-001-ca-5"></a><strong>Escenario: CA-5 Rechazo si quien intenta reportar no es un usuario registrado</strong>
<blockquote>
<em># RN-23 (capítulo 2: sin sesión iniciada no hay acceso a ninguna pantalla) · RF-34 · el caso no se registra</em>
<strong>Dado</strong> que una persona que no está registrada en el sistema y no ha iniciado sesión intenta generar el reporte de un caso
<strong>Cuando</strong> intenta abrir el formulario de reporte o enviar un caso, el sistema verifica que no corresponde a un usuario registrado con sesión iniciada
<strong>Entonces</strong> el sistema impide generar el reporte: no registra el caso y no genera número de seguimiento
<strong>Y</strong> le informa el motivo con el mensaje “Debes iniciar sesión con una cuenta registrada para reportar un caso.”
<strong>Y</strong> la lleva a la pantalla de inicio de sesión (MK-01), donde solo puede ingresar con una cuenta registrada por el administrador (HU-016)
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P2 y P9 de los resultados por pregunta (P2: "Algunos usuarios tienen claro cómo pedir ayuda, pero muchos no tienen claridad total sobre el proceso"; P9: "La mayoría prefiere un único sistema o formulario centralizado para registrar las solicitudes").</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-01, RF-02, RF-18</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Alta</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-001**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P2](../fase_0/0.4.1-entrevista-resultados.md#p2), [P9](../fase_0/0.4.1-entrevista-resultados.md#p9) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-001-ca-1), [CA-2](#hu-001-ca-2), [CA-3](#hu-001-ca-3), [CA-4](#hu-001-ca-4), [CA-5](#hu-001-ca-5) | Ficha de la HU |
> | RF derivados | [RF-01](2-reglas-de-negocio-y-requisitos.md#rf-01), [RF-02](2-reglas-de-negocio-y-requisitos.md#rf-02), [RF-18](2-reglas-de-negocio-y-requisitos.md#rf-18) | Ficha de la HU |
> | RN | [RN-01](2-reglas-de-negocio-y-requisitos.md#rn-01), [RN-02](2-reglas-de-negocio-y-requisitos.md#rn-02), [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23), [RN-25](2-reglas-de-negocio-y-requisitos.md#rn-25) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-001) |
> | Casos de uso | [CU-001](3-casos-de-uso.md#cu-001), [CU-004](3-casos-de-uso.md#cu-004), [CU-021](3-casos-de-uso.md#cu-021), [CU-022](3-casos-de-uso.md#cu-022), [CU-S01](3-casos-de-uso.md#cu-s01), [CU-S02](3-casos-de-uso.md#cu-s02) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-001) |
> | Caso de uso que nace de esta HU | [CU-001](3-casos-de-uso.md#cu-001) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-02](4-mockups.md#mk-02), [MK-06](4-mockups.md#mk-06) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-001) |
> | Entidades · Clase.Método | CasoSoporte, HistorialCaso, TiempoAtencionSLA, Activo · CasoSoporte.crearCaso();  HistorialCaso.registrarHistorial();  TiempoAtencionSLA.obtenerSLA();  Activo.obtenerActivo() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-001) |
> | Mensajes de secuencia | Sec. CU-001: crearCaso(), registrarHistorial(), obtenerSLA(), obtenerActivo() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-001) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-001**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-001-ca-1) | Envío exitoso con todos los datos obligatorios | [RN-13](2-reglas-de-negocio-y-requisitos.md#rn-13), [RN-25](2-reglas-de-negocio-y-requisitos.md#rn-25) | [RF-18](2-reglas-de-negocio-y-requisitos.md#rf-18) | [RN-02](2-reglas-de-negocio-y-requisitos.md#rn-02) | [CU-001](3-casos-de-uso.md#cu-001) |
| [CA-2](#hu-001-ca-2) | Rechazo por falta de un dato obligatorio | — | — | [RN-01](2-reglas-de-negocio-y-requisitos.md#rn-01) | [CU-001](3-casos-de-uso.md#cu-001) |
| [CA-3](#hu-001-ca-3) | Registro sin un equipo o programa asociado | — | — | [RN-25](2-reglas-de-negocio-y-requisitos.md#rn-25) | [CU-001](3-casos-de-uso.md#cu-001) |
| [CA-4](#hu-001-ca-4) | El sistema orienta con ejemplos | — | [RF-02](2-reglas-de-negocio-y-requisitos.md#rf-02) | — | — |
| [CA-5](#hu-001-ca-5) | Rechazo si quien intenta reportar no es un usuario registrado | [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | [RF-34](2-reglas-de-negocio-y-requisitos.md#rf-34) | [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | [CU-001](3-casos-de-uso.md#cu-001) |


<a id="hu-002"></a>

### HU-002 — Recibir confirmación del caso enviado

**Tabla 5**  
*Historia de usuario HU-002: Recibir confirmación del caso enviado*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-002</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Recibir confirmación del caso enviado</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Usuario solicitante, quiero recibir confirmación inmediata, y también por correo, de que mi caso fue recibido, con un número único de seguimiento, para saber que mi caso quedó registrado y que puedo consultarlo después.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que Marcela Ríos ha iniciado sesión como usuaria solicitante
</blockquote>
<a id="hu-002-ca-1"></a><strong>Escenario: CA-1 Confirmación inmediata</strong>
<blockquote>
<em># crearCaso() · RN-002 (número único de seguimiento)</em>
<strong>Cuando</strong> Marcela completa y envía su caso
<strong>Entonces</strong> el sistema le confirma de inmediato el registro con el número de seguimiento generado, por ejemplo “MA-2026-000145”
</blockquote>
<a id="hu-002-ca-2"></a><strong>Escenario: CA-2 Confirmación enviada por correo</strong>
<blockquote>
<em># Aviso.crearAviso() · canal = correo</em>
<strong>Dado</strong> que el correo registrado de Marcela es marcela.rios@nexaservicios.com
<strong>Cuando</strong> su caso queda registrado con el número MA-2026-000145
<strong>Entonces</strong> el sistema envía a ese correo un mensaje con el número de seguimiento y el resumen del caso
</blockquote>
<a id="hu-002-ca-3"></a><strong>Escenario: CA-3 El número de seguimiento nunca se repite</strong>
<blockquote>
<em># RN-014 · UNIQUE(numero_seguimiento)</em>
<strong>Dado</strong> que ya existe un caso registrado con el número MA-2026-000145
<strong>Cuando</strong> se registra un nuevo caso de cualquier otro usuario
<strong>Entonces</strong> el sistema le asigna un número de seguimiento distinto, nunca MA-2026-000145
</blockquote>
<a id="hu-002-ca-4"></a><strong>Escenario: CA-4 Reintento automático si falla el envío del correo</strong>
<blockquote>
<em># Aviso.reintentarEnvio() · el caso ya quedó registrado antes del envío</em>
<strong>Dado</strong> que el primer intento de envío del correo de confirmación falló
<strong>Cuando</strong> el sistema detecta la falla de entrega
<strong>Entonces</strong> reintenta el envío automáticamente
<strong>Y</strong> el caso de Marcela permanece registrado con su número de seguimiento, sin importar el resultado del envío
</blockquote>
<a id="hu-002-ca-5"></a><strong>Escenario: CA-5 Rechazo por correo electrónico con formato no válido</strong>
<blockquote>
<em># RN-17 (capítulo 2: el correo debe tener formato válido) · RF-03 · el caso no se registra mientras el correo sea inválido</em>
<strong>Dado</strong> que Marcela escribe como correo de contacto “marcela.rios@nexaservicios” (sin un dominio completo)
<strong>Cuando</strong> intenta enviar su caso y el sistema valida el formato del correo
<strong>Entonces</strong> el sistema no registra el caso ni envía la confirmación
<strong>Y</strong> le muestra el mensaje “Escribe un correo con formato válido, por ejemplo nombre@empresa.com.”
<strong>Y</strong> no le permite continuar hasta que el correo tenga un formato válido
<strong>Y</strong> le permite corregir el correo y volver a intentar el envío
</blockquote>
<a id="hu-002-ca-6"></a><strong>Escenario: CA-6 Aviso cuando la confirmación por correo no pudo enviarse</strong>
<blockquote>
<em># Aviso.actualizarEstadoEnvio() · Aviso.reintentarEnvio() · RN-16 (el registro del caso no depende del correo)</em>
<strong>Dado</strong> que el caso MA-2026-000145 quedó registrado y el correo de confirmación no pudo entregarse, ni siquiera después del reintento automático del CA-4
<strong>Cuando</strong> el sistema detecta que la entrega falló
<strong>Entonces</strong> le informa el problema con el aviso “No pudimos enviar la confirmación a tu correo. Tu caso quedó registrado con el número MA-2026-000145.”
<strong>Y</strong> mantiene visible el número de seguimiento y el resumen del caso
<strong>Y</strong> le indica qué puede hacer para reintentar: revisar que su correo registrado esté bien escrito, volver a solicitar el envío de la confirmación o consultar el caso en “Mis casos” con su número de seguimiento
<strong>Y</strong> un nuevo intento de envío no crea otro caso ni cambia el número de seguimiento MA-2026-000145, de modo que no quedan casos duplicados ni datos inconsistentes (RN-16)
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P3 de los resultados por pregunta (P3: "En varios casos los usuarios no saben si su solicitud fue recibida o atendida").</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-01, RF-03, RF-05</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Alta</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-002**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P3](../fase_0/0.4.1-entrevista-resultados.md#p3) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-002-ca-1), [CA-2](#hu-002-ca-2), [CA-3](#hu-002-ca-3), [CA-4](#hu-002-ca-4), [CA-5](#hu-002-ca-5), [CA-6](#hu-002-ca-6) | Ficha de la HU |
> | RF derivados | [RF-01](2-reglas-de-negocio-y-requisitos.md#rf-01), [RF-03](2-reglas-de-negocio-y-requisitos.md#rf-03), [RF-05](2-reglas-de-negocio-y-requisitos.md#rf-05) | Ficha de la HU |
> | RN | [RN-02](2-reglas-de-negocio-y-requisitos.md#rn-02), [RN-15](2-reglas-de-negocio-y-requisitos.md#rn-15), [RN-16](2-reglas-de-negocio-y-requisitos.md#rn-16), [RN-17](2-reglas-de-negocio-y-requisitos.md#rn-17) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-002) |
> | Casos de uso | [CU-002](3-casos-de-uso.md#cu-002), [CU-003](3-casos-de-uso.md#cu-003) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-002) |
> | Caso de uso que nace de esta HU | [CU-002](3-casos-de-uso.md#cu-002) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-03](4-mockups.md#mk-03), [MK-09](4-mockups.md#mk-09) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-002) |
> | Entidades · Clase.Método | Aviso, CasoSoporte · Aviso.crearAviso(), actualizarEstadoEnvio(), reintentarEnvio();  CasoSoporte.crearCaso() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-002) |
> | Mensajes de secuencia | Sec. CU-001: crearCaso();  Sec. CU-007: crearAviso() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-002) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-002**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-002-ca-1) | Confirmación inmediata | — | — | — | [CU-002](3-casos-de-uso.md#cu-002) |
| [CA-2](#hu-002-ca-2) | Confirmación enviada por correo | — | — | [RN-16](2-reglas-de-negocio-y-requisitos.md#rn-16) | — |
| [CA-3](#hu-002-ca-3) | El número de seguimiento nunca se repite | — | — | [RN-02](2-reglas-de-negocio-y-requisitos.md#rn-02) | — |
| [CA-4](#hu-002-ca-4) | Reintento automático si falla el envío del correo | — | — | [RN-15](2-reglas-de-negocio-y-requisitos.md#rn-15), [RN-16](2-reglas-de-negocio-y-requisitos.md#rn-16) | [CU-002](3-casos-de-uso.md#cu-002) |
| [CA-5](#hu-002-ca-5) | Rechazo por correo electrónico con formato no válido | [RN-17](2-reglas-de-negocio-y-requisitos.md#rn-17) | [RF-03](2-reglas-de-negocio-y-requisitos.md#rf-03) | [RN-17](2-reglas-de-negocio-y-requisitos.md#rn-17) | [CU-002](3-casos-de-uso.md#cu-002) |
| [CA-6](#hu-002-ca-6) | Aviso cuando la confirmación por correo no pudo enviarse | [RN-16](2-reglas-de-negocio-y-requisitos.md#rn-16) | — | — | [CU-002](3-casos-de-uso.md#cu-002) |


<a id="hu-003"></a>

### HU-003 — Recibir avisos sobre el avance del caso

**Tabla 6**  
*Historia de usuario HU-003: Recibir avisos sobre el avance del caso*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-003</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Recibir avisos sobre el avance del caso</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Usuario solicitante, quiero recibir un aviso cada vez que mi caso pase a recibido, en revisión, en atención, resuelto, cerrado o reabierto, para mantenerme informado sin tener que preguntar por otros medios.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que Marcela Ríos tiene un caso registrado con número MA-2026-000145
</blockquote>
<a id="hu-003-ca-1"></a><strong>Esquema del escenario: CA-1 Aviso ante cada cambio de situación del caso</strong>
<blockquote>
<em># RN-013 · Aviso.crearAviso() · estado_caso</em>
<strong>Cuando</strong> el caso de Marcela pasa de a
<strong>Entonces</strong> el sistema le genera un aviso informando el cambio situación anterior situación nueva recibido en revisión en revisión en atención en atención resuelto resuelto cerrado resuelto reabierto
</blockquote>
<a id="hu-003-ca-2"></a><strong>Escenario: CA-2 El aviso llega por los tres medios definidos</strong>
<blockquote>
<em># RN-013 · canal: correo, aviso emergente, detalle del caso</em>
<strong>Cuando</strong> el caso de Marcela pasa a “en atención”
<strong>Entonces</strong> el sistema le envía un correo
<strong>Y</strong> le muestra un aviso emergente dentro del sistema
<strong>Y</strong> deja el cambio visible en el detalle del caso
</blockquote>
<a id="hu-003-ca-3"></a><strong>Escenario: CA-3 Reintento ante una falla de envío</strong>
<blockquote>
<em># Aviso.actualizarEstadoEnvio(), reintentarEnvio()</em>
<strong>Dado</strong> que el envío del aviso por correo falló en el primer intento
<strong>Cuando</strong> el sistema registra la falla
<strong>Entonces</strong> guarda el motivo del fallo
<strong>Y</strong> reintenta el envío automáticamente
</blockquote>
<a id="hu-003-ca-4"></a><strong>Escenario: CA-4 Marcela consulta y lee un aviso</strong>
<blockquote>
<em># Aviso.obtenerAviso(), marcarLeido()</em>
<strong>Dado</strong> que Marcela tiene un aviso sin leer sobre su caso MA-2026-000145
<strong>Cuando</strong> abre ese aviso desde el sistema
<strong>Entonces</strong> ve el contenido completo del aviso
<strong>Y</strong> el sistema lo registra como leído, con la fecha y hora de lectura
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P3 y P10 de los resultados por pregunta (P3: "En varios casos los usuarios no saben si su solicitud fue recibida o atendida"; P10: "Se destacan problemas como demoras, falta de claridad, mala comunicación y dificultad para saber el estado del caso").</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-04, RF-05, RF-06</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Alta</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-003**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P3](../fase_0/0.4.1-entrevista-resultados.md#p3), [P10](../fase_0/0.4.1-entrevista-resultados.md#p10) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-003-ca-1), [CA-2](#hu-003-ca-2), [CA-3](#hu-003-ca-3), [CA-4](#hu-003-ca-4) | Ficha de la HU |
> | RF derivados | [RF-04](2-reglas-de-negocio-y-requisitos.md#rf-04), [RF-05](2-reglas-de-negocio-y-requisitos.md#rf-05), [RF-06](2-reglas-de-negocio-y-requisitos.md#rf-06) | Ficha de la HU |
> | RN | [RN-15](2-reglas-de-negocio-y-requisitos.md#rn-15), [RN-16](2-reglas-de-negocio-y-requisitos.md#rn-16) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-003) |
> | Casos de uso | [CU-003](3-casos-de-uso.md#cu-003) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-003) |
> | Caso de uso que nace de esta HU | [CU-003](3-casos-de-uso.md#cu-003) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-09](4-mockups.md#mk-09) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-003) |
> | Entidades · Clase.Método | Aviso · Aviso.crearAviso(), obtenerAviso(), actualizarEstadoEnvio(), reintentarEnvio(), marcarLeido() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-003) |
> | Mensajes de secuencia | Sec. CU-007: crearAviso() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-003) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-003**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-003-ca-1) | Aviso ante cada cambio de situación del caso | — | — | [RN-15](2-reglas-de-negocio-y-requisitos.md#rn-15) | [CU-003](3-casos-de-uso.md#cu-003) |
| [CA-2](#hu-003-ca-2) | El aviso llega por los tres medios definidos | — | — | [RN-15](2-reglas-de-negocio-y-requisitos.md#rn-15) | — |
| [CA-3](#hu-003-ca-3) | Reintento ante una falla de envío | — | — | [RN-15](2-reglas-de-negocio-y-requisitos.md#rn-15) | [CU-003](3-casos-de-uso.md#cu-003) |
| [CA-4](#hu-003-ca-4) | Marcela consulta y lee un aviso | — | — | — | — |


<a id="hu-004"></a>

### HU-004 — Identificar si el caso es un problema o una solicitud

**Tabla 7**  
*Historia de usuario HU-004: Identificar si el caso es un problema o una solicitud*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-004</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Identificar si el caso es un problema o una solicitud</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Usuario solicitante, quiero que el sistema me haga preguntas sencillas y me muestre ejemplos para saber si estoy reportando un problema o haciendo una solicitud, para enviar mi caso al proceso correcto desde el inicio.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que Marcela Ríos ha iniciado sesión y está reportando un caso nuevo
</blockquote>
<a id="hu-004-ca-1"></a><strong>Escenario: CA-1 Marcela identifica que tiene un problema</strong>
<blockquote>
<em># crearCaso() · tipo_caso = problema · RN-003</em>
<strong>Cuando</strong> Marcela indica que algo no está funcionando
<strong>Entonces</strong> el sistema le pide el tipo de problema
<strong>Y</strong> no le pide la clase de solicitud
</blockquote>
<a id="hu-004-ca-2"></a><strong>Escenario: CA-2 Marcela identifica que tiene una solicitud</strong>
<blockquote>
<em># crearCaso() · tipo_caso = solicitud</em>
<strong>Cuando</strong> Marcela indica que necesita algo nuevo, en lugar de reportar una falla
<strong>Entonces</strong> el sistema le pide el tipo de solicitud y la clase de solicitud
<strong>Y</strong> no le pide el tipo de problema
</blockquote>
<a id="hu-004-ca-3"></a><strong>Escenario: CA-3 El sistema no permite mezclar datos de problema y de solicitud</strong>
<blockquote>
<em># RN-003 · CHECK de exclusión mutua tipo_problema / tipo_solicitud</em>
<strong>Cuando</strong> Marcela selecciona que está reportando un problema
<strong>Entonces</strong> el formulario no permite además elegir un tipo de solicitud o una clase de solicitud para el mismo caso
</blockquote>
<a id="hu-004-ca-4"></a><strong>Escenario: CA-4 Ejemplos que ayudan a elegir correctamente</strong>
<blockquote>
<em># RF-02 · apoyo ante la falta de claridad reportada en la entrevista (P2)</em>
<strong>Cuando</strong> Marcela duda entre indicar un problema o una solicitud
<strong>Entonces</strong> el sistema le muestra ejemplos claros de cada caso (por ejemplo, “mi computador no enciende” como problema y “necesito acceso a una carpeta” como solicitud)
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P11 y P12 de los resultados por pregunta (P11: "Los usuarios reportan tanto problemas urgentes como solicitudes de nuevos servicios"; P12: "Muchos prefieren describir el problema y que el sistema o el área de TI lo clasifique"). Nota de diseño: P12 indica que muchos prefieren no clasificar ellos mismos; por eso la clasificación se acompaña de ejemplos (HU-001 CA-4) y puede corregirse por el personal de soporte (HU-049).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-02, RF-07</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Alta</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-004**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P11](../fase_0/0.4.1-entrevista-resultados.md#p11), [P12](../fase_0/0.4.1-entrevista-resultados.md#p12) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-004-ca-1), [CA-2](#hu-004-ca-2), [CA-3](#hu-004-ca-3), [CA-4](#hu-004-ca-4) | Ficha de la HU |
> | RF derivados | [RF-02](2-reglas-de-negocio-y-requisitos.md#rf-02), [RF-07](2-reglas-de-negocio-y-requisitos.md#rf-07) | Ficha de la HU |
> | RN | [RN-03](2-reglas-de-negocio-y-requisitos.md#rn-03) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-004) |
> | Casos de uso | [CU-001](3-casos-de-uso.md#cu-001), [CU-004](3-casos-de-uso.md#cu-004) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-004) |
> | Caso de uso que nace de esta HU | [CU-004](3-casos-de-uso.md#cu-004) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-02](4-mockups.md#mk-02) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-004) |
> | Entidades · Clase.Método | CasoSoporte · CasoSoporte.crearCaso() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-004) |
> | Mensajes de secuencia | Sec. CU-001: crearCaso() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-004) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-004**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-004-ca-1) | Marcela identifica que tiene un problema | — | — | [RN-03](2-reglas-de-negocio-y-requisitos.md#rn-03) | [CU-004](3-casos-de-uso.md#cu-004) |
| [CA-2](#hu-004-ca-2) | Marcela identifica que tiene una solicitud | — | — | [RN-03](2-reglas-de-negocio-y-requisitos.md#rn-03) | — |
| [CA-3](#hu-004-ca-3) | El sistema no permite mezclar datos de problema y de solicitud | — | — | [RN-03](2-reglas-de-negocio-y-requisitos.md#rn-03) | [CU-004](3-casos-de-uso.md#cu-004) |
| [CA-4](#hu-004-ca-4) | Ejemplos que ayudan a elegir correctamente | — | [RF-02](2-reglas-de-negocio-y-requisitos.md#rf-02) | — | — |


<a id="hu-005"></a>

### HU-005 — Consultar casos anteriores

**Tabla 8**  
*Historia de usuario HU-005: Consultar casos anteriores*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-005</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Consultar casos anteriores</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Usuario solicitante, quiero ver la lista de mis casos anteriores ordenados del más reciente al más antiguo y buscar por fecha, situación del caso o tipo de ayuda solicitada, para revisar qué pedí antes, qué respuesta recibí y cómo fue atendido mi caso.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que Marcela Ríos ha iniciado sesión como usuaria solicitante
<strong>Y</strong> tiene registrados los casos MA-2026-000101 (cerrado, 10 de enero), MA-2026-000130 (resuelto, 5 de febrero) y MA-2026-000145 (en atención, 3 de marzo)
</blockquote>
<a id="hu-005-ca-1"></a><strong>Escenario: CA-1 Listado ordenado del más reciente al más antiguo</strong>
<blockquote>
<em># obtenerCaso() · orden por fecha_creacion · RF-10</em>
<strong>Cuando</strong> Marcela consulta sus casos anteriores
<strong>Entonces</strong> el sistema le muestra primero MA-2026-000145, luego MA-2026-000130 y por último MA-2026-000101
</blockquote>
<a id="hu-005-ca-2"></a><strong>Escenario: CA-2 Un usuario solo ve sus propios casos</strong>
<blockquote>
<em># RN-010 · un solicitante solo consulta sus propios casos</em>
<strong>Dado</strong> que el caso MA-2026-000199 pertenece a Diego Salazar, no a Marcela
<strong>Cuando</strong> Marcela consulta su listado de casos
<strong>Entonces</strong> el sistema no le muestra el caso MA-2026-000199
</blockquote>
<a id="hu-005-ca-3"></a><strong>Esquema del escenario: CA-3 Búsqueda por distintos filtros</strong>
<blockquote>
<em># RF-10 · filtro por fecha, situación, tipo o palabra clave</em>
<strong>Cuando</strong> Marcela busca sus casos por con el valor “”
<strong>Entonces</strong> el sistema le muestra únicamente los casos que cumplen ese filtro filtro valor fecha 3 de marzo de 2026 situación en atención tipo de problema Hardware palabra en el título o la descripción computador
</blockquote>
<a id="hu-005-ca-4"></a><strong>Escenario: CA-4 Búsqueda sin resultados</strong>
<blockquote>
<strong>Cuando</strong> Marcela busca sus casos con la palabra “impresora” y ninguno la contiene
<strong>Entonces</strong> el sistema le informa que no encontró casos que coincidan, sin mostrar registros que no correspondan
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P3 y P9 de los resultados por pregunta (P3: "En varios casos los usuarios no saben si su solicitud fue recibida o atendida"; P9: "La mayoría prefiere un único sistema o formulario centralizado para registrar las solicitudes"). (conclusión: los usuarios requieren un sistema único donde puedan registrar y conocer el estado de sus solicitudes).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-09, RF-10</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Alta</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-005**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P3](../fase_0/0.4.1-entrevista-resultados.md#p3), [P9](../fase_0/0.4.1-entrevista-resultados.md#p9) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-005-ca-1), [CA-2](#hu-005-ca-2), [CA-3](#hu-005-ca-3), [CA-4](#hu-005-ca-4) | Ficha de la HU |
> | RF derivados | [RF-09](2-reglas-de-negocio-y-requisitos.md#rf-09), [RF-10](2-reglas-de-negocio-y-requisitos.md#rf-10) | Ficha de la HU |
> | RN | [RN-06](2-reglas-de-negocio-y-requisitos.md#rn-06) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-005) |
> | Casos de uso | [CU-005](3-casos-de-uso.md#cu-005) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-005) |
> | Caso de uso que nace de esta HU | [CU-005](3-casos-de-uso.md#cu-005) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-04](4-mockups.md#mk-04) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-005) |
> | Entidades · Clase.Método | CasoSoporte · CasoSoporte.obtenerCaso() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-005) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-005) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-005**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-005-ca-1) | Listado ordenado del más reciente al más antiguo | — | [RF-10](2-reglas-de-negocio-y-requisitos.md#rf-10) | — | [CU-005](3-casos-de-uso.md#cu-005) |
| [CA-2](#hu-005-ca-2) | Un usuario solo ve sus propios casos | — | — | [RN-06](2-reglas-de-negocio-y-requisitos.md#rn-06) | — |
| [CA-3](#hu-005-ca-3) | Búsqueda por distintos filtros | — | [RF-10](2-reglas-de-negocio-y-requisitos.md#rf-10) | — | — |
| [CA-4](#hu-005-ca-4) | Búsqueda sin resultados | — | — | — | [CU-005](3-casos-de-uso.md#cu-005) |


<a id="hu-006"></a>

### HU-006 — Revisar casos pendientes

**Tabla 9**  
*Historia de usuario HU-006: Revisar casos pendientes*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-006</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Revisar casos pendientes</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Personal de soporte, quiero ver en un solo lugar los casos que todavía están pendientes, ordenados por importancia, fecha y tipo de problema, para saber cuáles debo atender primero y evitar retrasos.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el técnico Carlos Peña ha iniciado sesión como personal de soporte
</blockquote>
<a id="hu-006-ca-1"></a><strong>Escenario: CA-1 Un solo lugar con los casos pendientes</strong>
<blockquote>
<em># obtenerCaso() · excluye estado_caso = cerrado · RF-11</em>
<strong>Dado</strong> que existen los casos MA-2026-000145 (en atención), MA-2026-000150 (recibido) y MA-2026-000101 (cerrado)
<strong>Cuando</strong> Carlos abre la pantalla de casos pendientes
<strong>Entonces</strong> ve MA-2026-000145 y MA-2026-000150
<strong>Y</strong> no ve MA-2026-000101, porque ya está cerrado
</blockquote>
<a id="hu-006-ca-2"></a><strong>Escenario: CA-2 Orden por importancia, fecha y tipo de problema</strong>
<blockquote>
<em># TablaImportancia.calcularResultadoImportancia() · P1 es la prioridad más alta</em>
<strong>Dado</strong> que MA-2026-000150 tiene importancia P1 y MA-2026-000145 tiene importancia P3
<strong>Cuando</strong> Carlos ordena la lista por importancia
<strong>Entonces</strong> MA-2026-000150 aparece antes que MA-2026-000145
</blockquote>
<a id="hu-006-ca-3"></a><strong>Escenario: CA-3 Información visible por caso</strong>
<blockquote>
<strong>Cuando</strong> Carlos revisa la lista de pendientes
<strong>Entonces</strong> cada caso muestra su número de seguimiento, su situación actual y su nivel de importancia
</blockquote>
<a id="hu-006-ca-4"></a><strong>Escenario: CA-4 No hay casos pendientes</strong>
<blockquote>
<strong>Dado</strong> que todos los casos están en situación “cerrado”
<strong>Cuando</strong> Carlos abre la pantalla de casos pendientes
<strong>Entonces</strong> el sistema le indica claramente que no hay casos pendientes
</blockquote>
<a id="hu-006-ca-5"></a><strong>Escenario: CA-5 Un solicitante no accede a los casos pendientes</strong>
<blockquote>
<em># RN-23 · acceso según perfil</em>
<strong>Cuando</strong> Marcela Ríos (perfil solicitante) intenta abrir la pantalla de casos pendientes
<strong>Entonces</strong> el sistema no se lo permite
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P4 y P10 de los resultados por pregunta (P4: "Se evidencia que en muchos casos las respuestas se demoran más de lo esperado"; P10: "Se destacan problemas como demoras, falta de claridad, mala comunicación y dificultad para saber el estado del caso"). (desde la perspectiva del personal de TI, que debe responder a estas demoras organizando su propia carga de trabajo).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-11</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Alta</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-006**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P4](../fase_0/0.4.1-entrevista-resultados.md#p4), [P10](../fase_0/0.4.1-entrevista-resultados.md#p10) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-006-ca-1), [CA-2](#hu-006-ca-2), [CA-3](#hu-006-ca-3), [CA-4](#hu-006-ca-4), [CA-5](#hu-006-ca-5) | Ficha de la HU |
> | RF derivados | [RF-11](2-reglas-de-negocio-y-requisitos.md#rf-11) | Ficha de la HU |
> | RN | [RN-05](2-reglas-de-negocio-y-requisitos.md#rn-05), [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-006) |
> | Casos de uso | [CU-006](3-casos-de-uso.md#cu-006) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-006) |
> | Caso de uso que nace de esta HU | [CU-006](3-casos-de-uso.md#cu-006) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-07](4-mockups.md#mk-07) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-006) |
> | Entidades · Clase.Método | CasoSoporte, TablaImportancia · CasoSoporte.obtenerCaso();  TablaImportancia.calcularResultadoImportancia() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-006) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-006) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-006**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-006-ca-1) | Un solo lugar con los casos pendientes | — | [RF-11](2-reglas-de-negocio-y-requisitos.md#rf-11) | — | [CU-006](3-casos-de-uso.md#cu-006) |
| [CA-2](#hu-006-ca-2) | Orden por importancia, fecha y tipo de problema | — | — | [RN-05](2-reglas-de-negocio-y-requisitos.md#rn-05) | — |
| [CA-3](#hu-006-ca-3) | Información visible por caso | — | — | — | — |
| [CA-4](#hu-006-ca-4) | No hay casos pendientes | — | — | — | [CU-006](3-casos-de-uso.md#cu-006) |
| [CA-5](#hu-006-ca-5) | Un solicitante no accede a los casos pendientes | [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | — | [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | [CU-006](3-casos-de-uso.md#cu-006) |


<a id="hu-007"></a>

### HU-007 — Cambiar la situación actual del caso

**Tabla 10**  
*Historia de usuario HU-007: Cambiar la situación actual del caso*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-007</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Cambiar la situación actual del caso</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Personal de soporte, quiero cambiar la situación actual de un caso siguiendo únicamente los cambios permitidos para mi rol, dejando registrado quién hizo la actualización y cuándo se realizó, para mantener el proceso organizado, conservar el historial del caso y permitir que el usuario conozca su avance.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el técnico Carlos Peña (perfil de soporte) ha iniciado sesión
<strong>Y</strong> el caso MA-2026-000145 está en situación “en atención”
</blockquote>
<a id="hu-007-ca-1"></a><strong>Escenario: CA-1 Cambio permitido y autorizado</strong>
<blockquote>
<em># TransicionEstadoCaso.esTransicionValida() · actualizarCaso() · marcarSolucionado() (si pasa a resuelto) · HistorialCaso.registrarHistorial() · RN-006</em>
<strong>Cuando</strong> Carlos cambia la situación del caso MA-2026-000145 a “resuelto” el 10 de marzo de 2026 a las 3:40 p. m.
<strong>Entonces</strong> el sistema actualiza la situación del caso
<strong>Y</strong> registra en el historial que fue Carlos Peña quien hizo el cambio, el 10 de marzo de 2026 a las 3:40 p. m.
<strong>Y</strong> guarda la fecha de solución del caso
</blockquote>
<a id="hu-007-ca-2"></a><strong>Escenario: CA-2 Rechazo de un cambio no permitido</strong>
<blockquote>
<em># esTransicionValida() devuelve falso</em>
<strong>Dado</strong> que el caso MA-2026-000150 está en situación “recibido”
<strong>Cuando</strong> Carlos intenta cambiarlo directamente a “cerrado”
<strong>Entonces</strong> el sistema rechaza el cambio
<strong>Y</strong> explica que esa situación no puede pasar directamente a “cerrado”
<strong>Y</strong> el caso MA-2026-000150 sigue en “recibido”
</blockquote>
<a id="hu-007-ca-3"></a><strong>Escenario: CA-3 Rechazo por rol no autorizado</strong>
<blockquote>
<em># perfil_autorizado de TransicionEstadoCaso</em>
<strong>Dado</strong> que Marcela Ríos tiene perfil de acceso “solicitante”
<strong>Cuando</strong> Marcela intenta cambiar la situación de su propio caso MA-2026-000145
<strong>Entonces</strong> el sistema impide el cambio
<strong>Y</strong> conserva la situación anterior del caso
</blockquote>
<a id="hu-007-ca-4"></a><strong>Escenario: CA-4 El solicitante ve el cambio de inmediato</strong>
<blockquote>
<strong>Cuando</strong> Carlos marca el caso MA-2026-000145 como resuelto
<strong>Entonces</strong> Marcela puede ver la nueva situación “resuelto” al consultar su caso, sin demora
</blockquote>
<a id="hu-007-ca-5"></a><strong>Escenario: CA-5 Registro de la primera respuesta</strong>
<blockquote>
<em># registrarPrimeraRespuesta() · RN-14</em>
<strong>Dado</strong> que el caso MA-2026-000150 aún no tiene primera respuesta
<strong>Cuando</strong> Carlos cambia su situación de “recibido” a “en revisión”
<strong>Entonces</strong> el sistema registra la fecha y hora de ese cambio como primera respuesta del caso
<strong>Y</strong> no la modifica en los cambios de situación posteriores
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P3 y P10 de los resultados por pregunta (P3: "En varios casos los usuarios no saben si su solicitud fue recibida o atendida"; P10: "Se destacan problemas como demoras, falta de claridad, mala comunicación y dificultad para saber el estado del caso").</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-12, RF-13, RF-49, RF-50</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Alta</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-007**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P3](../fase_0/0.4.1-entrevista-resultados.md#p3), [P10](../fase_0/0.4.1-entrevista-resultados.md#p10) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-007-ca-1), [CA-2](#hu-007-ca-2), [CA-3](#hu-007-ca-3), [CA-4](#hu-007-ca-4), [CA-5](#hu-007-ca-5) | Ficha de la HU |
> | RF derivados | [RF-12](2-reglas-de-negocio-y-requisitos.md#rf-12), [RF-13](2-reglas-de-negocio-y-requisitos.md#rf-13), [RF-49](2-reglas-de-negocio-y-requisitos.md#rf-49), [RF-50](2-reglas-de-negocio-y-requisitos.md#rf-50) | Ficha de la HU |
> | RN | [RN-06](2-reglas-de-negocio-y-requisitos.md#rn-06), [RN-07](2-reglas-de-negocio-y-requisitos.md#rn-07), [RN-08](2-reglas-de-negocio-y-requisitos.md#rn-08), [RN-14](2-reglas-de-negocio-y-requisitos.md#rn-14), [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-007) |
> | Casos de uso | [CU-003](3-casos-de-uso.md#cu-003), [CU-007](3-casos-de-uso.md#cu-007), [CU-010](3-casos-de-uso.md#cu-010), [CU-S02](3-casos-de-uso.md#cu-s02) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-007) |
> | Caso de uso que nace de esta HU | [CU-007](3-casos-de-uso.md#cu-007) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-05](4-mockups.md#mk-05), [MK-06](4-mockups.md#mk-06) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-007) |
> | Entidades · Clase.Método | CasoSoporte, HistorialCaso, TransicionEstadoCaso · CasoSoporte.actualizarCaso(), registrarPrimeraRespuesta(), marcarSolucionado();  HistorialCaso.registrarHistorial();  TransicionEstadoCaso.esTransicionValida() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-007) |
> | Mensajes de secuencia | Sec. CU-007: registrarHistorial(), actualizarCaso(), registrarPrimeraRespuesta(), marcarSolucionado(), esTransicionValida() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-007) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-007**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-007-ca-1) | Cambio permitido y autorizado | — | — | [RN-08](2-reglas-de-negocio-y-requisitos.md#rn-08) | [CU-007](3-casos-de-uso.md#cu-007) |
| [CA-2](#hu-007-ca-2) | Rechazo de un cambio no permitido | — | — | [RN-07](2-reglas-de-negocio-y-requisitos.md#rn-07) | [CU-007](3-casos-de-uso.md#cu-007) |
| [CA-3](#hu-007-ca-3) | Rechazo por rol no autorizado | — | — | [RN-07](2-reglas-de-negocio-y-requisitos.md#rn-07), [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | [CU-007](3-casos-de-uso.md#cu-007) |
| [CA-4](#hu-007-ca-4) | El solicitante ve el cambio de inmediato | — | — | — | — |
| [CA-5](#hu-007-ca-5) | Registro de la primera respuesta | [RN-14](2-reglas-de-negocio-y-requisitos.md#rn-14) | — | [RN-14](2-reglas-de-negocio-y-requisitos.md#rn-14) | — |


<a id="hu-008"></a>

### HU-008 — Asignar una persona encargada del caso

**Tabla 11**  
*Historia de usuario HU-008: Asignar una persona encargada del caso*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-008</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Asignar una persona encargada del caso</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Personal de soporte, quiero asignar o cambiar la persona encargada de atender un caso, para asegurar que cada caso tenga alguien responsable de revisarlo.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que la supervisora Patricia Londoño ha iniciado sesión
<strong>Y</strong> el caso MA-2026-000150 aún no tiene persona asignada
</blockquote>
<a id="hu-008-ca-1"></a><strong>Escenario: CA-1 Asignación a personal de soporte</strong>
<blockquote>
<em># actualizarCaso() · HistorialCaso.registrarHistorial() (RF-49) · relación caso_soporte-usuario (rol asignado)</em>
<strong>Cuando</strong> Patricia asigna el caso MA-2026-000150 al técnico Carlos Peña
<strong>Entonces</strong> el sistema registra a Carlos como responsable del caso
<strong>Y</strong> guarda en el historial quién hizo la asignación y en qué momento
</blockquote>
<a id="hu-008-ca-2"></a><strong>Escenario: CA-2 Rechazo al intentar asignar a alguien sin perfil de soporte</strong>
<blockquote>
<em># solo perfil_acceso = soporte puede ser asignado</em>
<strong>Cuando</strong> Patricia intenta asignar el caso MA-2026-000150 a Marcela Ríos, cuyo perfil es “solicitante”
<strong>Entonces</strong> el sistema no permite la asignación
</blockquote>
<a id="hu-008-ca-3"></a><strong>Escenario: CA-3 Cambio de responsable</strong>
<blockquote>
<strong>Dado</strong> que el caso MA-2026-000145 está asignado a Carlos Peña
<strong>Cuando</strong> Patricia lo reasigna a la técnica Juliana Gómez
<strong>Entonces</strong> Juliana queda como nueva responsable
<strong>Y</strong> el sistema conserva en el historial que antes era responsable Carlos Peña
</blockquote>
<a id="hu-008-ca-4"></a><strong>Escenario: CA-4 Caso sin responsable definido</strong>
<blockquote>
<strong>Cuando</strong> Patricia revisa un caso recién recibido que aún no tiene responsable
<strong>Entonces</strong> el sistema lo muestra sin persona asignada, sin impedir su consulta
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (P10: "Se destacan problemas como demoras, falta de claridad, mala comunicación y dificultad para saber el estado del caso", que exige que cada caso tenga un responsable identificable).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-14, RF-49</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Alta</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-008**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P10](../fase_0/0.4.1-entrevista-resultados.md#p10) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-008-ca-1), [CA-2](#hu-008-ca-2), [CA-3](#hu-008-ca-3), [CA-4](#hu-008-ca-4) | Ficha de la HU |
> | RF derivados | [RF-14](2-reglas-de-negocio-y-requisitos.md#rf-14), [RF-49](2-reglas-de-negocio-y-requisitos.md#rf-49) | Ficha de la HU |
> | RN | [RN-08](2-reglas-de-negocio-y-requisitos.md#rn-08), [RN-09](2-reglas-de-negocio-y-requisitos.md#rn-09) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-008) |
> | Casos de uso | [CU-008](3-casos-de-uso.md#cu-008), [CU-S02](3-casos-de-uso.md#cu-s02) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-008) |
> | Caso de uso que nace de esta HU | [CU-008](3-casos-de-uso.md#cu-008) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-06](4-mockups.md#mk-06) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-008) |
> | Entidades · Clase.Método | CasoSoporte, HistorialCaso · CasoSoporte.actualizarCaso();  HistorialCaso.registrarHistorial() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-008) |
> | Mensajes de secuencia | Sec. CU-001: registrarHistorial();  Sec. CU-007: actualizarCaso() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-008) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-008**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-008-ca-1) | Asignación a personal de soporte | — | [RF-49](2-reglas-de-negocio-y-requisitos.md#rf-49) | [RN-08](2-reglas-de-negocio-y-requisitos.md#rn-08) | [CU-008](3-casos-de-uso.md#cu-008) |
| [CA-2](#hu-008-ca-2) | Rechazo al intentar asignar a alguien sin perfil de soporte | — | — | [RN-09](2-reglas-de-negocio-y-requisitos.md#rn-09) | [CU-008](3-casos-de-uso.md#cu-008) |
| [CA-3](#hu-008-ca-3) | Cambio de responsable | — | — | — | — |
| [CA-4](#hu-008-ca-4) | Caso sin responsable definido | — | — | — | — |


<a id="hu-009"></a>

### HU-009 — Agregar comentarios al caso

**Tabla 12**  
*Historia de usuario HU-009: Agregar comentarios al caso*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-009</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Agregar comentarios al caso</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Personal de soporte, quiero agregar comentarios que expliquen avances, aclaraciones o información faltante del caso, para dejar claro qué se ha hecho y qué falta por revisar.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el técnico Carlos Peña ha iniciado sesión
<strong>Y</strong> atiende el caso MA-2026-000145 de Marcela Ríos
</blockquote>
<a id="hu-009-ca-1"></a><strong>Escenario: CA-1 Comentario visible para el usuario</strong>
<blockquote>
<em># ComentarioCaso.registrarComentario() · visibilidad = usuario</em>
<strong>Cuando</strong> Carlos agrega el comentario “Ya revisamos el equipo, se cambiará una pieza” y lo marca visible para el usuario
<strong>Entonces</strong> el comentario queda guardado con su nombre y la fecha
<strong>Y</strong> Marcela puede verlo al consultar su caso
</blockquote>
<a id="hu-009-ca-2"></a><strong>Escenario: CA-2 Comentario interno, solo para soporte</strong>
<blockquote>
<em># visibilidad = interno_soporte · RN-022</em>
<strong>Cuando</strong> Carlos agrega el comentario “Falta repuesto, pedir a bodega” y lo marca como interno
<strong>Entonces</strong> el comentario queda guardado
<strong>Y</strong> Marcela no puede verlo al consultar su caso
<strong>Y</strong> otra persona de soporte, como Juliana Gómez, sí puede verlo
</blockquote>
<a id="hu-009-ca-3"></a><strong>Escenario: CA-3 Rechazo de un comentario vacío</strong>
<blockquote>
<strong>Cuando</strong> Carlos intenta guardar un comentario sin escribir ningún texto
<strong>Entonces</strong> el sistema no registra el comentario
</blockquote>
<a id="hu-009-ca-4"></a><strong>Escenario: CA-4 Consulta del hilo completo de comentarios</strong>
<blockquote>
<em># listarComentarios()</em>
<strong>Dado</strong> que el caso MA-2026-000145 tiene dos comentarios visibles y uno interno
<strong>Cuando</strong> Carlos abre el hilo de comentarios del caso
<strong>Entonces</strong> ve los tres comentarios
<strong>Pero</strong> Marcela, al abrir el mismo caso, solo ve los dos comentarios visibles para ella
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P6 de los resultados por pregunta (P6: "Algunos usuarios envían información completa, pero muchos deben complementar después").</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-16, RF-17</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-009**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P6](../fase_0/0.4.1-entrevista-resultados.md#p6) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-009-ca-1), [CA-2](#hu-009-ca-2), [CA-3](#hu-009-ca-3), [CA-4](#hu-009-ca-4) | Ficha de la HU |
> | RF derivados | [RF-16](2-reglas-de-negocio-y-requisitos.md#rf-16), [RF-17](2-reglas-de-negocio-y-requisitos.md#rf-17) | Ficha de la HU |
> | RN | [RN-08](2-reglas-de-negocio-y-requisitos.md#rn-08), [RN-10](2-reglas-de-negocio-y-requisitos.md#rn-10) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-009) |
> | Casos de uso | [CU-009](3-casos-de-uso.md#cu-009) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-009) |
> | Caso de uso que nace de esta HU | [CU-009](3-casos-de-uso.md#cu-009) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-05](4-mockups.md#mk-05), [MK-06](4-mockups.md#mk-06) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-009) |
> | Entidades · Clase.Método | ComentarioCaso · ComentarioCaso.registrarComentario(), listarComentarios() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-009) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-009) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-009**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-009-ca-1) | Comentario visible para el usuario | — | — | — | [CU-009](3-casos-de-uso.md#cu-009) |
| [CA-2](#hu-009-ca-2) | Comentario interno, solo para soporte | — | — | [RN-10](2-reglas-de-negocio-y-requisitos.md#rn-10) | — |
| [CA-3](#hu-009-ca-3) | Rechazo de un comentario vacío | — | — | [RN-10](2-reglas-de-negocio-y-requisitos.md#rn-10) | [CU-009](3-casos-de-uso.md#cu-009) |
| [CA-4](#hu-009-ca-4) | Consulta del hilo completo de comentarios | — | — | [RN-06](2-reglas-de-negocio-y-requisitos.md#rn-06), [RN-10](2-reglas-de-negocio-y-requisitos.md#rn-10) | — |


<a id="hu-010"></a>

### HU-010 — Ver tiempo aproximado de atención

**Tabla 13**  
*Historia de usuario HU-010: Ver tiempo aproximado de atención*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-010</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Ver tiempo aproximado de atención</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Usuario solicitante, quiero ver un tiempo aproximado de atención calculado según la importancia y el tipo de mi caso, para organizar mejor mis actividades mientras espero respuesta.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que Marcela Ríos tiene el caso MA-2026-000145 con importancia P2 y tipo “problema”
<strong>Y</strong> la regla de tiempos vigente para P2 y problema define 120 minutos de respuesta y 480 minutos de solución
</blockquote>
<a id="hu-010-ca-1"></a><strong>Escenario: CA-1 Tiempo aproximado visible para el solicitante</strong>
<blockquote>
<em># TiempoAtencionSLA.obtenerSLA(id)</em>
<strong>Cuando</strong> Marcela consulta el detalle de su caso
<strong>Entonces</strong> el sistema le muestra que el tiempo máximo de respuesta es de 120 minutos y el de solución de 480 minutos
</blockquote>
<a id="hu-010-ca-2"></a><strong>Escenario: CA-2 El tiempo mostrado no cambia aunque la regla se actualice después</strong>
<blockquote>
<em># versión de la regla vigente al momento de crear el caso</em>
<strong>Dado</strong> que después de creado el caso el administrador cambia la regla de P2-problema a 90 minutos de respuesta
<strong>Cuando</strong> Marcela vuelve a consultar su caso MA-2026-000145
<strong>Entonces</strong> sigue viendo 120 minutos de respuesta, la regla vigente cuando se creó su caso
</blockquote>
<a id="hu-010-ca-3"></a><strong>Escenario: CA-3 Indicación de cumplimiento una vez hay primera respuesta</strong>
<blockquote>
<em># CasoSoporte.cumpleSLA()</em>
<strong>Dado</strong> que el caso MA-2026-000145 recibió su primera respuesta 90 minutos después de creado
<strong>Cuando</strong> Marcela consulta su caso
<strong>Entonces</strong> el sistema le indica que la primera respuesta se dio dentro del tiempo definido
</blockquote>
<a id="hu-010-ca-4"></a><strong>Escenario: CA-4 Un solicitante no ve los tiempos de un caso ajeno</strong>
<blockquote>
<em># RN-06 · un solicitante solo consulta sus propios casos</em>
<strong>Dado</strong> que el caso MA-2026-000199 pertenece a Diego Salazar, no a Marcela
<strong>Cuando</strong> Marcela intenta consultar los tiempos de atención de ese caso
<strong>Entonces</strong> el sistema no se los muestra
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P4 y P13 de los resultados por pregunta (P4: "Se evidencia que en muchos casos las respuestas se demoran más de lo esperado"; P13: "La mayoría espera respuestas rápidas, desde menos de una hora hasta el mismo día").</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-13, RF-20</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-010**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P4](../fase_0/0.4.1-entrevista-resultados.md#p4), [P13](../fase_0/0.4.1-entrevista-resultados.md#p13) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-010-ca-1), [CA-2](#hu-010-ca-2), [CA-3](#hu-010-ca-3), [CA-4](#hu-010-ca-4) | Ficha de la HU |
> | RF derivados | [RF-13](2-reglas-de-negocio-y-requisitos.md#rf-13), [RF-20](2-reglas-de-negocio-y-requisitos.md#rf-20) | Ficha de la HU |
> | RN | [RN-06](2-reglas-de-negocio-y-requisitos.md#rn-06), [RN-13](2-reglas-de-negocio-y-requisitos.md#rn-13), [RN-14](2-reglas-de-negocio-y-requisitos.md#rn-14) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-010) |
> | Casos de uso | [CU-010](3-casos-de-uso.md#cu-010), [CU-S01](3-casos-de-uso.md#cu-s01) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-010) |
> | Caso de uso que nace de esta HU | [CU-010](3-casos-de-uso.md#cu-010), [CU-S01](3-casos-de-uso.md#cu-s01) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-05](4-mockups.md#mk-05) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-010) |
> | Entidades · Clase.Método | CasoSoporte, TiempoAtencionSLA · CasoSoporte.cumpleSLA();  TiempoAtencionSLA.obtenerSLA() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-010) |
> | Mensajes de secuencia | Sec. CU-001: obtenerSLA() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-010) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-010**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-010-ca-1) | Tiempo aproximado visible para el solicitante | — | — | — | [CU-010](3-casos-de-uso.md#cu-010), [CU-S01](3-casos-de-uso.md#cu-s01) |
| [CA-2](#hu-010-ca-2) | El tiempo mostrado no cambia aunque la regla se actualice después | — | — | [RN-13](2-reglas-de-negocio-y-requisitos.md#rn-13) | [CU-010](3-casos-de-uso.md#cu-010) |
| [CA-3](#hu-010-ca-3) | Indicación de cumplimiento una vez hay primera respuesta | — | — | [RN-14](2-reglas-de-negocio-y-requisitos.md#rn-14) | — |
| [CA-4](#hu-010-ca-4) | Un solicitante no ve los tiempos de un caso ajeno | [RN-06](2-reglas-de-negocio-y-requisitos.md#rn-06) | — | [RN-06](2-reglas-de-negocio-y-requisitos.md#rn-06) | [CU-010](3-casos-de-uso.md#cu-010) |


<a id="hu-011"></a>

### HU-011 — Revisar resumen general de atención

**Tabla 14**  
*Historia de usuario HU-011: Revisar resumen general de atención*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-011</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Revisar resumen general de atención</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Supervisor de soporte, quiero ver un resumen claro de los casos pendientes, casos en atención, casos resueltos y casos atrasados, para saber si la atención está avanzando bien o si se están acumulando retrasos.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que la supervisora Patricia Londoño ha iniciado sesión
</blockquote>
<a id="hu-011-ca-1"></a><strong>Escenario: CA-1 Conteo de casos por situación</strong>
<blockquote>
<em># obtenerCaso() agrupado por estado_caso</em>
<strong>Dado</strong> que hoy hay 5 casos recibidos, 8 en atención, 12 resueltos y 2 cerrados
<strong>Cuando</strong> Patricia abre el resumen general de atención
<strong>Entonces</strong> ve esas cuatro cantidades correctamente reflejadas
</blockquote>
<a id="hu-011-ca-2"></a><strong>Escenario: CA-2 Casos que cumplen y que incumplen el tiempo definido</strong>
<blockquote>
<em># CasoSoporte.cumpleSLA()</em>
<strong>Dado</strong> que de los 8 casos en atención, 6 están dentro del tiempo definido y 2 ya lo superaron
<strong>Cuando</strong> Patricia abre el resumen general
<strong>Entonces</strong> ve que 6 casos cumplen el tiempo de atención y 2 están atrasados
</blockquote>
<a id="hu-011-ca-3"></a><strong>Escenario: CA-3 Un caso atrasado se identifica por superar el tiempo definido</strong>
<blockquote>
<em># registrarPrimeraRespuesta() aún no ejecutado dentro del tiempo límite</em>
<strong>Dado</strong> que el caso MA-2026-000150 lleva más del tiempo de respuesta definido sin haber recibido atención
<strong>Entonces</strong> el resumen lo cuenta como atrasado
</blockquote>
<a id="hu-011-ca-4"></a><strong>Escenario: CA-4 Periodo sin casos registrados</strong>
<blockquote>
<strong>Cuando</strong> Patricia consulta el resumen de un periodo sin ningún caso registrado
<strong>Entonces</strong> el sistema se lo indica claramente, en lugar de mostrar un resumen vacío sin explicación
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P4 y P10 de los resultados por pregunta (P4: "Se evidencia que en muchos casos las respuestas se demoran más de lo esperado"; P10: "Se destacan problemas como demoras, falta de claridad, mala comunicación y dificultad para saber el estado del caso"). (vista de supervisión sobre las demoras y dificultades reportadas por los usuarios).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-21</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-011**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P4](../fase_0/0.4.1-entrevista-resultados.md#p4), [P10](../fase_0/0.4.1-entrevista-resultados.md#p10) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-011-ca-1), [CA-2](#hu-011-ca-2), [CA-3](#hu-011-ca-3), [CA-4](#hu-011-ca-4) | Ficha de la HU |
> | RF derivados | [RF-21](2-reglas-de-negocio-y-requisitos.md#rf-21) | Ficha de la HU |
> | RN | [RN-14](2-reglas-de-negocio-y-requisitos.md#rn-14), [RN-29](2-reglas-de-negocio-y-requisitos.md#rn-29) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-011) |
> | Casos de uso | [CU-011](3-casos-de-uso.md#cu-011) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-011) |
> | Caso de uso que nace de esta HU | [CU-011](3-casos-de-uso.md#cu-011) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-10](4-mockups.md#mk-10) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-011) |
> | Entidades · Clase.Método | CasoSoporte · CasoSoporte.cumpleSLA(), obtenerCaso(), registrarPrimeraRespuesta() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-011) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-011) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-011**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-011-ca-1) | Conteo de casos por situación | — | — | — | [CU-011](3-casos-de-uso.md#cu-011) |
| [CA-2](#hu-011-ca-2) | Casos que cumplen y que incumplen el tiempo definido | — | — | [RN-14](2-reglas-de-negocio-y-requisitos.md#rn-14) | — |
| [CA-3](#hu-011-ca-3) | Un caso atrasado se identifica por superar el tiempo definido | — | — | [RN-14](2-reglas-de-negocio-y-requisitos.md#rn-14) | — |
| [CA-4](#hu-011-ca-4) | Periodo sin casos registrados | — | — | [RN-29](2-reglas-de-negocio-y-requisitos.md#rn-29) | [CU-011](3-casos-de-uso.md#cu-011) |


<a id="hu-012"></a>

### HU-012 — Revisar resumen por periodo

**Tabla 15**  
*Historia de usuario HU-012: Revisar resumen por periodo*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-012</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Revisar resumen por periodo</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Supervisor de soporte, quiero consultar el resumen de atención por día, semana, mes o un periodo elegido, para comparar cómo se ha comportado la atención en diferentes momentos.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que la supervisora Patricia Londoño ha iniciado sesión
</blockquote>
<a id="hu-012-ca-1"></a><strong>Esquema del escenario: CA-1 Resumen según el periodo elegido</strong>
<blockquote>
<em># CasoSoporte.obtenerResumenAtencion(desde, hasta) · RF-22 · RN-29</em>
<strong>Cuando</strong> Patricia elige consultar el resumen por
<strong>Entonces</strong> el sistema recalcula el resumen usando únicamente los casos de ese periodo periodo el día de hoy esta semana este mes un rango de fechas elegido por ella, por ejemplo del 1 al 15 de marzo de 2026
</blockquote>
<a id="hu-012-ca-2"></a><strong>Escenario: CA-2 Periodo sin casos</strong>
<blockquote>
<strong>Cuando</strong> Patricia consulta el resumen de un periodo en el que no se registró ningún caso
<strong>Entonces</strong> el sistema se lo indica claramente
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P4 de los resultados por pregunta (P4: "Se evidencia que en muchos casos las respuestas se demoran más de lo esperado"). (seguimiento histórico de la misma demora reportada por los usuarios).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-22</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-012**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P4](../fase_0/0.4.1-entrevista-resultados.md#p4) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-012-ca-1), [CA-2](#hu-012-ca-2) | Ficha de la HU |
> | RF derivados | [RF-22](2-reglas-de-negocio-y-requisitos.md#rf-22) | Ficha de la HU |
> | RN | [RN-29](2-reglas-de-negocio-y-requisitos.md#rn-29) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-012) |
> | Casos de uso | [CU-012](3-casos-de-uso.md#cu-012) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-012) |
> | Caso de uso que nace de esta HU | [CU-012](3-casos-de-uso.md#cu-012) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-10](4-mockups.md#mk-10) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-012) |
> | Entidades · Clase.Método | CasoSoporte · CasoSoporte.obtenerResumenAtencion() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-012) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-012) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-012**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-012-ca-1) | Resumen según el periodo elegido | [RN-29](2-reglas-de-negocio-y-requisitos.md#rn-29) | [RF-22](2-reglas-de-negocio-y-requisitos.md#rf-22) | — | [CU-012](3-casos-de-uso.md#cu-012) |
| [CA-2](#hu-012-ca-2) | Periodo sin casos | — | — | [RN-29](2-reglas-de-negocio-y-requisitos.md#rn-29) | [CU-012](3-casos-de-uso.md#cu-012) |


<a id="hu-013"></a>

### HU-013 — Reabrir un caso

**Tabla 16**  
*Historia de usuario HU-013: Reabrir un caso*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-013</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Reabrir un caso</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Usuario solicitante, quiero reabrir un caso dentro de los 5 días hábiles siguientes a su solución si el problema continúa, para retomar el mismo caso sin tener que empezar desde cero.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que Marcela Ríos ha iniciado sesión
<strong>Y</strong> su caso MA-2026-000130 fue marcado como “resuelto” el 1 de marzo de 2026
</blockquote>
<a id="hu-013-ca-1"></a><strong>Escenario: CA-1 Reapertura dentro del plazo permitido</strong>
<blockquote>
<em># reabrirCaso() · RN-007 (5 días hábiles)</em>
<strong>Cuando</strong> Marcela solicita reabrir el caso MA-2026-000130 el 4 de marzo de 2026, indicando el motivo “el problema volvió a presentarse”
<strong>Entonces</strong> el sistema reabre el caso conservando el mismo número de seguimiento MA-2026-000130
<strong>Y</strong> aumenta en uno el número de veces que el caso ha sido reabierto
<strong>Y</strong> guarda el motivo indicado por Marcela
</blockquote>
<a id="hu-013-ca-2"></a><strong>Escenario: CA-2 Rechazo por vencimiento del plazo</strong>
<blockquote>
<strong>Dado</strong> que han pasado más de 5 días hábiles desde que el caso MA-2026-000130 fue resuelto
<strong>Cuando</strong> Marcela intenta reabrirlo
<strong>Entonces</strong> el sistema no permite la reapertura
<strong>Y</strong> le explica que el plazo para reabrir ya venció
</blockquote>
<a id="hu-013-ca-3"></a><strong>Escenario: CA-3 El motivo de reapertura es obligatorio</strong>
<blockquote>
<strong>Cuando</strong> Marcela intenta reabrir el caso MA-2026-000130 sin escribir ningún motivo
<strong>Entonces</strong> el sistema no permite continuar hasta que indique un motivo
</blockquote>
<a id="hu-013-ca-4"></a><strong>Escenario: CA-4 Solo puede reabrirse un caso resuelto</strong>
<blockquote>
<strong>Dado</strong> que el caso MA-2026-000145 está en situación “en atención”, no “resuelto”
<strong>Cuando</strong> Marcela intenta reabrirlo
<strong>Entonces</strong> el sistema no lo permite
</blockquote>
<a id="hu-013-ca-5"></a><strong>Escenario: CA-5 El caso reabierto conserva su historial, comentarios y adjuntos</strong>
<blockquote>
<strong>Cuando</strong> el caso MA-2026-000130 queda reabierto
<strong>Entonces</strong> conserva todo su historial, comentarios y archivos adjuntos anteriores
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre reabrir casos. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (P3: "En varios casos los usuarios no saben si su solicitud fue recibida o atendida", lo que exige poder retomar un caso resuelto sin empezar de cero).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-23</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-013**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P3](../fase_0/0.4.1-entrevista-resultados.md#p3) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-013-ca-1), [CA-2](#hu-013-ca-2), [CA-3](#hu-013-ca-3), [CA-4](#hu-013-ca-4), [CA-5](#hu-013-ca-5) | Ficha de la HU |
> | RF derivados | [RF-23](2-reglas-de-negocio-y-requisitos.md#rf-23) | Ficha de la HU |
> | RN | [RN-08](2-reglas-de-negocio-y-requisitos.md#rn-08), [RN-11](2-reglas-de-negocio-y-requisitos.md#rn-11) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-013) |
> | Casos de uso | [CU-013](3-casos-de-uso.md#cu-013) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-013) |
> | Caso de uso que nace de esta HU | [CU-013](3-casos-de-uso.md#cu-013) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-05](4-mockups.md#mk-05) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-013) |
> | Entidades · Clase.Método | CasoSoporte · CasoSoporte.reabrirCaso() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-013) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-013) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-013**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-013-ca-1) | Reapertura dentro del plazo permitido | — | — | [RN-11](2-reglas-de-negocio-y-requisitos.md#rn-11) | [CU-013](3-casos-de-uso.md#cu-013) |
| [CA-2](#hu-013-ca-2) | Rechazo por vencimiento del plazo | — | — | [RN-11](2-reglas-de-negocio-y-requisitos.md#rn-11) | [CU-013](3-casos-de-uso.md#cu-013) |
| [CA-3](#hu-013-ca-3) | El motivo de reapertura es obligatorio | — | — | [RN-11](2-reglas-de-negocio-y-requisitos.md#rn-11) | [CU-013](3-casos-de-uso.md#cu-013) |
| [CA-4](#hu-013-ca-4) | Solo puede reabrirse un caso resuelto | — | — | [RN-11](2-reglas-de-negocio-y-requisitos.md#rn-11) | [CU-013](3-casos-de-uso.md#cu-013) |
| [CA-5](#hu-013-ca-5) | El caso reabierto conserva su historial, comentarios y adjuntos | — | — | [RN-11](2-reglas-de-negocio-y-requisitos.md#rn-11) | — |


<a id="hu-015"></a>

### HU-015 — Consultar información del personal de soporte

**Tabla 17**  
*Historia de usuario HU-015: Consultar información del personal de soporte*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-015</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Consultar información del personal de soporte</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Supervisor de soporte, quiero ver qué tipo de casos puede atender cada persona de soporte y su disponibilidad actual, para asignar cada caso a la persona más adecuada.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que la supervisora Patricia Londoño ha iniciado sesión
</blockquote>
<a id="hu-015-ca-1"></a><strong>Escenario: CA-1 Disponibilidad de una persona específica</strong>
<blockquote>
<em># InfoPersonalSoporte.obtenerInfoSoporte()</em>
<strong>Dado</strong> que el técnico Carlos Peña tiene disponibilidad “disponible”
<strong>Cuando</strong> Patricia consulta la disponibilidad de Carlos
<strong>Entonces</strong> el sistema le muestra “disponible”
</blockquote>
<a id="hu-015-ca-2"></a><strong>Escenario: CA-2 Disponibilidad de todo el equipo de soporte</strong>
<blockquote>
<strong>Cuando</strong> Patricia consulta la disponibilidad de todo el equipo
<strong>Entonces</strong> ve el estado de cada persona de soporte: disponible, ocupado o ausente
</blockquote>
<a id="hu-015-ca-3"></a><strong>Escenario: CA-3 Persona sin información de disponibilidad registrada</strong>
<blockquote>
<strong>Dado</strong> que la técnica Juliana Gómez nunca ha actualizado su disponibilidad
<strong>Cuando</strong> Patricia consulta su disponibilidad
<strong>Entonces</strong> el sistema le indica que no hay información registrada, en lugar de mostrar un dato incorrecto
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P8 de los resultados por pregunta (P8: "Los usuarios suelen volver a escribir, usar otro medio o preguntar a otra persona de TI"). (los usuarios recurren a preguntar a otra persona de TI; el supervisor necesita saber quién puede atender).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-24</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-015**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P8](../fase_0/0.4.1-entrevista-resultados.md#p8) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-015-ca-1), [CA-2](#hu-015-ca-2), [CA-3](#hu-015-ca-3) | Ficha de la HU |
> | RF derivados | [RF-24](2-reglas-de-negocio-y-requisitos.md#rf-24) | Ficha de la HU |
> | RN | [RN-28](2-reglas-de-negocio-y-requisitos.md#rn-28) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-015) |
> | Casos de uso | [CU-015](3-casos-de-uso.md#cu-015) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-015) |
> | Caso de uso que nace de esta HU | [CU-015](3-casos-de-uso.md#cu-015) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-11](4-mockups.md#mk-11) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-015) |
> | Entidades · Clase.Método | InfoPersonalSoporte · InfoPersonalSoporte.obtenerInfoSoporte() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-015) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-015) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-015**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-015-ca-1) | Disponibilidad de una persona específica | — | — | — | [CU-015](3-casos-de-uso.md#cu-015) |
| [CA-2](#hu-015-ca-2) | Disponibilidad de todo el equipo de soporte | — | — | — | — |
| [CA-3](#hu-015-ca-3) | Persona sin información de disponibilidad registrada | — | — | [RN-28](2-reglas-de-negocio-y-requisitos.md#rn-28) | [CU-015](3-casos-de-uso.md#cu-015) |


<a id="hu-016"></a>

### HU-016 — Registrar usuarios del sistema

**Tabla 18**  
*Historia de usuario HU-016: Registrar usuarios del sistema*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-016</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Registrar usuarios del sistema</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Administrador, quiero registrar nuevos usuarios con su nombre, cargo, área y rol dentro del sistema, para mantener actualizada la información de las personas que pueden usar la mesa de ayuda.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el administrador Jorge Ramírez ha iniciado sesión
</blockquote>
<a id="hu-016-ca-1"></a><strong>Escenario: CA-1 Registro exitoso de un usuario</strong>
<blockquote>
<em># Usuario.crearUsuario(), validarCorreoUnico(), encriptarContrasena(), Catalogo.obtener(id) (área activa)</em>
<strong>Cuando</strong> Jorge registra un usuario con estos datos: Campo Valor Nombre Diego Salazar Correo diego.salazar@nexaservicios.com Cargo Auxiliar de Logística Área Logística Rol organizacional Operativo Perfil de acceso solicitante
<strong>Entonces</strong> el sistema registra a Diego como usuario activo
<strong>Y</strong> guarda su contraseña inicial de forma protegida, nunca en texto legible
</blockquote>
<a id="hu-016-ca-2"></a><strong>Escenario: CA-2 Rechazo por correo duplicado</strong>
<blockquote>
<em># validarCorreoUnico() · UNIQUE(correo)</em>
<strong>Dado</strong> que ya existe un usuario con el correo diego.salazar@nexaservicios.com
<strong>Cuando</strong> Jorge intenta registrar otro usuario con ese mismo correo
<strong>Entonces</strong> el sistema no registra el usuario
<strong>Y</strong> le explica que ese correo ya está en uso
</blockquote>
<a id="hu-016-ca-3"></a><strong>Esquema del escenario: CA-3 Datos obligatorios incompletos</strong>
<blockquote>
<strong>Cuando</strong> Jorge deja vacío el campo y confirma el registro
<strong>Entonces</strong> el sistema no registra el usuario y señala “” campo mensaje nombre El nombre es obligatorio. correo El correo es obligatorio. perfil de acceso Debe seleccionar un perfil de acceso.
</blockquote>
<a id="hu-016-ca-4"></a><strong>Escenario: CA-4 El área es obligatoria para un perfil solicitante</strong>
<blockquote>
<em># D21/RN04 · id_area obligatorio cuando perfil_acceso = solicitante</em>
<strong>Cuando</strong> Jorge registra un usuario con perfil “solicitante” y no indica su área
<strong>Entonces</strong> el sistema no permite completar el registro hasta que indique el área
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (conclusión general: la empresa requiere un sistema único e implica administrar quiénes pueden usarlo).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-26</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Alta</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-016**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | — | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-016-ca-1), [CA-2](#hu-016-ca-2), [CA-3](#hu-016-ca-3), [CA-4](#hu-016-ca-4) | Ficha de la HU |
> | RF derivados | [RF-26](2-reglas-de-negocio-y-requisitos.md#rf-26) | Ficha de la HU |
> | RN | [RN-17](2-reglas-de-negocio-y-requisitos.md#rn-17), [RN-18](2-reglas-de-negocio-y-requisitos.md#rn-18), [RN-19](2-reglas-de-negocio-y-requisitos.md#rn-19) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-016) |
> | Casos de uso | [CU-016](3-casos-de-uso.md#cu-016) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-016) |
> | Caso de uso que nace de esta HU | [CU-016](3-casos-de-uso.md#cu-016) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-14](4-mockups.md#mk-14) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-016) |
> | Entidades · Clase.Método | Usuario, Catalogo · Usuario.crearUsuario(), encriptarContrasena(), validarCorreoUnico();  Catalogo.obtener() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-016) |
> | Mensajes de secuencia | Sec. CU-016: crearUsuario(), encriptarContrasena(), validarCorreoUnico(), obtener() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-016) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-016**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-016-ca-1) | Registro exitoso de un usuario | — | — | [RN-19](2-reglas-de-negocio-y-requisitos.md#rn-19) | [CU-016](3-casos-de-uso.md#cu-016) |
| [CA-2](#hu-016-ca-2) | Rechazo por correo duplicado | — | — | [RN-17](2-reglas-de-negocio-y-requisitos.md#rn-17) | [CU-016](3-casos-de-uso.md#cu-016) |
| [CA-3](#hu-016-ca-3) | Datos obligatorios incompletos | — | — | — | [CU-016](3-casos-de-uso.md#cu-016) |
| [CA-4](#hu-016-ca-4) | El área es obligatoria para un perfil solicitante | — | — | [RN-18](2-reglas-de-negocio-y-requisitos.md#rn-18) | [CU-016](3-casos-de-uso.md#cu-016) |


<a id="hu-017"></a>

### HU-017 — Consultar usuarios registrados

**Tabla 19**  
*Historia de usuario HU-017: Consultar usuarios registrados*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-017</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Consultar usuarios registrados</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Personal de soporte, quiero consultar el listado de usuarios registrados con su cargo y área, para saber quién hace la solicitud y a qué área pertenece.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el técnico Carlos Peña ha iniciado sesión
</blockquote>
<a id="hu-017-ca-1"></a><strong>Escenario: CA-1 Listado con cargo y área</strong>
<blockquote>
<em># Usuario.obtenerUsuario() · RF-27</em>
<strong>Cuando</strong> Carlos consulta el listado de usuarios registrados
<strong>Entonces</strong> ve el nombre, cargo, área y rol de cada uno, incluyendo a Marcela Ríos (Contabilidad) y Diego Salazar (Logística)
</blockquote>
<a id="hu-017-ca-2"></a><strong>Escenario: CA-2 Búsqueda por nombre o correo</strong>
<blockquote>
<strong>Cuando</strong> Carlos busca “Marcela”
<strong>Entonces</strong> el sistema le muestra a Marcela Ríos con su cargo y área
</blockquote>
<a id="hu-017-ca-3"></a><strong>Escenario: CA-3 Búsqueda sin resultados</strong>
<blockquote>
<strong>Cuando</strong> Carlos busca un nombre que no corresponde a ningún usuario registrado
<strong>Entonces</strong> el sistema le indica que no encontró resultados, sin mostrar registros que no correspondan
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (P1: "La mayoría de participantes actúan como usuarios que solicitan ayuda, aunque también hay personal de TI y roles de coordinación", lo que exige identificar a cada solicitante).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-27</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-017**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P1](../fase_0/0.4.1-entrevista-resultados.md#p1) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-017-ca-1), [CA-2](#hu-017-ca-2), [CA-3](#hu-017-ca-3) | Ficha de la HU |
> | RF derivados | [RF-27](2-reglas-de-negocio-y-requisitos.md#rf-27) | Ficha de la HU |
> | RN | [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-017) |
> | Casos de uso | [CU-017](3-casos-de-uso.md#cu-017) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-017) |
> | Caso de uso que nace de esta HU | [CU-017](3-casos-de-uso.md#cu-017) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-13](4-mockups.md#mk-13) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-017) |
> | Entidades · Clase.Método | Usuario · Usuario.obtenerUsuario() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-017) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-017) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-017**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-017-ca-1) | Listado con cargo y área | — | [RF-27](2-reglas-de-negocio-y-requisitos.md#rf-27) | — | [CU-017](3-casos-de-uso.md#cu-017) |
| [CA-2](#hu-017-ca-2) | Búsqueda por nombre o correo | — | — | — | — |
| [CA-3](#hu-017-ca-3) | Búsqueda sin resultados | — | — | — | [CU-017](3-casos-de-uso.md#cu-017) |


<a id="hu-018"></a>

### HU-018 — Indicar tipo de problema

**Tabla 20**  
*Historia de usuario HU-018: Indicar tipo de problema*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-018</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Indicar tipo de problema</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Usuario solicitante, quiero seleccionar el tipo de problema que estoy reportando, como equipo, internet, programa o acceso, para que mi caso llegue a la persona que mejor pueda ayudarme.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que Marcela Ríos está reportando un problema
<strong>Y</strong> los tipos de problema activos son Internet, Hardware, Programa y Acceso
</blockquote>
<a id="hu-018-ca-1"></a><strong>Escenario: CA-1 Selección de un tipo de problema activo</strong>
<blockquote>
<em># Catalogo.obtener(id) · consulta solo las opciones activas (TipoProblema)</em>
<strong>Cuando</strong> Marcela selecciona el tipo de problema “Hardware”
<strong>Entonces</strong> el sistema asocia ese tipo de problema a su caso
</blockquote>
<a id="hu-018-ca-2"></a><strong>Escenario: CA-2 Solo se muestran tipos activos</strong>
<blockquote>
<em># tipo_problema.estado = activo</em>
<strong>Dado</strong> que el tipo de problema “Fax” está inactivo
<strong>Cuando</strong> Marcela abre la lista de tipos de problema
<strong>Entonces</strong> no ve “Fax” entre las opciones disponibles
</blockquote>
<a id="hu-018-ca-3"></a><strong>Escenario: CA-3 No se permite escribir un tipo libre</strong>
<blockquote>
<strong>Cuando</strong> Marcela intenta escribir un tipo de problema que no está en la lista
<strong>Entonces</strong> el sistema no se lo permite; debe elegir una de las opciones disponibles
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P11 y P12 de los resultados por pregunta (P11: "Los usuarios reportan tanto problemas urgentes como solicitudes de nuevos servicios"; P12: "Muchos prefieren describir el problema y que el sistema o el área de TI lo clasifique"). Nota de diseño: P12 indica que muchos prefieren no clasificar ellos mismos; por eso la clasificación se acompaña de ejemplos (HU-001 CA-4) y puede corregirse por el personal de soporte (HU-049).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-31</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Alta</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-018**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P11](../fase_0/0.4.1-entrevista-resultados.md#p11), [P12](../fase_0/0.4.1-entrevista-resultados.md#p12) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-018-ca-1), [CA-2](#hu-018-ca-2), [CA-3](#hu-018-ca-3) | Ficha de la HU |
> | RF derivados | [RF-31](2-reglas-de-negocio-y-requisitos.md#rf-31) | Ficha de la HU |
> | RN | [RN-03](2-reglas-de-negocio-y-requisitos.md#rn-03), [RN-04](2-reglas-de-negocio-y-requisitos.md#rn-04) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-018) |
> | Casos de uso | [CU-018](3-casos-de-uso.md#cu-018) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-018) |
> | Caso de uso que nace de esta HU | [CU-018](3-casos-de-uso.md#cu-018) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-02](4-mockups.md#mk-02) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-018) |
> | Entidades · Clase.Método | TipoProblema · Catalogo.obtener() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-018) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-018) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-018**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-018-ca-1) | Selección de un tipo de problema activo | — | — | — | [CU-018](3-casos-de-uso.md#cu-018) |
| [CA-2](#hu-018-ca-2) | Solo se muestran tipos activos | — | — | [RN-04](2-reglas-de-negocio-y-requisitos.md#rn-04) | — |
| [CA-3](#hu-018-ca-3) | No se permite escribir un tipo libre | — | — | [RN-04](2-reglas-de-negocio-y-requisitos.md#rn-04) | [CU-018](3-casos-de-uso.md#cu-018) |


<a id="hu-019"></a>

### HU-019 — Indicar tipo de solicitud

**Tabla 21**  
*Historia de usuario HU-019: Indicar tipo de solicitud*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-019</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Indicar tipo de solicitud</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Usuario solicitante, quiero seleccionar el tipo de solicitud que necesito, como acceso, equipo, programa, información u otra ayuda, para que el equipo entienda mejor qué estoy pidiendo.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que Diego Salazar está haciendo una solicitud
<strong>Y</strong> los tipos de solicitud activos son Acceso, Equipo, Información y Otra ayuda
</blockquote>
<a id="hu-019-ca-1"></a><strong>Escenario: CA-1 Selección de un tipo de solicitud activo</strong>
<blockquote>
<em># Catalogo.obtener(id) · consulta solo las opciones activas (TipoSolicitud)</em>
<strong>Cuando</strong> Diego selecciona el tipo de solicitud “Acceso”
<strong>Entonces</strong> el sistema asocia ese tipo de solicitud a su caso
</blockquote>
<a id="hu-019-ca-2"></a><strong>Escenario: CA-2 Solo se muestran tipos activos</strong>
<blockquote>
<strong>Dado</strong> que el tipo de solicitud “Capacitación” está inactivo
<strong>Cuando</strong> Diego abre la lista de tipos de solicitud
<strong>Entonces</strong> no ve “Capacitación” entre las opciones disponibles
</blockquote>
<a id="hu-019-ca-3"></a><strong>Escenario: CA-3 No se permite escribir un tipo libre</strong>
<blockquote>
<strong>Cuando</strong> Diego intenta escribir un tipo de solicitud que no está en la lista
<strong>Entonces</strong> el sistema no se lo permite
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P11 y P12 de los resultados por pregunta (P11: "Los usuarios reportan tanto problemas urgentes como solicitudes de nuevos servicios"; P12: "Muchos prefieren describir el problema y que el sistema o el área de TI lo clasifique"). Nota de diseño: P12 indica que muchos prefieren no clasificar ellos mismos; por eso la clasificación se acompaña de ejemplos (HU-001 CA-4) y puede corregirse por el personal de soporte (HU-049).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-32</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Alta</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-019**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P11](../fase_0/0.4.1-entrevista-resultados.md#p11), [P12](../fase_0/0.4.1-entrevista-resultados.md#p12) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-019-ca-1), [CA-2](#hu-019-ca-2), [CA-3](#hu-019-ca-3) | Ficha de la HU |
> | RF derivados | [RF-32](2-reglas-de-negocio-y-requisitos.md#rf-32) | Ficha de la HU |
> | RN | [RN-03](2-reglas-de-negocio-y-requisitos.md#rn-03), [RN-04](2-reglas-de-negocio-y-requisitos.md#rn-04) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-019) |
> | Casos de uso | [CU-019](3-casos-de-uso.md#cu-019) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-019) |
> | Caso de uso que nace de esta HU | [CU-019](3-casos-de-uso.md#cu-019) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-02](4-mockups.md#mk-02) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-019) |
> | Entidades · Clase.Método | TipoSolicitud · Catalogo.obtener() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-019) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-019) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-019**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-019-ca-1) | Selección de un tipo de solicitud activo | — | — | — | [CU-019](3-casos-de-uso.md#cu-019) |
| [CA-2](#hu-019-ca-2) | Solo se muestran tipos activos | — | — | [RN-04](2-reglas-de-negocio-y-requisitos.md#rn-04) | — |
| [CA-3](#hu-019-ca-3) | No se permite escribir un tipo libre | — | — | [RN-04](2-reglas-de-negocio-y-requisitos.md#rn-04) | [CU-019](3-casos-de-uso.md#cu-019) |


<a id="hu-020"></a>

### HU-020 — Indicar clase de solicitud

**Tabla 22**  
*Historia de usuario HU-020: Indicar clase de solicitud*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-020</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Indicar clase de solicitud</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Usuario solicitante, quiero indicar si necesito algo nuevo, cambiar algo que ya existe o hacer una consulta, para que el equipo de soporte entienda desde el inicio qué tipo de atención necesito.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que Diego Salazar está registrando una solicitud
</blockquote>
<a id="hu-020-ca-1"></a><strong>Esquema del escenario: CA-1 Clase de solicitud disponible</strong>
<blockquote>
<em># CasoSoporte.crearCaso() · registra clase_solicitud · RF-33</em>
<strong>Cuando</strong> Diego indica que su solicitud es de clase
<strong>Entonces</strong> el sistema la asocia a su caso clase nuevo cambio consulta
</blockquote>
<a id="hu-020-ca-2"></a><strong>Escenario: CA-2 La clase de solicitud solo se pide para solicitudes</strong>
<blockquote>
<em># clase_solicitud solo aplica si tipo_caso = solicitud</em>
<strong>Cuando</strong> Diego está reportando un problema, no una solicitud
<strong>Entonces</strong> el sistema no le pide la clase de solicitud
</blockquote>
<a id="hu-020-ca-3"></a><strong>Escenario: CA-3 Dato obligatorio para solicitudes</strong>
<blockquote>
<strong>Cuando</strong> Diego registra una solicitud sin elegir ninguna clase
<strong>Entonces</strong> el sistema no le permite continuar hasta que elija una
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P12 de los resultados por pregunta (P12: "Muchos prefieren describir el problema y que el sistema o el área de TI lo clasifique"). Nota de diseño: P12 indica que muchos prefieren no clasificar ellos mismos; por eso la clasificación se acompaña de ejemplos (HU-001 CA-4) y puede corregirse por el personal de soporte (HU-049).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-33</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-020**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P12](../fase_0/0.4.1-entrevista-resultados.md#p12) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-020-ca-1), [CA-2](#hu-020-ca-2), [CA-3](#hu-020-ca-3) | Ficha de la HU |
> | RF derivados | [RF-33](2-reglas-de-negocio-y-requisitos.md#rf-33) | Ficha de la HU |
> | RN | [RN-03](2-reglas-de-negocio-y-requisitos.md#rn-03) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-020) |
> | Casos de uso | [CU-020](3-casos-de-uso.md#cu-020) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-020) |
> | Caso de uso que nace de esta HU | [CU-020](3-casos-de-uso.md#cu-020) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-02](4-mockups.md#mk-02) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-020) |
> | Entidades · Clase.Método | CasoSoporte (atributo clase_solicitud) · CasoSoporte.crearCaso() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-020) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-020) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-020**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-020-ca-1) | Clase de solicitud disponible | — | [RF-33](2-reglas-de-negocio-y-requisitos.md#rf-33) | — | [CU-020](3-casos-de-uso.md#cu-020) |
| [CA-2](#hu-020-ca-2) | La clase de solicitud solo se pide para solicitudes | — | — | [RN-03](2-reglas-de-negocio-y-requisitos.md#rn-03) | — |
| [CA-3](#hu-020-ca-3) | Dato obligatorio para solicitudes | — | — | [RN-03](2-reglas-de-negocio-y-requisitos.md#rn-03) | [CU-020](3-casos-de-uso.md#cu-020) |


<a id="hu-021"></a>

### HU-021 — Indicar cuántas personas se ven afectadas

**Tabla 23**  
*Historia de usuario HU-021: Indicar cuántas personas se ven afectadas*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-021</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Indicar cuántas personas se ven afectadas</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Usuario solicitante, quiero indicar si el problema me afecta solo a mí, a mi área o a toda la empresa, para que el sistema ayude a reconocer qué tan importante es atender el caso.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que Marcela Ríos está registrando un caso
</blockquote>
<a id="hu-021-ca-1"></a><strong>Esquema del escenario: CA-1 Registro de la afectación indicada</strong>
<blockquote>
<em># TablaImportancia.afectacion</em>
<strong>Cuando</strong> Marcela indica que el problema afecta a
<strong>Entonces</strong> el sistema guarda esa afectación para su caso afectación solo a ella (usuario) a su área a toda la empresa
</blockquote>
<a id="hu-021-ca-2"></a><strong>Escenario: CA-2 Dato obligatorio</strong>
<blockquote>
<strong>Cuando</strong> Marcela intenta enviar su caso sin indicar a quién afecta
<strong>Entonces</strong> el sistema no le permite continuar hasta que lo indique
</blockquote>
<a id="hu-021-ca-3"></a><strong>Escenario: CA-3 La afectación se usa para calcular la importancia</strong>
<blockquote>
<em># calcularResultadoImportancia() combina afectación y urgencia</em>
<strong>Cuando</strong> Marcela indica que el problema afecta a toda la empresa
<strong>Entonces</strong> ese dato se combina con la urgencia indicada para calcular el nivel de importancia del caso
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P12 de los resultados por pregunta (P12: "Muchos prefieren describir el problema y que el sistema o el área de TI lo clasifique"). Nota de diseño: P12 indica que muchos prefieren no clasificar ellos mismos; por eso el solicitante solo indica afectación y urgencia, y el sistema calcula la importancia.</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-18, RF-19</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Alta</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-021**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P12](../fase_0/0.4.1-entrevista-resultados.md#p12) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-021-ca-1), [CA-2](#hu-021-ca-2), [CA-3](#hu-021-ca-3) | Ficha de la HU |
> | RF derivados | [RF-18](2-reglas-de-negocio-y-requisitos.md#rf-18), [RF-19](2-reglas-de-negocio-y-requisitos.md#rf-19) | Ficha de la HU |
> | RN | [RN-01](2-reglas-de-negocio-y-requisitos.md#rn-01), [RN-05](2-reglas-de-negocio-y-requisitos.md#rn-05) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-021) |
> | Casos de uso | [CU-021](3-casos-de-uso.md#cu-021), [CU-022](3-casos-de-uso.md#cu-022) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-021) |
> | Caso de uso que nace de esta HU | [CU-021](3-casos-de-uso.md#cu-021) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-02](4-mockups.md#mk-02) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-021) |
> | Entidades · Clase.Método | TablaImportancia · TablaImportancia.calcularResultadoImportancia() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-021) |
> | Mensajes de secuencia | Sec. CU-001: calcularResultadoImportancia() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-021) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-021**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-021-ca-1) | Registro de la afectación indicada | — | — | — | [CU-021](3-casos-de-uso.md#cu-021) |
| [CA-2](#hu-021-ca-2) | Dato obligatorio | — | — | [RN-01](2-reglas-de-negocio-y-requisitos.md#rn-01) | [CU-021](3-casos-de-uso.md#cu-021) |
| [CA-3](#hu-021-ca-3) | La afectación se usa para calcular la importancia | — | — | [RN-05](2-reglas-de-negocio-y-requisitos.md#rn-05) | — |


<a id="hu-022"></a>

### HU-022 — Indicar qué tan rápido necesito atención

**Tabla 24**  
*Historia de usuario HU-022: Indicar qué tan rápido necesito atención*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-022</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Indicar qué tan rápido necesito atención</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Usuario solicitante, quiero indicar si necesito atención baja, media, alta o crítica según la urgencia del caso, para que el sistema ayude a ordenar los casos según la necesidad real de atención.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que Marcela Ríos está registrando un caso
</blockquote>
<a id="hu-022-ca-1"></a><strong>Esquema del escenario: CA-1 Combinación de afectación y urgencia</strong>
<blockquote>
<em># calcularResultadoImportancia() · matriz de prioridad (P1 = más alta, P4 = más baja)</em>
<strong>Cuando</strong> Marcela indica afectación y urgencia
<strong>Entonces</strong> el sistema calcula automáticamente la importancia , sin que ella tenga que calcularla afectación urgencia resultado usuario baja P4 área crítica P1 empresa crítica P1 empresa baja P3
</blockquote>
<a id="hu-022-ca-2"></a><strong>Escenario: CA-2 La importancia calculada no cambia después</strong>
<blockquote>
<em># resultado_importancia se fija una sola vez, no se recalcula</em>
<strong>Dado</strong> que el caso MA-2026-000145 quedó con importancia P2
<strong>Cuando</strong> el administrador cambia más adelante las reglas generales de prioridad
<strong>Entonces</strong> el caso MA-2026-000145 conserva su importancia P2
</blockquote>
<a id="hu-022-ca-3"></a><strong>Escenario: CA-3 Urgencia obligatoria</strong>
<blockquote>
<strong>Cuando</strong> Marcela intenta enviar su caso sin indicar la urgencia
<strong>Entonces</strong> el sistema no le permite continuar hasta que la indique
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P12 y P13 de los resultados por pregunta (P12: "Muchos prefieren describir el problema y que el sistema o el área de TI lo clasifique"; P13: "La mayoría espera respuestas rápidas, desde menos de una hora hasta el mismo día"). Nota de diseño: P12 indica que muchos prefieren no clasificar ellos mismos; por eso el solicitante solo indica afectación y urgencia, y el sistema calcula la importancia.</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-18, RF-19</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Alta</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-022**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P12](../fase_0/0.4.1-entrevista-resultados.md#p12), [P13](../fase_0/0.4.1-entrevista-resultados.md#p13) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-022-ca-1), [CA-2](#hu-022-ca-2), [CA-3](#hu-022-ca-3) | Ficha de la HU |
> | RF derivados | [RF-18](2-reglas-de-negocio-y-requisitos.md#rf-18), [RF-19](2-reglas-de-negocio-y-requisitos.md#rf-19) | Ficha de la HU |
> | RN | [RN-01](2-reglas-de-negocio-y-requisitos.md#rn-01), [RN-05](2-reglas-de-negocio-y-requisitos.md#rn-05) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-022) |
> | Casos de uso | [CU-021](3-casos-de-uso.md#cu-021), [CU-022](3-casos-de-uso.md#cu-022) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-022) |
> | Caso de uso que nace de esta HU | [CU-022](3-casos-de-uso.md#cu-022) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-02](4-mockups.md#mk-02) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-022) |
> | Entidades · Clase.Método | TablaImportancia · TablaImportancia.calcularResultadoImportancia() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-022) |
> | Mensajes de secuencia | Sec. CU-001: calcularResultadoImportancia() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-022) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-022**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-022-ca-1) | Combinación de afectación y urgencia | — | — | [RN-05](2-reglas-de-negocio-y-requisitos.md#rn-05) | [CU-022](3-casos-de-uso.md#cu-022) |
| [CA-2](#hu-022-ca-2) | La importancia calculada no cambia después | — | — | [RN-05](2-reglas-de-negocio-y-requisitos.md#rn-05) | — |
| [CA-3](#hu-022-ca-3) | Urgencia obligatoria | — | — | [RN-01](2-reglas-de-negocio-y-requisitos.md#rn-01) | [CU-022](3-casos-de-uso.md#cu-022) |


<a id="hu-023"></a>

### HU-023 — Iniciar sesión

**Tabla 25**  
*Historia de usuario HU-023: Iniciar sesión*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-023</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Iniciar sesión</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Usuario solicitante, Personal de soporte, Supervisor de soporte o Administrador, quiero ingresar al sistema con mis datos de acceso, validados de forma segura y con protección ante intentos repetidos incorrectos, para usar solo las funciones que corresponden a mi rol.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que Marcela Ríos está registrada con correo marcela.rios@nexaservicios.com y cuenta activa
</blockquote>
<a id="hu-023-ca-1"></a><strong>Escenario: CA-1 Ingreso exitoso</strong>
<blockquote>
<em># autenticar() · resetearIntentosFallidos()</em>
<strong>Cuando</strong> Marcela ingresa su correo y su contraseña correcta
<strong>Entonces</strong> el sistema le concede acceso a las funciones de su rol de solicitante
<strong>Y</strong> reinicia su contador de intentos fallidos
</blockquote>
<a id="hu-023-ca-2"></a><strong>Escenario: CA-2 Rechazo por datos incorrectos</strong>
<blockquote>
<em># autenticar() devuelve falso · registrarIntentoFallido()</em>
<strong>Cuando</strong> Marcela ingresa su correo correcto con una contraseña equivocada
<strong>Entonces</strong> el sistema rechaza el ingreso
<strong>Y</strong> le muestra un mensaje genérico, sin indicar si el error fue el correo o la contraseña
<strong>Y</strong> aumenta su contador de intentos fallidos
</blockquote>
<a id="hu-023-ca-3"></a><strong>Escenario: CA-3 Bloqueo por intentos fallidos repetidos</strong>
<blockquote>
<em># bloquearCuenta() · RN-20 (límite de 4 intentos fallidos)</em>
<strong>Dado que Marcela ha fallado el ingreso 3 veces seguidas y el límite de la política de seguridad es de 4 intentos fallidos</strong>
<strong>Cuando</strong> intenta ingresar una vez más
<strong>Entonces</strong> el sistema bloquea su cuenta temporalmente
<strong>Y</strong> le informa que su cuenta quedó bloqueada
</blockquote>
<a id="hu-023-ca-4"></a><strong>Escenario: CA-4 Cada rol ve solo sus funciones permitidas</strong>
<blockquote>
<strong>Cuando</strong> el técnico Carlos Peña inicia sesión con sus datos correctos
<strong>Entonces</strong> ve las funciones de personal de soporte
<strong>Pero</strong> no ve las funciones exclusivas de administrador, como registrar nuevos usuarios
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (conclusión general: un sistema único centralizado requiere controlar el acceso de cada usuario).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-34</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Alta</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-023**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | — | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-023-ca-1), [CA-2](#hu-023-ca-2), [CA-3](#hu-023-ca-3), [CA-4](#hu-023-ca-4) | Ficha de la HU |
> | RF derivados | [RF-34](2-reglas-de-negocio-y-requisitos.md#rf-34) | Ficha de la HU |
> | RN | [RN-20](2-reglas-de-negocio-y-requisitos.md#rn-20), [RN-21](2-reglas-de-negocio-y-requisitos.md#rn-21), [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-023) |
> | Casos de uso | [CU-023](3-casos-de-uso.md#cu-023) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-023) |
> | Caso de uso que nace de esta HU | [CU-023](3-casos-de-uso.md#cu-023) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-01](4-mockups.md#mk-01) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-023) |
> | Entidades · Clase.Método | Usuario · Usuario.autenticar(), registrarIntentoFallido(), resetearIntentosFallidos(), bloquearCuenta() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-023) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-023) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-023**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-023-ca-1) | Ingreso exitoso | — | — | — | [CU-023](3-casos-de-uso.md#cu-023) |
| [CA-2](#hu-023-ca-2) | Rechazo por datos incorrectos | — | — | [RN-20](2-reglas-de-negocio-y-requisitos.md#rn-20) | [CU-023](3-casos-de-uso.md#cu-023) |
| [CA-3](#hu-023-ca-3) | Bloqueo por intentos fallidos repetidos | [RN-20](2-reglas-de-negocio-y-requisitos.md#rn-20) | — | [RN-20](2-reglas-de-negocio-y-requisitos.md#rn-20) | [CU-023](3-casos-de-uso.md#cu-023) |
| [CA-4](#hu-023-ca-4) | Cada rol ve solo sus funciones permitidas | — | — | [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | — |


<a id="hu-024"></a>

### HU-024 — Recuperar contraseña

**Tabla 26**  
*Historia de usuario HU-024: Recuperar contraseña*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-024</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Recuperar contraseña</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Usuario solicitante, Personal de soporte, Supervisor de soporte o Administrador, quiero recuperar mi contraseña mediante un enlace o código temporal, protegido y de un solo uso, enviado a mi correo registrado, para volver a ingresar al sistema de forma segura sin pedir ayuda por otros medios.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que Marcela Ríos está registrada con correo marcela.rios@nexaservicios.com
</blockquote>
<a id="hu-024-ca-1"></a><strong>Escenario: CA-1 Solicitud del enlace de recuperación</strong>
<blockquote>
<em># generarTokenRecuperacion() · enviarEnlaceRecuperacion() · RN-22 · RF-35</em>
<strong>Cuando</strong> Marcela solicita recuperar su contraseña indicando su correo registrado
<strong>Entonces</strong> el sistema le envía a ese correo un enlace temporal y protegido para restablecerla
</blockquote>
<a id="hu-024-ca-2"></a><strong>Escenario: CA-2 Restablecimiento exitoso dentro del tiempo límite</strong>
<blockquote>
<em># restablecerContrasena() · encriptarContrasena() · TokenRecuperacion.esValido() · RN-19 · RN-22</em>
<strong>Dado</strong> que el enlace enviado a Marcela todavía está vigente y no ha sido usado
<strong>Cuando</strong> Marcela lo abre y define una nueva contraseña
<strong>Entonces</strong> el sistema actualiza su contraseña
<strong>Y</strong> le permite ingresar con la nueva contraseña
</blockquote>
<a id="hu-024-ca-3"></a><strong>Escenario: CA-3 Rechazo por enlace vencido o ya usado</strong>
<blockquote>
<em># esValido() devuelve falso · marcarUsado()</em>
<strong>Dado</strong> que el enlace enviado a Marcela ya fue usado una vez, o ya venció
<strong>Cuando</strong> Marcela intenta usarlo de nuevo
<strong>Entonces</strong> el sistema rechaza el restablecimiento
<strong>Y</strong> le explica que debe solicitar un enlace nuevo
</blockquote>
<a id="hu-024-ca-4"></a><strong>Escenario: CA-4 Un enlace nuevo invalida el anterior</strong>
<blockquote>
<em># TokenRecuperacion.revocar()</em>
<strong>Dado</strong> que Marcela ya había solicitado un enlace de recuperación sin usarlo
<strong>Cuando</strong> vuelve a solicitar otro enlace
<strong>Entonces</strong> el enlace anterior queda invalidado
<strong>Y</strong> solo el enlace nuevo permite restablecer la contraseña
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (conclusión general: el control de acceso del sistema único requiere un mecanismo de recuperación de acceso).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-35</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Alta</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-024**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | — | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-024-ca-1), [CA-2](#hu-024-ca-2), [CA-3](#hu-024-ca-3), [CA-4](#hu-024-ca-4) | Ficha de la HU |
> | RF derivados | [RF-35](2-reglas-de-negocio-y-requisitos.md#rf-35) | Ficha de la HU |
> | RN | [RN-19](2-reglas-de-negocio-y-requisitos.md#rn-19), [RN-22](2-reglas-de-negocio-y-requisitos.md#rn-22) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-024) |
> | Casos de uso | [CU-024](3-casos-de-uso.md#cu-024) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-024) |
> | Caso de uso que nace de esta HU | [CU-024](3-casos-de-uso.md#cu-024) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-01](4-mockups.md#mk-01), [MK-19](4-mockups.md#mk-19) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-024) |
> | Entidades · Clase.Método | Usuario, TokenRecuperacion · Usuario.generarTokenRecuperacion(), encriptarContrasena(), enviarEnlaceRecuperacion(), restablecerContrasena();  TokenRecuperacion.esValido(), marcarUsado(), revocar() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-024) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-024) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-024**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-024-ca-1) | Solicitud del enlace de recuperación | [RN-22](2-reglas-de-negocio-y-requisitos.md#rn-22) | [RF-35](2-reglas-de-negocio-y-requisitos.md#rf-35) | — | — |
| [CA-2](#hu-024-ca-2) | Restablecimiento exitoso dentro del tiempo límite | [RN-19](2-reglas-de-negocio-y-requisitos.md#rn-19), [RN-22](2-reglas-de-negocio-y-requisitos.md#rn-22) | — | [RN-19](2-reglas-de-negocio-y-requisitos.md#rn-19), [RN-22](2-reglas-de-negocio-y-requisitos.md#rn-22) | [CU-024](3-casos-de-uso.md#cu-024) |
| [CA-3](#hu-024-ca-3) | Rechazo por enlace vencido o ya usado | — | — | [RN-22](2-reglas-de-negocio-y-requisitos.md#rn-22) | [CU-024](3-casos-de-uso.md#cu-024) |
| [CA-4](#hu-024-ca-4) | Un enlace nuevo invalida el anterior | — | — | [RN-22](2-reglas-de-negocio-y-requisitos.md#rn-22) | [CU-024](3-casos-de-uso.md#cu-024) |


<a id="hu-025"></a>

### HU-025 — Cerrar sesión

**Tabla 27**  
*Historia de usuario HU-025: Cerrar sesión*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-025</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Cerrar sesión</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Usuario solicitante, Personal de soporte, Supervisor de soporte o Administrador, quiero cerrar mi sesión cuando termine de usar el sistema, para proteger mi información y evitar que otra persona use mi cuenta.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que Marcela Ríos tiene una sesión abierta en el sistema
</blockquote>
<a id="hu-025-ca-1"></a><strong>Escenario: CA-1 Cierre de sesión exitoso</strong>
<blockquote>
<em># cerrarSesion() · RN-23</em>
<strong>Cuando</strong> Marcela selecciona cerrar sesión
<strong>Entonces</strong> el sistema cierra su sesión
<strong>Y</strong> la devuelve a la pantalla de ingreso
</blockquote>
<a id="hu-025-ca-2"></a><strong>Escenario: CA-2 Las funciones quedan bloqueadas tras el cierre</strong>
<blockquote>
<strong>Dado</strong> que Marcela cerró su sesión
<strong>Cuando</strong> intenta volver a una pantalla del sistema sin iniciar sesión de nuevo
<strong>Entonces</strong> el sistema no le permite el acceso hasta que vuelva a ingresar sus datos
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (conclusión general: el control de acceso del sistema único requiere poder cerrar la sesión).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-36</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Baja</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-025**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | — | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-025-ca-1), [CA-2](#hu-025-ca-2) | Ficha de la HU |
> | RF derivados | [RF-36](2-reglas-de-negocio-y-requisitos.md#rf-36) | Ficha de la HU |
> | RN | [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-025) |
> | Casos de uso | [CU-025](3-casos-de-uso.md#cu-025) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-025) |
> | Caso de uso que nace de esta HU | [CU-025](3-casos-de-uso.md#cu-025) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-04](4-mockups.md#mk-04) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-025) |
> | Entidades · Clase.Método | Usuario · Usuario.cerrarSesion() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-025) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-025) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-025**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-025-ca-1) | Cierre de sesión exitoso | [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | — | — | [CU-025](3-casos-de-uso.md#cu-025) |
| [CA-2](#hu-025-ca-2) | Las funciones quedan bloqueadas tras el cierre | — | — | [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | — |


<a id="hu-026"></a>

### HU-026 — Pasar un caso a otra persona de soporte

**Tabla 28**  
*Historia de usuario HU-026: Pasar un caso a otra persona de soporte*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-026</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Pasar un caso a otra persona de soporte</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Personal de soporte, quiero pasar un caso a otra persona de soporte cuando no pueda resolverlo, para asegurar que el caso sea atendido por quien tenga mayor capacidad de resolverlo.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el técnico Carlos Peña tiene asignado el caso MA-2026-000145
</blockquote>
<a id="hu-026-ca-1"></a><strong>Escenario: CA-1 Reasignación a otro técnico</strong>
<blockquote>
<em># actualizarCaso() · RN-017 · HistorialCaso.registrarHistorial()</em>
<strong>Cuando</strong> Carlos pasa el caso MA-2026-000145 a la técnica Juliana Gómez porque no puede resolverlo
<strong>Entonces</strong> Juliana queda como nueva responsable del caso
<strong>Y</strong> el sistema registra en el historial quién hizo el cambio, a quién se asignó y en qué momento
</blockquote>
<a id="hu-026-ca-2"></a><strong>Escenario: CA-2 Rechazo si el nuevo responsable no es personal de soporte</strong>
<blockquote>
<strong>Cuando</strong> Carlos intenta pasar el caso a Marcela Ríos, cuyo perfil es “solicitante”
<strong>Entonces</strong> el sistema no permite la reasignación
</blockquote>
<a id="hu-026-ca-3"></a><strong>Escenario: CA-3 El nuevo responsable ve el historial previo</strong>
<blockquote>
<strong>Cuando</strong> Juliana recibe el caso MA-2026-000145
<strong>Entonces</strong> puede ver el historial y los comentarios que Carlos ya había registrado
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre el traspaso de casos entre el personal de soporte. La necesidad se deriva como requisito de soporte (P8: "Los usuarios suelen volver a escribir, usar otro medio o preguntar a otra persona de TI"; P10: "Se destacan problemas como demoras, falta de claridad, mala comunicación y dificultad para saber el estado del caso"), pues un caso debe poder pasar a quien pueda resolverlo.</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-15, RF-49</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-026**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P8](../fase_0/0.4.1-entrevista-resultados.md#p8), [P10](../fase_0/0.4.1-entrevista-resultados.md#p10) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-026-ca-1), [CA-2](#hu-026-ca-2), [CA-3](#hu-026-ca-3) | Ficha de la HU |
> | RF derivados | [RF-15](2-reglas-de-negocio-y-requisitos.md#rf-15), [RF-49](2-reglas-de-negocio-y-requisitos.md#rf-49) | Ficha de la HU |
> | RN | [RN-08](2-reglas-de-negocio-y-requisitos.md#rn-08), [RN-09](2-reglas-de-negocio-y-requisitos.md#rn-09) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-026) |
> | Casos de uso | [CU-026](3-casos-de-uso.md#cu-026), [CU-S02](3-casos-de-uso.md#cu-s02) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-026) |
> | Caso de uso que nace de esta HU | [CU-026](3-casos-de-uso.md#cu-026) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-06](4-mockups.md#mk-06) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-026) |
> | Entidades · Clase.Método | CasoSoporte, HistorialCaso · CasoSoporte.actualizarCaso();  HistorialCaso.registrarHistorial() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-026) |
> | Mensajes de secuencia | Sec. CU-001: registrarHistorial();  Sec. CU-007: actualizarCaso() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-026) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-026**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-026-ca-1) | Reasignación a otro técnico | — | — | [RN-08](2-reglas-de-negocio-y-requisitos.md#rn-08) | [CU-026](3-casos-de-uso.md#cu-026) |
| [CA-2](#hu-026-ca-2) | Rechazo si el nuevo responsable no es personal de soporte | — | — | [RN-09](2-reglas-de-negocio-y-requisitos.md#rn-09) | [CU-026](3-casos-de-uso.md#cu-026) |
| [CA-3](#hu-026-ca-3) | El nuevo responsable ve el historial previo | — | — | — | — |


<a id="hu-028"></a>

### HU-028 — Cerrar casos sin respuesta del usuario

**Tabla 29**  
*Historia de usuario HU-028: Cerrar casos sin respuesta del usuario*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-028</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Cerrar casos sin respuesta del usuario</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Personal de soporte, quiero que el sistema cierre un caso resuelto si el usuario no responde después del plazo definido, para evitar que queden casos abiertos sin necesidad.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el caso MA-2026-000130 de Marcela Ríos fue marcado como “resuelto”
</blockquote>
<a id="hu-028-ca-1"></a><strong>Escenario: CA-1 Cierre automático tras el plazo sin respuesta</strong>
<blockquote>
<em># cerrarCaso() automático · RN-008, RN-023 (5 días hábiles)</em>
<strong>Dado</strong> que pasaron 5 días hábiles desde que el caso quedó “resuelto” sin que Marcela respondiera ni lo reabriera
<strong>Cuando</strong> el sistema revisa los casos resueltos vencidos
<strong>Entonces</strong> cambia automáticamente el caso MA-2026-000130 a “cerrado”
<strong>Y</strong> registra en el historial que el cierre fue automático, por vencimiento del plazo
</blockquote>
<a id="hu-028-ca-2"></a><strong>Escenario: CA-2 Aviso al solicitante por el cierre automático</strong>
<blockquote>
<em># Aviso.crearAviso() · RN-015</em>
<strong>Cuando</strong> el caso MA-2026-000130 se cierra automáticamente
<strong>Entonces</strong> Marcela recibe un aviso informándole que su caso fue cerrado por falta de respuesta
</blockquote>
<a id="hu-028-ca-3"></a><strong>Escenario: CA-3 Un caso resuelto dentro del plazo no se cierra solo</strong>
<blockquote>
<strong>Dado</strong> que el caso MA-2026-000145 fue resuelto hace 2 días hábiles
<strong>Cuando</strong> el sistema revisa los casos resueltos vencidos
<strong>Entonces</strong> el caso MA-2026-000145 permanece en “resuelto”, porque aún no se cumplen los 5 días hábiles
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre el cierre automático de casos. La necesidad se deriva como requisito de soporte (P3: "En varios casos los usuarios no saben si su solicitud fue recibida o atendida"; P10: "Se destacan problemas como demoras, falta de claridad, mala comunicación y dificultad para saber el estado del caso"), pues un caso resuelto debe cerrarse y comunicarse sin dejar casos abiertos sin necesidad.</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-37</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-028**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P3](../fase_0/0.4.1-entrevista-resultados.md#p3), [P10](../fase_0/0.4.1-entrevista-resultados.md#p10) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-028-ca-1), [CA-2](#hu-028-ca-2), [CA-3](#hu-028-ca-3) | Ficha de la HU |
> | RF derivados | [RF-37](2-reglas-de-negocio-y-requisitos.md#rf-37) | Ficha de la HU |
> | RN | [RN-08](2-reglas-de-negocio-y-requisitos.md#rn-08), [RN-12](2-reglas-de-negocio-y-requisitos.md#rn-12), [RN-15](2-reglas-de-negocio-y-requisitos.md#rn-15) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-028) |
> | Casos de uso | [CU-028](3-casos-de-uso.md#cu-028) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-028) |
> | Caso de uso que nace de esta HU | [CU-028](3-casos-de-uso.md#cu-028) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-09](4-mockups.md#mk-09) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-028) |
> | Entidades · Clase.Método | CasoSoporte, Aviso · CasoSoporte.cerrarCaso();  Aviso.crearAviso() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-028) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-028) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-028**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-028-ca-1) | Cierre automático tras el plazo sin respuesta | — | — | [RN-12](2-reglas-de-negocio-y-requisitos.md#rn-12) | [CU-028](3-casos-de-uso.md#cu-028) |
| [CA-2](#hu-028-ca-2) | Aviso al solicitante por el cierre automático | — | — | [RN-15](2-reglas-de-negocio-y-requisitos.md#rn-15) | — |
| [CA-3](#hu-028-ca-3) | Un caso resuelto dentro del plazo no se cierra solo | — | — | [RN-12](2-reglas-de-negocio-y-requisitos.md#rn-12) | [CU-028](3-casos-de-uso.md#cu-028) |


<a id="hu-029"></a>

### HU-029 — Definir tiempos de atención

**Tabla 30**  
*Historia de usuario HU-029: Definir tiempos de atención*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-029</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Definir tiempos de atención</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Administrador, quiero definir los tiempos de respuesta y solución según la importancia y tipo de caso, para tener reglas claras sobre cuánto debería tardar la atención.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el administrador Jorge Ramírez ha iniciado sesión
</blockquote>
<a id="hu-029-ca-1"></a><strong>Escenario: CA-1 Creación de una nueva regla de tiempos</strong>
<blockquote>
<em># TiempoAtencionSLA.crearSLA()</em>
<strong>Cuando</strong> Jorge crea una regla para importancia P1 y tipo “problema” con 30 minutos de respuesta y 240 minutos de solución
<strong>Entonces</strong> el sistema guarda la regla como vigente para los nuevos casos P1-problema
</blockquote>
<a id="hu-029-ca-2"></a><strong>Escenario: CA-2 No se permiten dos reglas activas para la misma combinación</strong>
<blockquote>
<strong>Dado</strong> que ya existe una regla activa para P1 y “problema”
<strong>Cuando</strong> Jorge intenta crear otra regla activa para esa misma combinación
<strong>Entonces</strong> el sistema no se lo permite
</blockquote>
<a id="hu-029-ca-3"></a><strong>Escenario: CA-3 Edición sin afectar casos ya cerrados</strong>
<blockquote>
<em># obtenerSLA(id) · actualizarSLA() · versión vigente desde la fecha del cambio</em>
<strong>Dado</strong> que el caso MA-2026-000101 se cerró usando la regla anterior de 30 minutos
<strong>Cuando</strong> Jorge edita la regla de P1-problema a 20 minutos de respuesta
<strong>Entonces</strong> los nuevos casos P1-problema usan 20 minutos
<strong>Y</strong> el caso MA-2026-000101, ya cerrado, conserva su referencia a los 30 minutos originales
</blockquote>
<a id="hu-029-ca-4"></a><strong>Escenario: CA-4 Desactivación de una regla</strong>
<blockquote>
<em># inactivarSLA()</em>
<strong>Cuando</strong> Jorge desactiva la regla de P4-solicitud porque ya no debe usarse
<strong>Entonces</strong> esa regla deja de aplicarse a los casos nuevos
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P4 y P13 de los resultados por pregunta (P4: "Se evidencia que en muchos casos las respuestas se demoran más de lo esperado"; P13: "La mayoría espera respuestas rápidas, desde menos de una hora hasta el mismo día").</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-38</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-029**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P4](../fase_0/0.4.1-entrevista-resultados.md#p4), [P13](../fase_0/0.4.1-entrevista-resultados.md#p13) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-029-ca-1), [CA-2](#hu-029-ca-2), [CA-3](#hu-029-ca-3), [CA-4](#hu-029-ca-4) | Ficha de la HU |
> | RF derivados | [RF-38](2-reglas-de-negocio-y-requisitos.md#rf-38) | Ficha de la HU |
> | RN | [RN-13](2-reglas-de-negocio-y-requisitos.md#rn-13) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-029) |
> | Casos de uso | [CU-029](3-casos-de-uso.md#cu-029) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-029) |
> | Caso de uso que nace de esta HU | [CU-029](3-casos-de-uso.md#cu-029) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-12](4-mockups.md#mk-12) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-029) |
> | Entidades · Clase.Método | TiempoAtencionSLA · TiempoAtencionSLA.crearSLA(), obtenerSLA(), actualizarSLA(), inactivarSLA() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-029) |
> | Mensajes de secuencia | Sec. CU-029: crearSLA(), obtenerSLA(), actualizarSLA(), inactivarSLA() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-029) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-029**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-029-ca-1) | Creación de una nueva regla de tiempos | — | — | — | [CU-029](3-casos-de-uso.md#cu-029) |
| [CA-2](#hu-029-ca-2) | No se permiten dos reglas activas para la misma combinación | — | — | [RN-13](2-reglas-de-negocio-y-requisitos.md#rn-13) | [CU-029](3-casos-de-uso.md#cu-029) |
| [CA-3](#hu-029-ca-3) | Edición sin afectar casos ya cerrados | — | — | [RN-13](2-reglas-de-negocio-y-requisitos.md#rn-13) | [CU-029](3-casos-de-uso.md#cu-029) |
| [CA-4](#hu-029-ca-4) | Desactivación de una regla | — | — | — | [CU-029](3-casos-de-uso.md#cu-029) |


<a id="hu-030"></a>

### HU-030 — Descargar reportes de atención

**Tabla 31**  
*Historia de usuario HU-030: Descargar reportes de atención*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-030</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Descargar reportes de atención</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Supervisor de soporte, quiero descargar reportes de atención en PDF o Excel, para compartir resultados en reuniones o informes de seguimiento.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que la supervisora Patricia Londoño ha iniciado sesión
</blockquote>
<a id="hu-030-ca-1"></a><strong>Esquema del escenario: CA-1 Descarga en el formato elegido</strong>
<blockquote>
<em># CasoSoporte.generarReporte(desde, hasta, formato) · RF-40 · RN-29</em>
<strong>Cuando</strong> Patricia descarga el reporte de atención del mes de marzo en formato
<strong>Entonces</strong> el sistema genera el archivo en ese formato con la misma información del resumen de atención formato PDF Excel
</blockquote>
<a id="hu-030-ca-2"></a><strong>Escenario: CA-2 Periodo sin información</strong>
<blockquote>
<strong>Cuando</strong> Patricia intenta descargar el reporte de un periodo sin ningún caso registrado
<strong>Entonces</strong> el sistema le informa que no hay información para ese periodo, en lugar de generar un archivo vacío
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (P4 y P10: las demoras y dificultades reportadas motivan que el supervisor pueda documentar y compartir resultados de la atención).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-40</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Baja</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-030**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P4](../fase_0/0.4.1-entrevista-resultados.md#p4), [P10](../fase_0/0.4.1-entrevista-resultados.md#p10) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-030-ca-1), [CA-2](#hu-030-ca-2) | Ficha de la HU |
> | RF derivados | [RF-40](2-reglas-de-negocio-y-requisitos.md#rf-40) | Ficha de la HU |
> | RN | [RN-29](2-reglas-de-negocio-y-requisitos.md#rn-29) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-030) |
> | Casos de uso | [CU-030](3-casos-de-uso.md#cu-030) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-030) |
> | Caso de uso que nace de esta HU | [CU-030](3-casos-de-uso.md#cu-030) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-10](4-mockups.md#mk-10) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-030) |
> | Entidades · Clase.Método | CasoSoporte · CasoSoporte.generarReporte() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-030) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-030) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-030**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-030-ca-1) | Descarga en el formato elegido | [RN-29](2-reglas-de-negocio-y-requisitos.md#rn-29) | [RF-40](2-reglas-de-negocio-y-requisitos.md#rf-40) | — | [CU-030](3-casos-de-uso.md#cu-030) |
| [CA-2](#hu-030-ca-2) | Periodo sin información | — | — | [RN-29](2-reglas-de-negocio-y-requisitos.md#rn-29) | [CU-030](3-casos-de-uso.md#cu-030) |


<a id="hu-031"></a>

### HU-031 — Actualizar la información de un usuario registrado

**Tabla 32**  
*Historia de usuario HU-031: Actualizar la información de un usuario registrado*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-031</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Actualizar la información de un usuario registrado</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Administrador, quiero actualizar los datos de un usuario ya registrado, como su cargo, área, rol o estado, para mantener correcta la información de las personas que usan el sistema.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el administrador Jorge Ramírez ha iniciado sesión
<strong>Y</strong> el usuario Diego Salazar está registrado con cargo “Auxiliar de Logística” y área “Logística”
</blockquote>
<a id="hu-031-ca-1"></a><strong>Escenario: CA-1 Actualización exitosa de los datos</strong>
<blockquote>
<em># Usuario.actualizarUsuario()</em>
<strong>Cuando</strong> Jorge cambia el cargo de Diego a “Coordinador de Logística”
<strong>Entonces</strong> el sistema guarda el nuevo cargo
<strong>Y</strong> registra la fecha del cambio y que fue Jorge quien lo hizo
</blockquote>
<a id="hu-031-ca-2"></a><strong>Escenario: CA-2 Rechazo por correo duplicado</strong>
<blockquote>
<em># validarCorreoUnico()</em>
<strong>Dado</strong> que el correo marcela.rios@nexaservicios.com ya pertenece a otro usuario
<strong>Cuando</strong> Jorge intenta cambiar el correo de Diego a ese mismo correo
<strong>Entonces</strong> el sistema no guarda el cambio
<strong>Y</strong> conserva el correo anterior de Diego
</blockquote>
<a id="hu-031-ca-3"></a><strong>Escenario: CA-3 Área obligatoria al pasar a perfil solicitante</strong>
<blockquote>
<strong>Cuando</strong> Jorge cambia el perfil de acceso de un usuario a “solicitante” sin indicarle un área
<strong>Entonces</strong> el sistema no permite guardar el cambio hasta que se indique el área
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (conclusión general: mantener actualizada la información de quienes usan el sistema único).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-28</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-031**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | — | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-031-ca-1), [CA-2](#hu-031-ca-2), [CA-3](#hu-031-ca-3) | Ficha de la HU |
> | RF derivados | [RF-28](2-reglas-de-negocio-y-requisitos.md#rf-28) | Ficha de la HU |
> | RN | [RN-17](2-reglas-de-negocio-y-requisitos.md#rn-17), [RN-18](2-reglas-de-negocio-y-requisitos.md#rn-18) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-031) |
> | Casos de uso | [CU-031](3-casos-de-uso.md#cu-031) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-031) |
> | Caso de uso que nace de esta HU | [CU-031](3-casos-de-uso.md#cu-031) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-13](4-mockups.md#mk-13), [MK-14](4-mockups.md#mk-14) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-031) |
> | Entidades · Clase.Método | Usuario · Usuario.validarCorreoUnico(), actualizarUsuario() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-031) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-031) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-031**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-031-ca-1) | Actualización exitosa de los datos | — | — | — | [CU-031](3-casos-de-uso.md#cu-031) |
| [CA-2](#hu-031-ca-2) | Rechazo por correo duplicado | — | — | [RN-17](2-reglas-de-negocio-y-requisitos.md#rn-17) | [CU-031](3-casos-de-uso.md#cu-031) |
| [CA-3](#hu-031-ca-3) | Área obligatoria al pasar a perfil solicitante | — | — | [RN-18](2-reglas-de-negocio-y-requisitos.md#rn-18) | [CU-031](3-casos-de-uso.md#cu-031) |


<a id="hu-032"></a>

### HU-032 — Inactivar un usuario que ya no debe tener acceso

**Tabla 33**  
*Historia de usuario HU-032: Inactivar un usuario que ya no debe tener acceso*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-032</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Inactivar un usuario que ya no debe tener acceso</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Administrador, quiero inactivar a un usuario que ya no debe tener acceso al sistema, para evitar que personas que salieron de la empresa o cambiaron de función sigan usando la mesa de ayuda.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el administrador Jorge Ramírez ha iniciado sesión
<strong>Y</strong> el usuario Diego Salazar está activo
</blockquote>
<a id="hu-032-ca-1"></a><strong>Escenario: CA-1 Inactivación de un usuario</strong>
<blockquote>
<em># Usuario.inactivarUsuario()</em>
<strong>Cuando</strong> Jorge inactiva a Diego porque ya no trabaja en la empresa
<strong>Entonces</strong> el sistema marca a Diego como inactivo
</blockquote>
<a id="hu-032-ca-2"></a><strong>Escenario: CA-2 Un usuario inactivo no puede ingresar</strong>
<blockquote>
<strong>Cuando</strong> Diego, ya inactivo, intenta iniciar sesión con sus datos
<strong>Entonces</strong> el sistema no le permite ingresar
</blockquote>
<a id="hu-032-ca-3"></a><strong>Escenario: CA-3 La información histórica se conserva</strong>
<blockquote>
<strong>Dado</strong> que Diego, antes de ser inactivado, tenía casos y comentarios registrados
<strong>Cuando</strong> Jorge lo inactiva
<strong>Entonces</strong> esos casos y comentarios siguen existiendo sin cambios
</blockquote>
<a id="hu-032-ca-4"></a><strong>Escenario: CA-4 Reactivación</strong>
<blockquote>
<em># Usuario.actualizarUsuario() · estado_usuario = activo</em>
<strong>Dado</strong> que Diego está inactivo
<strong>Cuando</strong> Jorge decide reactivarlo
<strong>Entonces</strong> Diego vuelve a poder iniciar sesión normalmente
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (conclusión general: mantener actualizada la información de quienes usan el sistema único).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-29, RF-34</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-032**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | — | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-032-ca-1), [CA-2](#hu-032-ca-2), [CA-3](#hu-032-ca-3), [CA-4](#hu-032-ca-4) | Ficha de la HU |
> | RF derivados | [RF-29](2-reglas-de-negocio-y-requisitos.md#rf-29), [RF-34](2-reglas-de-negocio-y-requisitos.md#rf-34) | Ficha de la HU |
> | RN | [RN-21](2-reglas-de-negocio-y-requisitos.md#rn-21) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-032) |
> | Casos de uso | [CU-032](3-casos-de-uso.md#cu-032) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-032) |
> | Caso de uso que nace de esta HU | [CU-032](3-casos-de-uso.md#cu-032) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-13](4-mockups.md#mk-13) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-032) |
> | Entidades · Clase.Método | Usuario · Usuario.inactivarUsuario(), actualizarUsuario() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-032) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-032) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-032**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-032-ca-1) | Inactivación de un usuario | — | — | — | [CU-032](3-casos-de-uso.md#cu-032) |
| [CA-2](#hu-032-ca-2) | Un usuario inactivo no puede ingresar | — | — | [RN-21](2-reglas-de-negocio-y-requisitos.md#rn-21) | — |
| [CA-3](#hu-032-ca-3) | La información histórica se conserva | — | — | [RN-21](2-reglas-de-negocio-y-requisitos.md#rn-21) | — |
| [CA-4](#hu-032-ca-4) | Reactivación | — | — | [RN-21](2-reglas-de-negocio-y-requisitos.md#rn-21) | [CU-032](3-casos-de-uso.md#cu-032) |


<a id="hu-033"></a>

### HU-033 — Desbloquear una cuenta de usuario

**Tabla 34**  
*Historia de usuario HU-033: Desbloquear una cuenta de usuario*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-033</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Desbloquear una cuenta de usuario</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Administrador, quiero desbloquear la cuenta de un usuario que quedó bloqueada por intentos fallidos de ingreso, para que esa persona pueda volver a acceder al sistema sin tener que crear una cuenta nueva.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el administrador Jorge Ramírez ha iniciado sesión
<strong>Y</strong> la cuenta de Marcela Ríos quedó bloqueada por intentos fallidos
</blockquote>
<a id="hu-033-ca-1"></a><strong>Escenario: CA-1 Ver las cuentas bloqueadas</strong>
<blockquote>
<strong>Cuando</strong> Jorge consulta la lista de cuentas bloqueadas
<strong>Entonces</strong> ve a Marcela Ríos entre ellas
</blockquote>
<a id="hu-033-ca-2"></a><strong>Escenario: CA-2 Desbloqueo exitoso</strong>
<blockquote>
<em># Usuario.desbloquearCuenta() · resetearIntentosFallidos()</em>
<strong>Cuando</strong> Jorge desbloquea la cuenta de Marcela
<strong>Entonces</strong> el sistema reinicia su contador de intentos fallidos
<strong>Y</strong> Marcela puede volver a iniciar sesión con sus datos correctos
</blockquote>
<a id="hu-033-ca-3"></a><strong>Escenario: CA-3 Solo el administrador desbloquea cuentas</strong>
<blockquote>
<em># RN-23 · acceso según perfil</em>
<strong>Cuando</strong> el técnico Carlos Peña intenta desbloquear la cuenta de Marcela
<strong>Entonces</strong> el sistema no se lo permite
<strong>Y</strong> la cuenta de Marcela sigue bloqueada
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (conclusión general: el control de acceso del sistema único requiere poder restituirlo cuando se bloquea).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-30</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-033**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | — | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-033-ca-1), [CA-2](#hu-033-ca-2), [CA-3](#hu-033-ca-3) | Ficha de la HU |
> | RF derivados | [RF-30](2-reglas-de-negocio-y-requisitos.md#rf-30) | Ficha de la HU |
> | RN | [RN-20](2-reglas-de-negocio-y-requisitos.md#rn-20), [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-033) |
> | Casos de uso | [CU-033](3-casos-de-uso.md#cu-033) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-033) |
> | Caso de uso que nace de esta HU | [CU-033](3-casos-de-uso.md#cu-033) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-15](4-mockups.md#mk-15) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-033) |
> | Entidades · Clase.Método | Usuario · Usuario.desbloquearCuenta(), resetearIntentosFallidos() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-033) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-033) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-033**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-033-ca-1) | Ver las cuentas bloqueadas | — | — | — | — |
| [CA-2](#hu-033-ca-2) | Desbloqueo exitoso | — | — | [RN-20](2-reglas-de-negocio-y-requisitos.md#rn-20) | [CU-033](3-casos-de-uso.md#cu-033) |
| [CA-3](#hu-033-ca-3) | Solo el administrador desbloquea cuentas | [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | — | [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | [CU-033](3-casos-de-uso.md#cu-033) |


<a id="hu-034"></a>

### HU-034 — Actualizar mi disponibilidad para recibir casos

**Tabla 35**  
*Historia de usuario HU-034: Actualizar mi disponibilidad para recibir casos*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-034</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Actualizar mi disponibilidad para recibir casos</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Personal de soporte, quiero actualizar mi disponibilidad entre disponible, ocupado o ausente, para que el personal que asigna casos sepa si puedo recibir más trabajo en este momento.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el técnico Carlos Peña ha iniciado sesión
</blockquote>
<a id="hu-034-ca-1"></a><strong>Esquema del escenario: CA-1 Cambio de disponibilidad</strong>
<blockquote>
<em># InfoPersonalSoporte.actualizarDisponibilidad()</em>
<strong>Cuando</strong> Carlos cambia su disponibilidad a
<strong>Entonces</strong> el sistema guarda ese estado junto con la fecha y hora del cambio disponibilidad disponible ocupado ausente
</blockquote>
<a id="hu-034-ca-2"></a><strong>Escenario: CA-2 La disponibilidad más reciente es la que se ve</strong>
<blockquote>
<strong>Dado</strong> que Carlos cambió su disponibilidad a “ocupado” a las 9:00 a. m. y a “disponible” a las 11:00 a. m.
<strong>Cuando</strong> la supervisora Patricia Londoño consulta su disponibilidad después de las 11:00 a. m.
<strong>Entonces</strong> ve “disponible”, el estado más reciente
</blockquote>
<a id="hu-034-ca-3"></a><strong>Escenario: CA-3 Un solicitante no cambia la disponibilidad</strong>
<blockquote>
<em># RN-23 · solo el personal de soporte actualiza su disponibilidad</em>
<strong>Cuando</strong> Marcela Ríos (perfil solicitante) intenta cambiar la disponibilidad del personal de soporte
<strong>Entonces</strong> el sistema no se lo permite
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P8 de los resultados por pregunta (P8: "Los usuarios suelen volver a escribir, usar otro medio o preguntar a otra persona de TI"). (saber a quién recurrir en TI depende de que el propio personal de soporte mantenga su disponibilidad al día).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-25</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-034**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P8](../fase_0/0.4.1-entrevista-resultados.md#p8) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-034-ca-1), [CA-2](#hu-034-ca-2), [CA-3](#hu-034-ca-3) | Ficha de la HU |
> | RF derivados | [RF-25](2-reglas-de-negocio-y-requisitos.md#rf-25) | Ficha de la HU |
> | RN | [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23), [RN-28](2-reglas-de-negocio-y-requisitos.md#rn-28) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-034) |
> | Casos de uso | [CU-034](3-casos-de-uso.md#cu-034) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-034) |
> | Caso de uso que nace de esta HU | [CU-034](3-casos-de-uso.md#cu-034) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-11](4-mockups.md#mk-11) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-034) |
> | Entidades · Clase.Método | InfoPersonalSoporte · InfoPersonalSoporte.actualizarDisponibilidad() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-034) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-034) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-034**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-034-ca-1) | Cambio de disponibilidad | — | — | — | [CU-034](3-casos-de-uso.md#cu-034) |
| [CA-2](#hu-034-ca-2) | La disponibilidad más reciente es la que se ve | — | — | [RN-28](2-reglas-de-negocio-y-requisitos.md#rn-28) | — |
| [CA-3](#hu-034-ca-3) | Un solicitante no cambia la disponibilidad | [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | — | [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | [CU-034](3-casos-de-uso.md#cu-034) |


<a id="hu-035"></a>

### HU-035 — Registrar un activo tecnológico de la empresa

**Tabla 36**  
*Historia de usuario HU-035: Registrar un activo tecnológico de la empresa*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-035</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Registrar un activo tecnológico de la empresa</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Administrador, quiero registrar los equipos y programas de la empresa con sus datos principales, para poder relacionarlos con los casos que los afectan y llevar un control de ellos.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el administrador Jorge Ramírez ha iniciado sesión
</blockquote>
<a id="hu-035-ca-1"></a><strong>Escenario: CA-1 Registro exitoso de un activo</strong>
<blockquote>
<em># Activo.crearActivo()</em>
<strong>Cuando</strong> Jorge registra un activo con estos datos: Campo Valor Nombre Computador portátil HP-2301 Tipo de activo Portátil Marca HP Modelo ProBook 440 Número de serie HPX-00234 Área Contabilidad
<strong>Entonces</strong> el sistema registra el activo
<strong>Y</strong> lo deja disponible para asociarse a futuros casos
</blockquote>
<a id="hu-035-ca-2"></a><strong>Escenario: CA-2 Rechazo por número de serie repetido</strong>
<blockquote>
<em># UNIQUE(numero_serie), admite múltiples NULL</em>
<strong>Dado</strong> que ya existe un activo registrado con número de serie “HPX-00234”
<strong>Cuando</strong> Jorge intenta registrar otro activo con ese mismo número de serie
<strong>Entonces</strong> el sistema no lo permite
</blockquote>
<a id="hu-035-ca-3"></a><strong>Escenario: CA-3 Registro sin número de serie</strong>
<blockquote>
<strong>Cuando</strong> Jorge registra un activo que no tiene número de serie visible y deja ese campo vacío
<strong>Entonces</strong> el sistema lo registra igual, sin exigir ese dato
</blockquote>
<a id="hu-035-ca-4"></a><strong>Escenario: CA-4 Datos obligatorios</strong>
<blockquote>
<strong>Cuando</strong> Jorge intenta registrar un activo sin indicar su nombre o su tipo
<strong>Entonces</strong> el sistema no lo registra hasta que complete esos datos
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (P11: "Los usuarios reportan tanto problemas urgentes como solicitudes de nuevos servicios", muchos de ellos relacionados con equipos o programas que deben poder identificarse).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-44</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-035**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P11](../fase_0/0.4.1-entrevista-resultados.md#p11) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-035-ca-1), [CA-2](#hu-035-ca-2), [CA-3](#hu-035-ca-3), [CA-4](#hu-035-ca-4) | Ficha de la HU |
> | RF derivados | [RF-44](2-reglas-de-negocio-y-requisitos.md#rf-44) | Ficha de la HU |
> | RN | [RN-24](2-reglas-de-negocio-y-requisitos.md#rn-24) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-035) |
> | Casos de uso | [CU-035](3-casos-de-uso.md#cu-035) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-035) |
> | Caso de uso que nace de esta HU | [CU-035](3-casos-de-uso.md#cu-035) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-17](4-mockups.md#mk-17) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-035) |
> | Entidades · Clase.Método | Activo · Activo.crearActivo() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-035) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-035) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-035**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-035-ca-1) | Registro exitoso de un activo | — | — | — | [CU-035](3-casos-de-uso.md#cu-035) |
| [CA-2](#hu-035-ca-2) | Rechazo por número de serie repetido | — | — | [RN-24](2-reglas-de-negocio-y-requisitos.md#rn-24) | [CU-035](3-casos-de-uso.md#cu-035) |
| [CA-3](#hu-035-ca-3) | Registro sin número de serie | — | — | — | [CU-035](3-casos-de-uso.md#cu-035) |
| [CA-4](#hu-035-ca-4) | Datos obligatorios | — | — | [RN-24](2-reglas-de-negocio-y-requisitos.md#rn-24) | [CU-035](3-casos-de-uso.md#cu-035) |


<a id="hu-036"></a>

### HU-036 — Consultar los activos tecnológicos registrados

**Tabla 37**  
*Historia de usuario HU-036: Consultar los activos tecnológicos registrados*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-036</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Consultar los activos tecnológicos registrados</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Personal de soporte, quiero consultar el listado de equipos y programas registrados con su estado y ubicación, para saber qué activos existen al momento de atender o revisar un caso.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el técnico Carlos Peña ha iniciado sesión
</blockquote>
<a id="hu-036-ca-1"></a><strong>Escenario: CA-1 Listado con estado y ubicación</strong>
<blockquote>
<em># Activo.obtenerActivo() · RF-45</em>
<strong>Cuando</strong> Carlos consulta el listado de activos registrados
<strong>Entonces</strong> ve cada activo con su nombre, tipo, estado y área donde está ubicado
</blockquote>
<a id="hu-036-ca-2"></a><strong>Escenario: CA-2 Búsqueda por nombre, número de serie o área</strong>
<blockquote>
<strong>Cuando</strong> Carlos busca el activo “HPX-00234”
<strong>Entonces</strong> el sistema le muestra el computador portátil HP-2301 asociado a ese número de serie
</blockquote>
<a id="hu-036-ca-3"></a><strong>Escenario: CA-3 Búsqueda sin resultados</strong>
<blockquote>
<strong>Cuando</strong> Carlos busca un activo que no existe
<strong>Entonces</strong> el sistema le indica que no encontró resultados
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (P11, por la misma razón que HU-035: los casos reportados suelen involucrar equipos o programas que deben poder consultarse).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-45</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Baja</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-036**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P11](../fase_0/0.4.1-entrevista-resultados.md#p11) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-036-ca-1), [CA-2](#hu-036-ca-2), [CA-3](#hu-036-ca-3) | Ficha de la HU |
> | RF derivados | [RF-45](2-reglas-de-negocio-y-requisitos.md#rf-45) | Ficha de la HU |
> | RN | [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-036) |
> | Casos de uso | [CU-036](3-casos-de-uso.md#cu-036) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-036) |
> | Caso de uso que nace de esta HU | [CU-036](3-casos-de-uso.md#cu-036) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-16](4-mockups.md#mk-16) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-036) |
> | Entidades · Clase.Método | Activo · Activo.obtenerActivo() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-036) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-036) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-036**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-036-ca-1) | Listado con estado y ubicación | — | [RF-45](2-reglas-de-negocio-y-requisitos.md#rf-45) | — | [CU-036](3-casos-de-uso.md#cu-036) |
| [CA-2](#hu-036-ca-2) | Búsqueda por nombre, número de serie o área | — | — | — | — |
| [CA-3](#hu-036-ca-3) | Búsqueda sin resultados | — | — | — | [CU-036](3-casos-de-uso.md#cu-036) |


<a id="hu-037"></a>

### HU-037 — Actualizar la información de un activo tecnológico

**Tabla 38**  
*Historia de usuario HU-037: Actualizar la información de un activo tecnológico*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-037</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Actualizar la información de un activo tecnológico</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Administrador, quiero actualizar los datos de un activo ya registrado, como su marca, modelo, ubicación o estado, para mantener correcta la información del inventario tecnológico.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el administrador Jorge Ramírez ha iniciado sesión
<strong>Y</strong> el activo HPX-00234 está ubicado en Contabilidad
</blockquote>
<a id="hu-037-ca-1"></a><strong>Escenario: CA-1 Actualización de ubicación y estado</strong>
<blockquote>
<em># Activo.actualizarActivo()</em>
<strong>Cuando</strong> Jorge traslada el activo HPX-00234 al área de Logística y lo marca como “en reparación”
<strong>Entonces</strong> el sistema guarda la nueva ubicación y el nuevo estado
</blockquote>
<a id="hu-037-ca-2"></a><strong>Escenario: CA-2 Rechazo por número de serie en uso</strong>
<blockquote>
<strong>Dado</strong> que el número de serie “HPX-00500” ya pertenece a otro activo
<strong>Cuando</strong> Jorge intenta asignar ese mismo número de serie al activo HPX-00234
<strong>Entonces</strong> el sistema no guarda el cambio
<strong>Y</strong> conserva el número de serie anterior del activo
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (P11, por la misma razón que HU-035 y HU-036).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-46</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Baja</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-037**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P11](../fase_0/0.4.1-entrevista-resultados.md#p11) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-037-ca-1), [CA-2](#hu-037-ca-2) | Ficha de la HU |
> | RF derivados | [RF-46](2-reglas-de-negocio-y-requisitos.md#rf-46) | Ficha de la HU |
> | RN | [RN-24](2-reglas-de-negocio-y-requisitos.md#rn-24) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-037) |
> | Casos de uso | [CU-037](3-casos-de-uso.md#cu-037) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-037) |
> | Caso de uso que nace de esta HU | [CU-037](3-casos-de-uso.md#cu-037) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-16](4-mockups.md#mk-16), [MK-17](4-mockups.md#mk-17) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-037) |
> | Entidades · Clase.Método | Activo · Activo.actualizarActivo() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-037) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-037) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-037**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-037-ca-1) | Actualización de ubicación y estado | — | — | — | [CU-037](3-casos-de-uso.md#cu-037) |
| [CA-2](#hu-037-ca-2) | Rechazo por número de serie en uso | — | — | [RN-24](2-reglas-de-negocio-y-requisitos.md#rn-24) | [CU-037](3-casos-de-uso.md#cu-037) |


<a id="hu-038"></a>

### HU-038 — Dar de baja un activo tecnológico

**Tabla 39**  
*Historia de usuario HU-038: Dar de baja un activo tecnológico*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-038</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Dar de baja un activo tecnológico</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Administrador, quiero dar de baja un activo que ya no está en uso, para que deje de aparecer como disponible para relacionarlo con nuevos casos.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el administrador Jorge Ramírez ha iniciado sesión
<strong>Y</strong> el activo HPX-00234 está activo
</blockquote>
<a id="hu-038-ca-1"></a><strong>Escenario: CA-1 Dar de baja un activo</strong>
<blockquote>
<em># Activo.darDeBajaActivo()</em>
<strong>Cuando</strong> Jorge da de baja el activo HPX-00234 porque ya no está en uso
<strong>Entonces</strong> el sistema lo marca como “dado de baja”
</blockquote>
<a id="hu-038-ca-2"></a><strong>Escenario: CA-2 Un activo dado de baja no puede elegirse en casos nuevos</strong>
<blockquote>
<strong>Dado</strong> que el activo HPX-00234 está dado de baja
<strong>Cuando</strong> Marcela intenta relacionar ese activo con un caso nuevo
<strong>Entonces</strong> no aparece entre las opciones disponibles
</blockquote>
<a id="hu-038-ca-3"></a><strong>Escenario: CA-3 Los casos anteriores conservan la relación</strong>
<blockquote>
<strong>Dado</strong> que el caso MA-2026-000101, ya cerrado, estaba relacionado con el activo HPX-00234
<strong>Cuando</strong> el activo se da de baja
<strong>Entonces</strong> el caso MA-2026-000101 conserva esa relación sin cambios
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (P11, por la misma razón que HU-035 a HU-037).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-47</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Baja</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-038**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P11](../fase_0/0.4.1-entrevista-resultados.md#p11) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-038-ca-1), [CA-2](#hu-038-ca-2), [CA-3](#hu-038-ca-3) | Ficha de la HU |
> | RF derivados | [RF-47](2-reglas-de-negocio-y-requisitos.md#rf-47) | Ficha de la HU |
> | RN | [RN-25](2-reglas-de-negocio-y-requisitos.md#rn-25) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-038) |
> | Casos de uso | [CU-038](3-casos-de-uso.md#cu-038) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-038) |
> | Caso de uso que nace de esta HU | [CU-038](3-casos-de-uso.md#cu-038) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-16](4-mockups.md#mk-16) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-038) |
> | Entidades · Clase.Método | Activo · Activo.darDeBajaActivo() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-038) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-038) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-038**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-038-ca-1) | Dar de baja un activo | — | — | — | [CU-038](3-casos-de-uso.md#cu-038) |
| [CA-2](#hu-038-ca-2) | Un activo dado de baja no puede elegirse en casos nuevos | — | — | [RN-25](2-reglas-de-negocio-y-requisitos.md#rn-25) | — |
| [CA-3](#hu-038-ca-3) | Los casos anteriores conservan la relación | — | — | [RN-25](2-reglas-de-negocio-y-requisitos.md#rn-25) | — |


<a id="hu-040"></a>

### HU-040 — Consultar las reglas de tiempos de atención configuradas

**Tabla 40**  
*Historia de usuario HU-040: Consultar las reglas de tiempos de atención configuradas*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-040</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Consultar las reglas de tiempos de atención configuradas</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Supervisor de soporte, quiero consultar las reglas de tiempos de respuesta y solución configuradas para cada importancia y tipo de caso, para verificar que están completas y son adecuadas antes de que se apliquen a nuevos casos.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que la supervisora Patricia Londoño ha iniciado sesión
</blockquote>
<a id="hu-040-ca-1"></a><strong>Escenario: CA-1 Listado de reglas vigentes</strong>
<blockquote>
<em># TiempoAtencionSLA.obtenerSLA()</em>
<strong>Cuando</strong> Patricia consulta las reglas de tiempos de atención configuradas
<strong>Entonces</strong> ve cada regla con su importancia, tipo de caso, tiempo de respuesta y tiempo de solución
</blockquote>
<a id="hu-040-ca-2"></a><strong>Escenario: CA-2 Distinción entre reglas activas y reglas anteriores</strong>
<blockquote>
<strong>Dado</strong> que la regla de P2-problema fue editada y la versión anterior quedó inactiva
<strong>Cuando</strong> Patricia consulta las reglas
<strong>Entonces</strong> puede distinguir cuál es la vigente y cuál ya no se usa
</blockquote>
<a id="hu-040-ca-3"></a><strong>Escenario: CA-3 Combinación sin regla definida</strong>
<blockquote>
<strong>Dado</strong> que no existe ninguna regla para importancia P4 y tipo “solicitud”
<strong>Cuando</strong> Patricia revisa esa combinación
<strong>Entonces</strong> el sistema le indica que no hay una regla definida
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P4 y P13 de los resultados por pregunta (P4: "Se evidencia que en muchos casos las respuestas se demoran más de lo esperado"; P13: "La mayoría espera respuestas rápidas, desde menos de una hora hasta el mismo día"). (verificación, por parte del supervisor, de que las reglas configuradas sostienen los tiempos esperados por los usuarios).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-39</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Baja</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-040**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P4](../fase_0/0.4.1-entrevista-resultados.md#p4), [P13](../fase_0/0.4.1-entrevista-resultados.md#p13) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-040-ca-1), [CA-2](#hu-040-ca-2), [CA-3](#hu-040-ca-3) | Ficha de la HU |
> | RF derivados | [RF-39](2-reglas-de-negocio-y-requisitos.md#rf-39) | Ficha de la HU |
> | RN | [RN-13](2-reglas-de-negocio-y-requisitos.md#rn-13) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-040) |
> | Casos de uso | [CU-040](3-casos-de-uso.md#cu-040) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-040) |
> | Caso de uso que nace de esta HU | [CU-040](3-casos-de-uso.md#cu-040) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-12](4-mockups.md#mk-12) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-040) |
> | Entidades · Clase.Método | TiempoAtencionSLA · TiempoAtencionSLA.obtenerSLA() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-040) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-040) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-040**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-040-ca-1) | Listado de reglas vigentes | — | — | — | [CU-040](3-casos-de-uso.md#cu-040) |
| [CA-2](#hu-040-ca-2) | Distinción entre reglas activas y reglas anteriores | — | — | [RN-13](2-reglas-de-negocio-y-requisitos.md#rn-13) | — |
| [CA-3](#hu-040-ca-3) | Combinación sin regla definida | — | — | — | [CU-040](3-casos-de-uso.md#cu-040) |


<a id="hu-041"></a>

### HU-041 — Consultar el historial de cambios de un caso

**Tabla 41**  
*Historia de usuario HU-041: Consultar el historial de cambios de un caso*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-041</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Consultar el historial de cambios de un caso</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Supervisor de soporte, quiero consultar el historial completo de cambios realizados sobre un caso, para revisar cómo fue atendido y verificar que el proceso se siguió correctamente.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que la supervisora Patricia Londoño ha iniciado sesión
<strong>Y</strong> el caso MA-2026-000145 ha tenido varios cambios desde que se creó
</blockquote>
<a id="hu-041-ca-1"></a><strong>Escenario: CA-1 Registro automático de cada cambio relevante</strong>
<blockquote>
<em># HistorialCaso.registrarHistorial()</em>
<strong>Cuando</strong> el caso MA-2026-000145 cambia de situación, cambia de responsable o recibe un comentario
<strong>Entonces</strong> el sistema guarda automáticamente ese cambio en el historial, con qué cambió, el valor anterior, el valor nuevo, quién lo hizo y la fecha
</blockquote>
<a id="hu-041-ca-2"></a><strong>Escenario: CA-2 Consulta del historial completo</strong>
<blockquote>
<em># HistorialCaso.listarHistorial()</em>
<strong>Cuando</strong> Patricia abre el historial del caso MA-2026-000145
<strong>Entonces</strong> ve todos los cambios registrados, ordenados desde el más antiguo hasta el más reciente
</blockquote>
<a id="hu-041-ca-3"></a><strong>Escenario: CA-3 El historial no puede modificarse ni eliminarse</strong>
<blockquote>
<strong>Cuando</strong> cualquier persona intenta modificar o borrar un registro ya guardado en el historial
<strong>Entonces</strong> el sistema no se lo permite
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P10 de los resultados por pregunta (P10: "Se destacan problemas como demoras, falta de claridad, mala comunicación y dificultad para saber el estado del caso").</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-41, RF-49</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-041**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P10](../fase_0/0.4.1-entrevista-resultados.md#p10) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-041-ca-1), [CA-2](#hu-041-ca-2), [CA-3](#hu-041-ca-3) | Ficha de la HU |
> | RF derivados | [RF-41](2-reglas-de-negocio-y-requisitos.md#rf-41), [RF-49](2-reglas-de-negocio-y-requisitos.md#rf-49) | Ficha de la HU |
> | RN | [RN-08](2-reglas-de-negocio-y-requisitos.md#rn-08) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-041) |
> | Casos de uso | [CU-041](3-casos-de-uso.md#cu-041), [CU-S02](3-casos-de-uso.md#cu-s02) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-041) |
> | Caso de uso que nace de esta HU | [CU-041](3-casos-de-uso.md#cu-041), [CU-S02](3-casos-de-uso.md#cu-s02) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-08](4-mockups.md#mk-08) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-041) |
> | Entidades · Clase.Método | HistorialCaso · HistorialCaso.listarHistorial(), registrarHistorial() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-041) |
> | Mensajes de secuencia | Sec. CU-001: registrarHistorial() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-041) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-041**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-041-ca-1) | Registro automático de cada cambio relevante | — | — | [RN-08](2-reglas-de-negocio-y-requisitos.md#rn-08) | [CU-S02](3-casos-de-uso.md#cu-s02) |
| [CA-2](#hu-041-ca-2) | Consulta del historial completo | — | — | — | [CU-041](3-casos-de-uso.md#cu-041) |
| [CA-3](#hu-041-ca-3) | El historial no puede modificarse ni eliminarse | — | — | [RN-08](2-reglas-de-negocio-y-requisitos.md#rn-08) | [CU-041](3-casos-de-uso.md#cu-041) |


<a id="hu-042"></a>

### HU-042 — Adjuntar y consultar evidencias de un caso

**Tabla 42**  
*Historia de usuario HU-042: Adjuntar y consultar evidencias de un caso*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-042</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Adjuntar y consultar evidencias de un caso</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Usuario solicitante, quiero adjuntar archivos como capturas de pantalla o documentos a mi caso y consultarlos después, para que el personal de soporte cuente con la evidencia necesaria para atenderlo.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que Marcela Ríos tiene el caso MA-2026-000145 abierto
</blockquote>
<a id="hu-042-ca-1"></a><strong>Escenario: CA-1 Carga exitosa de un archivo permitido</strong>
<blockquote>
<em># AdjuntoCaso.cargarAdjunto() · CHECK tipo_archivo IN (image/png, image/jpeg, application/pdf, text/plain)</em>
<strong>Cuando</strong> Marcela adjunta una captura de pantalla en formato PNG de 850 KB
<strong>Entonces</strong> el sistema guarda el archivo asociado a su caso
<strong>Y</strong> registra quién lo cargó y la fecha de carga
</blockquote>
<a id="hu-042-ca-2"></a><strong>Escenario: CA-2 Rechazo por tamaño máximo excedido</strong>
<blockquote>
<em># CHECK(tamano_kb &gt; 0 AND tamano_kb &lt;= 10240) · máximo 10 MB</em>
<strong>Cuando</strong> Marcela intenta adjuntar un archivo de 12 000 KB
<strong>Entonces</strong> el sistema lo rechaza
<strong>Y</strong> le explica que el tamaño máximo permitido es de 10 MB
</blockquote>
<a id="hu-042-ca-3"></a><strong>Escenario: CA-3 Rechazo por tipo de archivo no permitido</strong>
<blockquote>
<strong>Cuando</strong> Marcela intenta adjuntar un archivo de video en formato MP4
<strong>Entonces</strong> el sistema lo rechaza
<strong>Y</strong> le explica qué tipos de archivo sí están permitidos
</blockquote>
<a id="hu-042-ca-4"></a><strong>Escenario: CA-4 Consulta de los adjuntos de un caso</strong>
<blockquote>
<em># obtenerAdjunto(), listarAdjuntos()</em>
<strong>Dado</strong> que el caso MA-2026-000145 tiene dos archivos adjuntos
<strong>Cuando</strong> el técnico Carlos Peña abre el caso
<strong>Entonces</strong> ve el listado de los dos adjuntos y puede abrir cada uno
</blockquote>
<a id="hu-042-ca-5"></a><strong>Escenario: CA-5 Retiro de un adjunto cargado por error</strong>
<blockquote>
<em># eliminarAdjunto() · baja lógica, no elimina el registro del historial</em>
<strong>Dado</strong> que Marcela cargó por error un archivo que no corresponde a su caso
<strong>Cuando</strong> lo retira del caso (baja lógica)
<strong>Entonces</strong> el archivo deja de mostrarse en el caso
<strong>Y</strong> el historial conserva el registro de que ese archivo fue cargado y luego retirado
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P6 de los resultados por pregunta (P6: "Algunos usuarios envían información completa, pero muchos deben complementar después"). (adjuntar evidencia reduce la necesidad de complementar la información después).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-42, RF-43</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-042**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P6](../fase_0/0.4.1-entrevista-resultados.md#p6) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-042-ca-1), [CA-2](#hu-042-ca-2), [CA-3](#hu-042-ca-3), [CA-4](#hu-042-ca-4), [CA-5](#hu-042-ca-5) | Ficha de la HU |
> | RF derivados | [RF-42](2-reglas-de-negocio-y-requisitos.md#rf-42), [RF-43](2-reglas-de-negocio-y-requisitos.md#rf-43) | Ficha de la HU |
> | RN | [RN-08](2-reglas-de-negocio-y-requisitos.md#rn-08), [RN-27](2-reglas-de-negocio-y-requisitos.md#rn-27) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-042) |
> | Casos de uso | [CU-042](3-casos-de-uso.md#cu-042) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-042) |
> | Caso de uso que nace de esta HU | [CU-042](3-casos-de-uso.md#cu-042) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-02](4-mockups.md#mk-02), [MK-05](4-mockups.md#mk-05), [MK-06](4-mockups.md#mk-06) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-042) |
> | Entidades · Clase.Método | AdjuntoCaso · AdjuntoCaso.cargarAdjunto(), obtenerAdjunto(), listarAdjuntos(), eliminarAdjunto() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-042) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-042) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-042**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-042-ca-1) | Carga exitosa de un archivo permitido | — | — | [RN-27](2-reglas-de-negocio-y-requisitos.md#rn-27) | [CU-042](3-casos-de-uso.md#cu-042) |
| [CA-2](#hu-042-ca-2) | Rechazo por tamaño máximo excedido | — | — | [RN-27](2-reglas-de-negocio-y-requisitos.md#rn-27) | [CU-042](3-casos-de-uso.md#cu-042) |
| [CA-3](#hu-042-ca-3) | Rechazo por tipo de archivo no permitido | — | — | [RN-27](2-reglas-de-negocio-y-requisitos.md#rn-27) | [CU-042](3-casos-de-uso.md#cu-042) |
| [CA-4](#hu-042-ca-4) | Consulta de los adjuntos de un caso | — | — | — | — |
| [CA-5](#hu-042-ca-5) | Retiro de un adjunto cargado por error | — | — | [RN-08](2-reglas-de-negocio-y-requisitos.md#rn-08), [RN-27](2-reglas-de-negocio-y-requisitos.md#rn-27) | [CU-042](3-casos-de-uso.md#cu-042) |


<a id="hu-043"></a>

### HU-043 — Administrar las áreas

**Tabla 43**  
*Historia de usuario HU-043: Administrar las áreas*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-043</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Administrar las áreas</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Administrador, quiero crear, editar e inactivar las áreas del sistema, para mantener actualizadas las opciones que usan los demás usuarios al registrar información.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el administrador Jorge Ramírez ha iniciado sesión
</blockquote>
<a id="hu-043-ca-1"></a><strong>Escenario: CA-1 Creación de un valor nuevo</strong>
<blockquote>
<em># Catalogo.crear() · tabla area</em>
<strong>Cuando</strong> Jorge crea el valor “Mercadeo” en las áreas
<strong>Entonces</strong> ese valor queda disponible como opción para los demás usuarios
</blockquote>
<a id="hu-043-ca-2"></a><strong>Escenario: CA-2 Rechazo por nombre repetido en el mismo catálogo</strong>
<blockquote>
<em># RN-26</em>
<strong>Dado</strong> que ya existe el valor “Mercadeo”
<strong>Cuando</strong> Jorge intenta crear otro valor también llamado “Mercadeo” en el mismo catálogo
<strong>Entonces</strong> el sistema no lo permite
</blockquote>
<a id="hu-043-ca-3"></a><strong>Escenario: CA-3 Edición de un valor existente</strong>
<blockquote>
<em># Catalogo.actualizar()</em>
<strong>Cuando</strong> Jorge cambia el nombre “Mercadeo” por “Mercadeo y Ventas”
<strong>Entonces</strong> el sistema guarda el nuevo nombre
</blockquote>
<a id="hu-043-ca-4"></a><strong>Escenario: CA-4 Inactivación sin perder los registros que ya lo usan</strong>
<blockquote>
<em># Catalogo.inactivar() · Catalogo.obtener() ofrece solo los valores activos · RN-30</em>
<strong>Dado</strong> que el valor “Logística” ya fue usado en registros anteriores
<strong>Cuando</strong> Jorge lo inactiva
<strong>Entonces</strong> deja de aparecer como opción para registros nuevos
<strong>Y</strong> los registros anteriores que ya lo tenían lo conservan sin cambios
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (P1: "La mayoría de participantes actúan como usuarios que solicitan ayuda, aunque también hay personal de TI y roles de coordinación"; el área de cada solicitante determina la afectación del caso).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-48</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-043**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P1](../fase_0/0.4.1-entrevista-resultados.md#p1) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-043-ca-1), [CA-2](#hu-043-ca-2), [CA-3](#hu-043-ca-3), [CA-4](#hu-043-ca-4) | Ficha de la HU |
> | RF derivados | [RF-48](2-reglas-de-negocio-y-requisitos.md#rf-48) | Ficha de la HU |
> | RN | [RN-26](2-reglas-de-negocio-y-requisitos.md#rn-26), [RN-30](2-reglas-de-negocio-y-requisitos.md#rn-30) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-043) |
> | Casos de uso | [CU-043](3-casos-de-uso.md#cu-043) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-043) |
> | Caso de uso que nace de esta HU | [CU-043](3-casos-de-uso.md#cu-043) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-18](4-mockups.md#mk-18) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-043) |
> | Entidades · Clase.Método | Area · Catalogo.crear(), obtener(), actualizar(), inactivar() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-043) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-043) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-043**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-043-ca-1) | Creación de un valor nuevo | — | — | — | [CU-043](3-casos-de-uso.md#cu-043) |
| [CA-2](#hu-043-ca-2) | Rechazo por nombre repetido en el mismo catálogo | [RN-26](2-reglas-de-negocio-y-requisitos.md#rn-26) | — | — | [CU-043](3-casos-de-uso.md#cu-043) |
| [CA-3](#hu-043-ca-3) | Edición de un valor existente | — | — | — | [CU-043](3-casos-de-uso.md#cu-043) |
| [CA-4](#hu-043-ca-4) | Inactivación sin perder los registros que ya lo usan | [RN-30](2-reglas-de-negocio-y-requisitos.md#rn-30) | — | — | [CU-043](3-casos-de-uso.md#cu-043) |


<a id="hu-044"></a>

### HU-044 — Administrar los cargos

**Tabla 44**  
*Historia de usuario HU-044: Administrar los cargos*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-044</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Administrar los cargos</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Administrador, quiero crear, editar e inactivar los cargos del sistema, para mantener actualizadas las opciones que usan los demás usuarios al registrar información.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el administrador Jorge Ramírez ha iniciado sesión
</blockquote>
<a id="hu-044-ca-1"></a><strong>Escenario: CA-1 Creación de un valor nuevo</strong>
<blockquote>
<em># Catalogo.crear() · tabla cargo</em>
<strong>Cuando</strong> Jorge crea el valor “Analista de Mercadeo” en los cargos
<strong>Entonces</strong> ese valor queda disponible como opción para los demás usuarios
</blockquote>
<a id="hu-044-ca-2"></a><strong>Escenario: CA-2 Rechazo por nombre repetido en el mismo catálogo</strong>
<blockquote>
<em># RN-26</em>
<strong>Dado</strong> que ya existe el valor “Analista de Mercadeo”
<strong>Cuando</strong> Jorge intenta crear otro valor también llamado “Analista de Mercadeo” en el mismo catálogo
<strong>Entonces</strong> el sistema no lo permite
</blockquote>
<a id="hu-044-ca-3"></a><strong>Escenario: CA-3 Edición de un valor existente</strong>
<blockquote>
<em># Catalogo.actualizar()</em>
<strong>Cuando</strong> Jorge cambia el nombre “Analista de Mercadeo” por “Analista de Mercadeo Digital”
<strong>Entonces</strong> el sistema guarda el nuevo nombre
</blockquote>
<a id="hu-044-ca-4"></a><strong>Escenario: CA-4 Inactivación sin perder los registros que ya lo usan</strong>
<blockquote>
<em># Catalogo.inactivar() · Catalogo.obtener() ofrece solo los valores activos · RN-30</em>
<strong>Dado</strong> que el valor “Auxiliar de Logística” ya fue usado en registros anteriores
<strong>Cuando</strong> Jorge lo inactiva
<strong>Entonces</strong> deja de aparecer como opción para registros nuevos
<strong>Y</strong> los registros anteriores que ya lo tenían lo conservan sin cambios
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (P1: "La mayoría de participantes actúan como usuarios que solicitan ayuda, aunque también hay personal de TI y roles de coordinación", lo que exige identificar el cargo de quien solicita).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-48</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-044**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P1](../fase_0/0.4.1-entrevista-resultados.md#p1) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-044-ca-1), [CA-2](#hu-044-ca-2), [CA-3](#hu-044-ca-3), [CA-4](#hu-044-ca-4) | Ficha de la HU |
> | RF derivados | [RF-48](2-reglas-de-negocio-y-requisitos.md#rf-48) | Ficha de la HU |
> | RN | [RN-26](2-reglas-de-negocio-y-requisitos.md#rn-26), [RN-30](2-reglas-de-negocio-y-requisitos.md#rn-30) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-044) |
> | Casos de uso | [CU-044](3-casos-de-uso.md#cu-044) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-044) |
> | Caso de uso que nace de esta HU | [CU-044](3-casos-de-uso.md#cu-044) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-18](4-mockups.md#mk-18) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-044) |
> | Entidades · Clase.Método | Cargo · Catalogo.crear(), obtener(), actualizar(), inactivar() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-044) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-044) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-044**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-044-ca-1) | Creación de un valor nuevo | — | — | — | [CU-044](3-casos-de-uso.md#cu-044) |
| [CA-2](#hu-044-ca-2) | Rechazo por nombre repetido en el mismo catálogo | [RN-26](2-reglas-de-negocio-y-requisitos.md#rn-26) | — | — | [CU-044](3-casos-de-uso.md#cu-044) |
| [CA-3](#hu-044-ca-3) | Edición de un valor existente | — | — | — | [CU-044](3-casos-de-uso.md#cu-044) |
| [CA-4](#hu-044-ca-4) | Inactivación sin perder los registros que ya lo usan | [RN-30](2-reglas-de-negocio-y-requisitos.md#rn-30) | — | — | [CU-044](3-casos-de-uso.md#cu-044) |


<a id="hu-045"></a>

### HU-045 — Administrar los roles de empleado

**Tabla 45**  
*Historia de usuario HU-045: Administrar los roles de empleado*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-045</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Administrar los roles de empleado</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Administrador, quiero crear, editar e inactivar los roles de empleado del sistema, para mantener actualizadas las opciones que usan los demás usuarios al registrar información.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el administrador Jorge Ramírez ha iniciado sesión
</blockquote>
<a id="hu-045-ca-1"></a><strong>Escenario: CA-1 Creación de un valor nuevo</strong>
<blockquote>
<em># Catalogo.crear() · tabla rol_empleado</em>
<strong>Cuando</strong> Jorge crea el valor “Contratista” en los roles de empleado
<strong>Entonces</strong> ese valor queda disponible como opción para los demás usuarios
</blockquote>
<a id="hu-045-ca-2"></a><strong>Escenario: CA-2 Rechazo por nombre repetido en el mismo catálogo</strong>
<blockquote>
<em># RN-26</em>
<strong>Dado</strong> que ya existe el valor “Contratista”
<strong>Cuando</strong> Jorge intenta crear otro valor también llamado “Contratista” en el mismo catálogo
<strong>Entonces</strong> el sistema no lo permite
</blockquote>
<a id="hu-045-ca-3"></a><strong>Escenario: CA-3 Edición de un valor existente</strong>
<blockquote>
<em># Catalogo.actualizar()</em>
<strong>Cuando</strong> Jorge cambia el nombre “Contratista” por “Contratista externo”
<strong>Entonces</strong> el sistema guarda el nuevo nombre
</blockquote>
<a id="hu-045-ca-4"></a><strong>Escenario: CA-4 Inactivación sin perder los registros que ya lo usan</strong>
<blockquote>
<em># Catalogo.inactivar() · Catalogo.obtener() ofrece solo los valores activos · RN-30</em>
<strong>Dado</strong> que el valor “Seguridad” ya fue usado en registros anteriores
<strong>Cuando</strong> Jorge lo inactiva
<strong>Entonces</strong> deja de aparecer como opción para registros nuevos
<strong>Y</strong> los registros anteriores que ya lo tenían lo conservan sin cambios
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (P1: "La mayoría de participantes actúan como usuarios que solicitan ayuda, aunque también hay personal de TI y roles de coordinación").</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-48</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-045**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P1](../fase_0/0.4.1-entrevista-resultados.md#p1) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-045-ca-1), [CA-2](#hu-045-ca-2), [CA-3](#hu-045-ca-3), [CA-4](#hu-045-ca-4) | Ficha de la HU |
> | RF derivados | [RF-48](2-reglas-de-negocio-y-requisitos.md#rf-48) | Ficha de la HU |
> | RN | [RN-26](2-reglas-de-negocio-y-requisitos.md#rn-26), [RN-30](2-reglas-de-negocio-y-requisitos.md#rn-30) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-045) |
> | Casos de uso | [CU-045](3-casos-de-uso.md#cu-045) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-045) |
> | Caso de uso que nace de esta HU | [CU-045](3-casos-de-uso.md#cu-045) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-18](4-mockups.md#mk-18) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-045) |
> | Entidades · Clase.Método | RolEmpleado · Catalogo.crear(), obtener(), actualizar(), inactivar() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-045) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-045) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-045**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-045-ca-1) | Creación de un valor nuevo | — | — | — | [CU-045](3-casos-de-uso.md#cu-045) |
| [CA-2](#hu-045-ca-2) | Rechazo por nombre repetido en el mismo catálogo | [RN-26](2-reglas-de-negocio-y-requisitos.md#rn-26) | — | — | [CU-045](3-casos-de-uso.md#cu-045) |
| [CA-3](#hu-045-ca-3) | Edición de un valor existente | — | — | — | [CU-045](3-casos-de-uso.md#cu-045) |
| [CA-4](#hu-045-ca-4) | Inactivación sin perder los registros que ya lo usan | [RN-30](2-reglas-de-negocio-y-requisitos.md#rn-30) | — | — | [CU-045](3-casos-de-uso.md#cu-045) |


<a id="hu-046"></a>

### HU-046 — Administrar los tipos de activo

**Tabla 46**  
*Historia de usuario HU-046: Administrar los tipos de activo*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-046</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Administrar los tipos de activo</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Administrador, quiero crear, editar e inactivar los tipos de activo del sistema, para mantener actualizadas las opciones que usan los demás usuarios al registrar información.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el administrador Jorge Ramírez ha iniciado sesión
</blockquote>
<a id="hu-046-ca-1"></a><strong>Escenario: CA-1 Creación de un valor nuevo</strong>
<blockquote>
<em># Catalogo.crear() · tabla tipo_activo</em>
<strong>Cuando</strong> Jorge crea el valor “Teléfono IP” en los tipos de activo
<strong>Entonces</strong> ese valor queda disponible como opción para los demás usuarios
</blockquote>
<a id="hu-046-ca-2"></a><strong>Escenario: CA-2 Rechazo por nombre repetido en el mismo catálogo</strong>
<blockquote>
<em># RN-26</em>
<strong>Dado</strong> que ya existe el valor “Teléfono IP”
<strong>Cuando</strong> Jorge intenta crear otro valor también llamado “Teléfono IP” en el mismo catálogo
<strong>Entonces</strong> el sistema no lo permite
</blockquote>
<a id="hu-046-ca-3"></a><strong>Escenario: CA-3 Edición de un valor existente</strong>
<blockquote>
<em># Catalogo.actualizar()</em>
<strong>Cuando</strong> Jorge cambia el nombre “Teléfono IP” por “Teléfono IP de escritorio”
<strong>Entonces</strong> el sistema guarda el nuevo nombre
</blockquote>
<a id="hu-046-ca-4"></a><strong>Escenario: CA-4 Inactivación sin perder los registros que ya lo usan</strong>
<blockquote>
<em># Catalogo.inactivar() · Catalogo.obtener() ofrece solo los valores activos · RN-30</em>
<strong>Dado</strong> que el valor “Servidor” ya fue usado en registros anteriores
<strong>Cuando</strong> Jorge lo inactiva
<strong>Entonces</strong> deja de aparecer como opción para registros nuevos
<strong>Y</strong> los registros anteriores que ya lo tenían lo conservan sin cambios
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>La entrevista no incluye una pregunta específica sobre este aspecto administrativo o técnico. La necesidad se deriva como requisito de soporte para sostener la solución que sí demandan los hallazgos generales de la entrevista (P11: "Los usuarios reportan tanto problemas urgentes como solicitudes de nuevos servicios", muchos de ellos relacionados con equipos que deben clasificarse).</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-48</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-046**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P11](../fase_0/0.4.1-entrevista-resultados.md#p11) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-046-ca-1), [CA-2](#hu-046-ca-2), [CA-3](#hu-046-ca-3), [CA-4](#hu-046-ca-4) | Ficha de la HU |
> | RF derivados | [RF-48](2-reglas-de-negocio-y-requisitos.md#rf-48) | Ficha de la HU |
> | RN | [RN-26](2-reglas-de-negocio-y-requisitos.md#rn-26), [RN-30](2-reglas-de-negocio-y-requisitos.md#rn-30) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-046) |
> | Casos de uso | [CU-046](3-casos-de-uso.md#cu-046) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-046) |
> | Caso de uso que nace de esta HU | [CU-046](3-casos-de-uso.md#cu-046) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-18](4-mockups.md#mk-18) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-046) |
> | Entidades · Clase.Método | TipoActivo · Catalogo.crear(), obtener(), actualizar(), inactivar() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-046) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-046) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-046**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-046-ca-1) | Creación de un valor nuevo | — | — | — | [CU-046](3-casos-de-uso.md#cu-046) |
| [CA-2](#hu-046-ca-2) | Rechazo por nombre repetido en el mismo catálogo | [RN-26](2-reglas-de-negocio-y-requisitos.md#rn-26) | — | — | [CU-046](3-casos-de-uso.md#cu-046) |
| [CA-3](#hu-046-ca-3) | Edición de un valor existente | — | — | — | [CU-046](3-casos-de-uso.md#cu-046) |
| [CA-4](#hu-046-ca-4) | Inactivación sin perder los registros que ya lo usan | [RN-30](2-reglas-de-negocio-y-requisitos.md#rn-30) | — | — | [CU-046](3-casos-de-uso.md#cu-046) |


<a id="hu-047"></a>

### HU-047 — Administrar los tipos de problema

**Tabla 47**  
*Historia de usuario HU-047: Administrar los tipos de problema*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-047</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Administrar los tipos de problema</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Administrador, quiero crear, editar e inactivar los tipos de problema del sistema, para mantener actualizadas las opciones que usan los demás usuarios al registrar información.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el administrador Jorge Ramírez ha iniciado sesión
</blockquote>
<a id="hu-047-ca-1"></a><strong>Escenario: CA-1 Creación de un valor nuevo</strong>
<blockquote>
<em># Catalogo.crear() · tabla tipo_problema</em>
<strong>Cuando</strong> Jorge crea el valor “Correo electrónico” en los tipos de problema
<strong>Entonces</strong> ese valor queda disponible como opción para los demás usuarios
</blockquote>
<a id="hu-047-ca-2"></a><strong>Escenario: CA-2 Rechazo por nombre repetido en el mismo catálogo</strong>
<blockquote>
<em># RN-26</em>
<strong>Dado</strong> que ya existe el valor “Correo electrónico”
<strong>Cuando</strong> Jorge intenta crear otro valor también llamado “Correo electrónico” en el mismo catálogo
<strong>Entonces</strong> el sistema no lo permite
</blockquote>
<a id="hu-047-ca-3"></a><strong>Escenario: CA-3 Edición de un valor existente</strong>
<blockquote>
<em># Catalogo.actualizar()</em>
<strong>Cuando</strong> Jorge cambia el nombre “Programa” por “Software”
<strong>Entonces</strong> el sistema guarda el nuevo nombre
</blockquote>
<a id="hu-047-ca-4"></a><strong>Escenario: CA-4 Inactivación sin perder los registros que ya lo usan</strong>
<blockquote>
<em># Catalogo.inactivar() · Catalogo.obtener() ofrece solo los valores activos · RN-30</em>
<strong>Dado</strong> que el valor “Fax” ya fue usado en registros anteriores
<strong>Cuando</strong> Jorge lo inactiva
<strong>Entonces</strong> deja de aparecer como opción para registros nuevos
<strong>Y</strong> los registros anteriores que ya lo tenían lo conservan sin cambios
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P11 y P12 de los resultados por pregunta (P11: "Los usuarios reportan tanto problemas urgentes como solicitudes de nuevos servicios"; P12: "Muchos prefieren describir el problema y que el sistema o el área de TI lo clasifique").</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-48</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-047**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P11](../fase_0/0.4.1-entrevista-resultados.md#p11), [P12](../fase_0/0.4.1-entrevista-resultados.md#p12) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-047-ca-1), [CA-2](#hu-047-ca-2), [CA-3](#hu-047-ca-3), [CA-4](#hu-047-ca-4) | Ficha de la HU |
> | RF derivados | [RF-48](2-reglas-de-negocio-y-requisitos.md#rf-48) | Ficha de la HU |
> | RN | [RN-04](2-reglas-de-negocio-y-requisitos.md#rn-04), [RN-26](2-reglas-de-negocio-y-requisitos.md#rn-26), [RN-30](2-reglas-de-negocio-y-requisitos.md#rn-30) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-047) |
> | Casos de uso | [CU-047](3-casos-de-uso.md#cu-047) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-047) |
> | Caso de uso que nace de esta HU | [CU-047](3-casos-de-uso.md#cu-047) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-18](4-mockups.md#mk-18) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-047) |
> | Entidades · Clase.Método | TipoProblema · Catalogo.crear(), obtener(), actualizar(), inactivar() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-047) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-047) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-047**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-047-ca-1) | Creación de un valor nuevo | — | — | — | [CU-047](3-casos-de-uso.md#cu-047) |
| [CA-2](#hu-047-ca-2) | Rechazo por nombre repetido en el mismo catálogo | [RN-26](2-reglas-de-negocio-y-requisitos.md#rn-26) | — | — | [CU-047](3-casos-de-uso.md#cu-047) |
| [CA-3](#hu-047-ca-3) | Edición de un valor existente | — | — | — | [CU-047](3-casos-de-uso.md#cu-047) |
| [CA-4](#hu-047-ca-4) | Inactivación sin perder los registros que ya lo usan | [RN-30](2-reglas-de-negocio-y-requisitos.md#rn-30) | — | — | [CU-047](3-casos-de-uso.md#cu-047) |


<a id="hu-048"></a>

### HU-048 — Administrar los tipos de solicitud

**Tabla 48**  
*Historia de usuario HU-048: Administrar los tipos de solicitud*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-048</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Administrar los tipos de solicitud</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Administrador, quiero crear, editar e inactivar los tipos de solicitud del sistema, para mantener actualizadas las opciones que usan los demás usuarios al registrar información.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el administrador Jorge Ramírez ha iniciado sesión
</blockquote>
<a id="hu-048-ca-1"></a><strong>Escenario: CA-1 Creación de un valor nuevo</strong>
<blockquote>
<em># Catalogo.crear() · tabla tipo_solicitud</em>
<strong>Cuando</strong> Jorge crea el valor “Capacitación” en los tipos de solicitud
<strong>Entonces</strong> ese valor queda disponible como opción para los demás usuarios
</blockquote>
<a id="hu-048-ca-2"></a><strong>Escenario: CA-2 Rechazo por nombre repetido en el mismo catálogo</strong>
<blockquote>
<em># RN-26</em>
<strong>Dado</strong> que ya existe el valor “Capacitación”
<strong>Cuando</strong> Jorge intenta crear otro valor también llamado “Capacitación” en el mismo catálogo
<strong>Entonces</strong> el sistema no lo permite
</blockquote>
<a id="hu-048-ca-3"></a><strong>Escenario: CA-3 Edición de un valor existente</strong>
<blockquote>
<em># Catalogo.actualizar()</em>
<strong>Cuando</strong> Jorge cambia el nombre “Acceso” por “Acceso a sistemas”
<strong>Entonces</strong> el sistema guarda el nuevo nombre
</blockquote>
<a id="hu-048-ca-4"></a><strong>Escenario: CA-4 Inactivación sin perder los registros que ya lo usan</strong>
<blockquote>
<em># Catalogo.inactivar() · Catalogo.obtener() ofrece solo los valores activos · RN-30</em>
<strong>Dado</strong> que el valor “Capacitación” ya fue usado en registros anteriores
<strong>Cuando</strong> Jorge lo inactiva
<strong>Entonces</strong> deja de aparecer como opción para registros nuevos
<strong>Y</strong> los registros anteriores que ya lo tenían lo conservan sin cambios
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P11 y P12 de los resultados por pregunta (P11: "Los usuarios reportan tanto problemas urgentes como solicitudes de nuevos servicios"; P12: "Muchos prefieren describir el problema y que el sistema o el área de TI lo clasifique").</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-48</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-048**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P11](../fase_0/0.4.1-entrevista-resultados.md#p11), [P12](../fase_0/0.4.1-entrevista-resultados.md#p12) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-048-ca-1), [CA-2](#hu-048-ca-2), [CA-3](#hu-048-ca-3), [CA-4](#hu-048-ca-4) | Ficha de la HU |
> | RF derivados | [RF-48](2-reglas-de-negocio-y-requisitos.md#rf-48) | Ficha de la HU |
> | RN | [RN-04](2-reglas-de-negocio-y-requisitos.md#rn-04), [RN-26](2-reglas-de-negocio-y-requisitos.md#rn-26), [RN-30](2-reglas-de-negocio-y-requisitos.md#rn-30) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-048) |
> | Casos de uso | [CU-048](3-casos-de-uso.md#cu-048) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-048) |
> | Caso de uso que nace de esta HU | [CU-048](3-casos-de-uso.md#cu-048) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-18](4-mockups.md#mk-18) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-048) |
> | Entidades · Clase.Método | TipoSolicitud · Catalogo.crear(), obtener(), actualizar(), inactivar() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-048) |
> | Mensajes de secuencia | N/A: caso no crítico | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-048) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-048**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-048-ca-1) | Creación de un valor nuevo | — | — | — | [CU-048](3-casos-de-uso.md#cu-048) |
| [CA-2](#hu-048-ca-2) | Rechazo por nombre repetido en el mismo catálogo | [RN-26](2-reglas-de-negocio-y-requisitos.md#rn-26) | — | [RN-26](2-reglas-de-negocio-y-requisitos.md#rn-26) | [CU-048](3-casos-de-uso.md#cu-048) |
| [CA-3](#hu-048-ca-3) | Edición de un valor existente | — | — | — | [CU-048](3-casos-de-uso.md#cu-048) |
| [CA-4](#hu-048-ca-4) | Inactivación sin perder los registros que ya lo usan | [RN-30](2-reglas-de-negocio-y-requisitos.md#rn-30) | — | [RN-04](2-reglas-de-negocio-y-requisitos.md#rn-04), [RN-30](2-reglas-de-negocio-y-requisitos.md#rn-30) | [CU-048](3-casos-de-uso.md#cu-048) |


<a id="hu-049"></a>

### HU-049 — Corregir la clasificación de un caso

**Tabla 49**  
*Historia de usuario HU-049: Corregir la clasificación de un caso*

<table>
<thead>
<tr class="header">
<th><strong>Código</strong></th>
<th><strong>HU-049</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Título corto</strong></td>
<td>Corregir la clasificación de un caso</td>
</tr>
<tr class="even">
<td><strong>Historia</strong></td>
<td>Como Personal de soporte, quiero corregir el tipo de un caso que el solicitante clasificó mal (problema o solicitud), dejando registrado quién lo corrigió, cuándo y por qué, para que el caso siga el proceso correcto.</td>
</tr>
<tr class="odd">
<td><strong>Criterios de aceptación</strong></td>
<td><strong>Antecedentes:</strong>
<blockquote>
<strong>Dado</strong> que el técnico Carlos Peña ha iniciado sesión
<strong>Y</strong> Marcela Ríos registró su caso MA-2026-000145 como solicitud, cuando en realidad es un problema
</blockquote>
<a id="hu-049-ca-1"></a><strong>Escenario: CA-1 Corrección exitosa</strong>
<blockquote>
<em># actualizarCaso() · HistorialCaso.registrarHistorial() · RN-03, RN-08</em>
<strong>Cuando</strong> Carlos corrige el tipo de caso a “problema” e indica el motivo
<strong>Entonces</strong> el sistema guarda el nuevo tipo de caso
<strong>Y</strong> registra en el historial del caso quién hizo la corrección, cuándo la hizo y el motivo indicado por Carlos
</blockquote>
<a id="hu-049-ca-2"></a><strong>Escenario: CA-2 La corrección mantiene los datos coherentes</strong>
<blockquote>
<em># RN-03 · exclusión mutua entre tipo de problema y tipo/clase de solicitud</em>
<strong>Cuando</strong> Carlos corrige una solicitud a problema
<strong>Entonces</strong> el sistema le pide el tipo de problema
<strong>Y</strong> descarta el tipo de solicitud y la clase de solicitud anteriores
</blockquote>
<a id="hu-049-ca-3"></a><strong>Escenario: CA-3 Rechazo por rol no autorizado</strong>
<blockquote>
<em># RN-23 · acceso según perfil</em>
<strong>Cuando</strong> Marcela Ríos (perfil solicitante) intenta corregir el tipo de su propio caso
<strong>Entonces</strong> el sistema no se lo permite
<strong>Y</strong> conserva el tipo de caso anterior
</blockquote></td>
</tr>
<tr class="even">
<td><strong>Origen de la necesidad</strong></td>
<td>Entrevista a usuarios — P12 de los resultados por pregunta (P12: "Muchos prefieren describir el problema y que el sistema o el área de TI lo clasifique"). Esta historia era el CA-4 de HU-004 y se separó porque la ejecuta el personal de soporte, no el solicitante.</td>
</tr>
<tr class="odd">
<td><strong>RF derivados</strong></td>
<td><strong>RF-08, RF-49</strong></td>
</tr>
<tr class="even">
<td><strong>Prioridad</strong></td>
<td>Media</td>
</tr>
</tbody>
</table>

> **🔗 Trazabilidad de HU-049**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Origen (entrevista) | [P12](../fase_0/0.4.1-entrevista-resultados.md#p12) | Origen de la necesidad |
> | Criterios de aceptación | [CA-1](#hu-049-ca-1), [CA-2](#hu-049-ca-2), [CA-3](#hu-049-ca-3) | Ficha de la HU |
> | RF derivados | [RF-08](2-reglas-de-negocio-y-requisitos.md#rf-08), [RF-49](2-reglas-de-negocio-y-requisitos.md#rf-49) | Ficha de la HU |
> | RN | [RN-03](2-reglas-de-negocio-y-requisitos.md#rn-03), [RN-08](2-reglas-de-negocio-y-requisitos.md#rn-08), [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-049) |
> | Casos de uso | [CU-049](3-casos-de-uso.md#cu-049), [CU-S02](3-casos-de-uso.md#cu-s02) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-049) |
> | Caso de uso que nace de esta HU | [CU-049](3-casos-de-uso.md#cu-049) | Procedencia del CU («El rol de la HU») |
> | Mockups | [MK-06](4-mockups.md#mk-06) | [Matriz §5](5-matriz-de-trazabilidad-analisis.md#m5-hu-049) |
> | Entidades · Clase.Método | CasoSoporte, HistorialCaso · CasoSoporte.actualizarCaso();  HistorialCaso.registrarHistorial() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-049) |
> | Mensajes de secuencia | Sec. CU-001: registrarHistorial();  Sec. CU-007: actualizarCaso() | [Matriz §14](../fase_2/12-matriz-de-trazabilidad.md#m14-hu-049) |
> | Implementación y pruebas | *No identificado en el documento* | — |

**Trazabilidad de los criterios de aceptación de HU-049**

| CA | Escenario | RN que cita | RF que cita | RN que nacen de este CA | CU que lo implementa |
|---|---|---|---|---|---|
| [CA-1](#hu-049-ca-1) | Corrección exitosa | [RN-03](2-reglas-de-negocio-y-requisitos.md#rn-03), [RN-08](2-reglas-de-negocio-y-requisitos.md#rn-08) | — | [RN-08](2-reglas-de-negocio-y-requisitos.md#rn-08) | [CU-049](3-casos-de-uso.md#cu-049) |
| [CA-2](#hu-049-ca-2) | La corrección mantiene los datos coherentes | [RN-03](2-reglas-de-negocio-y-requisitos.md#rn-03) | — | [RN-03](2-reglas-de-negocio-y-requisitos.md#rn-03) | [CU-049](3-casos-de-uso.md#cu-049) |
| [CA-3](#hu-049-ca-3) | Rechazo por rol no autorizado | [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | — | [RN-23](2-reglas-de-negocio-y-requisitos.md#rn-23) | [CU-049](3-casos-de-uso.md#cu-049) |

