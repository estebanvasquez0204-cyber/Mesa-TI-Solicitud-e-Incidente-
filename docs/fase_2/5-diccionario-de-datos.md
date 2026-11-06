# 7. Diccionario de datos

> **Guía de seguimiento:** Fase 2 — actividad *5. Diccionario de Datos (3FN)*.
>
> **Fuente:** documento Word *Proyecto.docx* — «Mesa de Ayuda TI de Nexa Servicios» (F. J. Motta Quintero y E. Vásquez Valencia · Ingeniería de Software II · Docente: Lora Patiño Gloria Amparo · Octubre de 2026), sección 7.

Este capítulo reúne el diccionario de datos vigente. El modelo entidad-relación se presenta en el capítulo 8 y el diagrama de clases UML, junto con la auditoría cruzada entre los tres documentos, en el capítulo 9.

Se incorpora el Diccionario de datos vigente, tal como se entrega en el archivo independiente Diccionario_Datos.docx: 18 tablas y 161 atributos, con tipo, tamaño, clave primaria, clave foránea, nulidad, restricciones, valor por defecto, índice y descripción. Es la referencia de los nombres, tipos y relaciones que usan el MER (capítulo 8) y el diagrama de clases (capítulo 9).

**Control de versión.** La versión 2 conserva el diccionario v4 y agrega tres campos propuestos en la Fase 1 v2 (CRF-002), marcados «v2» y pendientes de validación con la docente: usuario.fecha_actualizacion, usuario.id_usuario_modificacion e historial_caso.motivo, más el valor cambio_clasificacion en historial_caso.accion y la relación de auditoría usuario → usuario. El MER (versión 2) y el diagrama de clases (versión 3, 29 de octubre de 2026) los incluyen. En la versión 3 del diagrama, los campos de auditoría de activo (fecha_creacion, fecha_actualizacion, id_usuario_modificacion) ya figuran también en la clase Activo (IN-18).

## Entidad area

(nombre anterior: Área) — Catálogo de áreas o departamentos de la empresa; se usa para ubicar usuarios y activos, y para calcular el nivel de afectación de un caso.

**Tabla 223**  
*Diccionario de datos: entidad area*

| **Campo**               | **Tipo de dato** | **Tamaño** | **PK** | **FK**                  | **Nulo** | **Restricciones**                    | **Valor por defecto** | **Índice** | **Descripción**                                                                                                |
|-------------------------|------------------|------------|--------|-------------------------|----------|--------------------------------------|-----------------------|------------|----------------------------------------------------------------------------------------------------------------|
| id_area                 | INT              | \-         | Sí     | No                      | No       | \-                                   | \-                    | \-         | Identificador, autoincremental                                                                                 |
| nombre_area             | VARCHAR          | 100        | No     | No                      | No       | UNIQUE(nombre_area)                  | \-                    | \-         | Nombre del área/departamento                                                                                   |
| estado                  | ENUM             | \-         | No     | No                      | No       | CHECK IN ('activo','inactivo')       | 'activo'              | \-         | activo / inactivo                                                                                              |
| fecha_creacion          | DATETIME         | \-         | No     | No                      | No       | \-                                   | CURRENT_TIMESTAMP     | \-         | (D23) Automática, al crear el registro                                                                         |
| fecha_actualizacion     | DATETIME         | \-         | No     | No                      | Sí       | \-                                   | \-                    | \-         | (D23) Se actualiza en cada modificación                                                                        |
| id_usuario_modificacion | INT              | \-         | No     | FK → usuario.id_usuario | Sí       | ON DELETE SET NULL ON UPDATE CASCADE | \-                    | \-         | (D23) Quién hizo el último cambio; SET NULL (no RESTRICT) para no bloquear la baja de un usuario por auditoría |

## Entidad cargo

Catálogo de cargos formales de la empresa, usado por Usuario para efectos de recursos humanos.

**Tabla 224**  
*Diccionario de datos: entidad cargo*

| **Campo**               | **Tipo de dato** | **Tamaño** | **PK** | **FK**                  | **Nulo** | **Restricciones**                    | **Valor por defecto** | **Índice** | **Descripción**                                                                                                |
|-------------------------|------------------|------------|--------|-------------------------|----------|--------------------------------------|-----------------------|------------|----------------------------------------------------------------------------------------------------------------|
| id_cargo                | INT              | \-         | Sí     | No                      | No       | \-                                   | \-                    | \-         | Identificador, autoincremental                                                                                 |
| nombre_cargo            | VARCHAR          | 100        | No     | No                      | No       | \-                                   | \-                    | \-         | Nombre del cargo                                                                                               |
| estado                  | ENUM             | \-         | No     | No                      | No       | CHECK IN ('activo','inactivo')       | 'activo'              | \-         | activo / inactivo                                                                                              |
| fecha_creacion          | DATETIME         | \-         | No     | No                      | No       | \-                                   | CURRENT_TIMESTAMP     | \-         | (D23) Automática, al crear el registro                                                                         |
| fecha_actualizacion     | DATETIME         | \-         | No     | No                      | Sí       | \-                                   | \-                    | \-         | (D23) Se actualiza en cada modificación                                                                        |
| id_usuario_modificacion | INT              | \-         | No     | FK → usuario.id_usuario | Sí       | ON DELETE SET NULL ON UPDATE CASCADE | \-                    | \-         | (D23) Quién hizo el último cambio; SET NULL (no RESTRICT) para no bloquear la baja de un usuario por auditoría |

## Entidad rol_empleado

Catálogo de clasificación jerárquica del empleado dentro de la estructura organizacional de Nexa Servicios.

**Tabla 225**  
*Diccionario de datos: entidad rol_empleado*

| **Campo**               | **Tipo de dato** | **Tamaño** | **PK** | **FK**                  | **Nulo** | **Restricciones**                    | **Valor por defecto** | **Índice** | **Descripción**                                                                                                |
|-------------------------|------------------|------------|--------|-------------------------|----------|--------------------------------------|-----------------------|------------|----------------------------------------------------------------------------------------------------------------|
| id_rol_empleado         | INT              | \-         | Sí     | No                      | No       | \-                                   | \-                    | \-         | Identificador, autoincremental                                                                                 |
| nombre_rol              | VARCHAR          | 100        | No     | No                      | No       | \-                                   | \-                    | \-         | Clasificación del empleado (administrativo, directivo, operativo, seguridad, supervisor)                       |
| estado                  | ENUM             | \-         | No     | No                      | No       | CHECK IN ('activo','inactivo')       | 'activo'              | \-         | activo / inactivo                                                                                              |
| fecha_creacion          | DATETIME         | \-         | No     | No                      | No       | \-                                   | CURRENT_TIMESTAMP     | \-         | (D23) Automática, al crear el registro                                                                         |
| fecha_actualizacion     | DATETIME         | \-         | No     | No                      | Sí       | \-                                   | \-                    | \-         | (D23) Se actualiza en cada modificación                                                                        |
| id_usuario_modificacion | INT              | \-         | No     | FK → usuario.id_usuario | Sí       | ON DELETE SET NULL ON UPDATE CASCADE | \-                    | \-         | (D23) Quién hizo el último cambio; SET NULL (no RESTRICT) para no bloquear la baja de un usuario por auditoría |

## Entidad usuario

Toda persona que interactúa con el sistema: solicitantes, personal de soporte, supervisores y administradores. Es la entidad de identidad y de credenciales del modelo. (C12) los tokens de recuperación ya no viven aquí: pasaron a la tabla token_recuperacion.

**Tabla 226**  
*Diccionario de datos: entidad usuario*

| **Campo**               | **Tipo de dato** | **Tamaño** | **PK** | **FK**                            | **Nulo** | **Restricciones**                                               | **Valor por defecto** | **Índice** | **Descripción**                                                                                                                                                                                                                |
|-------------------------|------------------|------------|--------|-----------------------------------|----------|-----------------------------------------------------------------|-----------------------|------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| id_usuario              | INT              | \-         | Sí     | No                                | No       | \-                                                              | \-                    | \-         | Identificador, autoincremental                                                                                                                                                                                                 |
| nombre                  | VARCHAR          | 120        | No     | No                                | No       | \-                                                              | \-                    | \-         | Nombre de la persona                                                                                                                                                                                                           |
| correo                  | VARCHAR          | 150        | No     | No                                | No       | UNIQUE(correo); CHECK(correo LIKE '%@%.%')                      | \-                    | \-         | Correo electrónico de la persona                                                                                                                                                                                               |
| telefono                | VARCHAR          | 20         | No     | No                                | Sí       | \-                                                              | \-                    | \-         | (D21) Teléfono o extensión de contacto, necesario para que soporte atienda el caso                                                                                                                                             |
| contrasena_hash         | VARCHAR          | 255        | No     | No                                | No       | \-                                                              | \-                    | \-         | Hash de la contraseña (nunca se almacena en texto plano)                                                                                                                                                                       |
| intentos_fallidos       | INT              | \-         | No     | No                                | No       | \-                                                              | 0                     | \-         | Contador de intentos de inicio de sesión fallidos; se reinicia al autenticar con éxito. Al llegar a 4 la cuenta se bloquea (RN-20)                                                                                             |
| fecha_bloqueo           | DATETIME         | \-         | No     | No                                | Sí       | \-                                                              | \-                    | \-         | Fecha desde la cual la cuenta queda bloqueada por exceso de intentos fallidos                                                                                                                                                  |
| id_cargo                | INT              | \-         | No     | FK → cargo.id_cargo               | Sí       | ON DELETE RESTRICT ON UPDATE CASCADE                            | \-                    | \-         | Cargo del empleado                                                                                                                                                                                                             |
| id_area                 | INT              | \-         | No     | FK → area.id_area                 | Sí       | ON DELETE RESTRICT ON UPDATE CASCADE                            | \-                    | \-         | Área a la que pertenece. (D21/RN04) obligatorio en la aplicación cuando perfil_acceso='solicitante', para evaluar la afectación 'área' de la matriz de prioridad; nullable en BD porque otros perfiles no siempre lo requieren |
| id_rol_organizacional   | INT              | \-         | No     | FK → rol_empleado.id_rol_empleado | Sí       | ON DELETE RESTRICT ON UPDATE CASCADE                            | \-                    | \-         | (antes id_rol_empleado) Clasificación jerárquica del empleado en la empresa                                                                                                                                                    |
| perfil_acceso           | ENUM             | \-         | No     | No                                | No       | CHECK IN ('solicitante','soporte','supervisor','administrador') | \-                    | \-         | (antes tipo_usuario) perfil de acceso al sistema                                                                                                                                                                               |
| estado_usuario          | ENUM             | \-         | No     | No                                | No       | CHECK IN ('activo','inactivo')                                  | 'activo'              | \-         | activo / inactivo                                                                                                                                                                                                              |
| fecha_registro          | DATE             | \-         | No     | No                                | No       | CHECK(fecha_registro \<= CURRENT_DATE)                          | CURRENT_DATE          | \-         | Fecha de registro del usuario                                                                                                                                                                                                  |
| fecha_actualizacion     | DATETIME         | \-         | No     | No                                | Sí       | \-                                                              | \-                    | \-         | (D23, v2) Se actualiza en cada modificación del usuario                                                                                                                                                                        |
| id_usuario_modificacion | INT              | \-         | No     | FK → usuario.id_usuario           | Sí       | ON DELETE SET NULL ON UPDATE CASCADE                            | \-                    | \-         | (D23, v2) Quién hizo el último cambio; SET NULL para no bloquear la baja de un usuario por auditoría                                                                                                                           |

## Entidad token_recuperacion \[tabla nueva — C12\]

Tokens de recuperación de contraseña emitidos para un usuario. Al salir de usuario, un mismo usuario puede tener varios tokens vigentes y conserva el histórico de los ya usados o revocados, que antes se perdía al sobrescribir el campo.

**Tabla 227**  
*Diccionario de datos: entidad token_recuperacion \[tabla nueva — C12\]*

| **Campo**        | **Tipo de dato** | **Tamaño** | **PK** | **FK**                  | **Nulo** | **Restricciones**                                          | **Valor por defecto** | **Índice** | **Descripción**                                                                                                                            |
|------------------|------------------|------------|--------|-------------------------|----------|------------------------------------------------------------|-----------------------|------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| id_token         | INT              | \-         | Sí     | No                      | No       | \-                                                         | \-                    | \-         | Identificador, autoincremental                                                                                                             |
| id_usuario       | INT              | \-         | No     | FK → usuario.id_usuario | No       | ON DELETE CASCADE ON UPDATE CASCADE                        | \-                    | Sí         | Usuario al que se le emitió el token; CASCADE porque el token no existe sin él                                                             |
| token_hash       | VARCHAR          | 255        | No     | No                      | No       | UNIQUE(token_hash)                                         | \-                    | \-         | Hash del token (nunca se almacena en texto plano, igual que contrasena_hash); el valor original solo viaja en el enlace enviado al usuario |
| fecha_generacion | DATETIME         | \-         | No     | No                      | No       | \-                                                         | CURRENT_TIMESTAMP     | \-         | Automática, momento de emisión                                                                                                             |
| fecha_expiracion | DATETIME         | \-         | No     | No                      | No       | CHECK(fecha_expiracion \> fecha_generacion)                | \-                    | \-         | Hasta cuándo sirve el token (equivale al antiguo token_expiracion)                                                                         |
| fecha_uso        | DATETIME         | \-         | No     | No                      | Sí       | CHECK(fecha_uso IS NULL OR fecha_uso \>= fecha_generacion) | \-                    | \-         | Cuándo se consumió para restablecer la contraseña; NULL si no se ha usado                                                                  |
| estado_token     | ENUM             | \-         | No     | No                      | No       | CHECK IN ('vigente','usado','revocado')                    | 'vigente'             | \-         | vigente / usado / revocado (RN06)                                                                                                          |

## Entidad activo

Equipos y elementos tecnológicos de la empresa (computadores, impresoras, routers, etc.) que pueden estar relacionados con un caso de soporte. Su tipo se clasifica mediante el catálogo tipo_activo (D08).

**Tabla 228**  
*Diccionario de datos: entidad activo*

| **Campo**               | **Tipo de dato** | **Tamaño** | **PK** | **FK**                          | **Nulo** | **Restricciones**                                  | **Valor por defecto** | **Índice** | **Descripción**                                  |
|-------------------------|------------------|------------|--------|---------------------------------|----------|----------------------------------------------------|-----------------------|------------|--------------------------------------------------|
| id_activo               | INT              | \-         | Sí     | No                              | No       | \-                                                 | \-                    | \-         | Identificador, autoincremental                   |
| nombre                  | VARCHAR          | 100        | No     | No                              | No       | \-                                                 | \-                    | \-         | Nombre/descripción del equipo                    |
| id_tipo_activo          | INT              | \-         | No     | FK → tipo_activo.id_tipo_activo | No       | ON DELETE RESTRICT ON UPDATE CASCADE               | \-                    | \-         | Tipo de equipo (antes tipo_activo VARCHAR libre) |
| marca                   | VARCHAR          | 60         | No     | No                              | Sí       | \-                                                 | \-                    | \-         | Marca del equipo                                 |
| modelo                  | VARCHAR          | 60         | No     | No                              | Sí       | \-                                                 | \-                    | \-         | Modelo del equipo                                |
| numero_serie            | VARCHAR          | 60         | No     | No                              | Sí       | UNIQUE(numero_serie) — permite múltiples NULL      | \-                    | \-         | Número de serie del equipo (si aplica)           |
| id_area                 | INT              | \-         | No     | FK → area.id_area               | Sí       | ON DELETE RESTRICT ON UPDATE CASCADE               | \-                    | \-         | Área/ubicación donde está asignado               |
| estado                  | ENUM             | \-         | No     | No                              | No       | CHECK IN ('activo','en_reparacion','dado_de_baja') | 'activo'              | \-         | activo, en reparación, dado de baja              |
| fecha_adquisicion       | DATE             | \-         | No     | No                              | Sí       | \-                                                 | \-                    | \-         | Solo si es relevante para el proyecto            |
| fecha_creacion          | DATETIME         | \-         | No     | No                              | No       | \-                                                 | CURRENT_TIMESTAMP     | \-         | (D23) Automática, al crear el registro           |
| fecha_actualizacion     | DATETIME         | \-         | No     | No                              | Sí       | \-                                                 | \-                    | \-         | (D23) Se actualiza en cada modificación          |
| id_usuario_modificacion | INT              | \-         | No     | FK → usuario.id_usuario         | Sí       | ON DELETE SET NULL ON UPDATE CASCADE               | \-                    | \-         | (D23) Quién hizo el último cambio                |

## Entidad tipo_activo

Catálogo de tipos de equipo (computador, portátil, impresora, router, servidor, etc.), creado en D08 para reemplazar el campo de texto libre que tenía Activo.

**Tabla 229**  
*Diccionario de datos: entidad tipo_activo*

| **Campo**               | **Tipo de dato** | **Tamaño** | **PK** | **FK**                  | **Nulo** | **Restricciones**                    | **Valor por defecto** | **Índice** | **Descripción**                                       |
|-------------------------|------------------|------------|--------|-------------------------|----------|--------------------------------------|-----------------------|------------|-------------------------------------------------------|
| id_tipo_activo          | INT              | \-         | Sí     | No                      | No       | \-                                   | \-                    | \-         | Identificador, autoincremental                        |
| nombre                  | VARCHAR          | 100        | No     | No                      | No       | \-                                   | \-                    | \-         | Ej. Computador, Portátil, Impresora, Router, Servidor |
| descripcion             | TEXT             | \-         | No     | No                      | Sí       | \-                                   | \-                    | \-         | Explicación adicional del tipo de equipo              |
| estado                  | ENUM             | \-         | No     | No                      | No       | CHECK IN ('activo','inactivo')       | 'activo'              | \-         | activo / inactivo                                     |
| fecha_creacion          | DATETIME         | \-         | No     | No                      | No       | \-                                   | CURRENT_TIMESTAMP     | \-         | (D23) Automática, al crear el registro                |
| fecha_actualizacion     | DATETIME         | \-         | No     | No                      | Sí       | \-                                   | \-                    | \-         | (D23) Se actualiza en cada modificación               |
| id_usuario_modificacion | INT              | \-         | No     | FK → usuario.id_usuario | Sí       | ON DELETE SET NULL ON UPDATE CASCADE | \-                    | \-         | (D23) Quién hizo el último cambio                     |

## Entidad caso_soporte

(nombre anterior: Caso de soporte) — Entidad central del sistema. Desde D13, incorpora directamente su clasificación (antes en clasificacion_caso, eliminada por ser una combinación 1:1 con el caso, no un catálogo compartido).

**Tabla 230**  
*Diccionario de datos: entidad caso_soporte*

| **Campo**               | **Tipo de dato** | **Tamaño** | **PK** | **FK**                                      | **Nulo** | **Restricciones**                                                                  | **Valor por defecto** | **Índice** | **Descripción**                                                                                        |
|-------------------------|------------------|------------|--------|---------------------------------------------|----------|------------------------------------------------------------------------------------|-----------------------|------------|--------------------------------------------------------------------------------------------------------|
| id_caso                 | INT              | \-         | Sí     | No                                          | No       | \-                                                                                 | \-                    | \-         | Identificador, autoincremental                                                                         |
| numero_seguimiento      | VARCHAR          | 30         | No     | No                                          | No       | UNIQUE(numero_seguimiento)                                                         | \-                    | Sí         | (D25) Código MA-AAAA-NNNNNN (ej. MA-2026-000145), generado por la aplicación, no por la BD             |
| titulo                  | VARCHAR          | 150        | No     | No                                          | No       | \-                                                                                 | \-                    | \-         | Resumen del caso                                                                                       |
| descripcion             | TEXT             | \-         | No     | No                                          | No       | \-                                                                                 | \-                    | \-         | Detalle del problema/solicitud                                                                         |
| lugar                   | VARCHAR          | 120        | No     | No                                          | No       | \-                                                                                 | \-                    | \-         | Lugar específico donde ocurre                                                                          |
| estado_caso             | ENUM             | \-         | No     | No                                          | No       | CHECK IN ('recibido','en_revision','en_atencion','resuelto','cerrado','reabierto') | 'recibido'            | Sí         | Ciclo de vida del caso                                                                                 |
| id_usuario_solicitante  | INT              | \-         | No     | FK → usuario.id_usuario                     | No       | ON DELETE RESTRICT ON UPDATE CASCADE                                               | \-                    | Sí         | Solicitante del caso                                                                                   |
| id_personal_asignado    | INT              | \-         | No     | FK → usuario.id_usuario                     | Sí       | ON DELETE RESTRICT ON UPDATE CASCADE                                               | \-                    | Sí         | Personal de soporte asignado (RN01: debe tener perfil_acceso=soporte, validado por trigger, no por FK) |
| id_activo               | INT              | \-         | No     | FK → activo.id_activo                       | Sí       | ON DELETE RESTRICT ON UPDATE CASCADE                                               | \-                    | \-         | Activo relacionado (no todos los casos tienen uno)                                                     |
| id_tabla_importancia    | INT              | \-         | No     | FK → tabla_importancia.id_tabla_importancia | No       | ON DELETE RESTRICT ON UPDATE CASCADE                                               | \-                    | \-         | Prioridad evaluada para este caso                                                                      |
| id_tiempo_atencion      | INT              | \-         | No     | FK → tiempo_atencion_sla.id_tiempo_atencion | No       | ON DELETE RESTRICT ON UPDATE CASCADE                                               | \-                    | \-         | (C08) versión exacta del SLA aplicada a este caso; hace navegable y determinista cumpleSLA()           |
| tipo_caso               | ENUM             | \-         | No     | No                                          | No       | CHECK IN ('problema','solicitud')                                                  | \-                    | \-         | (antes en clasificacion_caso, D13)                                                                     |
| id_tipo_problema        | INT              | \-         | No     | FK → tipo_problema.id_tipo_problema         | Sí       | ON DELETE RESTRICT; CHECK exclusión mutua con id_tipo_solicitud                    | \-                    | \-         | (antes en clasificacion_caso, D13) solo si tipo_caso=problema                                          |
| id_tipo_solicitud       | INT              | \-         | No     | FK → tipo_solicitud.id_tipo_solicitud       | Sí       | ON DELETE RESTRICT; CHECK exclusión mutua con id_tipo_problema                     | \-                    | \-         | (antes en clasificacion_caso, D13) solo si tipo_caso=solicitud                                         |
| clase_solicitud         | ENUM             | \-         | No     | No                                          | Sí       | CHECK IN ('nuevo','cambio','consulta')                                             | \-                    | \-         | (antes en clasificacion_caso, D13) solo si tipo_caso=solicitud                                         |
| fecha_creacion          | DATETIME         | \-         | No     | No                                          | No       | \-                                                                                 | CURRENT_TIMESTAMP     | Sí         | Automática                                                                                             |
| fecha_primera_respuesta | DATETIME         | \-         | No     | No                                          | Sí       | CHECK(fecha_primera_respuesta \>= fecha_creacion)                                  | \-                    | \-         | Primer contacto de soporte; se compara contra tiempo_respuesta del SLA                                 |
| fecha_solucion          | DATETIME         | \-         | No     | No                                          | Sí       | CHECK(fecha_solucion \>= fecha_primera_respuesta)                                  | \-                    | \-         | Cuándo quedó técnicamente resuelto; se compara contra tiempo_solucion del SLA                          |
| fecha_cierre            | DATETIME         | \-         | No     | No                                          | Sí       | CHECK(fecha_cierre \>= fecha_solucion)                                             | \-                    | \-         | Solo si se cierra (confirmación formal, distinta de fecha_solucion)                                    |
| contador_reaperturas    | INT              | \-         | No     | No                                          | No       | CHECK(contador_reaperturas \>= 0)                                                  | 0                     | \-         | (D17) veces reabierto; el SLA se mide sobre el último ciclo (RN03)                                     |
| motivo_reapertura       | TEXT             | \-         | No     | No                                          | Sí       | \-                                                                                 | \-                    | \-         | (D17) motivo de la reapertura más reciente; NULL si nunca se ha reabierto                              |

## Entidad tipo_problema

Catálogo de tipos de problema técnico (ej. Internet, Hardware) usado para clasificar los casos de tipo 'problema'.

**Tabla 231**  
*Diccionario de datos: entidad tipo_problema*

| **Campo**               | **Tipo de dato** | **Tamaño** | **PK** | **FK**                  | **Nulo** | **Restricciones**                    | **Valor por defecto** | **Índice** | **Descripción**                         |
|-------------------------|------------------|------------|--------|-------------------------|----------|--------------------------------------|-----------------------|------------|-----------------------------------------|
| id_tipo_problema        | INT              | \-         | Sí     | No                      | No       | \-                                   | \-                    | \-         | Autoincremental                         |
| nombre                  | VARCHAR          | 100        | No     | No                      | No       | \-                                   | \-                    | \-         | Ej. Internet, Hardware                  |
| descripcion             | TEXT             | \-         | No     | No                      | Sí       | \-                                   | \-                    | \-         | Explicación                             |
| estado                  | ENUM             | \-         | No     | No                      | No       | CHECK IN ('activo','inactivo')       | 'activo'              | \-         | activo / inactivo                       |
| fecha_creacion          | DATETIME         | \-         | No     | No                      | No       | \-                                   | CURRENT_TIMESTAMP     | \-         | (D23) Automática, al crear el registro  |
| fecha_actualizacion     | DATETIME         | \-         | No     | No                      | Sí       | \-                                   | \-                    | \-         | (D23) Se actualiza en cada modificación |
| id_usuario_modificacion | INT              | \-         | No     | FK → usuario.id_usuario | Sí       | ON DELETE SET NULL ON UPDATE CASCADE | \-                    | \-         | (D23) Quién hizo el último cambio       |

## Entidad tipo_solicitud

Catálogo de tipos de solicitud (ej. Acceso) usado para clasificar los casos de tipo 'solicitud'.

**Tabla 232**  
*Diccionario de datos: entidad tipo_solicitud*

| **Campo**               | **Tipo de dato** | **Tamaño** | **PK** | **FK**                  | **Nulo** | **Restricciones**                    | **Valor por defecto** | **Índice** | **Descripción**                         |
|-------------------------|------------------|------------|--------|-------------------------|----------|--------------------------------------|-----------------------|------------|-----------------------------------------|
| id_tipo_solicitud       | INT              | \-         | Sí     | No                      | No       | \-                                   | \-                    | \-         | Autoincremental                         |
| nombre                  | VARCHAR          | 100        | No     | No                      | No       | \-                                   | \-                    | \-         | Ej. Acceso                              |
| descripcion             | TEXT             | \-         | No     | No                      | Sí       | \-                                   | \-                    | \-         | Explicación                             |
| estado                  | ENUM             | \-         | No     | No                      | No       | CHECK IN ('activo','inactivo')       | 'activo'              | \-         | activo / inactivo                       |
| fecha_creacion          | DATETIME         | \-         | No     | No                      | No       | \-                                   | CURRENT_TIMESTAMP     | \-         | (D23) Automática, al crear el registro  |
| fecha_actualizacion     | DATETIME         | \-         | No     | No                      | Sí       | \-                                   | \-                    | \-         | (D23) Se actualiza en cada modificación |
| id_usuario_modificacion | INT              | \-         | No     | FK → usuario.id_usuario | Sí       | ON DELETE SET NULL ON UPDATE CASCADE | \-                    | \-         | (D23) Quién hizo el último cambio       |

## Entidad tabla_importancia

(nombre anterior: Tabla de importancia) — Matriz de prioridad: combina afectación y urgencia para determinar el nivel de importancia (P1-P4) de un caso.

**Tabla 233**  
*Diccionario de datos: entidad tabla_importancia*

| **Campo**               | **Tipo de dato** | **Tamaño** | **PK** | **FK**                  | **Nulo** | **Restricciones**                                                   | **Valor por defecto** | **Índice** | **Descripción**                                                                                      |
|-------------------------|------------------|------------|--------|-------------------------|----------|---------------------------------------------------------------------|-----------------------|------------|------------------------------------------------------------------------------------------------------|
| id_tabla_importancia    | INT              | \-         | Sí     | No                      | No       | \-                                                                  | \-                    | \-         | Autoincremental                                                                                      |
| afectacion              | ENUM             | \-         | No     | No                      | No       | CHECK IN ('usuario','area','empresa'); UNIQUE(afectacion, urgencia) | \-                    | \-         | usuario, área, empresa. (C10) la unicidad aplica a la pareja afectación + urgencia, no al campo solo |
| urgencia                | ENUM             | \-         | No     | No                      | No       | CHECK IN ('baja','media','alta','critica')                          | \-                    | \-         | baja, media, alta, crítica                                                                           |
| resultado_importancia   | ENUM             | \-         | No     | No                      | No       | CHECK IN ('P1','P2','P3','P4')                                      | \-                    | \-         | P1-P4 — fijado UNA vez según la matriz de prioridad (no se recalcula en cada lectura)                |
| estado                  | ENUM             | \-         | No     | No                      | No       | CHECK IN ('activo','inactivo')                                      | 'activo'              | \-         | activo / inactivo                                                                                    |
| fecha_creacion          | DATETIME         | \-         | No     | No                      | No       | \-                                                                  | CURRENT_TIMESTAMP     | \-         | (D23) Automática, al crear el registro                                                               |
| fecha_actualizacion     | DATETIME         | \-         | No     | No                      | Sí       | \-                                                                  | \-                    | \-         | (D23) Se actualiza en cada modificación                                                              |
| id_usuario_modificacion | INT              | \-         | No     | FK → usuario.id_usuario | Sí       | ON DELETE SET NULL ON UPDATE CASCADE                                | \-                    | \-         | (D23) Quién hizo el último cambio                                                                    |

## Entidad comentario_caso

(nombre anterior: Comentario del caso) — Comentarios de seguimiento sobre un caso, hechos por el solicitante o por soporte, con visibilidad configurable.

**Tabla 234**  
*Diccionario de datos: entidad comentario_caso*

| **Campo**        | **Tipo de dato** | **Tamaño** | **PK** | **FK**                    | **Nulo** | **Restricciones**                      | **Valor por defecto** | **Índice** | **Descripción**          |
|------------------|------------------|------------|--------|---------------------------|----------|----------------------------------------|-----------------------|------------|--------------------------|
| id_comentario    | INT              | \-         | Sí     | No                        | No       | \-                                     | \-                    | \-         | Autoincremental          |
| id_caso          | INT              | \-         | No     | FK → caso_soporte.id_caso | No       | ON DELETE CASCADE ON UPDATE CASCADE    | \-                    | \-         | Caso asociado            |
| id_usuario_autor | INT              | \-         | No     | FK → usuario.id_usuario   | No       | ON DELETE RESTRICT ON UPDATE CASCADE   | \-                    | \-         | Autor del comentario     |
| comentario       | TEXT             | \-         | No     | No                        | No       | CHECK(TRIM(comentario) \<\> '')        | \-                    | \-         | Contenido del comentario |
| visibilidad      | ENUM             | \-         | No     | No                        | No       | CHECK IN ('usuario','interno_soporte') | \-                    | \-         | usuario, interno soporte |
| fecha_comentario | DATETIME         | \-         | No     | No                        | No       | \-                                     | CURRENT_TIMESTAMP     | \-         | Automática               |

## Entidad historial_caso

(nombre anterior: Historial del caso) — Bitácora inmutable de cambios de un caso (auditoría): qué acción se hizo, qué campo cambió, cuándo y por quién.

**Tabla 235**  
*Diccionario de datos: entidad historial_caso*

| **Campo**         | **Tipo de dato** | **Tamaño** | **PK** | **FK**                    | **Nulo** | **Restricciones**                                                                                                        | **Valor por defecto** | **Índice** | **Descripción**                                                                                            |
|-------------------|------------------|------------|--------|---------------------------|----------|--------------------------------------------------------------------------------------------------------------------------|-----------------------|------------|------------------------------------------------------------------------------------------------------------|
| id_historial      | INT              | \-         | Sí     | No                        | No       | \-                                                                                                                       | \-                    | \-         | Autoincremental                                                                                            |
| id_caso           | INT              | \-         | No     | FK → caso_soporte.id_caso | No       | ON DELETE RESTRICT ON UPDATE CASCADE — protege el historial de un borrado físico del caso                                | \-                    | \-         | Caso asociado                                                                                              |
| id_usuario_accion | INT              | \-         | No     | FK → usuario.id_usuario   | No       | ON DELETE RESTRICT ON UPDATE CASCADE                                                                                     | \-                    | \-         | Quién hizo el cambio                                                                                       |
| accion            | ENUM             | \-         | No     | No                        | No       | CHECK IN ('creacion','cambio_estado','reasignacion','comentario','adjunto','cierre','reapertura','cambio_clasificacion') | \-                    | \-         | (D18, antes VARCHAR libre) tipo de cambio realizado                                                        |
| campo_modificado  | VARCHAR          | 60         | No     | No                        | Sí       | \-                                                                                                                       | \-                    | \-         | (D18) nombre del campo que cambió; NULL si la acción no aplica a un campo específico                       |
| valor_anterior    | TEXT             | \-         | No     | No                        | Sí       | \-                                                                                                                       | \-                    | \-         | Antes del cambio                                                                                           |
| valor_nuevo       | TEXT             | \-         | No     | No                        | Sí       | \-                                                                                                                       | \-                    | \-         | Después del cambio                                                                                         |
| motivo            | VARCHAR          | 255        | No     | No                        | Sí       | \-                                                                                                                       | \-                    | \-         | (v2) Motivo indicado por quien hizo el cambio (corrección de clasificación, reapertura); NULL si no aplica |
| fecha_accion      | DATETIME         | \-         | No     | No                        | No       | \-                                                                                                                       | CURRENT_TIMESTAMP     | \-         | Automática                                                                                                 |

## Entidad adjunto_caso

(nombre anterior: Adjunto del caso) — Archivos o evidencias (capturas, documentos) cargados por un usuario y asociados a un caso de soporte. (C09) incorpora el borrado lógico que ya estaba previsto en el diagrama.

**Tabla 236**  
*Diccionario de datos: entidad adjunto_caso*

| **Campo**           | **Tipo de dato** | **Tamaño** | **PK** | **FK**                    | **Nulo** | **Restricciones**                                                     | **Valor por defecto** | **Índice** | **Descripción**                                                                                                         |
|---------------------|------------------|------------|--------|---------------------------|----------|-----------------------------------------------------------------------|-----------------------|------------|-------------------------------------------------------------------------------------------------------------------------|
| id_adjunto          | INT              | \-         | Sí     | No                        | No       | \-                                                                    | \-                    | \-         | Identificador, autoincremental                                                                                          |
| id_caso             | INT              | \-         | No     | FK → caso_soporte.id_caso | No       | ON DELETE CASCADE ON UPDATE CASCADE                                   | \-                    | \-         | Caso al que pertenece la evidencia                                                                                      |
| id_usuario_autor    | INT              | \-         | No     | FK → usuario.id_usuario   | No       | ON DELETE RESTRICT ON UPDATE CASCADE                                  | \-                    | \-         | Usuario que cargó el archivo                                                                                            |
| nombre_archivo      | VARCHAR          | 150        | No     | No                        | No       | \-                                                                    | \-                    | \-         | Nombre original del archivo                                                                                             |
| tipo_archivo        | VARCHAR          | 50         | No     | No                        | No       | CHECK IN ('image/png','image/jpeg','application/pdf','text/plain')    | \-                    | \-         | (D20) tipo MIME, restringido a lista cerrada                                                                            |
| ruta_almacenamiento | VARCHAR          | 255        | No     | No                        | No       | \-                                                                    | \-                    | \-         | (D20) ruta o URL; no debe ser accesible directamente desde la web (servir vía aplicación)                               |
| tamano_kb           | INT              | \-         | No     | No                        | No       | CHECK(tamano_kb \> 0 AND tamano_kb \<= 10240)                         | \-                    | \-         | Tamaño del archivo en KB (máximo 10 MB)                                                                                 |
| fecha_carga         | DATETIME         | \-         | No     | No                        | No       | \-                                                                    | CURRENT_TIMESTAMP     | \-         | Automática                                                                                                              |
| estado_adjunto      | ENUM             | \-         | No     | No                        | No       | CHECK IN ('activo','eliminado')                                       | 'activo'              | \-         | (C09) Estado del borrado lógico; 'eliminado' oculta la evidencia sin borrar el registro ni romper el historial del caso |
| fecha_eliminacion   | DATETIME         | \-         | No     | No                        | Sí       | CHECK(fecha_eliminacion IS NULL OR fecha_eliminacion \>= fecha_carga) | \-                    | \-         | (C09) Fecha del borrado lógico; NULL mientras estado_adjunto='activo'                                                   |

## Entidad info_personal_soporte

(nombre anterior: Información del personal de soporte) — Extensión 1:1 de Usuario, exclusiva para personal con perfil_acceso=soporte: disponibilidad actual para recibir casos.

**Tabla 237**  
*Diccionario de datos: entidad info_personal_soporte*

| **Campo**           | **Tipo de dato** | **Tamaño** | **PK** | **FK**                  | **Nulo** | **Restricciones**                           | **Valor por defecto** | **Índice** | **Descripción**                      |
|---------------------|------------------|------------|--------|-------------------------|----------|---------------------------------------------|-----------------------|------------|--------------------------------------|
| id_info_soporte     | INT              | \-         | Sí     | No                      | No       | \-                                          | \-                    | \-         | Autoincremental                      |
| id_usuario_soporte  | INT              | \-         | No     | FK → usuario.id_usuario | No       | ON DELETE CASCADE ON UPDATE CASCADE         | \-                    | \-         | Debe existir en Usuario, único (1:1) |
| disponibilidad      | ENUM             | \-         | No     | No                      | No       | CHECK IN ('disponible','ocupado','ausente') | \-                    | \-         | disponible, ocupado, ausente         |
| fecha_actualizacion | DATETIME         | \-         | No     | No                      | No       | \-                                          | CURRENT_TIMESTAMP     | \-         | Automática                           |

## Entidad tiempo_atencion_sla

(nombre anterior: Tiempo de atención (SLA)) — Catálogo de tiempos máximos de respuesta y solución según el nivel de importancia y el tipo de caso.

**Tabla 238**  
*Diccionario de datos: entidad tiempo_atencion_sla*

| **Campo**               | **Tipo de dato** | **Tamaño** | **PK** | **FK**                                      | **Nulo** | **Restricciones**                                                                                    | **Valor por defecto** | **Índice** | **Descripción**                                                                         |
|-------------------------|------------------|------------|--------|---------------------------------------------|----------|------------------------------------------------------------------------------------------------------|-----------------------|------------|-----------------------------------------------------------------------------------------|
| id_tiempo_atencion      | INT              | \-         | Sí     | No                                          | No       | \-                                                                                                   | \-                    | \-         | Autoincremental                                                                         |
| id_tabla_importancia    | INT              | \-         | No     | FK → tabla_importancia.id_tabla_importancia | No       | ON DELETE RESTRICT ON UPDATE CASCADE; UNIQUE(id_tabla_importancia, tipo_caso, fecha_inicio_vigencia) | \-                    | \-         | Nivel de importancia al que aplica. (C13) queda escrita la unicidad con vigencia de D10 |
| tipo_caso               | ENUM             | \-         | No     | No                                          | No       | CHECK IN ('problema','solicitud')                                                                    | \-                    | \-         | problema, solicitud                                                                     |
| fecha_inicio_vigencia   | DATE             | \-         | No     | No                                          | No       | \-                                                                                                   | CURRENT_DATE          | \-         | (D10/D12) desde cuándo aplica; permite versionar sin alterar casos ya cerrados          |
| fecha_fin_vigencia      | DATE             | \-         | No     | No                                          | Sí       | CHECK(fecha_fin_vigencia IS NULL OR fecha_fin_vigencia \> fecha_inicio_vigencia)                     | \-                    | \-         | (D12) NULL = versión vigente                                                            |
| tiempo_respuesta        | INT              | \-         | No     | No                                          | No       | \-                                                                                                   | \-                    | \-         | Tiempo máximo de respuesta, en MINUTOS CALENDARIO (24/7, D11)                           |
| tiempo_solucion         | INT              | \-         | No     | No                                          | No       | \-                                                                                                   | \-                    | \-         | Tiempo máximo de solución, en MINUTOS CALENDARIO (24/7, D11)                            |
| estado                  | ENUM             | \-         | No     | No                                          | No       | CHECK IN ('activo','inactivo')                                                                       | 'activo'              | \-         | activo / inactivo                                                                       |
| fecha_creacion          | DATETIME         | \-         | No     | No                                          | No       | \-                                                                                                   | CURRENT_TIMESTAMP     | \-         | (D23) Automática, al crear el registro                                                  |
| fecha_actualizacion     | DATETIME         | \-         | No     | No                                          | Sí       | \-                                                                                                   | \-                    | \-         | (D23) Se actualiza en cada modificación                                                 |
| id_usuario_modificacion | INT              | \-         | No     | FK → usuario.id_usuario                     | Sí       | ON DELETE SET NULL ON UPDATE CASCADE                                                                 | \-                    | \-         | (D23) Quién hizo el último cambio                                                       |

## Entidad aviso

Notificaciones enviadas a un usuario por un cambio relevante en un caso (correo, aviso emergente, detalle del caso).

**Tabla 239**  
*Diccionario de datos: entidad aviso*

| **Campo**            | **Tipo de dato** | **Tamaño** | **PK** | **FK**                    | **Nulo** | **Restricciones**                                        | **Valor por defecto** | **Índice** | **Descripción**                                                                  |
|----------------------|------------------|------------|--------|---------------------------|----------|----------------------------------------------------------|-----------------------|------------|----------------------------------------------------------------------------------|
| id_aviso             | INT              | \-         | Sí     | No                        | No       | \-                                                       | \-                    | \-         | Autoincremental                                                                  |
| id_caso              | INT              | \-         | No     | FK → caso_soporte.id_caso | No       | ON DELETE CASCADE ON UPDATE CASCADE                      | \-                    | \-         | Caso que generó la novedad                                                       |
| id_usuario_destino   | INT              | \-         | No     | FK → usuario.id_usuario   | No       | ON DELETE RESTRICT ON UPDATE CASCADE                     | \-                    | \-         | Usuario que debe recibir el aviso                                                |
| canal                | ENUM             | \-         | No     | No                        | No       | CHECK IN ('correo','aviso_emergente','detalle_del_caso') | \-                    | \-         | correo, aviso emergente, detalle del caso                                        |
| mensaje              | TEXT             | \-         | No     | No                        | No       | \-                                                       | \-                    | \-         | Contenido del aviso                                                              |
| fecha_envio          | DATETIME         | \-         | No     | No                        | No       | \-                                                       | CURRENT_TIMESTAMP     | \-         | Automática                                                                       |
| estado_envio         | ENUM             | \-         | No     | No                        | No       | CHECK IN ('enviado','pendiente','fallido')               | \-                    | \-         | enviado, pendiente, fallido                                                      |
| intentos             | INT              | \-         | No     | No                        | No       | \-                                                       | 0                     | \-         | (D24) número de intentos de envío realizados                                     |
| fecha_ultimo_intento | DATETIME         | \-         | No     | No                        | Sí       | \-                                                       | \-                    | \-         | (D24) fecha/hora del intento más reciente                                        |
| motivo_fallo         | VARCHAR          | 255        | No     | No                        | Sí       | \-                                                       | \-                    | \-         | (D24) detalle del error si estado_envio='fallido'                                |
| fecha_lectura        | DATETIME         | \-         | No     | No                        | Sí       | \-                                                       | \-                    | \-         | (D24) fecha/hora en que el usuario destino leyó el aviso; NULL si no lo ha leído |

## Entidad transicion_estado_caso \[tabla nueva — D15\]

Cataloga qué cambios de estado_caso están permitidos y qué perfil_acceso puede ejecutarlos; valida las transiciones antes de escribir en el historial.

**Tabla 240**  
*Diccionario de datos: entidad transicion_estado_caso \[tabla nueva — D15\]*

| **Campo**               | **Tipo de dato** | **Tamaño** | **PK** | **FK**                  | **Nulo** | **Restricciones**                                                                                                                            | **Valor por defecto** | **Índice** | **Descripción**                                                                                           |
|-------------------------|------------------|------------|--------|-------------------------|----------|----------------------------------------------------------------------------------------------------------------------------------------------|-----------------------|------------|-----------------------------------------------------------------------------------------------------------|
| id_transicion           | INT              | \-         | Sí     | No                      | No       | \-                                                                                                                                           | \-                    | \-         | Identificador, autoincremental                                                                            |
| estado_origen           | ENUM             | \-         | No     | No                      | No       | CHECK IN ('recibido','en_revision','en_atencion','resuelto','cerrado','reabierto'); UNIQUE(estado_origen, estado_destino, perfil_autorizado) | \-                    | \-         | Estado desde el cual se permite la transición. (C11) la unicidad aplica al trío origen + destino + perfil |
| estado_destino          | ENUM             | \-         | No     | No                      | No       | CHECK IN ('recibido','en_revision','en_atencion','resuelto','cerrado','reabierto')                                                           | \-                    | \-         | Estado al cual se permite pasar                                                                           |
| perfil_autorizado       | ENUM             | \-         | No     | No                      | No       | CHECK IN ('solicitante','soporte','supervisor','administrador')                                                                              | \-                    | \-         | Quién puede ejecutar este cambio                                                                          |
| estado                  | ENUM             | \-         | No     | No                      | No       | CHECK IN ('activo','inactivo')                                                                                                               | 'activo'              | \-         | activo / inactivo                                                                                         |
| fecha_creacion          | DATETIME         | \-         | No     | No                      | No       | \-                                                                                                                                           | CURRENT_TIMESTAMP     | \-         | (D23) Automática, al crear el registro                                                                    |
| fecha_actualizacion     | DATETIME         | \-         | No     | No                      | Sí       | \-                                                                                                                                           | \-                    | \-         | (D23) Se actualiza en cada modificación                                                                   |
| id_usuario_modificacion | INT              | \-         | No     | FK → usuario.id_usuario | Sí       | ON DELETE SET NULL ON UPDATE CASCADE                                                                                                         | \-                    | \-         | (D23) Quién hizo el último cambio; SET NULL para no bloquear la baja de un usuario por auditoría          |

**Relaciones (D26)**

Resumen de todas las relaciones del modelo con su cardinalidad. Detalle completo (con nombre de rol) en el documento del diagrama de clases.

**Tabla 241**  
*Diccionario de datos: resumen de relaciones (D26)*

| **Entidad origen**     | **Entidad destino**   | **Card. origen** | **Card. destino** | **Tipo**                 | **Descripción**                                                                                           |
|------------------------|-----------------------|------------------|-------------------|--------------------------|-----------------------------------------------------------------------------------------------------------|
| usuario                | cargo                 | 0..\*            | 0..1              | Asociación               | Cargo del empleado                                                                                        |
| usuario                | area                  | 0..\*            | 0..1              | Asociación               | Área del empleado                                                                                         |
| usuario                | rol_empleado          | 0..\*            | 0..1              | Asociación               | Rol organizacional                                                                                        |
| usuario                | info_personal_soporte | 0..1             | 0..1              | Asociación 1:1           | Solo si perfil_acceso=soporte                                                                             |
| token_recuperacion     | usuario               | 0..\*            | 1                 | Composición              | (C12) No existe sin el usuario; ON DELETE CASCADE                                                         |
| activo                 | area                  | 0..\*            | 0..1              | Asociación               | Ubicación del equipo                                                                                      |
| activo                 | tipo_activo           | 0..\*            | 1                 | Asociación               | (D08) Clasificación del equipo                                                                            |
| caso_soporte           | usuario               | 0..\*            | 1                 | Asociación (solicitante) | Quien reporta el caso                                                                                     |
| caso_soporte           | usuario               | 0..\*            | 0..1              | Asociación (asignado)    | Personal de soporte asignado                                                                              |
| caso_soporte           | activo                | 0..\*            | 0..1              | Asociación               | Activo relacionado, opcional                                                                              |
| caso_soporte           | tipo_problema         | 0..\*            | 0..1              | Asociación               | (D13) antes vía clasificacion_caso                                                                        |
| caso_soporte           | tipo_solicitud        | 0..\*            | 0..1              | Asociación               | (D13) antes vía clasificacion_caso                                                                        |
| caso_soporte           | tabla_importancia     | 0..\*            | 1                 | Asociación               | Prioridad evaluada                                                                                        |
| caso_soporte           | tiempo_atencion_sla   | 0..\*            | 1                 | Asociación               | (C08) SLA exacto aplicado, navegable para cumpleSLA()                                                     |
| comentario_caso        | caso_soporte          | 0..\*            | 1                 | Composición              | No existe sin el caso                                                                                     |
| comentario_caso        | usuario               | 0..\*            | 1                 | Asociación (autor)       | \-                                                                                                        |
| historial_caso         | caso_soporte          | 0..\*            | 1                 | Composición              | No existe sin el caso                                                                                     |
| historial_caso         | usuario               | 0..\*            | 1                 | Asociación (responsable) | \-                                                                                                        |
| adjunto_caso           | caso_soporte          | 0..\*            | 1                 | Composición              | No existe sin el caso                                                                                     |
| adjunto_caso           | usuario               | 0..\*            | 1                 | Asociación (autor)       | \-                                                                                                        |
| aviso                  | caso_soporte          | 0..\*            | 1                 | Composición              | No existe sin el caso                                                                                     |
| aviso                  | usuario               | 0..\*            | 1                 | Asociación (destino)     | \-                                                                                                        |
| tiempo_atencion_sla    | tabla_importancia     | 0..\*            | 1                 | Asociación               | \-                                                                                                        |
| transicion_estado_caso | usuario               | 0..\*            | 0..1              | Asociación de auditoría  | Usuario que realizó la última modificación; la referencia puede quedar vacía mediante ON DELETE SET NULL. |
| usuario                | usuario               | 0..\*            | 0..1              | Asociación de auditoría  | (v2) Usuario que realizó la última modificación; ON DELETE SET NULL.                                      |
