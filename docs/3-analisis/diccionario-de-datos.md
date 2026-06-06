# Diccionario de Datos

---

## Entidad: Usuario

| Entidad | Atributo | Tipo | Descripción | Restricciones | Ejemplo |
|---------|----------|------|-------------|---------------|---------|
| Usuario | id_usuario | INT | Identificador del usuario | Autoincremental y único | 1 |
| Usuario | nombre | VARCHAR(120) | Nombre de la persona | Obligatorio | Juan Pérez |
| Usuario | correo | VARCHAR(150) | Correo del usuario | Formato válido y no repetido | juan@email.com |
| Usuario | cargo | VARCHAR(100) | Cargo dentro de la empresa | Opcional | Analista |
| Usuario | area | VARCHAR(100) | Área del usuario | Opcional | Sistemas |
| Usuario | tipo_usuario | ENUM | Tipo de usuario | solicitante, soporte, supervisor, administrador | soporte |
| Usuario | estado_usuario | ENUM | Estado del usuario | activo, inactivo | activo |
| Usuario | fecha_registro | DATE | Fecha de registro | No puede ser futura | 2026-05-20 |

---

## Entidad: Caso de soporte

| Entidad | Atributo | Tipo | Descripción | Restricciones | Ejemplo |
|---------|----------|------|-------------|---------------|---------|
| Caso de soporte | id_caso | INT | Identificador del caso | Autoincremental y único | 101 |
| Caso de soporte | numero_seguimiento | VARCHAR(30) | Número para identificar el caso | Debe ser único | CASO-001 |
| Caso de soporte | titulo | VARCHAR(150) | Resumen del caso | Obligatorio | Error en internet |
| Caso de soporte | descripcion | TEXT | Detalle del problema | Obligatorio | No hay conexión |
| Caso de soporte | lugar | VARCHAR(120) | Lugar donde ocurre | Obligatorio | Oficina 2 |
| Caso de soporte | estado_caso | ENUM | Estado del caso | recibido, en revisión, en atención, resuelto, cerrado, reabierto | en atención |
| Caso de soporte | id_usuario | INT | Usuario que creó el caso | Debe existir en Usuario | 1 |
| Caso de soporte | id_personal_asignado | INT | Persona de soporte asignada | Debe ser tipo soporte | 2 |
| Caso de soporte | id_clasificacion | INT | Clasificación del caso | Debe existir | 3 |
| Caso de soporte | fecha_creacion | DATETIME | Fecha de creación | Automática | 2026-05-23 10:00 |
| Caso de soporte | fecha_cierre | DATETIME | Fecha de cierre | Solo si se cierra | 2026-05-25 15:00 |

---

## Entidad: Clasificación del caso

| Entidad | Atributo | Tipo | Descripción | Restricciones | Ejemplo |
|---------|----------|------|-------------|---------------|---------|
| Clasificación del caso | id_clasificacion | INT | Identificador | Autoincremental | 1 |
| Clasificación del caso | tipo_caso | ENUM | Tipo del caso | problema, solicitud | problema |
| Clasificación del caso | id_tipo_problema | INT | Tipo de problema | Solo si aplica | 2 |
| Clasificación del caso | id_tipo_solicitud | INT | Tipo de solicitud | Solo si aplica | 1 |
| Clasificación del caso | clase_solicitud | ENUM | Clase de solicitud | nuevo, cambio, consulta | nuevo |
| Clasificación del caso | afectacion | ENUM | Nivel de afectación | usuario, área, empresa | área |
| Clasificación del caso | urgencia | ENUM | Nivel de urgencia | baja, media, alta, crítica | alta |
| Clasificación del caso | importancia | ENUM | Nivel de importancia | Se calcula con afectación y urgencia | alta |

---

## Entidad: Tipo de problema

| Entidad | Atributo | Tipo | Descripción | Restricciones | Ejemplo |
|---------|----------|------|-------------|---------------|---------|
| Tipo de problema | id_tipo_problema | INT | Identificador | Autoincremental | 1 |
| Tipo de problema | nombre | VARCHAR(100) | Nombre del problema | Obligatorio | Internet |
| Tipo de problema | descripcion | TEXT | Explicación | Opcional | Sin conexión |
| Tipo de problema | estado | ENUM | Estado | activo, inactivo | activo |

---

## Entidad: Tipo de solicitud

| Entidad | Atributo | Tipo | Descripción | Restricciones | Ejemplo |
|---------|----------|------|-------------|---------------|---------|
| Tipo de solicitud | id_tipo_solicitud | INT | Identificador | Autoincremental | 1 |
| Tipo de solicitud | nombre | VARCHAR(100) | Tipo de solicitud | Obligatorio | Acceso |
| Tipo de solicitud | descripcion | TEXT | Explicación | Opcional | Solicitud de acceso |
| Tipo de solicitud | estado | ENUM | Estado | activo, inactivo | activo |

---

## Entidad: Comentario del caso

| Entidad | Atributo | Tipo | Descripción | Restricciones | Ejemplo |
|---------|----------|------|-------------|---------------|---------|
| Comentario del caso | id_comentario | INT | Identificador | Autoincremental | 1 |
| Comentario del caso | id_caso | INT | Caso asociado | Debe existir | 101 |
| Comentario del caso | id_usuario_autor | INT | Usuario autor | Debe existir | 2 |
| Comentario del caso | comentario | TEXT | Texto del comentario | No vacío | Revisando caso |
| Comentario del caso | visibilidad | ENUM | Quién lo ve | usuario, interno soporte | usuario |
| Comentario del caso | fecha_comentario | DATETIME | Fecha | Automática | 2026-05-23 |

---

## Entidad: Historial del caso

| Entidad | Atributo | Tipo | Descripción | Restricciones | Ejemplo |
|---------|----------|------|-------------|---------------|---------|
| Historial del caso | id_historial | INT | Identificador | Autoincremental | 1 |
| Historial del caso | id_caso | INT | Caso | Obligatorio | 101 |
| Historial del caso | id_usuario_accion | INT | Usuario que hizo el cambio | Obligatorio | 2 |
| Historial del caso | accion | VARCHAR(120) | Cambio realizado | Obligatorio | Cambio de estado |
| Historial del caso | valor_anterior | TEXT | Antes del cambio | Opcional | en revisión |
| Historial del caso | valor_nuevo | TEXT | Después del cambio | Opcional | en atención |
| Historial del caso | fecha_accion | DATETIME | Fecha | Automática | 2026-05-23 |
| Historial del caso | editable | BOOLEAN | Protege el historial | Siempre falso | false |

---

## Entidad: Aviso

| Entidad | Atributo | Tipo | Descripción | Restricciones | Ejemplo |
|---------|----------|------|-------------|---------------|---------|
| Aviso | id_aviso | INT | Identificador | Autoincremental | 1 |
| Aviso | id_caso | INT | Caso relacionado | Obligatorio | 101 |
| Aviso | id_usuario_destino | INT | Usuario destino | Obligatorio | 1 |
| Aviso | canal | ENUM | Medio de aviso | correo, aviso emergente, detalle del caso | correo |
| Aviso | mensaje | TEXT | Contenido | Obligatorio | Cambio de estado |
| Aviso | fecha_envio | DATETIME | Fecha | Automática | 2026-05-23 |
| Aviso | estado_envio | ENUM | Estado | enviado, pendiente, fallido | enviado |

---

## Entidad: Tabla de importancia

| Entidad | Atributo | Tipo | Descripción | Restricciones | Ejemplo |
|---------|----------|------|-------------|---------------|---------|
| Tabla de importancia | id_tabla_importancia | INT | Identificador | Autoincremental | 1 |
| Tabla de importancia | afectacion | ENUM | Nivel de afectación | usuario, área, empresa | área |
| Tabla de importancia | urgencia | ENUM | Nivel de urgencia | baja, media, alta, crítica | alta |
| Tabla de importancia | resultado_importancia | ENUM | Resultado final | Calculado | alta |
| Tabla de importancia | estado | ENUM | Estado | activo, inactivo | activo |

---

## Entidad: Tiempo de atención

| Entidad | Atributo | Tipo | Descripción | Restricciones | Ejemplo |
|---------|----------|------|-------------|---------------|---------|
| Tiempo de atención | id_tiempo_atencion | INT | Identificador | Autoincremental | 1 |
| Tiempo de atención | importancia | ENUM | Nivel del caso | Obligatorio | alta |
| Tiempo de atención | tipo_caso | ENUM | Tipo | problema, solicitud | problema |
| Tiempo de atención | tiempo_respuesta | VARCHAR(50) | Tiempo de respuesta | Obligatorio | 2 horas |
| Tiempo de atención | tiempo_solucion | VARCHAR(50) | Tiempo de solución | Obligatorio | 1 día |
| Tiempo de atención | estado | ENUM | Estado | activo, inactivo | activo |

---

## Entidad: Información del personal de soporte

| Entidad | Atributo | Tipo | Descripción | Restricciones | Ejemplo |
|---------|----------|------|-------------|---------------|---------|
| Información del personal de soporte | id_info_soporte | INT | Identificador | Autoincremental | 1 |
| Información del personal de soporte | id_usuario_soporte | INT | Usuario soporte | Obligatorio | 2 |
| Información del personal de soporte | capacidades | TEXT | Lo que puede atender | Obligatorio | Redes |
| Información del personal de soporte | disponibilidad | ENUM | Estado | disponible, ocupado, ausente | disponible |
| Información del personal de soporte | carga_actual | INT | Casos asignados | Obligatorio | 5 |
| Información del personal de soporte | fecha_actualizacion | DATETIME | Fecha | Automática | 2026-05-23 |

---

## Entidad: Ayuda rápida

| Entidad | Atributo | Tipo | Descripción | Restricciones | Ejemplo |
|---------|----------|------|-------------|---------------|---------|
| Ayuda rápida | id_ayuda | INT | Identificador | Autoincremental | 1 |
| Ayuda rápida | titulo | VARCHAR(150) | Nombre | Obligatorio | Configurar wifi |
| Ayuda rápida | contenido | TEXT | Explicación | Obligatorio | Pasos para conexión |
| Ayuda rápida | palabras_clave | VARCHAR(200) | Palabras clave | Opcional | wifi, red |
| Ayuda rápida | estado | ENUM | Estado | activa, inactiva | activa |

---

## Entidad: Reporte de atención

| Entidad | Atributo | Tipo | Descripción | Restricciones | Ejemplo |
|---------|----------|------|-------------|---------------|---------|
| Reporte de atención | id_reporte | INT | Identificador | Autoincremental | 1 |
| Reporte de atención | id_usuario_solicita | INT | Usuario | Obligatorio | 3 |
| Reporte de atención | tipo_archivo | ENUM | Tipo de archivo | PDF, Excel | PDF |
| Reporte de atención | periodo_inicio | DATE | Fecha inicio | Obligatorio | 2026-05-01 |
| Reporte de atención | periodo_fin | DATE | Fecha fin | Obligatorio | 2026-05-31 |
| Reporte de atención | fecha_generacion | DATETIME | Fecha | Automática | 2026-05-23 |
