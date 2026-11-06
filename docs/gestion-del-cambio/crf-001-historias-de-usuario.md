# CRF-001 — Gestión del cambio de las historias de usuario

> **Guía de seguimiento:** transversal a toda la ruta — *gestión del cambio y gestión de la configuración* (todo cambio entra por CRF; el Cambio DECIDE).
>
> **Fuente:** documento Word *Gestion_del_Cambio_HU_CRF.docx* («Gestión del Cambio de las Historias de Usuario»).

**Formulario de Solicitud de Cambio (CRF)**

<table>
<tbody>
<tr class="odd">
<td><strong>ID del CRF</strong></td>
<td>CRF-001 — Change Request Form (Formulario de Solicitud de Cambio)</td>
</tr>
<tr class="even">
<td><strong>Proyecto</strong></td>
<td>Sistema de Mesa de Ayuda TI — Nexa Servicios</td>
</tr>
<tr class="odd">
<td><strong>Fecha de solicitud</strong></td>
<td>7 de octubre de 2026</td>
</tr>
<tr class="even">
<td><strong>Solicitante</strong></td>
<td>Equipo de desarrollo del proyecto (revisión con el docente de la asignatura)</td>
</tr>
<tr class="odd">
<td><strong>Elemento afectado</strong></td>
<td>Historias de Usuario (HU) y criterios de aceptación — documento «HU´s + Criterios», 40 historias (HU-001 a HU-042, sin HU-014 ni HU-027).</td>
</tr>
<tr class="even">
<td><strong>Tipo de cambio</strong></td>
<td>Mejora y adición de información (evolutivo de especificación) — no modifica la funcionalidad ni el alcance del sistema.</td>
</tr>
<tr class="odd">
<td><strong>Descripción del cambio</strong></td>
<td><p>Durante el primer semestre las Historias de Usuario se construyeron principalmente con la información de las entrevistas a los usuarios. Con el avance del proyecto y un mayor entendimiento del sistema, se ajustaron para que dejen de basarse únicamente en esos hallazgos y se fundamenten también en el análisis del diagrama UML y en los métodos identificados en los distintos casos de uso.</p>
<p>El cambio incorpora el campo «Origen», que identifica la fuente de cada historia, y agrega criterios de aceptación que definen con precisión las condiciones para considerar satisfactoria cada funcionalidad. Además, se mejoró la estructura general de las historias para aumentar su claridad, completitud y alineación con las necesidades del sistema, y se fortaleció la trazabilidad con los demás artefactos de análisis y diseño.</p></td>
</tr>
<tr class="even">
<td><strong>Justificación técnica</strong></td>
<td><p>Una historia basada solo en entrevistas refleja lo que el usuario percibe y expresa, pero no necesariamente todo lo que el sistema debe hacer. El análisis del diagrama UML y de los métodos de los casos de uso evidenció operaciones y validaciones que las entrevistas no habían revelado, así como historias de alcance ambiguo.</p>
<p>Sin un campo de origen no era posible rastrear la razón de ser de cada historia, y sin criterios de aceptación no existían condiciones verificables para validar las funcionalidades. Según Sommerville, la validación de requisitos exige comprobar que el conjunto sea completo y consistente; por eso era necesario que cada historia tuviera fuente identificada, condiciones precisas y relación explícita con los requerimientos derivados.</p></td>
</tr>
<tr class="odd">
<td><strong>Análisis de impacto</strong></td>
<td><p>Historias de Usuario: se modifica su estructura y se enriquecen con el campo «Origen», los criterios de aceptación y la relación con los RF derivados. La redacción original del «quiero» de cada historia se conserva.</p>
<p>Requerimientos funcionales: se establece la trazabilidad HU ↔︎ RF; los 49 requerimientos quedan asociados a al menos una historia y las 40 historias cuentan con al menos un requerimiento derivado, sin RF huérfanos ni historias vacías. No se crean requerimientos nuevos ni se altera su numeración.</p>
<p>Reglas de negocio, casos de uso y modelo UML: no se modifican; se refuerza su vínculo con las historias, ya que los criterios de rechazo permiten verificar que cada regla tenga un requerimiento que la vigile.</p>
<p>Esfuerzo estimado: bajo a medio, concentrado en la revisión y documentación; no afecta el código ni la arquitectura. El riesgo de no aprobar el cambio es mantener historias ambiguas y una trazabilidad incompleta, con posibles omisiones de funcionalidades en etapas posteriores.</p></td>
</tr>
<tr class="even">
<td><strong>Estado</strong></td>
<td>Aprobado — incorporado a la versión definitiva de las Historias de Usuario.</td>
</tr>
</tbody>
</table>

Como resultado del cambio, el proyecto cuenta con historias más completas y verificables: cada una identifica su origen, define sus condiciones de aceptación y se relaciona explícitamente con los requerimientos que la implementan. Esto facilita la validación de las funcionalidades, reduce los malentendidos entre quienes especifican y quienes implementan, y disminuye el riesgo de omisiones o inconsistencias en las etapas posteriores del desarrollo.

> **🔗 Trazabilidad del CRF-001**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Elemento afectado | [Historias de usuario y criterios de aceptación](../fase_1/1-historias-de-usuario.md) | Campo «Elemento afectado» |
> | Campo «Origen» de cada HU | Preguntas de la [entrevista](../fase_0/0.4.1-entrevista-resultados.md), citadas en el «Origen de la necesidad» de cada [HU](../fase_1/1-historias-de-usuario.md) | Campo «Descripción del cambio» |
> | Trazabilidad HU ↔ RF | [Anexo B (HU ↔ RF) y Anexo C (RF → HU)](../fase_1/1.1-anexos-trazabilidad-hu-rf.md) · [Requisitos funcionales](../fase_1/2-reglas-de-negocio-y-requisitos.md) | Campo «Análisis de impacto» |
> | Reglas de negocio, casos de uso y modelo UML (vínculo reforzado, sin modificarse) | [Reglas de negocio](../fase_1/2-reglas-de-negocio-y-requisitos.md#21-reglas-de-negocio) · [Casos de uso](../fase_1/3-casos-de-uso.md) · [Diagrama de clases](../fase_2/7-diagrama-de-clases.md) | Campo «Análisis de impacto» |
> | Cambio posterior que actualiza sus cifras | [CRF-002](crf-002-fase-1.md) (de 40 a 46 HU y de 49 a 50 RF) | CRF-002 |
