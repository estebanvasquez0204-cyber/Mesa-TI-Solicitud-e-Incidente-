# 5. Matriz de Trazabilidad: una fila por historia

> **Guía de seguimiento:** Fase 1 — matriz de análisis HU → RF → RN → CU → MK (la matriz completa de la guía, actividad 12, está en la [Fase 2](../fase_2/12-matriz-de-trazabilidad.md)).
>
> **Fuente:** documento Word *Proyecto.docx* — «Mesa de Ayuda TI de Nexa Servicios» (F. J. Motta Quintero y E. Vásquez Valencia · Ingeniería de Software II · Docente: Lora Patiño Gloria Amparo · Octubre de 2026), sección 5.

Cadena HU → RF → RN → Caso de uso → Mockup. Cada celda existe de verdad en su artefacto; verificarlo es verificar todo el documento de una pasada. Esta matriz es la aprobada; solo cambian dos filas: HU-024 incluye ahora MK-19 (pantalla nueva de IN-19, que atiende CU-024) y HU-049 registra explícitamente RF-49 (IN-02, corregido también en la documentación de requisitos).

**Tabla 218**  
*Matriz de trazabilidad por historia de usuario*

| **HU**                                                          | **CA**      | **RF**                     | **RN**                            | **Caso de uso**                                | **Mockup**               |
|-----------------------------------------------------------------|-------------|----------------------------|-----------------------------------|------------------------------------------------|--------------------------|
| HU-001 Reportar un caso de soporte                              | CA-1 a CA-5 | RF-01, RF-02, RF-18        | RN-01, RN-02, RN-23, RN-25        | CU-001, CU-004, CU-021, CU-022, CU-S01, CU-S02 | MK-02, MK-06             |
| HU-002 Recibir confirmación del caso enviado                    | CA-1 a CA-6 | RF-03, RF-05               | RN-02, RN-15, RN-16, RN-17        | CU-002, CU-003                                 | MK-03, MK-09             |
| HU-003 Recibir avisos sobre el avance del caso                  | CA-1 a CA-4 | RF-04, RF-05, RF-06        | RN-15, RN-16                      | CU-003                                         | MK-09                    |
| HU-004 Identificar si el caso es un problema o una solicitud    | CA-1 a CA-4 | RF-02, RF-07               | RN-03                             | CU-001, CU-004                                 | MK-02                    |
| HU-005 Consultar casos anteriores                               | CA-1 a CA-4 | RF-09, RF-10               | RN-06                             | CU-005                                         | MK-04                    |
| HU-006 Revisar casos pendientes                                 | CA-1 a CA-5 | RF-11                      | RN-05, RN-23                      | CU-006                                         | MK-07                    |
| HU-007 Cambiar la situación actual del caso                     | CA-1 a CA-5 | RF-12, RF-13, RF-49, RF-50 | RN-06, RN-07, RN-08, RN-14, RN-23 | CU-007, CU-003, CU-010, CU-S02                 | MK-05, MK-06             |
| HU-008 Asignar una persona encargada del caso                   | CA-1 a CA-4 | RF-14, RF-49               | RN-08, RN-09                      | CU-008, CU-S02                                 | MK-06                    |
| HU-009 Agregar comentarios al caso                              | CA-1 a CA-4 | RF-16, RF-17               | RN-08, RN-10                      | CU-009                                         | MK-05, MK-06             |
| HU-010 Ver tiempo aproximado de atención                        | CA-1 a CA-4 | RF-13, RF-20               | RN-06, RN-13, RN-14               | CU-010, CU-S01                                 | MK-05                    |
| HU-011 Revisar resumen general de atención                      | CA-1 a CA-4 | RF-21                      | RN-14, RN-29                      | CU-011                                         | MK-10                    |
| HU-012 Revisar resumen por periodo                              | CA-1 a CA-2 | RF-22                      | RN-29                             | CU-012                                         | MK-10                    |
| HU-013 Reabrir un caso                                          | CA-1 a CA-5 | RF-23                      | RN-08, RN-11                      | CU-013                                         | MK-05                    |
| HU-015 Consultar información del personal de soporte            | CA-1 a CA-3 | RF-24                      | RN-28                             | CU-015                                         | MK-11                    |
| HU-016 Registrar usuarios del sistema                           | CA-1 a CA-4 | RF-26                      | RN-17, RN-18, RN-19               | CU-016                                         | MK-14                    |
| HU-017 Consultar usuarios registrados                           | CA-1 a CA-3 | RF-27                      | RN-23                             | CU-017                                         | MK-13                    |
| HU-018 Indicar tipo de problema                                 | CA-1 a CA-3 | RF-31                      | RN-03, RN-04                      | CU-018                                         | MK-02                    |
| HU-019 Indicar tipo de solicitud                                | CA-1 a CA-3 | RF-32                      | RN-03, RN-04                      | CU-019                                         | MK-02                    |
| HU-020 Indicar clase de solicitud                               | CA-1 a CA-3 | RF-33                      | RN-03                             | CU-020                                         | MK-02                    |
| HU-021 Indicar cuántas personas se ven afectadas                | CA-1 a CA-3 | RF-18, RF-19               | RN-01, RN-05                      | CU-021, CU-022                                 | MK-02                    |
| HU-022 Indicar qué tan rápido necesito atención                 | CA-1 a CA-3 | RF-18, RF-19               | RN-01, RN-05                      | CU-021, CU-022                                 | MK-02                    |
| HU-023 Iniciar sesión                                           | CA-1 a CA-4 | RF-34                      | RN-20, RN-21, RN-23               | CU-023                                         | MK-01                    |
| HU-024 Recuperar contraseña                                     | CA-1 a CA-4 | RF-35                      | RN-19, RN-22                      | CU-024                                         | MK-01, MK-19             |
| HU-025 Cerrar sesión                                            | CA-1 a CA-2 | RF-36                      | RN-23                             | CU-025                                         | MK-04                    |
| HU-026 Pasar un caso a otra persona de soporte                  | CA-1 a CA-3 | RF-15, RF-49               | RN-08, RN-09                      | CU-026, CU-S02                                 | MK-06                    |
| HU-028 Cerrar casos sin respuesta del usuario                   | CA-1 a CA-3 | RF-37                      | RN-08, RN-12, RN-15               | CU-028                                         | Interno (aviso en MK-09) |
| HU-029 Definir tiempos de atención                              | CA-1 a CA-4 | RF-38                      | RN-13                             | CU-029                                         | MK-12                    |
| HU-030 Descargar reportes de atención                           | CA-1 a CA-2 | RF-40                      | RN-29                             | CU-030                                         | MK-10                    |
| HU-031 Actualizar la información de un usuario registrado       | CA-1 a CA-3 | RF-28                      | RN-17, RN-18                      | CU-031                                         | MK-13, MK-14             |
| HU-032 Inactivar un usuario que ya no debe tener acceso         | CA-1 a CA-4 | RF-29                      | RN-21                             | CU-032                                         | MK-13                    |
| HU-033 Desbloquear una cuenta de usuario                        | CA-1 a CA-3 | RF-30                      | RN-20, RN-23                      | CU-033                                         | MK-15                    |
| HU-034 Actualizar mi disponibilidad para recibir casos          | CA-1 a CA-3 | RF-25                      | RN-28, RN-23                      | CU-034                                         | MK-11                    |
| HU-035 Registrar un activo tecnológico de la empresa            | CA-1 a CA-4 | RF-44                      | RN-24                             | CU-035                                         | MK-17                    |
| HU-036 Consultar los activos tecnológicos registrados           | CA-1 a CA-3 | RF-45                      | RN-23                             | CU-036                                         | MK-16                    |
| HU-037 Actualizar la información de un activo tecnológico       | CA-1 a CA-2 | RF-46                      | RN-24                             | CU-037                                         | MK-16, MK-17             |
| HU-038 Dar de baja un activo tecnológico                        | CA-1 a CA-3 | RF-47                      | RN-25                             | CU-038                                         | MK-16                    |
| HU-040 Consultar las reglas de tiempos de atención configuradas | CA-1 a CA-3 | RF-39                      | RN-13                             | CU-040                                         | MK-12                    |
| HU-041 Consultar el historial de cambios de un caso             | CA-1 a CA-3 | RF-41, RF-49               | RN-08                             | CU-041, CU-S02                                 | MK-08                    |
| HU-042 Adjuntar y consultar evidencias de un caso               | CA-1 a CA-5 | RF-42, RF-43               | RN-08, RN-27                      | CU-042                                         | MK-02, MK-05, MK-06      |
| HU-043 Administrar las áreas                                    | CA-1 a CA-4 | RF-48                      | RN-26, RN-30                      | CU-043                                         | MK-18                    |
| HU-044 Administrar los cargos                                   | CA-1 a CA-4 | RF-48                      | RN-26, RN-30                      | CU-044                                         | MK-18                    |
| HU-045 Administrar los roles de empleado                        | CA-1 a CA-4 | RF-48                      | RN-26, RN-30                      | CU-045                                         | MK-18                    |
| HU-046 Administrar los tipos de activo                          | CA-1 a CA-4 | RF-48                      | RN-26, RN-30                      | CU-046                                         | MK-18                    |
| HU-047 Administrar los tipos de problema                        | CA-1 a CA-4 | RF-48                      | RN-04, RN-26, RN-30               | CU-047                                         | MK-18                    |
| HU-048 Administrar los tipos de solicitud                       | CA-1 a CA-4 | RF-48                      | RN-04, RN-26, RN-30               | CU-048                                         | MK-18                    |
| HU-049 Corregir la clasificación de un caso                     | CA-1 a CA-3 | RF-08, RF-49               | RN-03, RN-08, RN-23               | CU-049, CU-S02                                 | MK-06                    |

***De dónde nace:** los CU de apoyo S01 y S02 y el CU-003 aparecen en las filas de las HU cuyos RF implementan. Las RN de cada fila se calculan a partir de los RF de esa HU; las HU cuya cadena no incluye RN se señalan con “—” y se listan en la validación final.*
