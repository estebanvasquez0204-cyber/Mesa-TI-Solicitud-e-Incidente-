# 15. Gestión del cambio de la Fase 1

> **Guía de seguimiento:** Transversal a toda la ruta — *gestión del cambio y gestión de la configuración* (todo cambio entra por CRF).
>
> **Fuente:** documento Word *Proyecto.docx* — «Mesa de Ayuda TI de Nexa Servicios» (F. J. Motta Quintero y E. Vásquez Valencia · Ingeniería de Software II · Docente: Lora Patiño Gloria Amparo · Octubre de 2026), sección 15.

## 15.1 Formulario de Solicitud de Cambio (CRF-002)

Como resultado del cambio, la Fase 1 queda alineada con el modelo de datos: cada historia se redacta sin interfaz ni tecnología, cada requisito describe una obligación del sistema, y cada entidad, método, regla y caso de uso puede rastrearse hasta su historia. Esto facilita validar la especificación y reduce el riesgo de inconsistencias en las fases siguientes.

**Tabla 256**  
*Formulario de Solicitud de Cambio CRF-002 de la Fase 1*

<table>
<thead>
<tr class="header">
<th><strong>ID del CRF</strong></th>
<th>CRF-002 — Change Request Form (Formulario de Solicitud de Cambio)</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>Proyecto</strong></td>
<td>Sistema de Mesa de Ayuda TI — Nexa Servicios</td>
</tr>
<tr class="even">
<td><strong>Fecha de solicitud</strong></td>
<td>26 de octubre de 2026</td>
</tr>
<tr class="odd">
<td><strong>Solicitante</strong></td>
<td>Equipo de desarrollo del proyecto, a partir de la retroalimentación de la docente sobre la Fase 1 (revisión del 25 de octubre de 2026, criterios C3, C4 y C5).</td>
</tr>
<tr class="even">
<td><strong>Elemento afectado</strong></td>
<td>Documento «Fase 1»: historias de usuario y criterios de aceptación, reglas de negocio, requisitos funcionales, casos de uso, mockups y matriz de trazabilidad. Pasa de 40 a 46 historias (HU-001 a HU-049, sin HU-014, HU-027 ni HU-039), de 49 a 50 requisitos funcionales, de 29 a 30 reglas de negocio y de 42 a 48 casos de uso. Se incorpora el modelo de datos (MER, diagrama de clases y diccionario) como sección 2.4 y anexos D y E.</td>
</tr>
<tr class="odd">
<td><strong>Tipo de cambio</strong></td>
<td>Correctivo y de alineación con el modelo (C3), de calidad de las historias (C4) y de redacción de requisitos (C5). No cambia el alcance del sistema: no se agregan funciones nuevas para el usuario. Dos adiciones nacen de brechas del modelo: el registro de la primera respuesta (RF-50) y la corrección de la clasificación del caso como historia propia (HU-049).</td>
</tr>
<tr class="even">
<td><strong>Descripción del cambio</strong></td>
<td>C3 — Coherencia con el modelo. Se incorporan a la Fase 1 el MER (18 entidades, 25 relaciones, notación de pata de gallo), el diagrama de clases y el diccionario de datos. Se verifica que las 18 entidades tengan al menos una historia y que los 53 métodos del diagrama tengan historia y requisito (Anexo E). El único método sin cobertura, CasoSoporte.registrarPrimeraRespuesta(), queda cubierto por HU-007 CA-5 y el nuevo RF-50. Se citan por su nombre los métodos que las historias describían sin nombrarlos (marcarSolucionado, actualizarUsuario y los cuatro de Catalogo).
C4 — Historias de usuario. Se reescriben HU-001, HU-002 y HU-003 sin referencias a pantallas ni ventanas emergentes. La HU-023, la HU-024 y la HU-025 enumeran los cuatro roles en lugar de «Usuario del sistema». Las HU-006 y HU-034 pasan a «Personal de soporte». La HU-039 se divide en seis historias, una por catálogo (HU-043 a HU-048). La HU-004 cede la corrección de clasificación a la nueva HU-049. Se agregan criterios de rechazo que faltaban (HU-006 CA-5, HU-010 CA-4, HU-033 CA-3, HU-034 CA-3) y se reemplazan los orígenes parafraseados por los hallazgos reales de la entrevista (P1 a P13); las historias que la entrevista no motiva se marcan como «derivado».
C5 — Requisitos funcionales. Se reescriben nueve RF (RF-02, 03, 04, 13, 17, 21, 24, 41 y 48) para quitar interfaz y tecnología. Se agrega el RF-50 (primera respuesta) y la regla RN-30 (inactivación de valores de catálogo). Se corrigen los orígenes de RF-01 (HU-001 y HU-002) y RF-34 (HU-023 y HU-032).
Modelo de datos. Tres campos nuevos, pendientes de validación con la docente: usuario.fecha_actualizacion, usuario.id_usuario_modificacion e historial_caso.motivo, más el valor cambio_clasificacion en historial_caso.accion. Se agrega la relación de auditoría usuario → usuario (R25).</td>
</tr>
<tr class="odd">
<td><strong>Justificación técnica</strong></td>
<td>La revisión mostró que la Fase 1 se leía bien por separado pero no demostraba coherencia con el modelo: historias con lenguaje de interfaz, un método sin historia, una historia que agrupaba seis catálogos y requisitos que describían pantallas. Según Sommerville (2011), la validación de requisitos exige comprobar que el conjunto sea completo y consistente; por eso cada historia, requisito, regla, caso de uso y método debe poder rastrearse hacia su padre y hacia el modelo.
Los campos nuevos responden a criterios de aceptación que exigen guardar un dato que el modelo no tenía (fecha y autor del cambio de un usuario; motivo de una corrección). Se prefirió ampliar el modelo, y no debilitar las historias, porque el dato lo pide el negocio.</td>
</tr>
<tr class="even">
<td><strong>Análisis de impacto</strong></td>
<td>Historias de usuario: 15 modificadas (HU-001, 002, 003, 004, 006, 007, 010, 023, 024, 025, 032, 033, 034, 035 y 042), 1 retirada y dividida (HU-039) y 7 nuevas (HU-043 a HU-049).
Requisitos funcionales: 9 reescritos, 1 nuevo (RF-50) y 2 con origen corregido. Reglas de negocio: RN-30 nueva; RN-01, 03, 04, 06, 08, 14, 23 y 26 con orígenes o enunciado ajustados. Casos de uso: CU-039 sustituido por CU-043 a CU-048; CU-049 nuevo; CU-004, 007, 023, 024 y 025 ajustados; flujos alternativos nuevos en CU-006, 010, 033 y 034. Mockups: MK-02, MK-06 y MK-18 ajustados; los 18 siguen atendiendo al menos un caso de uso.
Diagramas: los cinco diagramas generales por actor de la versión anterior se retiran; permanece solo el diagrama de los cuatro casos de uso críticos (3.2.2); las imágenes de los mockups deben regenerarse en el material original.
Modelo de datos: tres campos y un valor de lista nuevos; el diagrama de clases no cambia.
Conteos resultantes: 46 historias, 50 RF, 30 RN, 48 CU (46 de HU y 2 de apoyo), 18 mockups y 10 RNF; verificados por programa en la sección 6 de la Fase 1.
Esfuerzo estimado: medio, concentrado en documentación. Riesgo de no aprobar: mantener la observación de la docente en C3, C4 y C5 y llegar a las fases de diseño con un modelo que no respalda lo especificado.</td>
</tr>
<tr class="odd">
<td><strong>Relación con el CRF-001</strong></td>
<td>El CRF-001 (7 de octubre de 2026, estado Aprobado) no se modifica. Sigue vigente en lo que describe, salvo en las cifras de su análisis de impacto («49 requerimientos», «40 historias», «no se crean requerimientos nuevos»), que este CRF-002 actualiza, y en su afirmación de que el modelo UML y los casos de uso no se modificaban, que deja de ser cierta.</td>
</tr>
<tr class="even">
<td><strong>Decisiones pendientes de validar</strong></td>
<td>1) Definición de «primera respuesta» como el primer cambio de situación del caso a «en revisión». 2) Los tres campos nuevos del modelo y el valor cambio_clasificacion. 3) Los cuatro roles listados en HU-023, HU-024 y HU-025 (aceptado por el equipo).</td>
</tr>
<tr class="odd">
<td><strong>Estado</strong></td>
<td>Propuesto — pendiente de revisión y aprobación de la docente. Al aprobarse, se incorpora a la versión definitiva de la Fase 1.</td>
</tr>
</tbody>
</table>

*Nota.* Elaboración propia. El CRF-001 (7 de octubre de 2026, estado Aprobado) no se modifica; este CRF-002 actualiza sus cifras.
