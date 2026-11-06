# 2. Reglas de Negocio y Requisitos: RF + RN + RNF

> **Guía de seguimiento:** Fase 1 — actividad *2. RF + RN + RNF*.
>
> **Fuente:** documento Word *Proyecto.docx* — «Mesa de Ayuda TI de Nexa Servicios» (F. J. Motta Quintero y E. Vásquez Valencia · Ingeniería de Software II · Docente: Lora Patiño Gloria Amparo · Octubre de 2026), sección 2.

## 2.1 Reglas de Negocio

***De dónde nace:** las reglas fueron delatadas por los criterios de aceptación de RECHAZO (“el sistema no registra y muestra…”) y por los criterios de éxito que fijan una condición permanente. La pregunta “¿esta prohibición existiría sin software?” convierte ese criterio en una RN numerada. Cada RN queda vigilada por al menos un RF (ninguna regla sin vigilante) y se hace visible en los flujos alternativos de los casos de uso.*

**Tabla 52**  
<a id="rn-01"></a>

*Regla de negocio RN-01: Datos mínimos del caso*

| **Código**            | **RN-01 — Datos mínimos del caso**                                                                                                                                                     |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Un caso solo puede enviarse si indica qué necesita, dónde ocurre, a quiénes afecta, qué tan urgente es y contar con datos de contacto registrados del solicitante (teléfono o correo). |
| **Origen**            | Criterios de rechazo HU-001 CA-2, HU-021 CA-2 y HU-022 CA-3; entrevista: la información enviada suele estar incompleta (P6).                                                           |
| **RF que la vigilan** | RF-01 y RF-18                                                                                                                                                                          |

> **🔗 Trazabilidad de RN-01**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-001 CA-2](1-historias-de-usuario.md#hu-001-ca-2), [HU-021 CA-2](1-historias-de-usuario.md#hu-021-ca-2), [HU-022 CA-3](1-historias-de-usuario.md#hu-022-ca-3) | Campo «Origen» |
> | Origen (entrevista) | [P6](../fase_0/0.4.1-entrevista-resultados.md#p6) | Campo «Origen» |
> | RF que la vigilan | [RF-01](#rf-01), [RF-18](#rf-18) | Campo «RF que la vigilan» |
> | Casos de uso que la aplican | [CU-001](3-casos-de-uso.md#cu-001), [CU-021](3-casos-de-uso.md#cu-021), [CU-022](3-casos-de-uso.md#cu-022) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-02](4-mockups.md#mk-02) | Fichas de mockup («RN visibles») |
> | HU | [HU-001](1-historias-de-usuario.md#hu-001), [HU-021](1-historias-de-usuario.md#hu-021), [HU-022](1-historias-de-usuario.md#hu-022) | Matriz §5 |
> | Implementación en la base de datos | [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) (`telefono`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`titulo`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`descripcion`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`lugar`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`id_tabla_importancia`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`usuario.telefono`](../apoyo/trazabilidad_atributos.md#atr-usuario-telefono), [`caso_soporte.titulo`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-titulo), [`caso_soporte.descripcion`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-descripcion), [`caso_soporte.lugar`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-lugar), [`caso_soporte.id_tabla_importancia`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-id-tabla-importancia) | Columnas de las restricciones marcadas `-- RN-01` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.16](../fase_3/13.1-pruebas-ddl.md#prueba-5-16) | Sección 5 del script (13.1) |


**Tabla 53**  
<a id="rn-02"></a>

*Regla de negocio RN-02: Número de seguimiento único*

| **Código**            | **RN-02 — Número de seguimiento único**                                                               |
|-----------------------|-------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Todo caso recibe un número de seguimiento con formato MA-AAAA-NNNNNN que nunca se repite entre casos. |
| **Origen**            | HU-001 CA-1 y HU-002 CA-3; entrevista: los usuarios no saben si su solicitud fue recibida (P3).       |
| **RF que la vigilan** | RF-01 y RF-03                                                                                         |

> **🔗 Trazabilidad de RN-02**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-001 CA-1](1-historias-de-usuario.md#hu-001-ca-1), [HU-002 CA-3](1-historias-de-usuario.md#hu-002-ca-3) | Campo «Origen» |
> | Origen (entrevista) | [P3](../fase_0/0.4.1-entrevista-resultados.md#p3) | Campo «Origen» |
> | RF que la vigilan | [RF-01](#rf-01), [RF-03](#rf-03) | Campo «RF que la vigilan» |
> | Casos de uso que la aplican | [CU-001](3-casos-de-uso.md#cu-001), [CU-002](3-casos-de-uso.md#cu-002) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-03](4-mockups.md#mk-03) | Fichas de mockup («RN visibles») |
> | HU | [HU-001](1-historias-de-usuario.md#hu-001), [HU-002](1-historias-de-usuario.md#hu-002) | Matriz §5 |
> | Implementación en la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`numero_seguimiento`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`uq_caso_numero_seguimiento`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`ck_caso_numero_seguimiento_formato`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`caso_soporte.numero_seguimiento`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-numero-seguimiento) | Columnas de las restricciones marcadas `-- RN-02` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.9](../fase_3/13.1-pruebas-ddl.md#prueba-5-9), [5.10](../fase_3/13.1-pruebas-ddl.md#prueba-5-10) | Sección 5 del script (13.1) |


**Tabla 54**  
<a id="rn-03"></a>

*Regla de negocio RN-03: Un caso es problema o solicitud, nunca ambos*

| **Código**            | **RN-03 — Un caso es problema o solicitud, nunca ambos**                                                                                                                                |
|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Un caso es un problema o una solicitud. El problema lleva tipo de problema; la solicitud lleva tipo de solicitud y clase de solicitud (nuevo, cambio o consulta). No se pueden mezclar. |
| **Origen**            | Criterios de rechazo HU-004 CA-1 a CA-3, HU-020 CA-2 y CA-3 y HU-049 CA-2; entrevista: los usuarios reportan tanto problemas como solicitudes (P11).                                    |
| **RF que la vigilan** | RF-07, RF-08, RF-31, RF-32 y RF-33                                                                                                                                                      |

> **🔗 Trazabilidad de RN-03**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-004 CA-1](1-historias-de-usuario.md#hu-004-ca-1), [HU-004 CA-2](1-historias-de-usuario.md#hu-004-ca-2), [HU-004 CA-3](1-historias-de-usuario.md#hu-004-ca-3), [HU-020 CA-2](1-historias-de-usuario.md#hu-020-ca-2), [HU-020 CA-3](1-historias-de-usuario.md#hu-020-ca-3), [HU-049 CA-2](1-historias-de-usuario.md#hu-049-ca-2) | Campo «Origen» |
> | Origen (entrevista) | [P11](../fase_0/0.4.1-entrevista-resultados.md#p11) | Campo «Origen» |
> | RF que la vigilan | [RF-07](#rf-07), [RF-08](#rf-08), [RF-31](#rf-31), [RF-32](#rf-32), [RF-33](#rf-33) | Campo «RF que la vigilan» |
> | CA que la citan | [HU-049 CA-1](1-historias-de-usuario.md#hu-049-ca-1), [HU-049 CA-2](1-historias-de-usuario.md#hu-049-ca-2) | Anotaciones de los criterios de aceptación |
> | Casos de uso que la aplican | [CU-004](3-casos-de-uso.md#cu-004), [CU-020](3-casos-de-uso.md#cu-020), [CU-049](3-casos-de-uso.md#cu-049) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-02](4-mockups.md#mk-02), [MK-06](4-mockups.md#mk-06) | Fichas de mockup («RN visibles») |
> | HU | [HU-004](1-historias-de-usuario.md#hu-004), [HU-018](1-historias-de-usuario.md#hu-018), [HU-019](1-historias-de-usuario.md#hu-019), [HU-020](1-historias-de-usuario.md#hu-020), [HU-049](1-historias-de-usuario.md#hu-049) | Matriz §5 |
> | Implementación en la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`tipo_caso`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`id_tipo_problema`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`id_tipo_solicitud`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`clase_solicitud`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`ck_caso_tipo_caso`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`ck_caso_clase_solicitud`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`ck_caso_clasificacion_exclusiva`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`caso_soporte.tipo_caso`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-tipo-caso), [`caso_soporte.id_tipo_problema`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-id-tipo-problema), [`caso_soporte.id_tipo_solicitud`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-id-tipo-solicitud), [`caso_soporte.clase_solicitud`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-clase-solicitud) | Columnas de las restricciones marcadas `-- RN-03` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.11](../fase_3/13.1-pruebas-ddl.md#prueba-5-11), [5.12](../fase_3/13.1-pruebas-ddl.md#prueba-5-12) | Sección 5 del script (13.1) |


**Tabla 55**  
<a id="rn-04"></a>

*Regla de negocio RN-04: Clasificación solo con opciones activas*

| **Código**            | **RN-04 — Clasificación solo con opciones activas**                                                                                                                                                      |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Los tipos de problema y de solicitud se eligen únicamente de las opciones activas del catálogo; no se admite texto libre. Una opción inactiva deja de ofrecerse, pero los casos anteriores la conservan. |
| **Origen**            | Criterios de rechazo HU-018 CA-2 y CA-3, HU-019 CA-2 y CA-3 y HU-047 y HU-048 CA-4.                                                                                                                      |
| **RF que la vigilan** | RF-31, RF-32 y RF-48                                                                                                                                                                                     |

> **🔗 Trazabilidad de RN-04**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-018 CA-2](1-historias-de-usuario.md#hu-018-ca-2), [HU-018 CA-3](1-historias-de-usuario.md#hu-018-ca-3), [HU-019 CA-2](1-historias-de-usuario.md#hu-019-ca-2), [HU-019 CA-3](1-historias-de-usuario.md#hu-019-ca-3), [HU-047 CA-4](1-historias-de-usuario.md#hu-047-ca-4), [HU-048 CA-4](1-historias-de-usuario.md#hu-048-ca-4) | Campo «Origen» |
> | RF que la vigilan | [RF-31](#rf-31), [RF-32](#rf-32), [RF-48](#rf-48) | Campo «RF que la vigilan» |
> | Casos de uso que la aplican | [CU-018](3-casos-de-uso.md#cu-018), [CU-019](3-casos-de-uso.md#cu-019) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-02](4-mockups.md#mk-02), [MK-18](4-mockups.md#mk-18) | Fichas de mockup («RN visibles») |
> | HU | [HU-018](1-historias-de-usuario.md#hu-018), [HU-019](1-historias-de-usuario.md#hu-019), [HU-047](1-historias-de-usuario.md#hu-047), [HU-048](1-historias-de-usuario.md#hu-048) | Matriz §5 |
> | Implementación en la base de datos | [`tipo_problema`](../fase_3/13-script-sql-ddl.md#tabla-tipo-problema) (`ck_tipo_problema_estado`), [`tipo_solicitud`](../fase_3/13-script-sql-ddl.md#tabla-tipo-solicitud) (`ck_tipo_solicitud_estado`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`fk_caso_tipo_problema`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`fk_caso_tipo_solicitud`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`tipo_problema.estado`](../apoyo/trazabilidad_atributos.md#atr-tipo-problema-estado), [`tipo_solicitud.estado`](../apoyo/trazabilidad_atributos.md#atr-tipo-solicitud-estado), [`caso_soporte.id_tipo_problema`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-id-tipo-problema), [`caso_soporte.id_tipo_solicitud`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-id-tipo-solicitud) | Columnas de las restricciones marcadas `-- RN-04` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |


**Tabla 56**  
<a id="rn-05"></a>

*Regla de negocio RN-05: Importancia calculada y fija*

| **Código**            | **RN-05 — Importancia calculada y fija**                                                                                                                                              |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | La importancia (P1 la más alta, P4 la más baja) se calcula automáticamente combinando afectación y urgencia según la matriz de prioridad. Se fija al crear el caso y no se recalcula. |
| **Origen**            | HU-022 CA-1 y CA-2, HU-021 CA-3 y HU-006 CA-2; entrevista: se espera atención según la necesidad real (P12, P13).                                                                     |
| **RF que la vigilan** | RF-11 y RF-19                                                                                                                                                                         |

> **🔗 Trazabilidad de RN-05**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-022 CA-1](1-historias-de-usuario.md#hu-022-ca-1), [HU-022 CA-2](1-historias-de-usuario.md#hu-022-ca-2), [HU-021 CA-3](1-historias-de-usuario.md#hu-021-ca-3), [HU-006 CA-2](1-historias-de-usuario.md#hu-006-ca-2) | Campo «Origen» |
> | Origen (entrevista) | [P12](../fase_0/0.4.1-entrevista-resultados.md#p12), [P13](../fase_0/0.4.1-entrevista-resultados.md#p13) | Campo «Origen» |
> | RF que la vigilan | [RF-11](#rf-11), [RF-19](#rf-19) | Campo «RF que la vigilan» |
> | Casos de uso que la aplican | [CU-001](3-casos-de-uso.md#cu-001), [CU-006](3-casos-de-uso.md#cu-006), [CU-022](3-casos-de-uso.md#cu-022) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-02](4-mockups.md#mk-02), [MK-07](4-mockups.md#mk-07) | Fichas de mockup («RN visibles») |
> | HU | [HU-006](1-historias-de-usuario.md#hu-006), [HU-021](1-historias-de-usuario.md#hu-021), [HU-022](1-historias-de-usuario.md#hu-022) | Matriz §5 |
> | Implementación en la base de datos | [`tabla_importancia`](../fase_3/13-script-sql-ddl.md#tabla-tabla-importancia) (`uq_tabla_importancia_afectacion_urgencia`), [`tabla_importancia`](../fase_3/13-script-sql-ddl.md#tabla-tabla-importancia) (`ck_tabla_importancia_afectacion`), [`tabla_importancia`](../fase_3/13-script-sql-ddl.md#tabla-tabla-importancia) (`ck_tabla_importancia_urgencia`), [`tabla_importancia`](../fase_3/13-script-sql-ddl.md#tabla-tabla-importancia) (`ck_tabla_importancia_resultado`), [`tabla_importancia`](../fase_3/13-script-sql-ddl.md#tabla-tabla-importancia) (`ck_tabla_importancia_estado`), [`tabla_importancia`](../fase_3/13-script-sql-ddl.md#tabla-tabla-importancia) (`fk_tabla_importancia_usuario_modificacion`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`id_tabla_importancia`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`fk_caso_tabla_importancia`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`tabla_importancia.afectacion`](../apoyo/trazabilidad_atributos.md#atr-tabla-importancia-afectacion), [`tabla_importancia.urgencia`](../apoyo/trazabilidad_atributos.md#atr-tabla-importancia-urgencia), [`tabla_importancia.resultado_importancia`](../apoyo/trazabilidad_atributos.md#atr-tabla-importancia-resultado-importancia), [`tabla_importancia.estado`](../apoyo/trazabilidad_atributos.md#atr-tabla-importancia-estado), [`tabla_importancia.id_usuario_modificacion`](../apoyo/trazabilidad_atributos.md#atr-tabla-importancia-id-usuario-modificacion), [`caso_soporte.id_tabla_importancia`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-id-tabla-importancia) | Columnas de las restricciones marcadas `-- RN-05` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.17](../fase_3/13.1-pruebas-ddl.md#prueba-5-17) | Sección 5 del script (13.1) |


**Tabla 57**  
<a id="rn-06"></a>

*Regla de negocio RN-06: Visibilidad de los casos propios*

| **Código**            | **RN-06 — Visibilidad de los casos propios**                                                            |
|-----------------------|---------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Un solicitante solo puede consultar sus propios casos y los comentarios marcados como visibles para él. |
| **Origen**            | Criterios de rechazo HU-005 CA-2, HU-009 CA-4 y HU-010 CA-4.                                            |
| **RF que la vigilan** | RF-09, RF-10 y RF-13                                                                                    |

> **🔗 Trazabilidad de RN-06**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-005 CA-2](1-historias-de-usuario.md#hu-005-ca-2), [HU-009 CA-4](1-historias-de-usuario.md#hu-009-ca-4), [HU-010 CA-4](1-historias-de-usuario.md#hu-010-ca-4) | Campo «Origen» |
> | RF que la vigilan | [RF-09](#rf-09), [RF-10](#rf-10), [RF-13](#rf-13) | Campo «RF que la vigilan» |
> | CA que la citan | [HU-010 CA-4](1-historias-de-usuario.md#hu-010-ca-4) | Anotaciones de los criterios de aceptación |
> | Casos de uso que la aplican | [CU-005](3-casos-de-uso.md#cu-005), [CU-010](3-casos-de-uso.md#cu-010) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-04](4-mockups.md#mk-04) | Fichas de mockup («RN visibles») |
> | HU | [HU-005](1-historias-de-usuario.md#hu-005), [HU-007](1-historias-de-usuario.md#hu-007), [HU-010](1-historias-de-usuario.md#hu-010) | Matriz §5 |
> | Implementación en la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`id_usuario_solicitante`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`fk_caso_solicitante`), [`comentario_caso`](../fase_3/13-script-sql-ddl.md#tabla-comentario-caso) (`ck_comentario_visibilidad`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`caso_soporte.id_usuario_solicitante`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-id-usuario-solicitante), [`comentario_caso.visibilidad`](../apoyo/trazabilidad_atributos.md#atr-comentario-caso-visibilidad) | Columnas de las restricciones marcadas `-- RN-06` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.31](../fase_3/13.1-pruebas-ddl.md#prueba-5-31) | Sección 5 del script (13.1) |


**Tabla 58**  
<a id="rn-07"></a>

*Regla de negocio RN-07: Cambios de situación permitidos por perfil*

| **Código**            | **RN-07 — Cambios de situación permitidos por perfil**                                                                                                         |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | La situación de un caso solo cambia siguiendo las transiciones permitidas y por un perfil autorizado. El solicitante no puede cambiar la situación de su caso. |
| **Origen**            | Criterios de rechazo HU-007 CA-2 y CA-3.                                                                                                                       |
| **RF que la vigilan** | RF-12                                                                                                                                                          |

> **🔗 Trazabilidad de RN-07**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-007 CA-2](1-historias-de-usuario.md#hu-007-ca-2), [HU-007 CA-3](1-historias-de-usuario.md#hu-007-ca-3) | Campo «Origen» |
> | RF que la vigilan | [RF-12](#rf-12) | Campo «RF que la vigilan» |
> | Casos de uso que la aplican | [CU-007](3-casos-de-uso.md#cu-007) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-06](4-mockups.md#mk-06) | Fichas de mockup («RN visibles») |
> | HU | [HU-007](1-historias-de-usuario.md#hu-007) | Matriz §5 |
> | Implementación en la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`ck_caso_estado_caso`), [`transicion_estado_caso`](../fase_3/13-script-sql-ddl.md#tabla-transicion-estado-caso) (`uq_transicion_origen_destino_perfil`), [`transicion_estado_caso`](../fase_3/13-script-sql-ddl.md#tabla-transicion-estado-caso) (`ck_transicion_estado_origen`), [`transicion_estado_caso`](../fase_3/13-script-sql-ddl.md#tabla-transicion-estado-caso) (`ck_transicion_estado_destino`), [`transicion_estado_caso`](../fase_3/13-script-sql-ddl.md#tabla-transicion-estado-caso) (`ck_transicion_perfil`), [`transicion_estado_caso`](../fase_3/13-script-sql-ddl.md#tabla-transicion-estado-caso) (`ck_transicion_estado`), [`transicion_estado_caso`](../fase_3/13-script-sql-ddl.md#tabla-transicion-estado-caso) (`fk_transicion_usuario_modificacion`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`caso_soporte.estado_caso`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-estado-caso), [`transicion_estado_caso.estado_origen`](../apoyo/trazabilidad_atributos.md#atr-transicion-estado-caso-estado-origen), [`transicion_estado_caso.estado_destino`](../apoyo/trazabilidad_atributos.md#atr-transicion-estado-caso-estado-destino), [`transicion_estado_caso.perfil_autorizado`](../apoyo/trazabilidad_atributos.md#atr-transicion-estado-caso-perfil-autorizado), [`transicion_estado_caso.estado`](../apoyo/trazabilidad_atributos.md#atr-transicion-estado-caso-estado), [`transicion_estado_caso.id_usuario_modificacion`](../apoyo/trazabilidad_atributos.md#atr-transicion-estado-caso-id-usuario-modificacion) | Columnas de las restricciones marcadas `-- RN-07` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.13](../fase_3/13.1-pruebas-ddl.md#prueba-5-13), [5.30](../fase_3/13.1-pruebas-ddl.md#prueba-5-30) | Sección 5 del script (13.1) |


**Tabla 59**  
<a id="rn-08"></a>

*Regla de negocio RN-08: Historial inmutable de cambios*

| **Código**            | **RN-08 — Historial inmutable de cambios**                                                                                                                                                                                                  |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Todo cambio relevante de un caso (situación, responsable, clasificación, comentario, adjunto, cierre, reapertura) queda en el historial con quién lo hizo, cuándo, valor anterior y valor nuevo. El historial no se modifica ni se elimina. |
| **Origen**            | HU-049 CA-1, HU-007 CA-1, HU-008 CA-1, HU-026 CA-1, HU-041 CA-1 y CA-3, HU-042 CA-5; entrevista: dificultad para saber el estado del caso (P10).                                                                                            |
| **RF que la vigilan** | RF-08, RF-12, RF-14, RF-15, RF-16, RF-23, RF-37, RF-41, RF-42, RF-43 y RF-49                                                                                                                                                                |

> **🔗 Trazabilidad de RN-08**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-049 CA-1](1-historias-de-usuario.md#hu-049-ca-1), [HU-007 CA-1](1-historias-de-usuario.md#hu-007-ca-1), [HU-008 CA-1](1-historias-de-usuario.md#hu-008-ca-1), [HU-026 CA-1](1-historias-de-usuario.md#hu-026-ca-1), [HU-041 CA-1](1-historias-de-usuario.md#hu-041-ca-1), [HU-041 CA-3](1-historias-de-usuario.md#hu-041-ca-3), [HU-042 CA-5](1-historias-de-usuario.md#hu-042-ca-5) | Campo «Origen» |
> | Origen (entrevista) | [P10](../fase_0/0.4.1-entrevista-resultados.md#p10) | Campo «Origen» |
> | RF que la vigilan | [RF-08](#rf-08), [RF-12](#rf-12), [RF-14](#rf-14), [RF-15](#rf-15), [RF-16](#rf-16), [RF-23](#rf-23), [RF-37](#rf-37), [RF-41](#rf-41), [RF-42](#rf-42), [RF-43](#rf-43), [RF-49](#rf-49) | Campo «RF que la vigilan» |
> | CA que la citan | [HU-049 CA-1](1-historias-de-usuario.md#hu-049-ca-1) | Anotaciones de los criterios de aceptación |
> | Casos de uso que la aplican | [CU-007](3-casos-de-uso.md#cu-007), [CU-008](3-casos-de-uso.md#cu-008), [CU-026](3-casos-de-uso.md#cu-026), [CU-041](3-casos-de-uso.md#cu-041), [CU-049](3-casos-de-uso.md#cu-049), [CU-S02](3-casos-de-uso.md#cu-s02) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-06](4-mockups.md#mk-06), [MK-08](4-mockups.md#mk-08) | Fichas de mockup («RN visibles») |
> | HU | [HU-007](1-historias-de-usuario.md#hu-007), [HU-008](1-historias-de-usuario.md#hu-008), [HU-009](1-historias-de-usuario.md#hu-009), [HU-013](1-historias-de-usuario.md#hu-013), [HU-026](1-historias-de-usuario.md#hu-026), [HU-028](1-historias-de-usuario.md#hu-028), [HU-041](1-historias-de-usuario.md#hu-041), [HU-042](1-historias-de-usuario.md#hu-042), [HU-049](1-historias-de-usuario.md#hu-049) | Matriz §5 |
> | Implementación en la base de datos | [`historial_caso`](../fase_3/13-script-sql-ddl.md#tabla-historial-caso) (`fk_historial_caso`), [`historial_caso`](../fase_3/13-script-sql-ddl.md#tabla-historial-caso) (`fk_historial_usuario_accion`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`historial_caso.id_caso`](../apoyo/trazabilidad_atributos.md#atr-historial-caso-id-caso), [`historial_caso.id_usuario_accion`](../apoyo/trazabilidad_atributos.md#atr-historial-caso-id-usuario-accion) | Columnas de las restricciones marcadas `-- RN-08` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.22](../fase_3/13.1-pruebas-ddl.md#prueba-5-22) | Sección 5 del script (13.1) |


**Tabla 60**  
<a id="rn-09"></a>

*Regla de negocio RN-09: Responsable con perfil de soporte*

| **Código**            | **RN-09 — Responsable con perfil de soporte**                            |
|-----------------------|--------------------------------------------------------------------------|
| **Enunciado**         | Solo una persona con perfil de soporte puede ser responsable de un caso. |
| **Origen**            | Criterios de rechazo HU-008 CA-2 y HU-026 CA-2.                          |
| **RF que la vigilan** | RF-14 y RF-15                                                            |

> **🔗 Trazabilidad de RN-09**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-008 CA-2](1-historias-de-usuario.md#hu-008-ca-2), [HU-026 CA-2](1-historias-de-usuario.md#hu-026-ca-2) | Campo «Origen» |
> | RF que la vigilan | [RF-14](#rf-14), [RF-15](#rf-15) | Campo «RF que la vigilan» |
> | Casos de uso que la aplican | [CU-008](3-casos-de-uso.md#cu-008), [CU-026](3-casos-de-uso.md#cu-026) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-06](4-mockups.md#mk-06) | Fichas de mockup («RN visibles») |
> | HU | [HU-008](1-historias-de-usuario.md#hu-008), [HU-026](1-historias-de-usuario.md#hu-026) | Matriz §5 |
> | Implementación en la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`id_personal_asignado`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`fk_caso_asignado`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`caso_soporte.id_personal_asignado`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-id-personal-asignado) | Columnas de las restricciones marcadas `-- RN-09` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |


**Tabla 61**  
<a id="rn-10"></a>

*Regla de negocio RN-10: Comentarios no vacíos y con visibilidad*

| **Código**            | **RN-10 — Comentarios no vacíos y con visibilidad**                                                                                          |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Un comentario no puede estar vacío y se marca como visible para el usuario o como interno. El solicitante nunca ve los comentarios internos. |
| **Origen**            | Criterios de rechazo HU-009 CA-2, CA-3 y CA-4; entrevista: la información suele complementarse después (P6).                                 |
| **RF que la vigilan** | RF-16 y RF-17                                                                                                                                |

> **🔗 Trazabilidad de RN-10**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-009 CA-2](1-historias-de-usuario.md#hu-009-ca-2), [HU-009 CA-3](1-historias-de-usuario.md#hu-009-ca-3), [HU-009 CA-4](1-historias-de-usuario.md#hu-009-ca-4) | Campo «Origen» |
> | Origen (entrevista) | [P6](../fase_0/0.4.1-entrevista-resultados.md#p6) | Campo «Origen» |
> | RF que la vigilan | [RF-16](#rf-16), [RF-17](#rf-17) | Campo «RF que la vigilan» |
> | Casos de uso que la aplican | [CU-009](3-casos-de-uso.md#cu-009) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-05](4-mockups.md#mk-05), [MK-06](4-mockups.md#mk-06) | Fichas de mockup («RN visibles») |
> | HU | [HU-009](1-historias-de-usuario.md#hu-009) | Matriz §5 |
> | Implementación en la base de datos | [`comentario_caso`](../fase_3/13-script-sql-ddl.md#tabla-comentario-caso) (`ck_comentario_no_vacio`), [`comentario_caso`](../fase_3/13-script-sql-ddl.md#tabla-comentario-caso) (`ck_comentario_visibilidad`), [`comentario_caso`](../fase_3/13-script-sql-ddl.md#tabla-comentario-caso) (`fk_comentario_caso`), [`comentario_caso`](../fase_3/13-script-sql-ddl.md#tabla-comentario-caso) (`fk_comentario_autor`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`comentario_caso.id_caso`](../apoyo/trazabilidad_atributos.md#atr-comentario-caso-id-caso), [`comentario_caso.id_usuario_autor`](../apoyo/trazabilidad_atributos.md#atr-comentario-caso-id-usuario-autor), [`comentario_caso.comentario`](../apoyo/trazabilidad_atributos.md#atr-comentario-caso-comentario), [`comentario_caso.visibilidad`](../apoyo/trazabilidad_atributos.md#atr-comentario-caso-visibilidad) | Columnas de las restricciones marcadas `-- RN-10` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.20](../fase_3/13.1-pruebas-ddl.md#prueba-5-20), [5.21](../fase_3/13.1-pruebas-ddl.md#prueba-5-21) | Sección 5 del script (13.1) |


**Tabla 62**  
<a id="rn-11"></a>

*Regla de negocio RN-11: Reapertura condicionada*

| **Código**            | **RN-11 — Reapertura condicionada**                                                                                                                                                |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Un caso solo se reabre si está resuelto, dentro de 5 días hábiles desde su solución y con un motivo. Conserva su número, historial, comentarios y adjuntos, y suma una reapertura. |
| **Origen**            | Criterios de rechazo HU-013 CA-2, CA-3 y CA-4; CA-1 y CA-5.                                                                                                                        |
| **RF que la vigilan** | RF-23                                                                                                                                                                              |

> **🔗 Trazabilidad de RN-11**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-013 CA-2](1-historias-de-usuario.md#hu-013-ca-2), [HU-013 CA-3](1-historias-de-usuario.md#hu-013-ca-3), [HU-013 CA-4](1-historias-de-usuario.md#hu-013-ca-4), [HU-013 CA-1](1-historias-de-usuario.md#hu-013-ca-1), [HU-013 CA-5](1-historias-de-usuario.md#hu-013-ca-5) | Campo «Origen» |
> | RF que la vigilan | [RF-23](#rf-23) | Campo «RF que la vigilan» |
> | Casos de uso que la aplican | [CU-013](3-casos-de-uso.md#cu-013) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-05](4-mockups.md#mk-05) | Fichas de mockup («RN visibles») |
> | HU | [HU-013](1-historias-de-usuario.md#hu-013) | Matriz §5 |
> | Implementación en la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`contador_reaperturas`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`motivo_reapertura`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`ck_caso_contador_reaperturas`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`caso_soporte.contador_reaperturas`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-contador-reaperturas), [`caso_soporte.motivo_reapertura`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-motivo-reapertura) | Columnas de las restricciones marcadas `-- RN-11` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.15](../fase_3/13.1-pruebas-ddl.md#prueba-5-15) | Sección 5 del script (13.1) |


**Tabla 63**  
<a id="rn-12"></a>

*Regla de negocio RN-12: Cierre automático por vencimiento*

| **Código**            | **RN-12 — Cierre automático por vencimiento**                                                                                  |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Un caso resuelto que no recibe respuesta ni reapertura del usuario pasa automáticamente a cerrado al cumplirse 5 días hábiles. |
| **Origen**            | HU-028 CA-1 y CA-3.                                                                                                            |
| **RF que la vigilan** | RF-37                                                                                                                          |

> **🔗 Trazabilidad de RN-12**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-028 CA-1](1-historias-de-usuario.md#hu-028-ca-1), [HU-028 CA-3](1-historias-de-usuario.md#hu-028-ca-3) | Campo «Origen» |
> | RF que la vigilan | [RF-37](#rf-37) | Campo «RF que la vigilan» |
> | Casos de uso que la aplican | [CU-028](3-casos-de-uso.md#cu-028) | Flujos de los CU (§3.1) |
> | HU | [HU-028](1-historias-de-usuario.md#hu-028) | Matriz §5 |
> | Implementación en la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`ck_caso_fecha_cierre`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`caso_soporte.fecha_solucion`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-fecha-solucion), [`caso_soporte.fecha_cierre`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-fecha-cierre) | Columnas de las restricciones marcadas `-- RN-12` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |


**Tabla 64**  
<a id="rn-13"></a>

*Regla de negocio RN-13: Tiempos de atención versionados*

| **Código**            | **RN-13 — Tiempos de atención versionados**                                                                                                                                                                                |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Los tiempos de respuesta y solución se definen por importancia y tipo de caso, en minutos calendario. Solo hay una regla activa por combinación y cada caso conserva la regla vigente al crearse, aunque después se edite. |
| **Origen**            | Criterios de rechazo HU-029 CA-2 y CA-3, HU-010 CA-2 y HU-040 CA-2; entrevista: se esperan respuestas rápidas (P13).                                                                                                       |
| **RF que la vigilan** | RF-20, RF-38 y RF-39                                                                                                                                                                                                       |

> **🔗 Trazabilidad de RN-13**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-029 CA-2](1-historias-de-usuario.md#hu-029-ca-2), [HU-029 CA-3](1-historias-de-usuario.md#hu-029-ca-3), [HU-010 CA-2](1-historias-de-usuario.md#hu-010-ca-2), [HU-040 CA-2](1-historias-de-usuario.md#hu-040-ca-2) | Campo «Origen» |
> | Origen (entrevista) | [P13](../fase_0/0.4.1-entrevista-resultados.md#p13) | Campo «Origen» |
> | RF que la vigilan | [RF-20](#rf-20), [RF-38](#rf-38), [RF-39](#rf-39) | Campo «RF que la vigilan» |
> | CA que la citan | [HU-001 CA-1](1-historias-de-usuario.md#hu-001-ca-1) | Anotaciones de los criterios de aceptación |
> | Casos de uso que la aplican | [CU-001](3-casos-de-uso.md#cu-001), [CU-010](3-casos-de-uso.md#cu-010), [CU-029](3-casos-de-uso.md#cu-029), [CU-040](3-casos-de-uso.md#cu-040), [CU-S01](3-casos-de-uso.md#cu-s01) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-05](4-mockups.md#mk-05), [MK-12](4-mockups.md#mk-12) | Fichas de mockup («RN visibles») |
> | HU | [HU-010](1-historias-de-usuario.md#hu-010), [HU-029](1-historias-de-usuario.md#hu-029), [HU-040](1-historias-de-usuario.md#hu-040) | Matriz §5 |
> | Implementación en la base de datos | [`tiempo_atencion_sla`](../fase_3/13-script-sql-ddl.md#tabla-tiempo-atencion-sla) (`tiempo_respuesta`), [`tiempo_atencion_sla`](../fase_3/13-script-sql-ddl.md#tabla-tiempo-atencion-sla) (`tiempo_solucion`), [`tiempo_atencion_sla`](../fase_3/13-script-sql-ddl.md#tabla-tiempo-atencion-sla) (`uq_sla_importancia_tipo_vigencia`), [`tiempo_atencion_sla`](../fase_3/13-script-sql-ddl.md#tabla-tiempo-atencion-sla) (`ck_sla_tipo_caso`), [`tiempo_atencion_sla`](../fase_3/13-script-sql-ddl.md#tabla-tiempo-atencion-sla) (`ck_sla_vigencia`), [`tiempo_atencion_sla`](../fase_3/13-script-sql-ddl.md#tabla-tiempo-atencion-sla) (`ck_sla_estado`), [`tiempo_atencion_sla`](../fase_3/13-script-sql-ddl.md#tabla-tiempo-atencion-sla) (`fk_sla_tabla_importancia`), [`tiempo_atencion_sla`](../fase_3/13-script-sql-ddl.md#tabla-tiempo-atencion-sla) (`fk_sla_usuario_modificacion`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`id_tiempo_atencion`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`fk_caso_tiempo_atencion`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`tiempo_atencion_sla.id_tabla_importancia`](../apoyo/trazabilidad_atributos.md#atr-tiempo-atencion-sla-id-tabla-importancia), [`tiempo_atencion_sla.tipo_caso`](../apoyo/trazabilidad_atributos.md#atr-tiempo-atencion-sla-tipo-caso), [`tiempo_atencion_sla.fecha_inicio_vigencia`](../apoyo/trazabilidad_atributos.md#atr-tiempo-atencion-sla-fecha-inicio-vigencia), [`tiempo_atencion_sla.fecha_fin_vigencia`](../apoyo/trazabilidad_atributos.md#atr-tiempo-atencion-sla-fecha-fin-vigencia), [`tiempo_atencion_sla.tiempo_respuesta`](../apoyo/trazabilidad_atributos.md#atr-tiempo-atencion-sla-tiempo-respuesta), [`tiempo_atencion_sla.tiempo_solucion`](../apoyo/trazabilidad_atributos.md#atr-tiempo-atencion-sla-tiempo-solucion), [`tiempo_atencion_sla.estado`](../apoyo/trazabilidad_atributos.md#atr-tiempo-atencion-sla-estado), [`tiempo_atencion_sla.id_usuario_modificacion`](../apoyo/trazabilidad_atributos.md#atr-tiempo-atencion-sla-id-usuario-modificacion), [`caso_soporte.id_tiempo_atencion`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-id-tiempo-atencion) | Columnas de las restricciones marcadas `-- RN-13` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.18](../fase_3/13.1-pruebas-ddl.md#prueba-5-18), [5.19](../fase_3/13.1-pruebas-ddl.md#prueba-5-19) | Sección 5 del script (13.1) |


**Tabla 65**  
<a id="rn-14"></a>

*Regla de negocio RN-14: Caso atrasado por superar el tiempo definido*

| **Código**            | **RN-14 — Caso atrasado por superar el tiempo definido**                                                                      |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Un caso está atrasado si supera el tiempo de respuesta o de solución definido sin haber recibido la atención correspondiente. |
| **Origen**            | HU-011 CA-2 y CA-3, HU-010 CA-3 y HU-007 CA-5; entrevista: las respuestas se demoran más de lo esperado (P4).                 |
| **RF que la vigilan** | RF-20, RF-21 y RF-50                                                                                                          |

> **🔗 Trazabilidad de RN-14**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-011 CA-2](1-historias-de-usuario.md#hu-011-ca-2), [HU-011 CA-3](1-historias-de-usuario.md#hu-011-ca-3), [HU-010 CA-3](1-historias-de-usuario.md#hu-010-ca-3), [HU-007 CA-5](1-historias-de-usuario.md#hu-007-ca-5) | Campo «Origen» |
> | Origen (entrevista) | [P4](../fase_0/0.4.1-entrevista-resultados.md#p4) | Campo «Origen» |
> | RF que la vigilan | [RF-20](#rf-20), [RF-21](#rf-21), [RF-50](#rf-50) | Campo «RF que la vigilan» |
> | CA que la citan | [HU-007 CA-5](1-historias-de-usuario.md#hu-007-ca-5) | Anotaciones de los criterios de aceptación |
> | Casos de uso que la aplican | [CU-007](3-casos-de-uso.md#cu-007), [CU-010](3-casos-de-uso.md#cu-010), [CU-011](3-casos-de-uso.md#cu-011) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-05](4-mockups.md#mk-05), [MK-10](4-mockups.md#mk-10) | Fichas de mockup («RN visibles») |
> | HU | [HU-007](1-historias-de-usuario.md#hu-007), [HU-010](1-historias-de-usuario.md#hu-010), [HU-011](1-historias-de-usuario.md#hu-011) | Matriz §5 |
> | Implementación en la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`ck_caso_primera_respuesta`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`ck_caso_fecha_solucion`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`caso_soporte.fecha_creacion`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-fecha-creacion), [`caso_soporte.fecha_primera_respuesta`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-fecha-primera-respuesta), [`caso_soporte.fecha_solucion`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-fecha-solucion) | Columnas de las restricciones marcadas `-- RN-14` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.14](../fase_3/13.1-pruebas-ddl.md#prueba-5-14) | Sección 5 del script (13.1) |


**Tabla 66**  
<a id="rn-15"></a>

*Regla de negocio RN-15: Avisos por cambio de situación y reintento*

| **Código**            | **RN-15 — Avisos por cambio de situación y reintento**                                                                                                                         |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Todo cambio de situación genera un aviso al solicitante por correo, aviso emergente y detalle del caso. Si el envío falla, se guarda el motivo y se reintenta automáticamente. |
| **Origen**            | HU-003 CA-1 a CA-3, HU-002 CA-4 y HU-028 CA-2; entrevista: mala comunicación (P10).                                                                                            |
| **RF que la vigilan** | RF-04, RF-05 y RF-37                                                                                                                                                           |

> **🔗 Trazabilidad de RN-15**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-003 CA-1](1-historias-de-usuario.md#hu-003-ca-1), [HU-003 CA-2](1-historias-de-usuario.md#hu-003-ca-2), [HU-003 CA-3](1-historias-de-usuario.md#hu-003-ca-3), [HU-002 CA-4](1-historias-de-usuario.md#hu-002-ca-4), [HU-028 CA-2](1-historias-de-usuario.md#hu-028-ca-2) | Campo «Origen» |
> | Origen (entrevista) | [P10](../fase_0/0.4.1-entrevista-resultados.md#p10) | Campo «Origen» |
> | RF que la vigilan | [RF-04](#rf-04), [RF-05](#rf-05), [RF-37](#rf-37) | Campo «RF que la vigilan» |
> | Casos de uso que la aplican | [CU-003](3-casos-de-uso.md#cu-003) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-09](4-mockups.md#mk-09) | Fichas de mockup («RN visibles») |
> | HU | [HU-002](1-historias-de-usuario.md#hu-002), [HU-003](1-historias-de-usuario.md#hu-003), [HU-028](1-historias-de-usuario.md#hu-028) | Matriz §5 |
> | Implementación en la base de datos | [`aviso`](../fase_3/13-script-sql-ddl.md#tabla-aviso) (`intentos`), [`aviso`](../fase_3/13-script-sql-ddl.md#tabla-aviso) (`fecha_ultimo_intento`), [`aviso`](../fase_3/13-script-sql-ddl.md#tabla-aviso) (`motivo_fallo`), [`aviso`](../fase_3/13-script-sql-ddl.md#tabla-aviso) (`ck_aviso_canal`), [`aviso`](../fase_3/13-script-sql-ddl.md#tabla-aviso) (`ck_aviso_estado_envio`), [`aviso`](../fase_3/13-script-sql-ddl.md#tabla-aviso) (`fk_aviso_caso`), [`aviso`](../fase_3/13-script-sql-ddl.md#tabla-aviso) (`fk_aviso_usuario_destino`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`aviso.id_caso`](../apoyo/trazabilidad_atributos.md#atr-aviso-id-caso), [`aviso.id_usuario_destino`](../apoyo/trazabilidad_atributos.md#atr-aviso-id-usuario-destino), [`aviso.canal`](../apoyo/trazabilidad_atributos.md#atr-aviso-canal), [`aviso.estado_envio`](../apoyo/trazabilidad_atributos.md#atr-aviso-estado-envio), [`aviso.intentos`](../apoyo/trazabilidad_atributos.md#atr-aviso-intentos), [`aviso.fecha_ultimo_intento`](../apoyo/trazabilidad_atributos.md#atr-aviso-fecha-ultimo-intento), [`aviso.motivo_fallo`](../apoyo/trazabilidad_atributos.md#atr-aviso-motivo-fallo) | Columnas de las restricciones marcadas `-- RN-15` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.29](../fase_3/13.1-pruebas-ddl.md#prueba-5-29) | Sección 5 del script (13.1) |


**Tabla 67**  
<a id="rn-16"></a>

*Regla de negocio RN-16: El registro del caso no depende del correo*

| **Código**            | **RN-16 — El registro del caso no depende del correo**                                                  |
|-----------------------|---------------------------------------------------------------------------------------------------------|
| **Enunciado**         | El caso queda registrado con su número de seguimiento aunque falle el envío del correo de confirmación. |
| **Origen**            | HU-002 CA-2 y CA-4.                                                                                     |
| **RF que la vigilan** | RF-03 y RF-05                                                                                           |

> **🔗 Trazabilidad de RN-16**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-002 CA-2](1-historias-de-usuario.md#hu-002-ca-2), [HU-002 CA-4](1-historias-de-usuario.md#hu-002-ca-4) | Campo «Origen» |
> | RF que la vigilan | [RF-03](#rf-03), [RF-05](#rf-05) | Campo «RF que la vigilan» |
> | CA que la citan | [HU-002 CA-6](1-historias-de-usuario.md#hu-002-ca-6) | Anotaciones de los criterios de aceptación |
> | Casos de uso que la aplican | [CU-002](3-casos-de-uso.md#cu-002) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-03](4-mockups.md#mk-03), [MK-09](4-mockups.md#mk-09) | Fichas de mockup («RN visibles») |
> | HU | [HU-002](1-historias-de-usuario.md#hu-002), [HU-003](1-historias-de-usuario.md#hu-003) | Matriz §5 |


**Tabla 68**  
<a id="rn-17"></a>

*Regla de negocio RN-17: Correo de usuario único*

| **Código**            | **RN-17 — Correo de usuario único**                                      |
|-----------------------|--------------------------------------------------------------------------|
| **Enunciado**         | El correo de cada usuario es único en el sistema y tiene formato válido. |
| **Origen**            | Criterios de rechazo HU-016 CA-2, HU-031 CA-2 y HU-002 CA-5.             |
| **RF que la vigilan** | RF-03, RF-26 y RF-28                                                     |

> **🔗 Trazabilidad de RN-17**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-016 CA-2](1-historias-de-usuario.md#hu-016-ca-2), [HU-031 CA-2](1-historias-de-usuario.md#hu-031-ca-2), [HU-002 CA-5](1-historias-de-usuario.md#hu-002-ca-5) | Campo «Origen» |
> | RF que la vigilan | [RF-03](#rf-03), [RF-26](#rf-26), [RF-28](#rf-28) | Campo «RF que la vigilan» |
> | CA que la citan | [HU-002 CA-5](1-historias-de-usuario.md#hu-002-ca-5) | Anotaciones de los criterios de aceptación |
> | Casos de uso que la aplican | [CU-002](3-casos-de-uso.md#cu-002), [CU-016](3-casos-de-uso.md#cu-016), [CU-031](3-casos-de-uso.md#cu-031) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-14](4-mockups.md#mk-14) | Fichas de mockup («RN visibles») |
> | HU | [HU-002](1-historias-de-usuario.md#hu-002), [HU-016](1-historias-de-usuario.md#hu-016), [HU-031](1-historias-de-usuario.md#hu-031) | Matriz §5 |
> | Implementación en la base de datos | [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) (`uq_usuario_correo`), [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) (`ck_usuario_correo_formato`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`usuario.correo`](../apoyo/trazabilidad_atributos.md#atr-usuario-correo) | Columnas de las restricciones marcadas `-- RN-17` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.1](../fase_3/13.1-pruebas-ddl.md#prueba-5-1), [5.2](../fase_3/13.1-pruebas-ddl.md#prueba-5-2) | Sección 5 del script (13.1) |


**Tabla 69**  
<a id="rn-18"></a>

*Regla de negocio RN-18: Área obligatoria para solicitantes*

| **Código**            | **RN-18 — Área obligatoria para solicitantes**                     |
|-----------------------|--------------------------------------------------------------------|
| **Enunciado**         | Todo usuario con perfil solicitante debe tener un área registrada. |
| **Origen**            | Criterios de rechazo HU-016 CA-4 y HU-031 CA-3.                    |
| **RF que la vigilan** | RF-26 y RF-28                                                      |

> **🔗 Trazabilidad de RN-18**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-016 CA-4](1-historias-de-usuario.md#hu-016-ca-4), [HU-031 CA-3](1-historias-de-usuario.md#hu-031-ca-3) | Campo «Origen» |
> | RF que la vigilan | [RF-26](#rf-26), [RF-28](#rf-28) | Campo «RF que la vigilan» |
> | Casos de uso que la aplican | [CU-016](3-casos-de-uso.md#cu-016), [CU-031](3-casos-de-uso.md#cu-031) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-14](4-mockups.md#mk-14) | Fichas de mockup («RN visibles») |
> | HU | [HU-016](1-historias-de-usuario.md#hu-016), [HU-031](1-historias-de-usuario.md#hu-031) | Matriz §5 |
> | Implementación en la base de datos | [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) (`id_area`), [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) (`fk_usuario_area`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`usuario.id_area`](../apoyo/trazabilidad_atributos.md#atr-usuario-id-area) | Columnas de las restricciones marcadas `-- RN-18` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |


**Tabla 70**  
<a id="rn-19"></a>

*Regla de negocio RN-19: Contraseña protegida*

| **Código**            | **RN-19 — Contraseña protegida**                                               |
|-----------------------|--------------------------------------------------------------------------------|
| **Enunciado**         | La contraseña y los códigos de recuperación nunca se guardan en texto legible. |
| **Origen**            | HU-016 CA-1 y HU-024 CA-2.                                                     |
| **RF que la vigilan** | RF-26 y RF-35                                                                  |

> **🔗 Trazabilidad de RN-19**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-016 CA-1](1-historias-de-usuario.md#hu-016-ca-1), [HU-024 CA-2](1-historias-de-usuario.md#hu-024-ca-2) | Campo «Origen» |
> | RF que la vigilan | [RF-26](#rf-26), [RF-35](#rf-35) | Campo «RF que la vigilan» |
> | CA que la citan | [HU-024 CA-2](1-historias-de-usuario.md#hu-024-ca-2) | Anotaciones de los criterios de aceptación |
> | Casos de uso que la aplican | [CU-016](3-casos-de-uso.md#cu-016), [CU-024](3-casos-de-uso.md#cu-024) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-19](4-mockups.md#mk-19), [MK-14](4-mockups.md#mk-14) | Fichas de mockup («RN visibles») |
> | HU | [HU-016](1-historias-de-usuario.md#hu-016), [HU-024](1-historias-de-usuario.md#hu-024) | Matriz §5 |
> | Implementación en la base de datos | [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) (`contrasena_hash`), [`token_recuperacion`](../fase_3/13-script-sql-ddl.md#tabla-token-recuperacion) (`token_hash`), [`token_recuperacion`](../fase_3/13-script-sql-ddl.md#tabla-token-recuperacion) (`uq_token_recuperacion_token_hash`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`usuario.contrasena_hash`](../apoyo/trazabilidad_atributos.md#atr-usuario-contrasena-hash), [`token_recuperacion.token_hash`](../apoyo/trazabilidad_atributos.md#atr-token-recuperacion-token-hash) | Columnas de las restricciones marcadas `-- RN-19` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |


**Tabla 71**  
<a id="rn-20"></a>

*Regla de negocio RN-20: Bloqueo por intentos fallidos*

| **Código**            | **RN-20 — Bloqueo por intentos fallidos**                                                                                                                                                                                                          |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Ante datos de ingreso incorrectos el sistema muestra un mensaje genérico y cuenta el intento. Al llegar al cuarto intento fallido (límite de 4 intentos definido para el proyecto), la cuenta se bloquea hasta que un administrador la desbloquee. |
| **Origen**            | Criterios de rechazo HU-023 CA-2 y CA-3; HU-033 CA-2. Límite de 4 intentos fallidos (IN-13).                                                                                                                                                       |
| **RF que la vigilan** | RF-30 y RF-34                                                                                                                                                                                                                                      |

> **🔗 Trazabilidad de RN-20**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-023 CA-2](1-historias-de-usuario.md#hu-023-ca-2), [HU-023 CA-3](1-historias-de-usuario.md#hu-023-ca-3), [HU-033 CA-2](1-historias-de-usuario.md#hu-033-ca-2) | Campo «Origen» |
> | RF que la vigilan | [RF-30](#rf-30), [RF-34](#rf-34) | Campo «RF que la vigilan» |
> | CA que la citan | [HU-023 CA-3](1-historias-de-usuario.md#hu-023-ca-3) | Anotaciones de los criterios de aceptación |
> | Casos de uso que la aplican | [CU-023](3-casos-de-uso.md#cu-023), [CU-033](3-casos-de-uso.md#cu-033) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-01](4-mockups.md#mk-01), [MK-15](4-mockups.md#mk-15) | Fichas de mockup («RN visibles») |
> | HU | [HU-023](1-historias-de-usuario.md#hu-023), [HU-033](1-historias-de-usuario.md#hu-033) | Matriz §5 |
> | Implementación en la base de datos | [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) (`intentos_fallidos`), [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) (`fecha_bloqueo`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`usuario.intentos_fallidos`](../apoyo/trazabilidad_atributos.md#atr-usuario-intentos-fallidos), [`usuario.fecha_bloqueo`](../apoyo/trazabilidad_atributos.md#atr-usuario-fecha-bloqueo) | Columnas de las restricciones marcadas `-- RN-20` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |


**Tabla 72**  
<a id="rn-21"></a>

*Regla de negocio RN-21: Usuario inactivo sin acceso*

| **Código**            | **RN-21 — Usuario inactivo sin acceso**                                                                                |
|-----------------------|------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Un usuario inactivo no puede iniciar sesión, pero sus casos y comentarios se conservan sin cambios. Puede reactivarse. |
| **Origen**            | HU-032 CA-2, CA-3 y CA-4.                                                                                              |
| **RF que la vigilan** | RF-29 y RF-34                                                                                                          |

> **🔗 Trazabilidad de RN-21**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-032 CA-2](1-historias-de-usuario.md#hu-032-ca-2), [HU-032 CA-3](1-historias-de-usuario.md#hu-032-ca-3), [HU-032 CA-4](1-historias-de-usuario.md#hu-032-ca-4) | Campo «Origen» |
> | RF que la vigilan | [RF-29](#rf-29), [RF-34](#rf-34) | Campo «RF que la vigilan» |
> | Casos de uso que la aplican | [CU-023](3-casos-de-uso.md#cu-023), [CU-032](3-casos-de-uso.md#cu-032) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-01](4-mockups.md#mk-01), [MK-13](4-mockups.md#mk-13) | Fichas de mockup («RN visibles») |
> | HU | [HU-023](1-historias-de-usuario.md#hu-023), [HU-032](1-historias-de-usuario.md#hu-032) | Matriz §5 |
> | Implementación en la base de datos | [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) (`estado_usuario`), [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) (`ck_usuario_estado_usuario`), [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) (`fk_usuario_usuario_modificacion`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`usuario.estado_usuario`](../apoyo/trazabilidad_atributos.md#atr-usuario-estado-usuario), [`usuario.id_usuario_modificacion`](../apoyo/trazabilidad_atributos.md#atr-usuario-id-usuario-modificacion) | Columnas de las restricciones marcadas `-- RN-21` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |


**Tabla 73**  
<a id="rn-22"></a>

*Regla de negocio RN-22: Enlace de recuperación temporal y de un solo uso*

| **Código**            | **RN-22 — Enlace de recuperación temporal y de un solo uso**                                                  |
|-----------------------|---------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | El enlace de recuperación de contraseña vence y solo sirve una vez. Solicitar uno nuevo invalida el anterior. |
| **Origen**            | Criterios de rechazo HU-024 CA-3 y CA-4; CA-2.                                                                |
| **RF que la vigilan** | RF-35                                                                                                         |

> **🔗 Trazabilidad de RN-22**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-024 CA-3](1-historias-de-usuario.md#hu-024-ca-3), [HU-024 CA-4](1-historias-de-usuario.md#hu-024-ca-4), [HU-024 CA-2](1-historias-de-usuario.md#hu-024-ca-2) | Campo «Origen» |
> | RF que la vigilan | [RF-35](#rf-35) | Campo «RF que la vigilan» |
> | CA que la citan | [HU-024 CA-1](1-historias-de-usuario.md#hu-024-ca-1), [HU-024 CA-2](1-historias-de-usuario.md#hu-024-ca-2) | Anotaciones de los criterios de aceptación |
> | Casos de uso que la aplican | [CU-024](3-casos-de-uso.md#cu-024) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-01](4-mockups.md#mk-01), [MK-19](4-mockups.md#mk-19) | Fichas de mockup («RN visibles») |
> | HU | [HU-024](1-historias-de-usuario.md#hu-024) | Matriz §5 |
> | Implementación en la base de datos | [`token_recuperacion`](../fase_3/13-script-sql-ddl.md#tabla-token-recuperacion) (`uq_token_recuperacion_token_hash`), [`token_recuperacion`](../fase_3/13-script-sql-ddl.md#tabla-token-recuperacion) (`ck_token_expiracion`), [`token_recuperacion`](../fase_3/13-script-sql-ddl.md#tabla-token-recuperacion) (`ck_token_fecha_uso`), [`token_recuperacion`](../fase_3/13-script-sql-ddl.md#tabla-token-recuperacion) (`ck_token_estado`), [`token_recuperacion`](../fase_3/13-script-sql-ddl.md#tabla-token-recuperacion) (`fk_token_usuario`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`token_recuperacion.id_usuario`](../apoyo/trazabilidad_atributos.md#atr-token-recuperacion-id-usuario), [`token_recuperacion.token_hash`](../apoyo/trazabilidad_atributos.md#atr-token-recuperacion-token-hash), [`token_recuperacion.fecha_generacion`](../apoyo/trazabilidad_atributos.md#atr-token-recuperacion-fecha-generacion), [`token_recuperacion.fecha_expiracion`](../apoyo/trazabilidad_atributos.md#atr-token-recuperacion-fecha-expiracion), [`token_recuperacion.fecha_uso`](../apoyo/trazabilidad_atributos.md#atr-token-recuperacion-fecha-uso), [`token_recuperacion.estado_token`](../apoyo/trazabilidad_atributos.md#atr-token-recuperacion-estado-token) | Columnas de las restricciones marcadas `-- RN-22` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.25](../fase_3/13.1-pruebas-ddl.md#prueba-5-25), [5.26](../fase_3/13.1-pruebas-ddl.md#prueba-5-26) | Sección 5 del script (13.1) |


**Tabla 74**  
<a id="rn-23"></a>

*Regla de negocio RN-23: Acceso según perfil y sesión*

| **Código**            | **RN-23 — Acceso según perfil y sesión**                                                                                                                                 |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Cada perfil accede únicamente a las funciones de su rol, y sin sesión iniciada no hay acceso a ninguna pantalla.                                                         |
| **Origen**            | HU-001 CA-5, HU-023 CA-4, HU-025 CA-2, HU-007 CA-3, HU-006 CA-5, HU-033 CA-3, HU-034 CA-3 y HU-049 CA-3; HU-017 y HU-036 (consultas exclusivas del personal de soporte). |
| **RF que la vigilan** | RF-01, RF-08, RF-11, RF-12, RF-25, RF-27, RF-30, RF-34, RF-36 y RF-45                                                                                                    |

> **🔗 Trazabilidad de RN-23**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-001 CA-5](1-historias-de-usuario.md#hu-001-ca-5), [HU-023 CA-4](1-historias-de-usuario.md#hu-023-ca-4), [HU-025 CA-2](1-historias-de-usuario.md#hu-025-ca-2), [HU-007 CA-3](1-historias-de-usuario.md#hu-007-ca-3), [HU-006 CA-5](1-historias-de-usuario.md#hu-006-ca-5), [HU-033 CA-3](1-historias-de-usuario.md#hu-033-ca-3), [HU-034 CA-3](1-historias-de-usuario.md#hu-034-ca-3), [HU-049 CA-3](1-historias-de-usuario.md#hu-049-ca-3) | Campo «Origen» |
> | RF que la vigilan | [RF-01](#rf-01), [RF-08](#rf-08), [RF-11](#rf-11), [RF-12](#rf-12), [RF-25](#rf-25), [RF-27](#rf-27), [RF-30](#rf-30), [RF-34](#rf-34), [RF-36](#rf-36), [RF-45](#rf-45) | Campo «RF que la vigilan» |
> | CA que la citan | [HU-001 CA-5](1-historias-de-usuario.md#hu-001-ca-5), [HU-006 CA-5](1-historias-de-usuario.md#hu-006-ca-5), [HU-025 CA-1](1-historias-de-usuario.md#hu-025-ca-1), [HU-033 CA-3](1-historias-de-usuario.md#hu-033-ca-3), [HU-034 CA-3](1-historias-de-usuario.md#hu-034-ca-3), [HU-049 CA-3](1-historias-de-usuario.md#hu-049-ca-3) | Anotaciones de los criterios de aceptación |
> | Casos de uso que la aplican | [CU-001](3-casos-de-uso.md#cu-001), [CU-006](3-casos-de-uso.md#cu-006), [CU-007](3-casos-de-uso.md#cu-007), [CU-023](3-casos-de-uso.md#cu-023), [CU-025](3-casos-de-uso.md#cu-025), [CU-033](3-casos-de-uso.md#cu-033), [CU-034](3-casos-de-uso.md#cu-034), [CU-049](3-casos-de-uso.md#cu-049) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-04](4-mockups.md#mk-04) | Fichas de mockup («RN visibles») |
> | HU | [HU-001](1-historias-de-usuario.md#hu-001), [HU-006](1-historias-de-usuario.md#hu-006), [HU-007](1-historias-de-usuario.md#hu-007), [HU-017](1-historias-de-usuario.md#hu-017), [HU-023](1-historias-de-usuario.md#hu-023), [HU-025](1-historias-de-usuario.md#hu-025), [HU-033](1-historias-de-usuario.md#hu-033), [HU-034](1-historias-de-usuario.md#hu-034), [HU-036](1-historias-de-usuario.md#hu-036), [HU-049](1-historias-de-usuario.md#hu-049) | Matriz §5 |
> | Implementación en la base de datos | [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) (`perfil_acceso`), [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) (`ck_usuario_perfil_acceso`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`usuario.perfil_acceso`](../apoyo/trazabilidad_atributos.md#atr-usuario-perfil-acceso) | Columnas de las restricciones marcadas `-- RN-23` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.3](../fase_3/13.1-pruebas-ddl.md#prueba-5-3) | Sección 5 del script (13.1) |


**Tabla 75**  
<a id="rn-24"></a>

*Regla de negocio RN-24: Número de serie de activo único*

| **Código**            | **RN-24 — Número de serie de activo único**                                                                          |
|-----------------------|----------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | El número de serie de un activo, cuando existe, no puede repetirse. El nombre y el tipo del activo son obligatorios. |
| **Origen**            | Criterios de rechazo HU-035 CA-2 y CA-4, HU-037 CA-2; CA-3 (serie opcional).                                         |
| **RF que la vigilan** | RF-44 y RF-46                                                                                                        |

> **🔗 Trazabilidad de RN-24**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-035 CA-2](1-historias-de-usuario.md#hu-035-ca-2), [HU-035 CA-4](1-historias-de-usuario.md#hu-035-ca-4), [HU-037 CA-2](1-historias-de-usuario.md#hu-037-ca-2), [HU-035 CA-3](1-historias-de-usuario.md#hu-035-ca-3) | Campo «Origen» |
> | RF que la vigilan | [RF-44](#rf-44), [RF-46](#rf-46) | Campo «RF que la vigilan» |
> | Casos de uso que la aplican | [CU-035](3-casos-de-uso.md#cu-035), [CU-037](3-casos-de-uso.md#cu-037) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-17](4-mockups.md#mk-17) | Fichas de mockup («RN visibles») |
> | HU | [HU-035](1-historias-de-usuario.md#hu-035), [HU-037](1-historias-de-usuario.md#hu-037) | Matriz §5 |
> | Implementación en la base de datos | [`tipo_activo`](../fase_3/13-script-sql-ddl.md#tabla-tipo-activo) (`nombre`), [`activo`](../fase_3/13-script-sql-ddl.md#tabla-activo) (`nombre`), [`activo`](../fase_3/13-script-sql-ddl.md#tabla-activo) (`id_tipo_activo`), [`activo`](../fase_3/13-script-sql-ddl.md#tabla-activo) (`uq_activo_numero_serie`), [`activo`](../fase_3/13-script-sql-ddl.md#tabla-activo) (`fk_activo_tipo_activo`), [`activo`](../fase_3/13-script-sql-ddl.md#tabla-activo) (`fk_activo_area`), [`activo`](../fase_3/13-script-sql-ddl.md#tabla-activo) (`fk_activo_usuario_modificacion`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`tipo_activo.nombre`](../apoyo/trazabilidad_atributos.md#atr-tipo-activo-nombre), [`activo.nombre`](../apoyo/trazabilidad_atributos.md#atr-activo-nombre), [`activo.id_tipo_activo`](../apoyo/trazabilidad_atributos.md#atr-activo-id-tipo-activo), [`activo.numero_serie`](../apoyo/trazabilidad_atributos.md#atr-activo-numero-serie), [`activo.id_area`](../apoyo/trazabilidad_atributos.md#atr-activo-id-area), [`activo.id_usuario_modificacion`](../apoyo/trazabilidad_atributos.md#atr-activo-id-usuario-modificacion) | Columnas de las restricciones marcadas `-- RN-24` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.6](../fase_3/13.1-pruebas-ddl.md#prueba-5-6), [5.7](../fase_3/13.1-pruebas-ddl.md#prueba-5-7) | Sección 5 del script (13.1) |


**Tabla 76**  
<a id="rn-25"></a>

*Regla de negocio RN-25: Activo dado de baja no seleccionable*

| **Código**            | **RN-25 — Activo dado de baja no seleccionable**                                                                                              |
|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Un activo dado de baja no puede relacionarse con casos nuevos y los casos anteriores conservan la relación. El activo es opcional en un caso. |
| **Origen**            | HU-038 CA-2 y CA-3; HU-001 CA-3.                                                                                                              |
| **RF que la vigilan** | RF-01 y RF-47                                                                                                                                 |

> **🔗 Trazabilidad de RN-25**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-038 CA-2](1-historias-de-usuario.md#hu-038-ca-2), [HU-038 CA-3](1-historias-de-usuario.md#hu-038-ca-3), [HU-001 CA-3](1-historias-de-usuario.md#hu-001-ca-3) | Campo «Origen» |
> | RF que la vigilan | [RF-01](#rf-01), [RF-47](#rf-47) | Campo «RF que la vigilan» |
> | CA que la citan | [HU-001 CA-1](1-historias-de-usuario.md#hu-001-ca-1) | Anotaciones de los criterios de aceptación |
> | Casos de uso que la aplican | [CU-001](3-casos-de-uso.md#cu-001), [CU-038](3-casos-de-uso.md#cu-038) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-02](4-mockups.md#mk-02), [MK-16](4-mockups.md#mk-16) | Fichas de mockup («RN visibles») |
> | HU | [HU-001](1-historias-de-usuario.md#hu-001), [HU-038](1-historias-de-usuario.md#hu-038) | Matriz §5 |
> | Implementación en la base de datos | [`activo`](../fase_3/13-script-sql-ddl.md#tabla-activo) (`ck_activo_estado`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`id_activo`), [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) (`fk_caso_activo`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`activo.estado`](../apoyo/trazabilidad_atributos.md#atr-activo-estado), [`caso_soporte.id_activo`](../apoyo/trazabilidad_atributos.md#atr-caso-soporte-id-activo) | Columnas de las restricciones marcadas `-- RN-25` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.8](../fase_3/13.1-pruebas-ddl.md#prueba-5-8) | Sección 5 del script (13.1) |


**Tabla 77**  
<a id="rn-26"></a>

*Regla de negocio RN-26: Nombre único dentro de cada catálogo*

| **Código**            | **RN-26 — Nombre único dentro de cada catálogo**                    |
|-----------------------|---------------------------------------------------------------------|
| **Enunciado**         | El nombre de un valor no puede repetirse dentro del mismo catálogo. |
| **Origen**            | Criterio de rechazo HU-043 a HU-048 CA-2.                           |
| **RF que la vigilan** | RF-48                                                               |

> **🔗 Trazabilidad de RN-26**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-043 CA-2](1-historias-de-usuario.md#hu-043-ca-2), [HU-044 CA-2](1-historias-de-usuario.md#hu-044-ca-2), [HU-045 CA-2](1-historias-de-usuario.md#hu-045-ca-2), [HU-046 CA-2](1-historias-de-usuario.md#hu-046-ca-2), [HU-047 CA-2](1-historias-de-usuario.md#hu-047-ca-2), [HU-048 CA-2](1-historias-de-usuario.md#hu-048-ca-2) | Campo «Origen» |
> | RF que la vigilan | [RF-48](#rf-48) | Campo «RF que la vigilan» |
> | CA que la citan | [HU-043 CA-2](1-historias-de-usuario.md#hu-043-ca-2), [HU-044 CA-2](1-historias-de-usuario.md#hu-044-ca-2), [HU-045 CA-2](1-historias-de-usuario.md#hu-045-ca-2), [HU-046 CA-2](1-historias-de-usuario.md#hu-046-ca-2), [HU-047 CA-2](1-historias-de-usuario.md#hu-047-ca-2), [HU-048 CA-2](1-historias-de-usuario.md#hu-048-ca-2) | Anotaciones de los criterios de aceptación |
> | Casos de uso que la aplican | [CU-043](3-casos-de-uso.md#cu-043), [CU-044](3-casos-de-uso.md#cu-044), [CU-045](3-casos-de-uso.md#cu-045), [CU-046](3-casos-de-uso.md#cu-046), [CU-047](3-casos-de-uso.md#cu-047), [CU-048](3-casos-de-uso.md#cu-048) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-18](4-mockups.md#mk-18) | Fichas de mockup («RN visibles») |
> | HU | [HU-043](1-historias-de-usuario.md#hu-043), [HU-044](1-historias-de-usuario.md#hu-044), [HU-045](1-historias-de-usuario.md#hu-045), [HU-046](1-historias-de-usuario.md#hu-046), [HU-047](1-historias-de-usuario.md#hu-047), [HU-048](1-historias-de-usuario.md#hu-048) | Matriz §5 |
> | Implementación en la base de datos | [`area`](../fase_3/13-script-sql-ddl.md#tabla-area) (`uq_area_nombre_area`), [`cargo`](../fase_3/13-script-sql-ddl.md#tabla-cargo) (`uq_cargo_nombre_cargo`), [`rol_empleado`](../fase_3/13-script-sql-ddl.md#tabla-rol-empleado) (`uq_rol_empleado_nombre_rol`), [`tipo_activo`](../fase_3/13-script-sql-ddl.md#tabla-tipo-activo) (`uq_tipo_activo_nombre`), [`tipo_problema`](../fase_3/13-script-sql-ddl.md#tabla-tipo-problema) (`uq_tipo_problema_nombre`), [`tipo_solicitud`](../fase_3/13-script-sql-ddl.md#tabla-tipo-solicitud) (`uq_tipo_solicitud_nombre`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`area.nombre_area`](../apoyo/trazabilidad_atributos.md#atr-area-nombre-area), [`cargo.nombre_cargo`](../apoyo/trazabilidad_atributos.md#atr-cargo-nombre-cargo), [`rol_empleado.nombre_rol`](../apoyo/trazabilidad_atributos.md#atr-rol-empleado-nombre-rol), [`tipo_activo.nombre`](../apoyo/trazabilidad_atributos.md#atr-tipo-activo-nombre), [`tipo_problema.nombre`](../apoyo/trazabilidad_atributos.md#atr-tipo-problema-nombre), [`tipo_solicitud.nombre`](../apoyo/trazabilidad_atributos.md#atr-tipo-solicitud-nombre) | Columnas de las restricciones marcadas `-- RN-26` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.4](../fase_3/13.1-pruebas-ddl.md#prueba-5-4) | Sección 5 del script (13.1) |


**Tabla 78**  
<a id="rn-27"></a>

*Regla de negocio RN-27: Adjuntos permitidos*

| **Código**            | **RN-27 — Adjuntos permitidos**                                                                                                                      |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Solo se admiten archivos PNG, JPEG, PDF o texto de máximo 10 MB. Eliminar un adjunto es lógico: deja de mostrarse y el historial conserva el rastro. |
| **Origen**            | Criterios de rechazo HU-042 CA-2 y CA-3; CA-1 y CA-5; entrevista: la información se complementa después (P6).                                        |
| **RF que la vigilan** | RF-42 y RF-43                                                                                                                                        |

> **🔗 Trazabilidad de RN-27**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-042 CA-2](1-historias-de-usuario.md#hu-042-ca-2), [HU-042 CA-3](1-historias-de-usuario.md#hu-042-ca-3), [HU-042 CA-1](1-historias-de-usuario.md#hu-042-ca-1), [HU-042 CA-5](1-historias-de-usuario.md#hu-042-ca-5) | Campo «Origen» |
> | Origen (entrevista) | [P6](../fase_0/0.4.1-entrevista-resultados.md#p6) | Campo «Origen» |
> | RF que la vigilan | [RF-42](#rf-42), [RF-43](#rf-43) | Campo «RF que la vigilan» |
> | Casos de uso que la aplican | [CU-042](3-casos-de-uso.md#cu-042) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-02](4-mockups.md#mk-02), [MK-05](4-mockups.md#mk-05) | Fichas de mockup («RN visibles») |
> | HU | [HU-042](1-historias-de-usuario.md#hu-042) | Matriz §5 |
> | Implementación en la base de datos | [`adjunto_caso`](../fase_3/13-script-sql-ddl.md#tabla-adjunto-caso) (`ck_adjunto_tipo_archivo`), [`adjunto_caso`](../fase_3/13-script-sql-ddl.md#tabla-adjunto-caso) (`ck_adjunto_tamano`), [`adjunto_caso`](../fase_3/13-script-sql-ddl.md#tabla-adjunto-caso) (`ck_adjunto_estado`), [`adjunto_caso`](../fase_3/13-script-sql-ddl.md#tabla-adjunto-caso) (`ck_adjunto_fecha_eliminacion`), [`adjunto_caso`](../fase_3/13-script-sql-ddl.md#tabla-adjunto-caso) (`fk_adjunto_caso`), [`adjunto_caso`](../fase_3/13-script-sql-ddl.md#tabla-adjunto-caso) (`fk_adjunto_autor`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`adjunto_caso.id_caso`](../apoyo/trazabilidad_atributos.md#atr-adjunto-caso-id-caso), [`adjunto_caso.id_usuario_autor`](../apoyo/trazabilidad_atributos.md#atr-adjunto-caso-id-usuario-autor), [`adjunto_caso.tipo_archivo`](../apoyo/trazabilidad_atributos.md#atr-adjunto-caso-tipo-archivo), [`adjunto_caso.tamano_kb`](../apoyo/trazabilidad_atributos.md#atr-adjunto-caso-tamano-kb), [`adjunto_caso.fecha_carga`](../apoyo/trazabilidad_atributos.md#atr-adjunto-caso-fecha-carga), [`adjunto_caso.estado_adjunto`](../apoyo/trazabilidad_atributos.md#atr-adjunto-caso-estado-adjunto), [`adjunto_caso.fecha_eliminacion`](../apoyo/trazabilidad_atributos.md#atr-adjunto-caso-fecha-eliminacion) | Columnas de las restricciones marcadas `-- RN-27` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.23](../fase_3/13.1-pruebas-ddl.md#prueba-5-23), [5.24](../fase_3/13.1-pruebas-ddl.md#prueba-5-24) | Sección 5 del script (13.1) |


**Tabla 79**  
<a id="rn-28"></a>

*Regla de negocio RN-28: Disponibilidad vigente del personal de soporte*

| **Código**            | **RN-28 — Disponibilidad vigente del personal de soporte**                                                                                                         |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | La disponibilidad es disponible, ocupado o ausente, y siempre se muestra la más reciente. Si una persona no tiene disponibilidad registrada, el sistema lo indica. |
| **Origen**            | HU-034 CA-2 y HU-015 CA-3; entrevista: los usuarios preguntan a otra persona de TI (P8).                                                                           |
| **RF que la vigilan** | RF-24 y RF-25                                                                                                                                                      |

> **🔗 Trazabilidad de RN-28**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-034 CA-2](1-historias-de-usuario.md#hu-034-ca-2), [HU-015 CA-3](1-historias-de-usuario.md#hu-015-ca-3) | Campo «Origen» |
> | Origen (entrevista) | [P8](../fase_0/0.4.1-entrevista-resultados.md#p8) | Campo «Origen» |
> | RF que la vigilan | [RF-24](#rf-24), [RF-25](#rf-25) | Campo «RF que la vigilan» |
> | Casos de uso que la aplican | [CU-015](3-casos-de-uso.md#cu-015), [CU-034](3-casos-de-uso.md#cu-034) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-11](4-mockups.md#mk-11) | Fichas de mockup («RN visibles») |
> | HU | [HU-015](1-historias-de-usuario.md#hu-015), [HU-034](1-historias-de-usuario.md#hu-034) | Matriz §5 |
> | Implementación en la base de datos | [`info_personal_soporte`](../fase_3/13-script-sql-ddl.md#tabla-info-personal-soporte) (`uq_info_soporte_usuario`), [`info_personal_soporte`](../fase_3/13-script-sql-ddl.md#tabla-info-personal-soporte) (`ck_info_soporte_disponibilidad`), [`info_personal_soporte`](../fase_3/13-script-sql-ddl.md#tabla-info-personal-soporte) (`fk_info_soporte_usuario`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`info_personal_soporte.id_usuario_soporte`](../apoyo/trazabilidad_atributos.md#atr-info-personal-soporte-id-usuario-soporte), [`info_personal_soporte.disponibilidad`](../apoyo/trazabilidad_atributos.md#atr-info-personal-soporte-disponibilidad) | Columnas de las restricciones marcadas `-- RN-28` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.27](../fase_3/13.1-pruebas-ddl.md#prueba-5-27), [5.28](../fase_3/13.1-pruebas-ddl.md#prueba-5-28) | Sección 5 del script (13.1) |


**Tabla 80**  
<a id="rn-29"></a>

*Regla de negocio RN-29: Periodos sin información*

| **Código**            | **RN-29 — Periodos sin información**                                                                                    |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Si un periodo no tiene casos, el sistema lo informa claramente: no muestra un resumen vacío ni genera un reporte vacío. |
| **Origen**            | Criterios de rechazo HU-011 CA-4, HU-012 CA-2 y HU-030 CA-2.                                                            |
| **RF que la vigilan** | RF-21, RF-22 y RF-40                                                                                                    |

> **🔗 Trazabilidad de RN-29**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-011 CA-4](1-historias-de-usuario.md#hu-011-ca-4), [HU-012 CA-2](1-historias-de-usuario.md#hu-012-ca-2), [HU-030 CA-2](1-historias-de-usuario.md#hu-030-ca-2) | Campo «Origen» |
> | RF que la vigilan | [RF-21](#rf-21), [RF-22](#rf-22), [RF-40](#rf-40) | Campo «RF que la vigilan» |
> | CA que la citan | [HU-012 CA-1](1-historias-de-usuario.md#hu-012-ca-1), [HU-030 CA-1](1-historias-de-usuario.md#hu-030-ca-1) | Anotaciones de los criterios de aceptación |
> | Casos de uso que la aplican | [CU-011](3-casos-de-uso.md#cu-011), [CU-012](3-casos-de-uso.md#cu-012), [CU-030](3-casos-de-uso.md#cu-030) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-10](4-mockups.md#mk-10) | Fichas de mockup («RN visibles») |
> | HU | [HU-011](1-historias-de-usuario.md#hu-011), [HU-012](1-historias-de-usuario.md#hu-012), [HU-030](1-historias-de-usuario.md#hu-030) | Matriz §5 |


**Tabla 81**  
<a id="rn-30"></a>

*Regla de negocio RN-30: Inactivación de valores de catálogo*

| **Código**            | **RN-30 — Inactivación de valores de catálogo**                                                                                                                                                              |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Enunciado**         | Un valor inactivo de un catálogo (área, cargo, rol de empleado, tipo de activo, tipo de problema o tipo de solicitud) deja de ofrecerse en los registros nuevos, pero los registros existentes lo conservan. |
| **Origen**            | HU-043 a HU-048 CA-4 (antes HU-039 CA-4).                                                                                                                                                                    |
| **RF que la vigilan** | RF-48                                                                                                                                                                                                        |

> **🔗 Trazabilidad de RN-30**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Nace de (CA) | [HU-043 CA-4](1-historias-de-usuario.md#hu-043-ca-4), [HU-044 CA-4](1-historias-de-usuario.md#hu-044-ca-4), [HU-045 CA-4](1-historias-de-usuario.md#hu-045-ca-4), [HU-046 CA-4](1-historias-de-usuario.md#hu-046-ca-4), [HU-047 CA-4](1-historias-de-usuario.md#hu-047-ca-4), [HU-048 CA-4](1-historias-de-usuario.md#hu-048-ca-4) | Campo «Origen» |
> | RF que la vigilan | [RF-48](#rf-48) | Campo «RF que la vigilan» |
> | CA que la citan | [HU-043 CA-4](1-historias-de-usuario.md#hu-043-ca-4), [HU-044 CA-4](1-historias-de-usuario.md#hu-044-ca-4), [HU-045 CA-4](1-historias-de-usuario.md#hu-045-ca-4), [HU-046 CA-4](1-historias-de-usuario.md#hu-046-ca-4), [HU-047 CA-4](1-historias-de-usuario.md#hu-047-ca-4), [HU-048 CA-4](1-historias-de-usuario.md#hu-048-ca-4) | Anotaciones de los criterios de aceptación |
> | Casos de uso que la aplican | [CU-043](3-casos-de-uso.md#cu-043), [CU-044](3-casos-de-uso.md#cu-044), [CU-045](3-casos-de-uso.md#cu-045), [CU-046](3-casos-de-uso.md#cu-046), [CU-047](3-casos-de-uso.md#cu-047), [CU-048](3-casos-de-uso.md#cu-048) | Flujos de los CU (§3.1) |
> | Mockups que la muestran | [MK-18](4-mockups.md#mk-18) | Fichas de mockup («RN visibles») |
> | HU | [HU-043](1-historias-de-usuario.md#hu-043), [HU-044](1-historias-de-usuario.md#hu-044), [HU-045](1-historias-de-usuario.md#hu-045), [HU-046](1-historias-de-usuario.md#hu-046), [HU-047](1-historias-de-usuario.md#hu-047), [HU-048](1-historias-de-usuario.md#hu-048) | Matriz §5 |
> | Implementación en la base de datos | [`area`](../fase_3/13-script-sql-ddl.md#tabla-area) (`ck_area_estado`), [`area`](../fase_3/13-script-sql-ddl.md#tabla-area) (`fk_area_usuario_modificacion`), [`cargo`](../fase_3/13-script-sql-ddl.md#tabla-cargo) (`ck_cargo_estado`), [`cargo`](../fase_3/13-script-sql-ddl.md#tabla-cargo) (`fk_cargo_usuario_modificacion`), [`rol_empleado`](../fase_3/13-script-sql-ddl.md#tabla-rol-empleado) (`ck_rol_empleado_estado`), [`rol_empleado`](../fase_3/13-script-sql-ddl.md#tabla-rol-empleado) (`fk_rol_empleado_usuario_modificacion`), [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) (`fk_usuario_cargo`), [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) (`fk_usuario_rol_empleado`), [`tipo_activo`](../fase_3/13-script-sql-ddl.md#tabla-tipo-activo) (`ck_tipo_activo_estado`), [`tipo_activo`](../fase_3/13-script-sql-ddl.md#tabla-tipo-activo) (`fk_tipo_activo_usuario_modificacion`), [`tipo_problema`](../fase_3/13-script-sql-ddl.md#tabla-tipo-problema) (`ck_tipo_problema_estado`), [`tipo_problema`](../fase_3/13-script-sql-ddl.md#tabla-tipo-problema) (`fk_tipo_problema_usuario_modificacion`), [`tipo_solicitud`](../fase_3/13-script-sql-ddl.md#tabla-tipo-solicitud) (`ck_tipo_solicitud_estado`), [`tipo_solicitud`](../fase_3/13-script-sql-ddl.md#tabla-tipo-solicitud) (`fk_tipo_solicitud_usuario_modificacion`) | Comentarios `-- RN-xx` del script DDL |
> | Atributos que restringe | [`area.estado`](../apoyo/trazabilidad_atributos.md#atr-area-estado), [`area.id_usuario_modificacion`](../apoyo/trazabilidad_atributos.md#atr-area-id-usuario-modificacion), [`cargo.estado`](../apoyo/trazabilidad_atributos.md#atr-cargo-estado), [`cargo.id_usuario_modificacion`](../apoyo/trazabilidad_atributos.md#atr-cargo-id-usuario-modificacion), [`rol_empleado.estado`](../apoyo/trazabilidad_atributos.md#atr-rol-empleado-estado), [`rol_empleado.id_usuario_modificacion`](../apoyo/trazabilidad_atributos.md#atr-rol-empleado-id-usuario-modificacion), [`usuario.id_cargo`](../apoyo/trazabilidad_atributos.md#atr-usuario-id-cargo), [`usuario.id_rol_organizacional`](../apoyo/trazabilidad_atributos.md#atr-usuario-id-rol-organizacional), [`tipo_activo.estado`](../apoyo/trazabilidad_atributos.md#atr-tipo-activo-estado), [`tipo_activo.id_usuario_modificacion`](../apoyo/trazabilidad_atributos.md#atr-tipo-activo-id-usuario-modificacion), [`tipo_problema.estado`](../apoyo/trazabilidad_atributos.md#atr-tipo-problema-estado), [`tipo_problema.id_usuario_modificacion`](../apoyo/trazabilidad_atributos.md#atr-tipo-problema-id-usuario-modificacion), [`tipo_solicitud.estado`](../apoyo/trazabilidad_atributos.md#atr-tipo-solicitud-estado), [`tipo_solicitud.id_usuario_modificacion`](../apoyo/trazabilidad_atributos.md#atr-tipo-solicitud-id-usuario-modificacion) | Columnas de las restricciones marcadas `-- RN-30` en el DDL ([catálogo de atributos](../apoyo/trazabilidad_atributos.md)) |
> | Pruebas en MySQL | [5.5](../fase_3/13.1-pruebas-ddl.md#prueba-5-5) | Sección 5 del script (13.1) |


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
<a id="rf-01"></a>

*Ficha del requisito funcional RF-01*

| **Código**              | **RF-01**                                                                                                                                                                                                                                                 |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Registrar caso de soporte                                                                                                                                                                                                                                 |
| **Descripción**         | El sistema debe registrar un caso con qué necesita, dónde ocurre, tipo de caso, afectación, urgencia, datos de contacto y, de forma opcional, un equipo o programa, dejándolo en situación recibido con número de seguimiento y fecha y hora automáticos. |
| **HU de origen**        | HU-001 y HU-002                                                                                                                                                                                                                                           |
| **RN que hace cumplir** | RN-01, RN-02, RN-23 y RN-25                                                                                                                                                                                                                               |
| **Prioridad**           | Alta                                                                                                                                                                                                                                                      |

> **🔗 Trazabilidad de RF-01**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-001](1-historias-de-usuario.md#hu-001), [HU-002](1-historias-de-usuario.md#hu-002) | Ficha del RF |
> | HU que lo derivan | [HU-001](1-historias-de-usuario.md#hu-001), [HU-002](1-historias-de-usuario.md#hu-002) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-01](#rn-01), [RN-02](#rn-02), [RN-23](#rn-23), [RN-25](#rn-25) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-001](3-casos-de-uso.md#cu-001) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-02](4-mockups.md#mk-02) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-02](4-mockups.md#mk-02) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte), [`historial_caso`](../fase_3/13-script-sql-ddl.md#tabla-historial-caso), [`tiempo_atencion_sla`](../fase_3/13-script-sql-ddl.md#tabla-tiempo-atencion-sla), [`activo`](../fase_3/13-script-sql-ddl.md#tabla-activo), [`aviso`](../fase_3/13-script-sql-ddl.md#tabla-aviso) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 84**  
<a id="rf-02"></a>

*Ficha del requisito funcional RF-02*

| **Código**              | **RF-02**                                                                                                                                                                  |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Mostrar ejemplos junto a las preguntas                                                                                                                                     |
| **Descripción**         | El sistema debe orientar al solicitante con un ejemplo breve de respuesta en cada dato del caso que pueda generar duda, incluida la diferencia entre problema y solicitud. |
| **HU de origen**        | HU-001 y HU-004                                                                                                                                                            |
| **RN que hace cumplir** | Ninguna                                                                                                                                                                    |
| **Prioridad**           | Alta                                                                                                                                                                       |

> **🔗 Trazabilidad de RF-02**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-001](1-historias-de-usuario.md#hu-001), [HU-004](1-historias-de-usuario.md#hu-004) | Ficha del RF |
> | HU que lo derivan | [HU-001](1-historias-de-usuario.md#hu-001), [HU-004](1-historias-de-usuario.md#hu-004) | Fichas de HU («RF derivados») |
> | CA que lo citan | [HU-001 CA-4](1-historias-de-usuario.md#hu-001-ca-4), [HU-004 CA-4](1-historias-de-usuario.md#hu-004-ca-4) | Anotaciones de los criterios de aceptación |
> | Casos de uso que lo implementan | [CU-001](3-casos-de-uso.md#cu-001), [CU-004](3-casos-de-uso.md#cu-004) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-02](4-mockups.md#mk-02) | Cobertura §4.4 |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte), [`historial_caso`](../fase_3/13-script-sql-ddl.md#tabla-historial-caso), [`tiempo_atencion_sla`](../fase_3/13-script-sql-ddl.md#tabla-tiempo-atencion-sla), [`activo`](../fase_3/13-script-sql-ddl.md#tabla-activo) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 85**  
<a id="rf-03"></a>

*Ficha del requisito funcional RF-03*

| **Código**              | **RF-03**                                                                                                                                                           |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Confirmar el caso en pantalla y por correo                                                                                                                          |
| **Descripción**         | El sistema debe confirmar de inmediato al solicitante el registro de su caso con su número de seguimiento y enviarle por correo ese número con el resumen del caso. |
| **HU de origen**        | HU-002                                                                                                                                                              |
| **RN que hace cumplir** | RN-02, RN-16 y RN-17                                                                                                                                                |
| **Prioridad**           | Alta                                                                                                                                                                |

> **🔗 Trazabilidad de RF-03**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-002](1-historias-de-usuario.md#hu-002) | Ficha del RF |
> | HU que lo derivan | [HU-002](1-historias-de-usuario.md#hu-002) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-02](#rn-02), [RN-16](#rn-16), [RN-17](#rn-17) | Ficha del RF |
> | CA que lo citan | [HU-002 CA-5](1-historias-de-usuario.md#hu-002-ca-5) | Anotaciones de los criterios de aceptación |
> | Casos de uso que lo implementan | [CU-002](3-casos-de-uso.md#cu-002) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-03](4-mockups.md#mk-03) | Cobertura §4.4 |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte), [`aviso`](../fase_3/13-script-sql-ddl.md#tabla-aviso) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 86**  
<a id="rf-04"></a>

*Ficha del requisito funcional RF-04*

| **Código**              | **RF-04**                                                                                                                       |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Generar avisos por cambio de situación                                                                                          |
| **Descripción**         | El sistema debe notificar al solicitante cada cambio de situación de su caso por todos los canales de aviso definidos en RN-15. |
| **HU de origen**        | HU-003                                                                                                                          |
| **RN que hace cumplir** | RN-15                                                                                                                           |
| **Prioridad**           | Alta                                                                                                                            |

> **🔗 Trazabilidad de RF-04**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-003](1-historias-de-usuario.md#hu-003) | Ficha del RF |
> | HU que lo derivan | [HU-003](1-historias-de-usuario.md#hu-003) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-15](#rn-15) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-003](3-casos-de-uso.md#cu-003) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-09](4-mockups.md#mk-09) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-09](4-mockups.md#mk-09) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`aviso`](../fase_3/13-script-sql-ddl.md#tabla-aviso) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 87**  
<a id="rf-05"></a>

*Ficha del requisito funcional RF-05*

| **Código**              | **RF-05**                                                                                                                       |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Reintentar el envío de avisos fallidos                                                                                          |
| **Descripción**         | El sistema debe guardar el motivo de un envío fallido de correo y reintentarlo automáticamente, sin afectar el caso registrado. |
| **HU de origen**        | HU-002 y HU-003                                                                                                                 |
| **RN que hace cumplir** | RN-15 y RN-16                                                                                                                   |
| **Prioridad**           | Alta                                                                                                                            |

> **🔗 Trazabilidad de RF-05**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-002](1-historias-de-usuario.md#hu-002), [HU-003](1-historias-de-usuario.md#hu-003) | Ficha del RF |
> | HU que lo derivan | [HU-002](1-historias-de-usuario.md#hu-002), [HU-003](1-historias-de-usuario.md#hu-003) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-15](#rn-15), [RN-16](#rn-16) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-003](3-casos-de-uso.md#cu-003) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-09](4-mockups.md#mk-09) | Cobertura §4.4 |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte), [`aviso`](../fase_3/13-script-sql-ddl.md#tabla-aviso) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 88**  
<a id="rf-06"></a>

*Ficha del requisito funcional RF-06*

| **Código**              | **RF-06**                                                                                                                   |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Consultar y leer avisos                                                                                                     |
| **Descripción**         | El sistema debe permitir al solicitante abrir sus avisos, ver el contenido completo y registrar la fecha y hora de lectura. |
| **HU de origen**        | HU-003                                                                                                                      |
| **RN que hace cumplir** | Ninguna                                                                                                                     |
| **Prioridad**           | Alta                                                                                                                        |

> **🔗 Trazabilidad de RF-06**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-003](1-historias-de-usuario.md#hu-003) | Ficha del RF |
> | HU que lo derivan | [HU-003](1-historias-de-usuario.md#hu-003) | Fichas de HU («RF derivados») |
> | Casos de uso que lo implementan | [CU-003](3-casos-de-uso.md#cu-003) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-09](4-mockups.md#mk-09) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-09](4-mockups.md#mk-09) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`aviso`](../fase_3/13-script-sql-ddl.md#tabla-aviso) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 89**  
<a id="rf-07"></a>

*Ficha del requisito funcional RF-07*

| **Código**              | **RF-07**                                                                                                                                                                       |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Clasificar el caso como problema o solicitud                                                                                                                                    |
| **Descripción**         | El sistema debe pedir el tipo de problema cuando el caso es un problema, y el tipo y la clase de solicitud cuando es una solicitud, sin permitir mezclar ambos grupos de datos. |
| **HU de origen**        | HU-004                                                                                                                                                                          |
| **RN que hace cumplir** | RN-03                                                                                                                                                                           |
| **Prioridad**           | Alta                                                                                                                                                                            |

> **🔗 Trazabilidad de RF-07**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-004](1-historias-de-usuario.md#hu-004) | Ficha del RF |
> | HU que lo derivan | [HU-004](1-historias-de-usuario.md#hu-004) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-03](#rn-03) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-004](3-casos-de-uso.md#cu-004) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-02](4-mockups.md#mk-02) | Cobertura §4.4 |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 90**  
<a id="rf-08"></a>

*Ficha del requisito funcional RF-08*

| **Código**              | **RF-08**                                                                                                                |
|-------------------------|--------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Corregir la clasificación de un caso                                                                                     |
| **Descripción**         | El sistema debe permitir al personal de soporte corregir el tipo de caso, registrando quién lo hizo, cuándo y el motivo. |
| **HU de origen**        | HU-049                                                                                                                   |
| **RN que hace cumplir** | RN-03, RN-08 y RN-23                                                                                                     |
| **Prioridad**           | Media                                                                                                                    |

> **🔗 Trazabilidad de RF-08**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-049](1-historias-de-usuario.md#hu-049) | Ficha del RF |
> | HU que lo derivan | [HU-049](1-historias-de-usuario.md#hu-049) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-03](#rn-03), [RN-08](#rn-08), [RN-23](#rn-23) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-049](3-casos-de-uso.md#cu-049) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-06](4-mockups.md#mk-06) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-06](4-mockups.md#mk-06) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte), [`historial_caso`](../fase_3/13-script-sql-ddl.md#tabla-historial-caso) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 91**  
<a id="rf-09"></a>

*Ficha del requisito funcional RF-09*

| **Código**              | **RF-09**                                                                                                                           |
|-------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Listar los casos del solicitante                                                                                                    |
| **Descripción**         | El sistema debe listar los casos del solicitante ordenados del más reciente al más antiguo, mostrando únicamente los casos propios. |
| **HU de origen**        | HU-005                                                                                                                              |
| **RN que hace cumplir** | RN-06                                                                                                                               |
| **Prioridad**           | Alta                                                                                                                                |

> **🔗 Trazabilidad de RF-09**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-005](1-historias-de-usuario.md#hu-005) | Ficha del RF |
> | HU que lo derivan | [HU-005](1-historias-de-usuario.md#hu-005) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-06](#rn-06) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-005](3-casos-de-uso.md#cu-005) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-04](4-mockups.md#mk-04) | Cobertura §4.4 |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 92**  
<a id="rf-10"></a>

*Ficha del requisito funcional RF-10*

| **Código**              | **RF-10**                                                                                                                             |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Buscar casos por filtros                                                                                                              |
| **Descripción**         | El sistema debe permitir buscar los casos propios por fecha, situación, tipo o palabra clave, informando cuando no hay coincidencias. |
| **HU de origen**        | HU-005                                                                                                                                |
| **RN que hace cumplir** | RN-06                                                                                                                                 |
| **Prioridad**           | Alta                                                                                                                                  |

> **🔗 Trazabilidad de RF-10**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-005](1-historias-de-usuario.md#hu-005) | Ficha del RF |
> | HU que lo derivan | [HU-005](1-historias-de-usuario.md#hu-005) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-06](#rn-06) | Ficha del RF |
> | CA que lo citan | [HU-005 CA-1](1-historias-de-usuario.md#hu-005-ca-1), [HU-005 CA-3](1-historias-de-usuario.md#hu-005-ca-3) | Anotaciones de los criterios de aceptación |
> | Casos de uso que lo implementan | [CU-005](3-casos-de-uso.md#cu-005) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-04](4-mockups.md#mk-04) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-04](4-mockups.md#mk-04) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 93**  
<a id="rf-11"></a>

*Ficha del requisito funcional RF-11*

| **Código**              | **RF-11**                                                                                                                                               |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Listar casos pendientes                                                                                                                                 |
| **Descripción**         | El sistema debe listar los casos no cerrados, con número de seguimiento, situación e importancia, ordenables por importancia, fecha y tipo de problema. |
| **HU de origen**        | HU-006                                                                                                                                                  |
| **RN que hace cumplir** | RN-05 y RN-23                                                                                                                                           |
| **Prioridad**           | Alta                                                                                                                                                    |

> **🔗 Trazabilidad de RF-11**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-006](1-historias-de-usuario.md#hu-006) | Ficha del RF |
> | HU que lo derivan | [HU-006](1-historias-de-usuario.md#hu-006) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-05](#rn-05), [RN-23](#rn-23) | Ficha del RF |
> | CA que lo citan | [HU-006 CA-1](1-historias-de-usuario.md#hu-006-ca-1) | Anotaciones de los criterios de aceptación |
> | Casos de uso que lo implementan | [CU-006](3-casos-de-uso.md#cu-006) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-07](4-mockups.md#mk-07) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-07](4-mockups.md#mk-07) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte), [`tabla_importancia`](../fase_3/13-script-sql-ddl.md#tabla-tabla-importancia) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 94**  
<a id="rf-12"></a>

*Ficha del requisito funcional RF-12*

| **Código**              | **RF-12**                                                                                                                                                                 |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Cambiar la situación del caso                                                                                                                                             |
| **Descripción**         | El sistema debe cambiar la situación de un caso solo cuando la transición esté permitida para el perfil del usuario, rechazando los demás cambios y explicando el motivo. |
| **HU de origen**        | HU-007                                                                                                                                                                    |
| **RN que hace cumplir** | RN-07, RN-08 y RN-23                                                                                                                                                      |
| **Prioridad**           | Alta                                                                                                                                                                      |

> **🔗 Trazabilidad de RF-12**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-007](1-historias-de-usuario.md#hu-007) | Ficha del RF |
> | HU que lo derivan | [HU-007](1-historias-de-usuario.md#hu-007) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-07](#rn-07), [RN-08](#rn-08), [RN-23](#rn-23) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-007](3-casos-de-uso.md#cu-007) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-06](4-mockups.md#mk-06) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-06](4-mockups.md#mk-06) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte), [`historial_caso`](../fase_3/13-script-sql-ddl.md#tabla-historial-caso), [`transicion_estado_caso`](../fase_3/13-script-sql-ddl.md#tabla-transicion-estado-caso) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 95**  
<a id="rf-13"></a>

*Ficha del requisito funcional RF-13*

| **Código**              | **RF-13**                                                                                                                                                                                          |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Consultar el detalle del caso                                                                                                                                                                      |
| **Descripción**         | El sistema debe permitir al solicitante y al personal de soporte consultar la situación actual de un caso, los tiempos de atención aplicados, los comentarios visibles para su rol y los adjuntos. |
| **HU de origen**        | HU-007 y HU-010                                                                                                                                                                                    |
| **RN que hace cumplir** | RN-06                                                                                                                                                                                              |
| **Prioridad**           | Alta                                                                                                                                                                                               |

> **🔗 Trazabilidad de RF-13**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-007](1-historias-de-usuario.md#hu-007), [HU-010](1-historias-de-usuario.md#hu-010) | Ficha del RF |
> | HU que lo derivan | [HU-007](1-historias-de-usuario.md#hu-007), [HU-010](1-historias-de-usuario.md#hu-010) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-06](#rn-06) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-010](3-casos-de-uso.md#cu-010) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-05](4-mockups.md#mk-05) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-03](4-mockups.md#mk-03), [MK-04](4-mockups.md#mk-04) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte), [`historial_caso`](../fase_3/13-script-sql-ddl.md#tabla-historial-caso), [`tiempo_atencion_sla`](../fase_3/13-script-sql-ddl.md#tabla-tiempo-atencion-sla), [`transicion_estado_caso`](../fase_3/13-script-sql-ddl.md#tabla-transicion-estado-caso) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 96**  
<a id="rf-14"></a>

*Ficha del requisito funcional RF-14*

| **Código**              | **RF-14**                                                                                                                 |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Asignar responsable del caso                                                                                              |
| **Descripción**         | El sistema debe asignar o cambiar la persona responsable de un caso, conservando en el historial al responsable anterior. |
| **HU de origen**        | HU-008                                                                                                                    |
| **RN que hace cumplir** | RN-09 y RN-08                                                                                                             |
| **Prioridad**           | Alta                                                                                                                      |

> **🔗 Trazabilidad de RF-14**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-008](1-historias-de-usuario.md#hu-008) | Ficha del RF |
> | HU que lo derivan | [HU-008](1-historias-de-usuario.md#hu-008) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-08](#rn-08), [RN-09](#rn-09) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-008](3-casos-de-uso.md#cu-008) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-06](4-mockups.md#mk-06) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-06](4-mockups.md#mk-06) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte), [`historial_caso`](../fase_3/13-script-sql-ddl.md#tabla-historial-caso) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 97**  
<a id="rf-15"></a>

*Ficha del requisito funcional RF-15*

| **Código**              | **RF-15**                                                                                                                              |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Pasar un caso a otra persona de soporte                                                                                                |
| **Descripción**         | El sistema debe permitir al responsable pasar su caso a otra persona de soporte, que podrá ver el historial y los comentarios previos. |
| **HU de origen**        | HU-026                                                                                                                                 |
| **RN que hace cumplir** | RN-09 y RN-08                                                                                                                          |
| **Prioridad**           | Media                                                                                                                                  |

> **🔗 Trazabilidad de RF-15**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-026](1-historias-de-usuario.md#hu-026) | Ficha del RF |
> | HU que lo derivan | [HU-026](1-historias-de-usuario.md#hu-026) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-08](#rn-08), [RN-09](#rn-09) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-026](3-casos-de-uso.md#cu-026) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-06](4-mockups.md#mk-06) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-06](4-mockups.md#mk-06) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte), [`historial_caso`](../fase_3/13-script-sql-ddl.md#tabla-historial-caso) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 98**  
<a id="rf-16"></a>

*Ficha del requisito funcional RF-16*

| **Código**              | **RF-16**                                                                                                                   |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Registrar comentarios del caso                                                                                              |
| **Descripción**         | El sistema debe guardar un comentario con su autor, fecha y visibilidad (usuario o interno), rechazando comentarios vacíos. |
| **HU de origen**        | HU-009                                                                                                                      |
| **RN que hace cumplir** | RN-10 y RN-08                                                                                                               |
| **Prioridad**           | Media                                                                                                                       |

> **🔗 Trazabilidad de RF-16**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-009](1-historias-de-usuario.md#hu-009) | Ficha del RF |
> | HU que lo derivan | [HU-009](1-historias-de-usuario.md#hu-009) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-08](#rn-08), [RN-10](#rn-10) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-009](3-casos-de-uso.md#cu-009) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-05](4-mockups.md#mk-05), [MK-06](4-mockups.md#mk-06) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-06](4-mockups.md#mk-06) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`comentario_caso`](../fase_3/13-script-sql-ddl.md#tabla-comentario-caso) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 99**  
<a id="rf-17"></a>

*Ficha del requisito funcional RF-17*

| **Código**              | **RF-17**                                                                                                                                            |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Listar comentarios según visibilidad                                                                                                                 |
| **Descripción**         | El sistema debe permitir al personal de soporte consultar todos los comentarios de un caso y al solicitante solo los marcados como visibles para él. |
| **HU de origen**        | HU-009                                                                                                                                               |
| **RN que hace cumplir** | RN-10                                                                                                                                                |
| **Prioridad**           | Media                                                                                                                                                |

> **🔗 Trazabilidad de RF-17**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-009](1-historias-de-usuario.md#hu-009) | Ficha del RF |
> | HU que lo derivan | [HU-009](1-historias-de-usuario.md#hu-009) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-10](#rn-10) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-009](3-casos-de-uso.md#cu-009) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-05](4-mockups.md#mk-05), [MK-06](4-mockups.md#mk-06) | Cobertura §4.4 |
> | Tablas de la base de datos | [`comentario_caso`](../fase_3/13-script-sql-ddl.md#tabla-comentario-caso) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 100**  
<a id="rf-18"></a>

*Ficha del requisito funcional RF-18*

| **Código**              | **RF-18**                                                                                                                                                                         |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Indicar afectación y urgencia                                                                                                                                                     |
| **Descripción**         | El sistema debe solicitar a cuántas personas afecta el caso (usuario, área o empresa) y qué tan urgente es (baja, media, alta o crítica), sin permitir continuar si falta alguno. |
| **HU de origen**        | HU-001, HU-021 y HU-022                                                                                                                                                           |
| **RN que hace cumplir** | RN-01                                                                                                                                                                             |
| **Prioridad**           | Alta                                                                                                                                                                              |

> **🔗 Trazabilidad de RF-18**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-001](1-historias-de-usuario.md#hu-001), [HU-021](1-historias-de-usuario.md#hu-021), [HU-022](1-historias-de-usuario.md#hu-022) | Ficha del RF |
> | HU que lo derivan | [HU-001](1-historias-de-usuario.md#hu-001), [HU-021](1-historias-de-usuario.md#hu-021), [HU-022](1-historias-de-usuario.md#hu-022) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-01](#rn-01) | Ficha del RF |
> | CA que lo citan | [HU-001 CA-1](1-historias-de-usuario.md#hu-001-ca-1) | Anotaciones de los criterios de aceptación |
> | Casos de uso que lo implementan | [CU-021](3-casos-de-uso.md#cu-021), [CU-022](3-casos-de-uso.md#cu-022) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-02](4-mockups.md#mk-02) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-02](4-mockups.md#mk-02) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte), [`historial_caso`](../fase_3/13-script-sql-ddl.md#tabla-historial-caso), [`tiempo_atencion_sla`](../fase_3/13-script-sql-ddl.md#tabla-tiempo-atencion-sla), [`activo`](../fase_3/13-script-sql-ddl.md#tabla-activo), [`tabla_importancia`](../fase_3/13-script-sql-ddl.md#tabla-tabla-importancia) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 101**  
<a id="rf-19"></a>

*Ficha del requisito funcional RF-19*

| **Código**              | **RF-19**                                                                                                                             |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Calcular la importancia del caso                                                                                                      |
| **Descripción**         | El sistema debe calcular automáticamente la importancia P1 a P4 combinando afectación y urgencia, y fijarla sin recalcularla después. |
| **HU de origen**        | HU-021 y HU-022                                                                                                                       |
| **RN que hace cumplir** | RN-05                                                                                                                                 |
| **Prioridad**           | Alta                                                                                                                                  |

> **🔗 Trazabilidad de RF-19**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-021](1-historias-de-usuario.md#hu-021), [HU-022](1-historias-de-usuario.md#hu-022) | Ficha del RF |
> | HU que lo derivan | [HU-021](1-historias-de-usuario.md#hu-021), [HU-022](1-historias-de-usuario.md#hu-022) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-05](#rn-05) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-022](3-casos-de-uso.md#cu-022) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-02](4-mockups.md#mk-02) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-02](4-mockups.md#mk-02) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`tabla_importancia`](../fase_3/13-script-sql-ddl.md#tabla-tabla-importancia) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 102**  
<a id="rf-20"></a>

*Ficha del requisito funcional RF-20*

| **Código**              | **RF-20**                                                                                                             |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Asignar el tiempo de atención al caso                                                                                 |
| **Descripción**         | El sistema debe asociar a cada caso nuevo la regla de tiempos de atención vigente para su importancia y tipo de caso. |
| **HU de origen**        | HU-010                                                                                                                |
| **RN que hace cumplir** | RN-13 y RN-14                                                                                                         |
| **Prioridad**           | Media                                                                                                                 |

> **🔗 Trazabilidad de RF-20**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-010](1-historias-de-usuario.md#hu-010) | Ficha del RF |
> | HU que lo derivan | [HU-010](1-historias-de-usuario.md#hu-010) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-13](#rn-13), [RN-14](#rn-14) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-S01](3-casos-de-uso.md#cu-s01) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-05](4-mockups.md#mk-05) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-02](4-mockups.md#mk-02) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte), [`tiempo_atencion_sla`](../fase_3/13-script-sql-ddl.md#tabla-tiempo-atencion-sla) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 103**  
<a id="rf-21"></a>

*Ficha del requisito funcional RF-21*

| **Código**              | **RF-21**                                                                                                                              |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Resumen general de atención                                                                                                            |
| **Descripción**         | El sistema debe permitir al supervisor consultar la cantidad de casos por situación y cuántos cumplen o superan el tiempo de atención. |
| **HU de origen**        | HU-011                                                                                                                                 |
| **RN que hace cumplir** | RN-14 y RN-29                                                                                                                          |
| **Prioridad**           | Media                                                                                                                                  |

> **🔗 Trazabilidad de RF-21**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-011](1-historias-de-usuario.md#hu-011) | Ficha del RF |
> | HU que lo derivan | [HU-011](1-historias-de-usuario.md#hu-011) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-14](#rn-14), [RN-29](#rn-29) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-011](3-casos-de-uso.md#cu-011) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-10](4-mockups.md#mk-10) | Cobertura §4.4 |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 104**  
<a id="rf-22"></a>

*Ficha del requisito funcional RF-22*

| **Código**              | **RF-22**                                                                                                   |
|-------------------------|-------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Resumen de atención por periodo                                                                             |
| **Descripción**         | El sistema debe recalcular el resumen de atención para hoy, la semana, el mes o un rango de fechas elegido. |
| **HU de origen**        | HU-012                                                                                                      |
| **RN que hace cumplir** | RN-29                                                                                                       |
| **Prioridad**           | Media                                                                                                       |

> **🔗 Trazabilidad de RF-22**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-012](1-historias-de-usuario.md#hu-012) | Ficha del RF |
> | HU que lo derivan | [HU-012](1-historias-de-usuario.md#hu-012) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-29](#rn-29) | Ficha del RF |
> | CA que lo citan | [HU-012 CA-1](1-historias-de-usuario.md#hu-012-ca-1) | Anotaciones de los criterios de aceptación |
> | Casos de uso que lo implementan | [CU-012](3-casos-de-uso.md#cu-012) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-10](4-mockups.md#mk-10) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-10](4-mockups.md#mk-10) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 105**  
<a id="rf-23"></a>

*Ficha del requisito funcional RF-23*

| **Código**              | **RF-23**                                                                                                                                            |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Reabrir un caso resuelto                                                                                                                             |
| **Descripción**         | El sistema debe reabrir un caso resuelto dentro de 5 días hábiles, con motivo obligatorio, conservando su número, historial, comentarios y adjuntos. |
| **HU de origen**        | HU-013                                                                                                                                               |
| **RN que hace cumplir** | RN-11 y RN-08                                                                                                                                        |
| **Prioridad**           | Media                                                                                                                                                |

> **🔗 Trazabilidad de RF-23**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-013](1-historias-de-usuario.md#hu-013) | Ficha del RF |
> | HU que lo derivan | [HU-013](1-historias-de-usuario.md#hu-013) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-08](#rn-08), [RN-11](#rn-11) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-013](3-casos-de-uso.md#cu-013) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-05](4-mockups.md#mk-05) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-05](4-mockups.md#mk-05) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 106**  
<a id="rf-24"></a>

*Ficha del requisito funcional RF-24*

| **Código**              | **RF-24**                                                                                                                |
|-------------------------|--------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Consultar disponibilidad del personal de soporte                                                                         |
| **Descripción**         | El sistema debe permitir al supervisor consultar la disponibilidad actual de una persona de soporte o de todo el equipo. |
| **HU de origen**        | HU-015                                                                                                                   |
| **RN que hace cumplir** | RN-28                                                                                                                    |
| **Prioridad**           | Media                                                                                                                    |

> **🔗 Trazabilidad de RF-24**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-015](1-historias-de-usuario.md#hu-015) | Ficha del RF |
> | HU que lo derivan | [HU-015](1-historias-de-usuario.md#hu-015) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-28](#rn-28) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-015](3-casos-de-uso.md#cu-015) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-11](4-mockups.md#mk-11) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-11](4-mockups.md#mk-11) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`info_personal_soporte`](../fase_3/13-script-sql-ddl.md#tabla-info-personal-soporte) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 107**  
<a id="rf-25"></a>

*Ficha del requisito funcional RF-25*

| **Código**              | **RF-25**                                                                                                        |
|-------------------------|------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Actualizar mi disponibilidad                                                                                     |
| **Descripción**         | El sistema debe permitir al personal de soporte cambiar su disponibilidad, guardando la fecha y hora del cambio. |
| **HU de origen**        | HU-034                                                                                                           |
| **RN que hace cumplir** | RN-28 y RN-23                                                                                                    |
| **Prioridad**           | Media                                                                                                            |

> **🔗 Trazabilidad de RF-25**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-034](1-historias-de-usuario.md#hu-034) | Ficha del RF |
> | HU que lo derivan | [HU-034](1-historias-de-usuario.md#hu-034) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-23](#rn-23), [RN-28](#rn-28) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-034](3-casos-de-uso.md#cu-034) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-11](4-mockups.md#mk-11) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-11](4-mockups.md#mk-11) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`info_personal_soporte`](../fase_3/13-script-sql-ddl.md#tabla-info-personal-soporte) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 108**  
<a id="rf-26"></a>

*Ficha del requisito funcional RF-26*

| **Código**              | **RF-26**                                                                                                                                   |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Registrar usuario                                                                                                                           |
| **Descripción**         | El sistema debe registrar un usuario con nombre, correo, cargo, área, rol y perfil de acceso, dejándolo activo con su contraseña protegida. |
| **HU de origen**        | HU-016                                                                                                                                      |
| **RN que hace cumplir** | RN-17, RN-18 y RN-19                                                                                                                        |
| **Prioridad**           | Alta                                                                                                                                        |

> **🔗 Trazabilidad de RF-26**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-016](1-historias-de-usuario.md#hu-016) | Ficha del RF |
> | HU que lo derivan | [HU-016](1-historias-de-usuario.md#hu-016) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-17](#rn-17), [RN-18](#rn-18), [RN-19](#rn-19) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-016](3-casos-de-uso.md#cu-016) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-14](4-mockups.md#mk-14) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-13](4-mockups.md#mk-13), [MK-14](4-mockups.md#mk-14) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 109**  
<a id="rf-27"></a>

*Ficha del requisito funcional RF-27*

| **Código**              | **RF-27**                                                                                               |
|-------------------------|---------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Consultar usuarios                                                                                      |
| **Descripción**         | El sistema debe listar los usuarios con su cargo, área y rol, y permitir buscarlos por nombre o correo. |
| **HU de origen**        | HU-017                                                                                                  |
| **RN que hace cumplir** | RN-23                                                                                                   |
| **Prioridad**           | Media                                                                                                   |

> **🔗 Trazabilidad de RF-27**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-017](1-historias-de-usuario.md#hu-017) | Ficha del RF |
> | HU que lo derivan | [HU-017](1-historias-de-usuario.md#hu-017) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-23](#rn-23) | Ficha del RF |
> | CA que lo citan | [HU-017 CA-1](1-historias-de-usuario.md#hu-017-ca-1) | Anotaciones de los criterios de aceptación |
> | Casos de uso que lo implementan | [CU-017](3-casos-de-uso.md#cu-017) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-13](4-mockups.md#mk-13) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-13](4-mockups.md#mk-13) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 110**  
<a id="rf-28"></a>

*Ficha del requisito funcional RF-28*

| **Código**              | **RF-28**                                                                                                  |
|-------------------------|------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Actualizar usuario                                                                                         |
| **Descripción**         | El sistema debe actualizar los datos de un usuario existente, registrando la fecha y quién hizo el cambio. |
| **HU de origen**        | HU-031                                                                                                     |
| **RN que hace cumplir** | RN-17 y RN-18                                                                                              |
| **Prioridad**           | Media                                                                                                      |

> **🔗 Trazabilidad de RF-28**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-031](1-historias-de-usuario.md#hu-031) | Ficha del RF |
> | HU que lo derivan | [HU-031](1-historias-de-usuario.md#hu-031) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-17](#rn-17), [RN-18](#rn-18) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-031](3-casos-de-uso.md#cu-031) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-13](4-mockups.md#mk-13), [MK-14](4-mockups.md#mk-14) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-13](4-mockups.md#mk-13), [MK-14](4-mockups.md#mk-14) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 111**  
<a id="rf-29"></a>

*Ficha del requisito funcional RF-29*

| **Código**              | **RF-29**                                                                                 |
|-------------------------|-------------------------------------------------------------------------------------------|
| **Nombre corto**        | Inactivar y reactivar usuario                                                             |
| **Descripción**         | El sistema debe inactivar a un usuario conservando sus registros, y permitir reactivarlo. |
| **HU de origen**        | HU-032                                                                                    |
| **RN que hace cumplir** | RN-21                                                                                     |
| **Prioridad**           | Media                                                                                     |

> **🔗 Trazabilidad de RF-29**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-032](1-historias-de-usuario.md#hu-032) | Ficha del RF |
> | HU que lo derivan | [HU-032](1-historias-de-usuario.md#hu-032) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-21](#rn-21) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-032](3-casos-de-uso.md#cu-032) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-13](4-mockups.md#mk-13) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-13](4-mockups.md#mk-13) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 112**  
<a id="rf-30"></a>

*Ficha del requisito funcional RF-30*

| **Código**              | **RF-30**                                                                                                                               |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Listar y desbloquear cuentas                                                                                                            |
| **Descripción**         | El sistema debe listar las cuentas bloqueadas y permitir al administrador desbloquearlas, reiniciando el contador de intentos fallidos. |
| **HU de origen**        | HU-033                                                                                                                                  |
| **RN que hace cumplir** | RN-20 y RN-23                                                                                                                           |
| **Prioridad**           | Media                                                                                                                                   |

> **🔗 Trazabilidad de RF-30**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-033](1-historias-de-usuario.md#hu-033) | Ficha del RF |
> | HU que lo derivan | [HU-033](1-historias-de-usuario.md#hu-033) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-20](#rn-20), [RN-23](#rn-23) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-033](3-casos-de-uso.md#cu-033) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-15](4-mockups.md#mk-15) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-15](4-mockups.md#mk-15) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 113**  
<a id="rf-31"></a>

*Ficha del requisito funcional RF-31*

| **Código**              | **RF-31**                                                                                |
|-------------------------|------------------------------------------------------------------------------------------|
| **Nombre corto**        | Seleccionar tipo de problema                                                             |
| **Descripción**         | El sistema debe ofrecer solo los tipos de problema activos y asociar el elegido al caso. |
| **HU de origen**        | HU-018                                                                                   |
| **RN que hace cumplir** | RN-03 y RN-04                                                                            |
| **Prioridad**           | Alta                                                                                     |

> **🔗 Trazabilidad de RF-31**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-018](1-historias-de-usuario.md#hu-018) | Ficha del RF |
> | HU que lo derivan | [HU-018](1-historias-de-usuario.md#hu-018) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-03](#rn-03), [RN-04](#rn-04) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-018](3-casos-de-uso.md#cu-018) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-02](4-mockups.md#mk-02) | Cobertura §4.4 |
> | Tablas de la base de datos | [`tipo_problema`](../fase_3/13-script-sql-ddl.md#tabla-tipo-problema) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 114**  
<a id="rf-32"></a>

*Ficha del requisito funcional RF-32*

| **Código**              | **RF-32**                                                                                 |
|-------------------------|-------------------------------------------------------------------------------------------|
| **Nombre corto**        | Seleccionar tipo de solicitud                                                             |
| **Descripción**         | El sistema debe ofrecer solo los tipos de solicitud activos y asociar el elegido al caso. |
| **HU de origen**        | HU-019                                                                                    |
| **RN que hace cumplir** | RN-03 y RN-04                                                                             |
| **Prioridad**           | Alta                                                                                      |

> **🔗 Trazabilidad de RF-32**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-019](1-historias-de-usuario.md#hu-019) | Ficha del RF |
> | HU que lo derivan | [HU-019](1-historias-de-usuario.md#hu-019) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-03](#rn-03), [RN-04](#rn-04) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-019](3-casos-de-uso.md#cu-019) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-02](4-mockups.md#mk-02) | Cobertura §4.4 |
> | Tablas de la base de datos | [`tipo_solicitud`](../fase_3/13-script-sql-ddl.md#tabla-tipo-solicitud) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 115**  
<a id="rf-33"></a>

*Ficha del requisito funcional RF-33*

| **Código**              | **RF-33**                                                                                                              |
|-------------------------|------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Indicar clase de solicitud                                                                                             |
| **Descripción**         | El sistema debe pedir la clase de solicitud (nuevo, cambio o consulta) solo en solicitudes, y exigirla para continuar. |
| **HU de origen**        | HU-020                                                                                                                 |
| **RN que hace cumplir** | RN-03                                                                                                                  |
| **Prioridad**           | Media                                                                                                                  |

> **🔗 Trazabilidad de RF-33**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-020](1-historias-de-usuario.md#hu-020) | Ficha del RF |
> | HU que lo derivan | [HU-020](1-historias-de-usuario.md#hu-020) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-03](#rn-03) | Ficha del RF |
> | CA que lo citan | [HU-020 CA-1](1-historias-de-usuario.md#hu-020-ca-1) | Anotaciones de los criterios de aceptación |
> | Casos de uso que lo implementan | [CU-020](3-casos-de-uso.md#cu-020) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-02](4-mockups.md#mk-02) | Cobertura §4.4 |


**Tabla 116**  
<a id="rf-34"></a>

*Ficha del requisito funcional RF-34*

| **Código**              | **RF-34**                                                                                                                                                    |
|-------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Iniciar sesión                                                                                                                                               |
| **Descripción**         | El sistema debe validar las credenciales, conceder acceso a las funciones del perfil y contar los intentos fallidos, bloqueando la cuenta según la política. |
| **HU de origen**        | HU-023 y HU-032                                                                                                                                              |
| **RN que hace cumplir** | RN-20, RN-21 y RN-23                                                                                                                                         |
| **Prioridad**           | Alta                                                                                                                                                         |

> **🔗 Trazabilidad de RF-34**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-023](1-historias-de-usuario.md#hu-023), [HU-032](1-historias-de-usuario.md#hu-032) | Ficha del RF |
> | HU que lo derivan | [HU-023](1-historias-de-usuario.md#hu-023), [HU-032](1-historias-de-usuario.md#hu-032) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-20](#rn-20), [RN-21](#rn-21), [RN-23](#rn-23) | Ficha del RF |
> | CA que lo citan | [HU-001 CA-5](1-historias-de-usuario.md#hu-001-ca-5) | Anotaciones de los criterios de aceptación |
> | Casos de uso que lo implementan | [CU-023](3-casos-de-uso.md#cu-023) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-01](4-mockups.md#mk-01) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-01](4-mockups.md#mk-01) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 117**  
<a id="rf-35"></a>

*Ficha del requisito funcional RF-35*

| **Código**              | **RF-35**                                                                                                        |
|-------------------------|------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Recuperar contraseña                                                                                             |
| **Descripción**         | El sistema debe enviar al correo registrado un enlace temporal de un solo uso para definir una nueva contraseña. |
| **HU de origen**        | HU-024                                                                                                           |
| **RN que hace cumplir** | RN-19 y RN-22                                                                                                    |
| **Prioridad**           | Alta                                                                                                             |

> **🔗 Trazabilidad de RF-35**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-024](1-historias-de-usuario.md#hu-024) | Ficha del RF |
> | HU que lo derivan | [HU-024](1-historias-de-usuario.md#hu-024) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-19](#rn-19), [RN-22](#rn-22) | Ficha del RF |
> | CA que lo citan | [HU-024 CA-1](1-historias-de-usuario.md#hu-024-ca-1) | Anotaciones de los criterios de aceptación |
> | Casos de uso que lo implementan | [CU-024](3-casos-de-uso.md#cu-024) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-01](4-mockups.md#mk-01) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-01](4-mockups.md#mk-01), [MK-19](4-mockups.md#mk-19) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario), [`token_recuperacion`](../fase_3/13-script-sql-ddl.md#tabla-token-recuperacion) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 118**  
<a id="rf-36"></a>

*Ficha del requisito funcional RF-36*

| **Código**              | **RF-36**                                                                                 |
|-------------------------|-------------------------------------------------------------------------------------------|
| **Nombre corto**        | Cerrar sesión                                                                             |
| **Descripción**         | El sistema debe cerrar la sesión del usuario y bloquear el acceso hasta un nuevo ingreso. |
| **HU de origen**        | HU-025                                                                                    |
| **RN que hace cumplir** | RN-23                                                                                     |
| **Prioridad**           | Baja                                                                                      |

> **🔗 Trazabilidad de RF-36**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-025](1-historias-de-usuario.md#hu-025) | Ficha del RF |
> | HU que lo derivan | [HU-025](1-historias-de-usuario.md#hu-025) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-23](#rn-23) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-025](3-casos-de-uso.md#cu-025) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-04](4-mockups.md#mk-04) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-04](4-mockups.md#mk-04) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`usuario`](../fase_3/13-script-sql-ddl.md#tabla-usuario) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 119**  
<a id="rf-37"></a>

*Ficha del requisito funcional RF-37*

| **Código**              | **RF-37**                                                                                                                          |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Cerrar automáticamente casos resueltos vencidos                                                                                    |
| **Descripción**         | El sistema debe cerrar los casos resueltos sin respuesta tras 5 días hábiles, registrarlo en el historial y avisar al solicitante. |
| **HU de origen**        | HU-028                                                                                                                             |
| **RN que hace cumplir** | RN-12, RN-08 y RN-15                                                                                                               |
| **Prioridad**           | Media                                                                                                                              |

> **🔗 Trazabilidad de RF-37**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-028](1-historias-de-usuario.md#hu-028) | Ficha del RF |
> | HU que lo derivan | [HU-028](1-historias-de-usuario.md#hu-028) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-08](#rn-08), [RN-12](#rn-12), [RN-15](#rn-15) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-028](3-casos-de-uso.md#cu-028) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-08](4-mockups.md#mk-08), [MK-09](4-mockups.md#mk-09) | Cobertura §4.4 |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte), [`aviso`](../fase_3/13-script-sql-ddl.md#tabla-aviso) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 120**  
<a id="rf-38"></a>

*Ficha del requisito funcional RF-38*

| **Código**              | **RF-38**                                                                                                            |
|-------------------------|----------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Definir reglas de tiempos de atención                                                                                |
| **Descripción**         | El sistema debe crear, editar y desactivar reglas de tiempos de respuesta y solución por importancia y tipo de caso. |
| **HU de origen**        | HU-029                                                                                                               |
| **RN que hace cumplir** | RN-13                                                                                                                |
| **Prioridad**           | Media                                                                                                                |

> **🔗 Trazabilidad de RF-38**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-029](1-historias-de-usuario.md#hu-029) | Ficha del RF |
> | HU que lo derivan | [HU-029](1-historias-de-usuario.md#hu-029) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-13](#rn-13) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-029](3-casos-de-uso.md#cu-029) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-12](4-mockups.md#mk-12) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-12](4-mockups.md#mk-12) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`tiempo_atencion_sla`](../fase_3/13-script-sql-ddl.md#tabla-tiempo-atencion-sla) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 121**  
<a id="rf-39"></a>

*Ficha del requisito funcional RF-39*

| **Código**              | **RF-39**                                                                                                                       |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Consultar reglas de tiempos de atención                                                                                         |
| **Descripción**         | El sistema debe listar las reglas de tiempos, distinguiendo las vigentes de las anteriores e indicando combinaciones sin regla. |
| **HU de origen**        | HU-040                                                                                                                          |
| **RN que hace cumplir** | RN-13                                                                                                                           |
| **Prioridad**           | Baja                                                                                                                            |

> **🔗 Trazabilidad de RF-39**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-040](1-historias-de-usuario.md#hu-040) | Ficha del RF |
> | HU que lo derivan | [HU-040](1-historias-de-usuario.md#hu-040) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-13](#rn-13) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-040](3-casos-de-uso.md#cu-040) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-12](4-mockups.md#mk-12) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-12](4-mockups.md#mk-12) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`tiempo_atencion_sla`](../fase_3/13-script-sql-ddl.md#tabla-tiempo-atencion-sla) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 122**  
<a id="rf-40"></a>

*Ficha del requisito funcional RF-40*

| **Código**              | **RF-40**                                                                                                   |
|-------------------------|-------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Descargar reportes de atención                                                                              |
| **Descripción**         | El sistema debe generar el reporte de atención de un periodo en PDF o Excel con la información del resumen. |
| **HU de origen**        | HU-030                                                                                                      |
| **RN que hace cumplir** | RN-29                                                                                                       |
| **Prioridad**           | Baja                                                                                                        |

> **🔗 Trazabilidad de RF-40**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-030](1-historias-de-usuario.md#hu-030) | Ficha del RF |
> | HU que lo derivan | [HU-030](1-historias-de-usuario.md#hu-030) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-29](#rn-29) | Ficha del RF |
> | CA que lo citan | [HU-030 CA-1](1-historias-de-usuario.md#hu-030-ca-1) | Anotaciones de los criterios de aceptación |
> | Casos de uso que lo implementan | [CU-030](3-casos-de-uso.md#cu-030) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-10](4-mockups.md#mk-10) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-10](4-mockups.md#mk-10) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 123**  
<a id="rf-41"></a>

*Ficha del requisito funcional RF-41*

| **Código**              | **RF-41**                                                                                                                      |
|-------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Consultar el historial del caso                                                                                                |
| **Descripción**         | El sistema debe permitir al supervisor consultar el historial completo de cambios de un caso, del más antiguo al más reciente. |
| **HU de origen**        | HU-041                                                                                                                         |
| **RN que hace cumplir** | RN-08                                                                                                                          |
| **Prioridad**           | Media                                                                                                                          |

> **🔗 Trazabilidad de RF-41**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-041](1-historias-de-usuario.md#hu-041) | Ficha del RF |
> | HU que lo derivan | [HU-041](1-historias-de-usuario.md#hu-041) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-08](#rn-08) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-041](3-casos-de-uso.md#cu-041) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-08](4-mockups.md#mk-08) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-08](4-mockups.md#mk-08) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`historial_caso`](../fase_3/13-script-sql-ddl.md#tabla-historial-caso) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 124**  
<a id="rf-42"></a>

*Ficha del requisito funcional RF-42*

| **Código**              | **RF-42**                                                                                                   |
|-------------------------|-------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Adjuntar archivos al caso                                                                                   |
| **Descripción**         | El sistema debe guardar los archivos adjuntos permitidos asociados al caso, con quién los cargó y la fecha. |
| **HU de origen**        | HU-042                                                                                                      |
| **RN que hace cumplir** | RN-27 y RN-08                                                                                               |
| **Prioridad**           | Media                                                                                                       |

> **🔗 Trazabilidad de RF-42**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-042](1-historias-de-usuario.md#hu-042) | Ficha del RF |
> | HU que lo derivan | [HU-042](1-historias-de-usuario.md#hu-042) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-08](#rn-08), [RN-27](#rn-27) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-042](3-casos-de-uso.md#cu-042) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-02](4-mockups.md#mk-02), [MK-05](4-mockups.md#mk-05), [MK-06](4-mockups.md#mk-06) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-02](4-mockups.md#mk-02), [MK-05](4-mockups.md#mk-05) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`adjunto_caso`](../fase_3/13-script-sql-ddl.md#tabla-adjunto-caso) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 125**  
<a id="rf-43"></a>

*Ficha del requisito funcional RF-43*

| **Código**              | **RF-43**                                                                                        |
|-------------------------|--------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Consultar y eliminar adjuntos                                                                    |
| **Descripción**         | El sistema debe listar los adjuntos de un caso, permitir abrirlos y eliminarlos de forma lógica. |
| **HU de origen**        | HU-042                                                                                           |
| **RN que hace cumplir** | RN-27 y RN-08                                                                                    |
| **Prioridad**           | Media                                                                                            |

> **🔗 Trazabilidad de RF-43**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-042](1-historias-de-usuario.md#hu-042) | Ficha del RF |
> | HU que lo derivan | [HU-042](1-historias-de-usuario.md#hu-042) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-08](#rn-08), [RN-27](#rn-27) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-042](3-casos-de-uso.md#cu-042) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-02](4-mockups.md#mk-02), [MK-05](4-mockups.md#mk-05), [MK-06](4-mockups.md#mk-06) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-05](4-mockups.md#mk-05) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`adjunto_caso`](../fase_3/13-script-sql-ddl.md#tabla-adjunto-caso) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 126**  
<a id="rf-44"></a>

*Ficha del requisito funcional RF-44*

| **Código**              | **RF-44**                                                                                                                       |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Registrar activo tecnológico                                                                                                    |
| **Descripción**         | El sistema debe registrar un activo con nombre, tipo, marca, modelo, serie y área, dejándolo disponible para asociarse a casos. |
| **HU de origen**        | HU-035                                                                                                                          |
| **RN que hace cumplir** | RN-24                                                                                                                           |
| **Prioridad**           | Media                                                                                                                           |

> **🔗 Trazabilidad de RF-44**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-035](1-historias-de-usuario.md#hu-035) | Ficha del RF |
> | HU que lo derivan | [HU-035](1-historias-de-usuario.md#hu-035) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-24](#rn-24) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-035](3-casos-de-uso.md#cu-035) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-17](4-mockups.md#mk-17) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-16](4-mockups.md#mk-16), [MK-17](4-mockups.md#mk-17) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`activo`](../fase_3/13-script-sql-ddl.md#tabla-activo) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 127**  
<a id="rf-45"></a>

*Ficha del requisito funcional RF-45*

| **Código**              | **RF-45**                                                                                                   |
|-------------------------|-------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Consultar activos tecnológicos                                                                              |
| **Descripción**         | El sistema debe listar los activos con su estado y ubicación y permitir buscarlos por nombre, serie o área. |
| **HU de origen**        | HU-036                                                                                                      |
| **RN que hace cumplir** | RN-23                                                                                                       |
| **Prioridad**           | Baja                                                                                                        |

> **🔗 Trazabilidad de RF-45**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-036](1-historias-de-usuario.md#hu-036) | Ficha del RF |
> | HU que lo derivan | [HU-036](1-historias-de-usuario.md#hu-036) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-23](#rn-23) | Ficha del RF |
> | CA que lo citan | [HU-036 CA-1](1-historias-de-usuario.md#hu-036-ca-1) | Anotaciones de los criterios de aceptación |
> | Casos de uso que lo implementan | [CU-036](3-casos-de-uso.md#cu-036) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-16](4-mockups.md#mk-16) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-16](4-mockups.md#mk-16) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`activo`](../fase_3/13-script-sql-ddl.md#tabla-activo) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 128**  
<a id="rf-46"></a>

*Ficha del requisito funcional RF-46*

| **Código**              | **RF-46**                                                                          |
|-------------------------|------------------------------------------------------------------------------------|
| **Nombre corto**        | Actualizar activo tecnológico                                                      |
| **Descripción**         | El sistema debe actualizar los datos de un activo, incluida su ubicación y estado. |
| **HU de origen**        | HU-037                                                                             |
| **RN que hace cumplir** | RN-24                                                                              |
| **Prioridad**           | Baja                                                                               |

> **🔗 Trazabilidad de RF-46**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-037](1-historias-de-usuario.md#hu-037) | Ficha del RF |
> | HU que lo derivan | [HU-037](1-historias-de-usuario.md#hu-037) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-24](#rn-24) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-037](3-casos-de-uso.md#cu-037) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-16](4-mockups.md#mk-16), [MK-17](4-mockups.md#mk-17) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-16](4-mockups.md#mk-16), [MK-17](4-mockups.md#mk-17) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`activo`](../fase_3/13-script-sql-ddl.md#tabla-activo) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 129**  
<a id="rf-47"></a>

*Ficha del requisito funcional RF-47*

| **Código**              | **RF-47**                                                                                                             |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Dar de baja un activo tecnológico                                                                                     |
| **Descripción**         | El sistema debe marcar un activo como dado de baja, sin ofrecerlo en casos nuevos y conservando los casos anteriores. |
| **HU de origen**        | HU-038                                                                                                                |
| **RN que hace cumplir** | RN-25                                                                                                                 |
| **Prioridad**           | Baja                                                                                                                  |

> **🔗 Trazabilidad de RF-47**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-038](1-historias-de-usuario.md#hu-038) | Ficha del RF |
> | HU que lo derivan | [HU-038](1-historias-de-usuario.md#hu-038) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-25](#rn-25) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-038](3-casos-de-uso.md#cu-038) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-16](4-mockups.md#mk-16) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-16](4-mockups.md#mk-16) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`activo`](../fase_3/13-script-sql-ddl.md#tabla-activo) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 130**  
<a id="rf-48"></a>

*Ficha del requisito funcional RF-48*

| **Código**              | **RF-48**                                                                                                                                                                                                                                                     |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Administrar catálogos de clasificación                                                                                                                                                                                                                        |
| **Descripción**         | El sistema debe permitir al administrador crear, editar e inactivar los valores de cada catálogo de clasificación (áreas, cargos, roles de empleado, tipos de activo, tipos de problema y tipos de solicitud), sin repetir nombres dentro del mismo catálogo. |
| **HU de origen**        | HU-043 a HU-048                                                                                                                                                                                                                                               |
| **RN que hace cumplir** | RN-26, RN-04 y RN-30                                                                                                                                                                                                                                          |
| **Prioridad**           | Media                                                                                                                                                                                                                                                         |

> **🔗 Trazabilidad de RF-48**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-043](1-historias-de-usuario.md#hu-043), [HU-048](1-historias-de-usuario.md#hu-048) | Ficha del RF |
> | HU que lo derivan | [HU-043](1-historias-de-usuario.md#hu-043), [HU-044](1-historias-de-usuario.md#hu-044), [HU-045](1-historias-de-usuario.md#hu-045), [HU-046](1-historias-de-usuario.md#hu-046), [HU-047](1-historias-de-usuario.md#hu-047), [HU-048](1-historias-de-usuario.md#hu-048) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-04](#rn-04), [RN-26](#rn-26), [RN-30](#rn-30) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-043](3-casos-de-uso.md#cu-043), [CU-044](3-casos-de-uso.md#cu-044), [CU-045](3-casos-de-uso.md#cu-045), [CU-046](3-casos-de-uso.md#cu-046), [CU-047](3-casos-de-uso.md#cu-047), [CU-048](3-casos-de-uso.md#cu-048) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-18](4-mockups.md#mk-18) | Cobertura §4.4 |
> | Mockups con botón asociado | [MK-18](4-mockups.md#mk-18) | Fichas de mockup («Botones ↔ Eventos») |
> | Tablas de la base de datos | [`tipo_problema`](../fase_3/13-script-sql-ddl.md#tabla-tipo-problema), [`tipo_solicitud`](../fase_3/13-script-sql-ddl.md#tabla-tipo-solicitud), [`area`](../fase_3/13-script-sql-ddl.md#tabla-area), [`cargo`](../fase_3/13-script-sql-ddl.md#tabla-cargo), [`rol_empleado`](../fase_3/13-script-sql-ddl.md#tabla-rol-empleado), [`tipo_activo`](../fase_3/13-script-sql-ddl.md#tabla-tipo-activo) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 131**  
<a id="rf-49"></a>

*Ficha del requisito funcional RF-49*

| **Código**              | **RF-49**                                                                                                                                             |
|-------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Registrar automáticamente el historial del caso                                                                                                       |
| **Descripción**         | El sistema debe guardar de forma automática en el historial cada cambio relevante de un caso, con acción, valor anterior, valor nuevo, autor y fecha. |
| **HU de origen**        | HU-007, HU-008, HU-026, HU-041 y HU-049                                                                                                               |
| **RN que hace cumplir** | RN-08                                                                                                                                                 |
| **Prioridad**           | Media                                                                                                                                                 |

> **🔗 Trazabilidad de RF-49**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-007](1-historias-de-usuario.md#hu-007), [HU-008](1-historias-de-usuario.md#hu-008), [HU-026](1-historias-de-usuario.md#hu-026), [HU-041](1-historias-de-usuario.md#hu-041), [HU-049](1-historias-de-usuario.md#hu-049) | Ficha del RF |
> | HU que lo derivan | [HU-007](1-historias-de-usuario.md#hu-007), [HU-008](1-historias-de-usuario.md#hu-008), [HU-026](1-historias-de-usuario.md#hu-026), [HU-041](1-historias-de-usuario.md#hu-041), [HU-049](1-historias-de-usuario.md#hu-049) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-08](#rn-08) | Ficha del RF |
> | CA que lo citan | [HU-008 CA-1](1-historias-de-usuario.md#hu-008-ca-1) | Anotaciones de los criterios de aceptación |
> | Casos de uso que lo implementan | [CU-049](3-casos-de-uso.md#cu-049), [CU-S02](3-casos-de-uso.md#cu-s02) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-06](4-mockups.md#mk-06), [MK-08](4-mockups.md#mk-08) | Cobertura §4.4 |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte), [`historial_caso`](../fase_3/13-script-sql-ddl.md#tabla-historial-caso), [`transicion_estado_caso`](../fase_3/13-script-sql-ddl.md#tabla-transicion-estado-caso) | Matriz §14 → tabla (Tabla 246) → DDL |


**Tabla 132**  
<a id="rf-50"></a>

*Ficha del requisito funcional RF-50*

| **Código**              | **RF-50**                                                                                                          |
|-------------------------|--------------------------------------------------------------------------------------------------------------------|
| **Nombre corto**        | Registrar la primera respuesta del caso                                                                            |
| **Descripción**         | El sistema debe registrar la fecha y hora de la primera respuesta del personal de soporte a un caso, una sola vez. |
| **HU de origen**        | HU-007                                                                                                             |
| **RN que hace cumplir** | RN-14                                                                                                              |
| **Prioridad**           | Media                                                                                                              |

> **🔗 Trazabilidad de RF-50**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | HU de origen | [HU-007](1-historias-de-usuario.md#hu-007) | Ficha del RF |
> | HU que lo derivan | [HU-007](1-historias-de-usuario.md#hu-007) | Fichas de HU («RF derivados») |
> | RN que hace cumplir | [RN-14](#rn-14) | Ficha del RF |
> | Casos de uso que lo implementan | [CU-007](3-casos-de-uso.md#cu-007) | Cobertura §4.4 |
> | Mockups donde aterriza | [MK-06](4-mockups.md#mk-06) | Cobertura §4.4 |
> | Tablas de la base de datos | [`caso_soporte`](../fase_3/13-script-sql-ddl.md#tabla-caso-soporte), [`historial_caso`](../fase_3/13-script-sql-ddl.md#tabla-historial-caso), [`transicion_estado_caso`](../fase_3/13-script-sql-ddl.md#tabla-transicion-estado-caso) | Matriz §14 → tabla (Tabla 246) → DDL |


## 2.3 Requisitos No Funcionales

Un RNF sin medida es un deseo. Los diez RNF tienen número verificable y origen en la entrevista (rendimiento, disponibilidad, usabilidad, comunicación, tiempos de respuesta, seguimiento, centralización y seguridad). Los valores numéricos son propuestas de partida que se validan con Nexa Servicios.

**Tabla 133**  
<a id="rnf-01"></a>

*Requisito no funcional RNF-01*

| **Código**               | **RNF-01**                                                                                                   |
|--------------------------|--------------------------------------------------------------------------------------------------------------|
| **Categoría**            | Rendimiento                                                                                                  |
| **Enunciado con medida** | El listado y la búsqueda de casos deben responder en menos de 2 segundos con hasta 10.000 casos registrados. |
| **Origen**               | Entrevista: las respuestas se demoran más de lo esperado y el seguimiento es difícil (P4, P10).              |

> **🔗 Trazabilidad de RNF-01**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Categoría | Rendimiento | Ficha del RNF |
> | Origen (entrevista) | [P4](../fase_0/0.4.1-entrevista-resultados.md#p4), [P10](../fase_0/0.4.1-entrevista-resultados.md#p10) | Campo «Origen» |


**Tabla 134**  
<a id="rnf-02"></a>

*Requisito no funcional RNF-02*

| **Código**               | **RNF-02**                                                                                                                                                                              |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Categoría**            | Disponibilidad                                                                                                                                                                          |
| **Enunciado con medida** | El sistema debe estar disponible al menos el 99 % del tiempo cada mes (máximo 7 horas de indisponibilidad mensual), porque los tiempos de atención se miden en minutos calendario 24/7. |
| **Origen**               | Entrevista: se prefiere un sistema único donde registrar y consultar las solicitudes (P9).                                                                                              |

> **🔗 Trazabilidad de RNF-02**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Categoría | Disponibilidad | Ficha del RNF |
> | Origen (entrevista) | [P9](../fase_0/0.4.1-entrevista-resultados.md#p9) | Campo «Origen» |


**Tabla 135**  
<a id="rnf-03"></a>

*Requisito no funcional RNF-03*

| **Código**               | **RNF-03**                                                                                                                                                                      |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Categoría**            | Usabilidad                                                                                                                                                                      |
| **Enunciado con medida** | Un solicitante capacitado debe poder reportar un caso completo en máximo 3 minutos, y al menos el 90 % de los solicitantes de una prueba de usabilidad debe lograrlo sin ayuda. |
| **Origen**               | Entrevista: los usuarios no tienen claridad total sobre cómo solicitar ayuda (P2).                                                                                              |

> **🔗 Trazabilidad de RNF-03**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Categoría | Usabilidad | Ficha del RNF |
> | Origen (entrevista) | [P2](../fase_0/0.4.1-entrevista-resultados.md#p2) | Campo «Origen» |


**Tabla 136**  
<a id="rnf-04"></a>

*Requisito no funcional RNF-04*

| **Código**               | **RNF-04**                                                                                                                                           |
|--------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Categoría**            | Usabilidad                                                                                                                                           |
| **Enunciado con medida** | El 100 % de las preguntas que pueden generar duda debe mostrar un ejemplo, y todo mensaje de rechazo debe indicar el campo y la corrección esperada. |
| **Origen**               | Entrevista: falta de claridad (P2, P10).                                                                                                             |

> **🔗 Trazabilidad de RNF-04**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Categoría | Usabilidad | Ficha del RNF |
> | Origen (entrevista) | [P2](../fase_0/0.4.1-entrevista-resultados.md#p2), [P10](../fase_0/0.4.1-entrevista-resultados.md#p10) | Campo «Origen» |


**Tabla 137**  
<a id="rnf-05"></a>

*Requisito no funcional RNF-05*

| **Código**               | **RNF-05**                                                                                                                                                                |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Categoría**            | Comunicación                                                                                                                                                              |
| **Enunciado con medida** | Tras registrar un caso, el sistema debe mostrar la confirmación con el número de seguimiento en máximo 3 segundos y enviar el correo de confirmación en máximo 2 minutos. |
| **Origen**               | Entrevista: los usuarios no siempre reciben confirmación de su solicitud (P3).                                                                                            |

> **🔗 Trazabilidad de RNF-05**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Categoría | Comunicación | Ficha del RNF |
> | Origen (entrevista) | [P3](../fase_0/0.4.1-entrevista-resultados.md#p3) | Campo «Origen» |


**Tabla 138**  
<a id="rnf-06"></a>

*Requisito no funcional RNF-06*

| **Código**               | **RNF-06**                                                                                                                                                                                 |
|--------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Categoría**            | Comunicación                                                                                                                                                                               |
| **Enunciado con medida** | Cada cambio de situación debe notificarse en pantalla en máximo 1 minuto y por correo en máximo 5 minutos; un envío fallido debe reintentarse hasta 3 veces, con 5 minutos entre intentos. |
| **Origen**               | Entrevista: mala comunicación y dificultad para saber el estado del caso (P10).                                                                                                            |

> **🔗 Trazabilidad de RNF-06**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Categoría | Comunicación | Ficha del RNF |
> | Origen (entrevista) | [P10](../fase_0/0.4.1-entrevista-resultados.md#p10) | Campo «Origen» |
> | Base de datos | [`aviso`](../fase_3/13-script-sql-ddl.md#tabla-aviso) — reintento del envío hasta 3 veces con 5 minutos entre intentos (nota RN-15 del script, línea 567); no implementable en DDL, se valida en la capa de servicio | Notas del script DDL |


**Tabla 139**  
<a id="rnf-07"></a>

*Requisito no funcional RNF-07*

| **Código**               | **RNF-07**                                                                                                                                                                                                                                                                                                         |
|--------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Categoría**            | Tiempos de respuesta                                                                                                                                                                                                                                                                                               |
| **Enunciado con medida** | Las reglas de tiempos de atención deben medirse en minutos calendario y el sistema debe permitir verificar que al menos el 90 % de los casos recibe su primera respuesta dentro del tiempo definido; la regla inicial de importancia P1 no debe superar 60 minutos de respuesta y la de P4 no debe superar un día. |
| **Origen**               | Entrevista: se esperan respuestas rápidas, desde menos de una hora hasta el mismo día (P13).                                                                                                                                                                                                                       |

> **🔗 Trazabilidad de RNF-07**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Categoría | Tiempos de respuesta | Ficha del RNF |
> | Origen (entrevista) | [P13](../fase_0/0.4.1-entrevista-resultados.md#p13) | Campo «Origen» |


**Tabla 140**  
<a id="rnf-08"></a>

*Requisito no funcional RNF-08*

| **Código**               | **RNF-08**                                                                                                                                                                                   |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Categoría**            | Seguimiento                                                                                                                                                                                  |
| **Enunciado con medida** | Todo cambio de situación debe ser visible al solicitante en máximo 5 segundos tras guardarse, y el 100 % de los cambios relevantes de un caso debe quedar en el historial con autor y fecha. |
| **Origen**               | Entrevista: los usuarios no saben si su solicitud fue atendida (P3, P10).                                                                                                                    |

> **🔗 Trazabilidad de RNF-08**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Categoría | Seguimiento | Ficha del RNF |
> | Origen (entrevista) | [P3](../fase_0/0.4.1-entrevista-resultados.md#p3), [P10](../fase_0/0.4.1-entrevista-resultados.md#p10) | Campo «Origen» |


**Tabla 141**  
<a id="rnf-09"></a>

*Requisito no funcional RNF-09*

| **Código**               | **RNF-09**                                                                                                                                                                                                      |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Categoría**            | Centralización                                                                                                                                                                                                  |
| **Enunciado con medida** | Al menos el 90 % de los casos nuevos del primer trimestre posterior a la puesta en marcha debe registrarse por el formulario único del sistema, y el 100 % de los casos debe tener número de seguimiento único. |
| **Origen**               | Entrevista: WhatsApp y correo son los canales más usados y el uso de varios canales genera desorden; se prefiere un sistema único (P9).                                                                         |

> **🔗 Trazabilidad de RNF-09**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Categoría | Centralización | Ficha del RNF |
> | Origen (entrevista) | [P9](../fase_0/0.4.1-entrevista-resultados.md#p9) | Campo «Origen» |


**Tabla 142**  
<a id="rnf-10"></a>

*Requisito no funcional RNF-10*

| **Código**               | **RNF-10**                                                                                                                                                                                                    |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Categoría**            | Seguridad                                                                                                                                                                                                     |
| **Enunciado con medida** | El 100 % de las funciones debe estar restringido por perfil de acceso; las contraseñas y los códigos de recuperación deben guardarse protegidos y el enlace de recuperación debe vencer en máximo 30 minutos. |
| **Origen**               | Antecedentes de las HU (el usuario debe haber iniciado sesión) y conclusión de la entrevista: un sistema único requiere controlar el acceso.                                                                  |

> **🔗 Trazabilidad de RNF-10**
>
> | Relación | Elementos | Fuente en el documento |
> |---|---|---|
> | Categoría | Seguridad | Ficha del RNF |
> | Base de datos | [`token_recuperacion`](../fase_3/13-script-sql-ddl.md#tabla-token-recuperacion) — vencimiento del enlace de recuperación en máximo 30 minutos (nota RN-22 del script, línea 193); no implementable en DDL, se valida en la capa de servicio | Notas del script DDL |


***De dónde nace:** la conclusión de la entrevista —una Mesa de Ayuda TI centralizada que registre solicitudes, confirme recepción, permita hacer seguimiento y mejore los tiempos de atención— se traduce en medidas: confirmación (RNF-05), avisos (RNF-06), tiempos (RNF-07), seguimiento (RNF-08) y centralización (RNF-09).*
