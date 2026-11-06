# 5. Matriz de trazabilidad (una fila por historia) y 6. Validación final

> **Guía de seguimiento:** Fase 1 — actividad *Matriz de trazabilidad de la Fase 1 (sección 5 del documento) y validación final (sección 6)*.
>
> **Fuente:** documento Word *Fase 1 — Historias de Usuario y Criterios de Aceptación, Reglas de Negocio, Requisitos Funcionales y No Funcionales, Casos de Uso, Mockups y Matriz de Trazabilidad* (F. J. Motta Quintero y E. Vásquez Valencia · Docente: Lora Patiño Gloria Amparo · Octubre de 2026).


Cadena **HU → RF → RN → Caso de uso → Mockup**. Cada celda existe de verdad en su artefacto; verificarlo es verificar todo el documento de una pasada.

> Esta es la matriz de **análisis**. La matriz completa de la guía (actividad 12 de la Fase 2: HU → RF → entidad → clase.método → CU → mensaje de secuencia → pantalla) se documenta en la [Fase 2](../fase_2/README.md).


| HU | CA | RF | RN | Caso de uso | Mockup |
|---|---|---|---|---|---|
| [HU-001](1-historias-de-usuario.md#hu-001) Reportar un caso de soporte | CA-1 a CA-4 | RF-01, RF-02, RF-18 | RN-01, RN-02, RN-25 | CU-001, CU-004, CU-021, CU-022 | MK-02, MK-06 |
| [HU-002](1-historias-de-usuario.md#hu-002) Recibir confirmación del caso enviado | CA-1 a CA-4 | RF-03, RF-05 | RN-02, RN-15, RN-16 | CU-002, CU-003 | MK-03, MK-09 |
| [HU-003](1-historias-de-usuario.md#hu-003) Recibir avisos sobre el avance del caso | CA-1 a CA-4 | RF-04, RF-05, RF-06 | RN-15, RN-16 | CU-003 | MK-09 |
| [HU-004](1-historias-de-usuario.md#hu-004) Identificar si el caso es un problema o una solicitud | CA-1 a CA-5 | RF-02, RF-07, RF-08 | RN-03, RN-08 | CU-001, CU-004 | MK-02, MK-06 |
| [HU-005](1-historias-de-usuario.md#hu-005) Consultar casos anteriores | CA-1 a CA-4 | RF-09, RF-10 | RN-06 | CU-005 | MK-04 |
| [HU-006](1-historias-de-usuario.md#hu-006) Revisar casos pendientes | CA-1 a CA-4 | RF-11 | RN-05 | CU-006 | MK-07 |
| [HU-007](1-historias-de-usuario.md#hu-007) Cambiar la situación actual del caso | CA-1 a CA-4 | RF-12, RF-13, RF-49 | RN-06, RN-07, RN-08, RN-23 | CU-007, CU-010, CU-S02 | MK-05, MK-06 |
| [HU-008](1-historias-de-usuario.md#hu-008) Asignar una persona encargada del caso | CA-1 a CA-4 | RF-14, RF-49 | RN-08, RN-09 | CU-008, CU-S02 | MK-06 |
| [HU-009](1-historias-de-usuario.md#hu-009) Agregar comentarios al caso | CA-1 a CA-4 | RF-16, RF-17 | RN-08, RN-10 | CU-009 | MK-05, MK-06 |
| [HU-010](1-historias-de-usuario.md#hu-010) Ver tiempo aproximado de atención | CA-1 a CA-3 | RF-13, RF-20 | RN-06, RN-13, RN-14 | CU-010, CU-S01 | MK-05 |
| [HU-011](1-historias-de-usuario.md#hu-011) Revisar resumen general de atención | CA-1 a CA-4 | RF-21 | RN-14, RN-29 | CU-011 | MK-10 |
| [HU-012](1-historias-de-usuario.md#hu-012) Revisar resumen por periodo | CA-1 a CA-2 | RF-22 | RN-29 | CU-012 | MK-10 |
| [HU-013](1-historias-de-usuario.md#hu-013) Reabrir un caso | CA-1 a CA-5 | RF-23 | RN-08, RN-11 | CU-013 | MK-05 |
| [HU-015](1-historias-de-usuario.md#hu-015) Consultar información del personal de soporte | CA-1 a CA-3 | RF-24 | RN-28 | CU-015 | MK-11 |
| [HU-016](1-historias-de-usuario.md#hu-016) Registrar usuarios del sistema | CA-1 a CA-4 | RF-26 | RN-17, RN-18, RN-19 | CU-016 | MK-14 |
| [HU-017](1-historias-de-usuario.md#hu-017) Consultar usuarios registrados | CA-1 a CA-3 | RF-27 | RN-23 | CU-017 | MK-13 |
| [HU-018](1-historias-de-usuario.md#hu-018) Indicar tipo de problema | CA-1 a CA-3 | RF-31 | RN-03, RN-04 | CU-018 | MK-02 |
| [HU-019](1-historias-de-usuario.md#hu-019) Indicar tipo de solicitud | CA-1 a CA-3 | RF-32 | RN-03, RN-04 | CU-019 | MK-02 |
| [HU-020](1-historias-de-usuario.md#hu-020) Indicar clase de solicitud | CA-1 a CA-3 | RF-33 | RN-03 | CU-020 | MK-02 |
| [HU-021](1-historias-de-usuario.md#hu-021) Indicar cuántas personas se ven afectadas | CA-1 a CA-3 | RF-18, RF-19 | RN-01, RN-05 | CU-021, CU-022 | MK-02 |
| [HU-022](1-historias-de-usuario.md#hu-022) Indicar qué tan rápido necesito atención | CA-1 a CA-3 | RF-18, RF-19 | RN-01, RN-05 | CU-021, CU-022 | MK-02 |
| [HU-023](1-historias-de-usuario.md#hu-023) Iniciar sesión | CA-1 a CA-4 | RF-34 | RN-20, RN-21, RN-23 | CU-023 | MK-01 |
| [HU-024](1-historias-de-usuario.md#hu-024) Recuperar contraseña | CA-1 a CA-4 | RF-35 | RN-19, RN-22 | CU-024 | MK-01 |
| [HU-025](1-historias-de-usuario.md#hu-025) Cerrar sesión | CA-1 a CA-2 | RF-36 | RN-23 | CU-025 | MK-04 |
| [HU-026](1-historias-de-usuario.md#hu-026) Pasar un caso a otra persona de soporte | CA-1 a CA-3 | RF-15, RF-49 | RN-08, RN-09 | CU-026, CU-S02 | MK-06 |
| [HU-028](1-historias-de-usuario.md#hu-028) Cerrar casos sin respuesta del usuario | CA-1 a CA-3 | RF-37 | RN-08, RN-12, RN-15 | CU-028 | Interno (aviso en MK-09) |
| [HU-029](1-historias-de-usuario.md#hu-029) Definir tiempos de atención | CA-1 a CA-4 | RF-38 | RN-13 | CU-029 | MK-12 |
| [HU-030](1-historias-de-usuario.md#hu-030) Descargar reportes de atención | CA-1 a CA-2 | RF-40 | RN-29 | CU-030 | MK-10 |
| [HU-031](1-historias-de-usuario.md#hu-031) Actualizar la información de un usuario registrado | CA-1 a CA-3 | RF-28 | RN-17, RN-18 | CU-031 | MK-13, MK-14 |
| [HU-032](1-historias-de-usuario.md#hu-032) Inactivar un usuario que ya no debe tener acceso | CA-1 a CA-4 | RF-29 | RN-21 | CU-032 | MK-13 |
| [HU-033](1-historias-de-usuario.md#hu-033) Desbloquear una cuenta de usuario | CA-1 a CA-2 | RF-30 | RN-20 | CU-033 | MK-15 |
| [HU-034](1-historias-de-usuario.md#hu-034) Actualizar mi disponibilidad para recibir casos | CA-1 a CA-2 | RF-25 | RN-28 | CU-034 | MK-11 |
| [HU-035](1-historias-de-usuario.md#hu-035) Registrar un activo tecnológico de la empresa | CA-1 a CA-4 | RF-44 | RN-24 | CU-035 | MK-17 |
| [HU-036](1-historias-de-usuario.md#hu-036) Consultar los activos tecnológicos registrados | CA-1 a CA-3 | RF-45 | RN-23 | CU-036 | MK-16 |
| [HU-037](1-historias-de-usuario.md#hu-037) Actualizar la información de un activo tecnológico | CA-1 a CA-2 | RF-46 | RN-24 | CU-037 | MK-16, MK-17 |
| [HU-038](1-historias-de-usuario.md#hu-038) Dar de baja un activo tecnológico | CA-1 a CA-3 | RF-47 | RN-25 | CU-038 | MK-16 |
| [HU-039](1-historias-de-usuario.md#hu-039) Administrar los catálogos de clasificación del sistema | CA-1 a CA-4 | RF-48 | RN-04, RN-26 | CU-039 | MK-18 |
| [HU-040](1-historias-de-usuario.md#hu-040) Consultar las reglas de tiempos de atención configuradas | CA-1 a CA-3 | RF-39 | RN-13 | CU-040 | MK-12 |
| [HU-041](1-historias-de-usuario.md#hu-041) Consultar el historial de cambios de un caso | CA-1 a CA-3 | RF-41, RF-49 | RN-08 | CU-041, CU-S02 | MK-08 |
| [HU-042](1-historias-de-usuario.md#hu-042) Adjuntar y consultar evidencias de un caso | CA-1 a CA-5 | RF-42, RF-43 | RN-08, RN-27 | CU-042 | MK-02, MK-05, MK-06 |

*De dónde nace:* los CU de apoyo S01 y S02 y el CU-003 aparecen en las filas de las HU cuyos RF implementan. Las RN de cada fila se calculan a partir de los RF de esa HU; las HU cuya cadena no incluye RN se señalan con «—» y se listan en la validación final.

# 6. Validación final de consistencia y trazabilidad

Las verificaciones se recalcularon por programa al generar estos archivos Markdown, sobre los mismos datos del documento Word; los resultados coinciden con los del documento.

| Verificación | Resultado |
|---|---|
| Historias de usuario con al menos 1 RF | 40 de 40 (huérfanas: ninguna) |
| RF con HU de origen existente | 49 de 49 |
| RN vigiladas por al menos 1 RF | 29 de 29 |
| RF con al menos una RN que vigila | 47 de 49; sin RN (excepción justificada): RF-02, RF-06 |
| RF implementados por al menos 1 caso de uso | 49 de 49 |
| Casos de uso con RF existentes | 42 de 42 (40 CU de HU + CU-S01 y CU-S02 de apoyo) |
| Casos de uso con pantalla o declarados internos | 39 con mockup; 3 internos declarados (CU-028, CU-S01, CU-S02) |
| Mockups con al menos 1 caso de uso padre | 18 de 18 |
| Referencias cruzadas (RN, CU, MK) en el texto de los CU | Todas existen (verificado por programa) |
| Historias con cadena completa HU → RF → CU en la matriz | 40 de 40 |
| Historias sin RN en su cadena | ninguna |

## Observaciones y supuestos

- Las HU-014 y HU-027 no existen en el documento de HU; se trabajó con las 40 historias presentes y no se inventaron las faltantes.
- Los criterios de aceptación y el diccionario citan reglas con numeración interna (RN-001, RN04, RN06, etc.). Este documento usa su propia numeración RN-01 a RN-29 con formato de la guía; cada RN cita la HU y el CA de donde nace.
- Los valores de los RNF (99 % de disponibilidad, 2 y 3 segundos, 3 minutos, 5 minutos, 3 reintentos, 60 minutos, 30 minutos) son propuestas de partida que se validan con la empresa; la entrevista solo fija que se esperan respuestas rápidas (menos de una hora hasta el mismo día).
- El número de intentos fallidos que bloquea la cuenta no está definido en los criterios (HU-023 CA-3 lo remite a la política de seguridad de la empresa); por eso RN-20 no fija una cifra.
- Los mockups ilustran los casos de éxito y los mensajes de rechazo de las RN; el cierre automático (CU-028) y los casos de apoyo CU-S01 y CU-S02 no tienen pantalla propia.
- La numeración de preguntas de la entrevista (P2, P3, P4, P6, P8 a P13) se tomó de los orígenes citados en las HU; los demás insumos de la entrevista se citan por su contenido.
