/* =====================================================================
   PROYECTO      : Mesa de Ayuda TI - Nexa Servicios
   ASIGNATURA    : Ingeniería de Software II - Corporación Universitaria Remington
   AUTORES       : Francisco Javier Motta Quintero, Esteban Vásquez Valencia
   DOCENTE       : Lora Patiño Gloria Amparo
   ARCHIVO       : mesa_ayuda_ti_ddl.sql
   MOTOR         : MySQL 8.0.16 o superior (necesario para que CHECK se aplique)
   ORIGEN        : Modelo entidad-relación v2 (R01-R25) y Diccionario de datos v2
                   (18 tablas, 161 atributos) del documento «Proyecto» (cap. 7 y 8).
   TRAZABILIDAD  : Reglas de negocio RN-01 a RN-30 de la Fase 1 v2 (cap. 2.1).

   ---------------------------------------------------------------------
   HISTORIAL DE VERSIONES
   ---------------------------------------------------------------------
   Versión | Fecha       | Autor                          | Cambio
   --------+-------------+--------------------------------+-------------------------------
   1.0     | 2026-11-04  | Equipo del proyecto (IS2)      | Primera versión del DDL: 18
           |             |                                | tablas, FK, CHECK, UNIQUE,
           |             |                                | datos semilla y verificaciones.
   ---------------------------------------------------------------------

   CONVENCIONES DE NOMBRES
     pk_<tabla>                    clave primaria
     fk_<hija>_<padre|rol>         clave foránea
     uq_<tabla>_<campo(s)>         restricción UNIQUE
     ck_<tabla>_<campo|regla>      restricción CHECK
     idx_<tabla>_<campo>           índice (columna marcada «Índice: Sí» en el diccionario)
     Cada restricción lleva al lado el comentario  -- RN-xx  con la regla de negocio
     que la respalda.

   ELIMINACIÓN LÓGICA
     Este script NO usa DELETE. Las bajas se hacen con estados (activo / inactivo,
     en_reparacion / dado_de_baja, vigente / usado / revocado, activo / eliminado).
     Las acciones ON DELETE que figuran en el diccionario se conservan solo como
     protección de integridad: no se ejecutan en la operación normal del sistema.

   NOTAS DE TRAZABILIDAD (leer antes de ejecutar)
     N1. El diccionario declara UNIQUE(nombre) solo en area. La RN-26 exige nombre
         único dentro de cada catálogo; por eso se agrega el UNIQUE a cargo,
         rol_empleado, tipo_activo, tipo_problema y tipo_solicitud (marcado «RN-26»).
         Pendiente: actualizar el diccionario para que lo declare.
     N2. Columnas de auditoría (fecha_creacion, fecha_actualizacion,
         id_usuario_modificacion, convención D23 del diccionario): no tienen RN
         propia; se indica «Diccionario D23».
     N3. MySQL no permite funciones no deterministas (CURRENT_DATE, NOW) dentro de
         un CHECK, ni CHECK sobre columnas que participan en una FK con
         CASCADE / SET NULL. Esas reglas quedan como comentario «NO IMPLEMENTABLE
         EN DDL» con la capa donde deben validarse.
   ===================================================================== */


/* =====================================================================
   1. BASE DE DATOS
   ===================================================================== */
DROP DATABASE IF EXISTS mesa_ayuda_ti;   -- solo para reinstalar el esquema de pruebas
CREATE DATABASE mesa_ayuda_ti
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
USE mesa_ayuda_ti;


/* =====================================================================
   2. TABLAS (orden por dependencias)
      Nivel 0: area, cargo, rol_empleado, usuario  (sin FK entre sí, salvo
               usuario -> catálogos)
      Nivel 1: token_recuperacion, info_personal_soporte, tipo_activo,
               tipo_problema, tipo_solicitud, tabla_importancia
      Nivel 2: activo, tiempo_atencion_sla
      Nivel 3: caso_soporte
      Nivel 4: comentario_caso, historial_caso, adjunto_caso, aviso
      Aparte : transicion_estado_caso
      Las FK de auditoría id_usuario_modificacion se agregan al final con
      ALTER TABLE (sección 3) porque usuario depende de los catálogos y los
      catálogos dependen de usuario (referencia circular).
   ===================================================================== */

/* ---------------------------------------------------------------------
   2.1 area  (Tabla 223 del diccionario) - catálogo de áreas
   --------------------------------------------------------------------- */
CREATE TABLE area (
    id_area                 INT          NOT NULL AUTO_INCREMENT,
    nombre_area             VARCHAR(100) NOT NULL,
    estado                  ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',
    fecha_creacion          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- Diccionario D23
    fecha_actualizacion     DATETIME     NULL,                                 -- Diccionario D23
    id_usuario_modificacion INT          NULL,                                 -- Diccionario D23 (FK en sección 3)
    CONSTRAINT pk_area PRIMARY KEY (id_area),
    CONSTRAINT uq_area_nombre_area UNIQUE (nombre_area),                       -- RN-26
    CONSTRAINT ck_area_estado CHECK (estado IN ('activo','inactivo'))          -- RN-30
) ENGINE=InnoDB COMMENT='Catálogo de áreas o departamentos (RN-18, RN-30)';

/* ---------------------------------------------------------------------
   2.2 cargo  (Tabla 224)
   --------------------------------------------------------------------- */
CREATE TABLE cargo (
    id_cargo                INT          NOT NULL AUTO_INCREMENT,
    nombre_cargo            VARCHAR(100) NOT NULL,
    estado                  ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',
    fecha_creacion          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- Diccionario D23
    fecha_actualizacion     DATETIME     NULL,                                 -- Diccionario D23
    id_usuario_modificacion INT          NULL,                                 -- Diccionario D23 (FK en sección 3)
    CONSTRAINT pk_cargo PRIMARY KEY (id_cargo),
    CONSTRAINT uq_cargo_nombre_cargo UNIQUE (nombre_cargo),                    -- RN-26 (ver nota N1)
    CONSTRAINT ck_cargo_estado CHECK (estado IN ('activo','inactivo'))         -- RN-30
) ENGINE=InnoDB COMMENT='Catálogo de cargos formales (RN-30)';

/* ---------------------------------------------------------------------
   2.3 rol_empleado  (Tabla 225)
   --------------------------------------------------------------------- */
CREATE TABLE rol_empleado (
    id_rol_empleado         INT          NOT NULL AUTO_INCREMENT,
    nombre_rol              VARCHAR(100) NOT NULL,
    estado                  ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',
    fecha_creacion          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- Diccionario D23
    fecha_actualizacion     DATETIME     NULL,                                 -- Diccionario D23
    id_usuario_modificacion INT          NULL,                                 -- Diccionario D23 (FK en sección 3)
    CONSTRAINT pk_rol_empleado PRIMARY KEY (id_rol_empleado),
    CONSTRAINT uq_rol_empleado_nombre_rol UNIQUE (nombre_rol),                 -- RN-26 (ver nota N1)
    CONSTRAINT ck_rol_empleado_estado CHECK (estado IN ('activo','inactivo'))  -- RN-30
) ENGINE=InnoDB COMMENT='Clasificación jerárquica del empleado (RN-30)';

/* ---------------------------------------------------------------------
   2.4 usuario  (Tabla 226) - identidad y credenciales
   --------------------------------------------------------------------- */
CREATE TABLE usuario (
    id_usuario              INT          NOT NULL AUTO_INCREMENT,
    nombre                  VARCHAR(120) NOT NULL,
    correo                  VARCHAR(150) NOT NULL,
    telefono                VARCHAR(20)  NULL,                                 -- RN-01 (dato de contacto, D21)
    contrasena_hash         VARCHAR(255) NOT NULL,                             -- RN-19 (solo hash, nunca texto legible)
    intentos_fallidos       INT          NOT NULL DEFAULT 0,                   -- RN-20
    fecha_bloqueo           DATETIME     NULL,                                 -- RN-20
    id_cargo                INT          NULL,
    id_area                 INT          NULL,                                 -- RN-18
    id_rol_organizacional   INT          NULL,                                 -- (antes id_rol_empleado)
    perfil_acceso           ENUM('solicitante','soporte','supervisor','administrador') NOT NULL,   -- RN-23
    estado_usuario          ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',                  -- RN-21
    fecha_registro          DATE         NOT NULL DEFAULT (CURRENT_DATE),
    fecha_actualizacion     DATETIME     NULL,                                 -- Diccionario D23 (v2)
    id_usuario_modificacion INT          NULL,                                 -- Diccionario D23 (v2) (FK en sección 3)
    CONSTRAINT pk_usuario PRIMARY KEY (id_usuario),
    CONSTRAINT uq_usuario_correo UNIQUE (correo),                                          -- RN-17
    CONSTRAINT ck_usuario_correo_formato CHECK (correo LIKE '%@%.%'),                      -- RN-17
    CONSTRAINT ck_usuario_perfil_acceso
        CHECK (perfil_acceso IN ('solicitante','soporte','supervisor','administrador')),   -- RN-23
    CONSTRAINT ck_usuario_estado_usuario CHECK (estado_usuario IN ('activo','inactivo')),  -- RN-21
    CONSTRAINT fk_usuario_cargo
        FOREIGN KEY (id_cargo) REFERENCES cargo (id_cargo)
        ON DELETE RESTRICT ON UPDATE CASCADE,                                              -- R01 · RN-30
    CONSTRAINT fk_usuario_area
        FOREIGN KEY (id_area) REFERENCES area (id_area)
        ON DELETE RESTRICT ON UPDATE CASCADE,                                              -- R02 · RN-18
    CONSTRAINT fk_usuario_rol_empleado
        FOREIGN KEY (id_rol_organizacional) REFERENCES rol_empleado (id_rol_empleado)
        ON DELETE RESTRICT ON UPDATE CASCADE                                               -- R03 · RN-30
) ENGINE=InnoDB COMMENT='Personas que usan el sistema (RN-17 a RN-23)';
-- fecha_registro: el diccionario pide CHECK(fecha_registro <= CURRENT_DATE).
--   NO IMPLEMENTABLE EN DDL (MySQL prohíbe CURRENT_DATE en un CHECK). Validar en la
--   capa de servicio o con un trigger BEFORE INSERT/UPDATE. Diccionario v2 (sin RN).
-- RN-18: un usuario con perfil_acceso='solicitante' debe tener id_area. El diccionario
--   la deja anulable en BD y MySQL no permite un CHECK sobre una columna con FK
--   ON UPDATE CASCADE. NO IMPLEMENTABLE EN DDL: validar en la capa de servicio.
-- RN-20: al llegar a 4 intentos_fallidos la cuenta se bloquea (fecha_bloqueo) hasta que
--   un administrador la desbloquee. NO IMPLEMENTABLE EN DDL: lógica de autenticación
--   (capa de servicio).
-- RN-21: un usuario inactivo no inicia sesión, pero sus casos y comentarios se
--   conservan. Validación de acceso en la capa de servicio; no se borra el usuario.
-- RN-23: el acceso por perfil y sesión se controla en la capa de servicio.

/* ---------------------------------------------------------------------
   2.5 token_recuperacion  (Tabla 227) - nueva en C12
   --------------------------------------------------------------------- */
CREATE TABLE token_recuperacion (
    id_token          INT          NOT NULL AUTO_INCREMENT,
    id_usuario        INT          NOT NULL,
    token_hash        VARCHAR(255) NOT NULL,                                   -- RN-19
    fecha_generacion  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_expiracion  DATETIME     NOT NULL,
    fecha_uso         DATETIME     NULL,
    estado_token      ENUM('vigente','usado','revocado') NOT NULL DEFAULT 'vigente',
    CONSTRAINT pk_token_recuperacion PRIMARY KEY (id_token),
    CONSTRAINT uq_token_recuperacion_token_hash UNIQUE (token_hash),           -- RN-19, RN-22
    CONSTRAINT ck_token_expiracion CHECK (fecha_expiracion > fecha_generacion),-- RN-22 (el enlace vence)
    CONSTRAINT ck_token_fecha_uso
        CHECK (fecha_uso IS NULL OR fecha_uso >= fecha_generacion),            -- RN-22 (un solo uso)
    CONSTRAINT ck_token_estado CHECK (estado_token IN ('vigente','usado','revocado')),  -- RN-22
    CONSTRAINT fk_token_usuario
        FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
        ON DELETE CASCADE ON UPDATE CASCADE                                    -- R05 · RN-22
) ENGINE=InnoDB COMMENT='Tokens de recuperación de contraseña (RN-19, RN-22)';
CREATE INDEX idx_token_usuario ON token_recuperacion (id_usuario);             -- diccionario: Índice = Sí
-- RN-22: solicitar un enlace nuevo invalida el anterior (pasa a 'revocado') y el enlace
--   vence en máximo 30 minutos (RNF de seguridad). NO IMPLEMENTABLE EN DDL: validar en
--   la capa de servicio (o con trigger) al emitir y al consumir el token.

/* ---------------------------------------------------------------------
   2.6 info_personal_soporte  (Tabla 237) - extensión 1:1 de usuario
   --------------------------------------------------------------------- */
CREATE TABLE info_personal_soporte (
    id_info_soporte      INT      NOT NULL AUTO_INCREMENT,
    id_usuario_soporte   INT      NOT NULL,
    disponibilidad       ENUM('disponible','ocupado','ausente') NOT NULL,
    fecha_actualizacion  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_info_personal_soporte PRIMARY KEY (id_info_soporte),
    CONSTRAINT uq_info_soporte_usuario UNIQUE (id_usuario_soporte),            -- RN-28 (1:1, R04)
    CONSTRAINT ck_info_soporte_disponibilidad
        CHECK (disponibilidad IN ('disponible','ocupado','ausente')),          -- RN-28
    CONSTRAINT fk_info_soporte_usuario
        FOREIGN KEY (id_usuario_soporte) REFERENCES usuario (id_usuario)
        ON DELETE CASCADE ON UPDATE CASCADE                                    -- R04 · RN-28
) ENGINE=InnoDB COMMENT='Disponibilidad del personal de soporte (RN-28)';
-- RN-28: solo el personal con perfil_acceso='soporte' tiene esta fila. NO IMPLEMENTABLE
--   EN DDL (requiere consultar usuario): validar con trigger o en la capa de servicio.

/* ---------------------------------------------------------------------
   2.7 tipo_activo  (Tabla 229)
   --------------------------------------------------------------------- */
CREATE TABLE tipo_activo (
    id_tipo_activo          INT          NOT NULL AUTO_INCREMENT,
    nombre                  VARCHAR(100) NOT NULL,                             -- RN-24 (tipo obligatorio)
    descripcion             TEXT         NULL,
    estado                  ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',
    fecha_creacion          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- Diccionario D23
    fecha_actualizacion     DATETIME     NULL,                                 -- Diccionario D23
    id_usuario_modificacion INT          NULL,                                 -- Diccionario D23 (FK en sección 3)
    CONSTRAINT pk_tipo_activo PRIMARY KEY (id_tipo_activo),
    CONSTRAINT uq_tipo_activo_nombre UNIQUE (nombre),                          -- RN-26 (ver nota N1)
    CONSTRAINT ck_tipo_activo_estado CHECK (estado IN ('activo','inactivo'))   -- RN-30
) ENGINE=InnoDB COMMENT='Catálogo de tipos de equipo (RN-24, RN-30)';

/* ---------------------------------------------------------------------
   2.8 tipo_problema  (Tabla 231)
   --------------------------------------------------------------------- */
CREATE TABLE tipo_problema (
    id_tipo_problema        INT          NOT NULL AUTO_INCREMENT,
    nombre                  VARCHAR(100) NOT NULL,
    descripcion             TEXT         NULL,
    estado                  ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',
    fecha_creacion          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- Diccionario D23
    fecha_actualizacion     DATETIME     NULL,                                 -- Diccionario D23
    id_usuario_modificacion INT          NULL,                                 -- Diccionario D23 (FK en sección 3)
    CONSTRAINT pk_tipo_problema PRIMARY KEY (id_tipo_problema),
    CONSTRAINT uq_tipo_problema_nombre UNIQUE (nombre),                        -- RN-26 (ver nota N1)
    CONSTRAINT ck_tipo_problema_estado CHECK (estado IN ('activo','inactivo')) -- RN-04, RN-30
) ENGINE=InnoDB COMMENT='Catálogo de tipos de problema (RN-04, RN-30)';

/* ---------------------------------------------------------------------
   2.9 tipo_solicitud  (Tabla 232)
   --------------------------------------------------------------------- */
CREATE TABLE tipo_solicitud (
    id_tipo_solicitud       INT          NOT NULL AUTO_INCREMENT,
    nombre                  VARCHAR(100) NOT NULL,
    descripcion             TEXT         NULL,
    estado                  ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',
    fecha_creacion          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- Diccionario D23
    fecha_actualizacion     DATETIME     NULL,                                 -- Diccionario D23
    id_usuario_modificacion INT          NULL,                                 -- Diccionario D23 (FK en sección 3)
    CONSTRAINT pk_tipo_solicitud PRIMARY KEY (id_tipo_solicitud),
    CONSTRAINT uq_tipo_solicitud_nombre UNIQUE (nombre),                       -- RN-26 (ver nota N1)
    CONSTRAINT ck_tipo_solicitud_estado CHECK (estado IN ('activo','inactivo'))-- RN-04, RN-30
) ENGINE=InnoDB COMMENT='Catálogo de tipos de solicitud (RN-04, RN-30)';
-- RN-04: los tipos se eligen solo entre los de estado 'activo'; los casos anteriores
--   conservan el tipo inactivo. NO IMPLEMENTABLE EN DDL: filtrar en la capa de servicio.

/* ---------------------------------------------------------------------
   2.10 tabla_importancia  (Tabla 233) - matriz de prioridad
   --------------------------------------------------------------------- */
CREATE TABLE tabla_importancia (
    id_tabla_importancia    INT          NOT NULL AUTO_INCREMENT,
    afectacion              ENUM('usuario','area','empresa') NOT NULL,
    urgencia                ENUM('baja','media','alta','critica') NOT NULL,
    resultado_importancia   ENUM('P1','P2','P3','P4') NOT NULL,
    estado                  ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',
    fecha_creacion          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- Diccionario D23
    fecha_actualizacion     DATETIME     NULL,                                 -- Diccionario D23
    id_usuario_modificacion INT          NULL,                                 -- Diccionario D23 (FK en sección 3)
    CONSTRAINT pk_tabla_importancia PRIMARY KEY (id_tabla_importancia),
    CONSTRAINT uq_tabla_importancia_afectacion_urgencia
        UNIQUE (afectacion, urgencia),                                         -- RN-05 (C10)
    CONSTRAINT ck_tabla_importancia_afectacion
        CHECK (afectacion IN ('usuario','area','empresa')),                    -- RN-05
    CONSTRAINT ck_tabla_importancia_urgencia
        CHECK (urgencia IN ('baja','media','alta','critica')),                 -- RN-05
    CONSTRAINT ck_tabla_importancia_resultado
        CHECK (resultado_importancia IN ('P1','P2','P3','P4')),                -- RN-05
    CONSTRAINT ck_tabla_importancia_estado CHECK (estado IN ('activo','inactivo'))   -- RN-05
) ENGINE=InnoDB COMMENT='Matriz de prioridad afectación x urgencia = P1..P4 (RN-05)';
-- RN-05: la importancia se fija UNA vez al crear el caso y no se recalcula; la capa de
--   servicio la obtiene de esta tabla. NO IMPLEMENTABLE EN DDL.

/* ---------------------------------------------------------------------
   2.11 activo  (Tabla 228)
   --------------------------------------------------------------------- */
CREATE TABLE activo (
    id_activo               INT          NOT NULL AUTO_INCREMENT,
    nombre                  VARCHAR(100) NOT NULL,                             -- RN-24
    id_tipo_activo          INT          NOT NULL,                             -- RN-24
    marca                   VARCHAR(60)  NULL,
    modelo                  VARCHAR(60)  NULL,
    numero_serie            VARCHAR(60)  NULL,
    id_area                 INT          NULL,
    estado                  ENUM('activo','en_reparacion','dado_de_baja') NOT NULL DEFAULT 'activo',
    fecha_adquisicion       DATE         NULL,
    fecha_creacion          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- Diccionario D23
    fecha_actualizacion     DATETIME     NULL,                                 -- Diccionario D23
    id_usuario_modificacion INT          NULL,                                 -- Diccionario D23 (FK en sección 3)
    CONSTRAINT pk_activo PRIMARY KEY (id_activo),
    CONSTRAINT uq_activo_numero_serie UNIQUE (numero_serie),                   -- RN-24 (permite varios NULL)
    CONSTRAINT ck_activo_estado
        CHECK (estado IN ('activo','en_reparacion','dado_de_baja')),           -- RN-25
    CONSTRAINT fk_activo_tipo_activo
        FOREIGN KEY (id_tipo_activo) REFERENCES tipo_activo (id_tipo_activo)
        ON DELETE RESTRICT ON UPDATE CASCADE,                                  -- R07 · RN-24
    CONSTRAINT fk_activo_area
        FOREIGN KEY (id_area) REFERENCES area (id_area)
        ON DELETE RESTRICT ON UPDATE CASCADE                                   -- R06 · RN-24
) ENGINE=InnoDB COMMENT='Equipos de la empresa (RN-24, RN-25)';
-- RN-25: un activo 'dado_de_baja' no puede relacionarse con casos nuevos; los casos
--   anteriores conservan la relación. NO IMPLEMENTABLE EN DDL: validar en la capa de
--   servicio o con trigger BEFORE INSERT sobre caso_soporte. No se borra el activo.

/* ---------------------------------------------------------------------
   2.12 tiempo_atencion_sla  (Tabla 238)
   --------------------------------------------------------------------- */
CREATE TABLE tiempo_atencion_sla (
    id_tiempo_atencion      INT          NOT NULL AUTO_INCREMENT,
    id_tabla_importancia    INT          NOT NULL,
    tipo_caso               ENUM('problema','solicitud') NOT NULL,
    fecha_inicio_vigencia   DATE         NOT NULL DEFAULT (CURRENT_DATE),
    fecha_fin_vigencia      DATE         NULL,
    tiempo_respuesta        INT          NOT NULL,                             -- minutos calendario (RN-13)
    tiempo_solucion         INT          NOT NULL,                             -- minutos calendario (RN-13)
    estado                  ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',
    fecha_creacion          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- Diccionario D23
    fecha_actualizacion     DATETIME     NULL,                                 -- Diccionario D23
    id_usuario_modificacion INT          NULL,                                 -- Diccionario D23 (FK en sección 3)
    CONSTRAINT pk_tiempo_atencion_sla PRIMARY KEY (id_tiempo_atencion),
    CONSTRAINT uq_sla_importancia_tipo_vigencia
        UNIQUE (id_tabla_importancia, tipo_caso, fecha_inicio_vigencia),       -- RN-13 (C13)
    CONSTRAINT ck_sla_tipo_caso CHECK (tipo_caso IN ('problema','solicitud')), -- RN-13
    CONSTRAINT ck_sla_vigencia
        CHECK (fecha_fin_vigencia IS NULL
               OR fecha_fin_vigencia > fecha_inicio_vigencia),                 -- RN-13 (versionado)
    CONSTRAINT ck_sla_estado CHECK (estado IN ('activo','inactivo')),          -- RN-13
    CONSTRAINT fk_sla_tabla_importancia
        FOREIGN KEY (id_tabla_importancia) REFERENCES tabla_importancia (id_tabla_importancia)
        ON DELETE RESTRICT ON UPDATE CASCADE                                   -- R15 · RN-13
) ENGINE=InnoDB COMMENT='Reglas de tiempos de respuesta y solución, versionadas (RN-13, RN-14)';
-- RN-13: «solo hay una regla activa por combinación (importancia + tipo de caso)». El
--   UNIQUE anterior impide repetir la misma fecha de inicio, pero no que dos versiones
--   con fecha_fin_vigencia NULL convivan. NO IMPLEMENTABLE EN DDL: validar en la capa
--   de servicio (cerrar la versión anterior con fecha_fin_vigencia al crear la nueva).
-- RN-14: un caso está atrasado si supera tiempo_respuesta o tiempo_solucion. Se calcula
--   en la capa de servicio (cumpleSLA()); no se almacena.

/* ---------------------------------------------------------------------
   2.13 caso_soporte  (Tabla 230) - entidad central
   --------------------------------------------------------------------- */
CREATE TABLE caso_soporte (
    id_caso                 INT          NOT NULL AUTO_INCREMENT,
    numero_seguimiento      VARCHAR(30)  NOT NULL,                             -- RN-02
    titulo                  VARCHAR(150) NOT NULL,                             -- RN-01
    descripcion             TEXT         NOT NULL,                             -- RN-01
    lugar                   VARCHAR(120) NOT NULL,                             -- RN-01
    estado_caso             ENUM('recibido','en_revision','en_atencion','resuelto','cerrado','reabierto')
                            NOT NULL DEFAULT 'recibido',                       -- RN-07
    id_usuario_solicitante  INT          NOT NULL,                             -- RN-06
    id_personal_asignado    INT          NULL,                                 -- RN-09
    id_activo               INT          NULL,                                 -- RN-25 (opcional)
    id_tabla_importancia    INT          NOT NULL,                             -- RN-01, RN-05
    id_tiempo_atencion      INT          NOT NULL,                             -- RN-13
    tipo_caso               ENUM('problema','solicitud') NOT NULL,             -- RN-03
    id_tipo_problema        INT          NULL,                                 -- RN-03
    id_tipo_solicitud       INT          NULL,                                 -- RN-03
    clase_solicitud         ENUM('nuevo','cambio','consulta') NULL,            -- RN-03
    fecha_creacion          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_primera_respuesta DATETIME     NULL,
    fecha_solucion          DATETIME     NULL,
    fecha_cierre            DATETIME     NULL,
    contador_reaperturas    INT          NOT NULL DEFAULT 0,                   -- RN-11
    motivo_reapertura       TEXT         NULL,                                 -- RN-11
    CONSTRAINT pk_caso_soporte PRIMARY KEY (id_caso),
    CONSTRAINT uq_caso_numero_seguimiento UNIQUE (numero_seguimiento),         -- RN-02
    CONSTRAINT ck_caso_numero_seguimiento_formato
        CHECK (numero_seguimiento REGEXP '^MA-[0-9]{4}-[0-9]{6}$'),            -- RN-02 (formato MA-AAAA-NNNNNN)
    CONSTRAINT ck_caso_estado_caso
        CHECK (estado_caso IN ('recibido','en_revision','en_atencion','resuelto','cerrado','reabierto')),  -- RN-07
    CONSTRAINT ck_caso_tipo_caso CHECK (tipo_caso IN ('problema','solicitud')),                       -- RN-03
    CONSTRAINT ck_caso_clase_solicitud
        CHECK (clase_solicitud IN ('nuevo','cambio','consulta')),              -- RN-03
    CONSTRAINT ck_caso_clasificacion_exclusiva
        CHECK (   (tipo_caso = 'problema'
                   AND id_tipo_problema  IS NOT NULL
                   AND id_tipo_solicitud IS NULL
                   AND clase_solicitud   IS NULL)
               OR (tipo_caso = 'solicitud'
                   AND id_tipo_solicitud IS NOT NULL
                   AND clase_solicitud   IS NOT NULL
                   AND id_tipo_problema  IS NULL)),                            -- RN-03 (problema o solicitud, nunca ambos)
    CONSTRAINT ck_caso_primera_respuesta
        CHECK (fecha_primera_respuesta >= fecha_creacion),                     -- RN-14
    CONSTRAINT ck_caso_fecha_solucion
        CHECK (fecha_solucion >= fecha_primera_respuesta),                     -- RN-14
    CONSTRAINT ck_caso_fecha_cierre CHECK (fecha_cierre >= fecha_solucion),    -- RN-12
    CONSTRAINT ck_caso_contador_reaperturas CHECK (contador_reaperturas >= 0), -- RN-11
    CONSTRAINT fk_caso_solicitante
        FOREIGN KEY (id_usuario_solicitante) REFERENCES usuario (id_usuario)
        ON DELETE RESTRICT ON UPDATE CASCADE,                                  -- R08 · RN-06
    CONSTRAINT fk_caso_asignado
        FOREIGN KEY (id_personal_asignado) REFERENCES usuario (id_usuario)
        ON DELETE RESTRICT ON UPDATE CASCADE,                                  -- R09 · RN-09
    CONSTRAINT fk_caso_activo
        FOREIGN KEY (id_activo) REFERENCES activo (id_activo)
        ON DELETE RESTRICT ON UPDATE CASCADE,                                  -- R10 · RN-25
    CONSTRAINT fk_caso_tabla_importancia
        FOREIGN KEY (id_tabla_importancia) REFERENCES tabla_importancia (id_tabla_importancia)
        ON DELETE RESTRICT ON UPDATE CASCADE,                                  -- R13 · RN-05
    CONSTRAINT fk_caso_tiempo_atencion
        FOREIGN KEY (id_tiempo_atencion) REFERENCES tiempo_atencion_sla (id_tiempo_atencion)
        ON DELETE RESTRICT ON UPDATE CASCADE,                                  -- R14 · RN-13
    CONSTRAINT fk_caso_tipo_problema
        FOREIGN KEY (id_tipo_problema) REFERENCES tipo_problema (id_tipo_problema)
        ON DELETE RESTRICT,                                                    -- R11 · RN-04
    CONSTRAINT fk_caso_tipo_solicitud
        FOREIGN KEY (id_tipo_solicitud) REFERENCES tipo_solicitud (id_tipo_solicitud)
        ON DELETE RESTRICT                                                     -- R12 · RN-04
) ENGINE=InnoDB COMMENT='Caso de soporte, entidad central (RN-01 a RN-14, RN-25)';
CREATE INDEX idx_caso_estado_caso         ON caso_soporte (estado_caso);          -- diccionario: Índice = Sí
CREATE INDEX idx_caso_solicitante         ON caso_soporte (id_usuario_solicitante); -- diccionario: Índice = Sí
CREATE INDEX idx_caso_personal_asignado   ON caso_soporte (id_personal_asignado);   -- diccionario: Índice = Sí
CREATE INDEX idx_caso_fecha_creacion      ON caso_soporte (fecha_creacion);         -- diccionario: Índice = Sí
-- (numero_seguimiento ya está indexado por uq_caso_numero_seguimiento.)
--
-- Reglas del caso que NO son implementables con restricciones estándar:
-- RN-01: un caso solo se envía con qué necesita, dónde, a quiénes afecta, urgencia y datos
--   de contacto del solicitante (teléfono o correo). Las columnas están NOT NULL; el dato
--   de contacto vive en usuario. Validar en la capa de servicio.
-- RN-02: el número se genera en la aplicación (formato y unicidad ya cubiertos arriba).
-- RN-05: id_tabla_importancia se fija al crear el caso y no se recalcula (servicio).
-- RN-06: un solicitante solo consulta sus casos (capa de servicio / vistas por perfil).
-- RN-07: las transiciones de estado_caso deben existir en transicion_estado_caso para el
--   perfil que las ejecuta. Validar en servicio o con trigger BEFORE UPDATE.
-- RN-09: id_personal_asignado debe ser un usuario con perfil_acceso='soporte'. Trigger
--   BEFORE INSERT/UPDATE o servicio (una FK no puede verificar el perfil).
-- RN-11: reapertura solo desde 'resuelto', dentro de 5 días hábiles y con motivo; suma 1 a
--   contador_reaperturas. Servicio.
-- RN-12: el cierre automático a los 5 días hábiles lo ejecuta una tarea programada.
-- RN-13: id_tiempo_atencion debe corresponder a la importancia y al tipo_caso del caso y
--   conservar la regla vigente al crearlo. Servicio / trigger.
-- RN-14: «atrasado» se calcula con cumpleSLA(); no se almacena.

/* ---------------------------------------------------------------------
   2.14 comentario_caso  (Tabla 234)
   --------------------------------------------------------------------- */
CREATE TABLE comentario_caso (
    id_comentario     INT      NOT NULL AUTO_INCREMENT,
    id_caso           INT      NOT NULL,
    id_usuario_autor  INT      NOT NULL,
    comentario        TEXT     NOT NULL,
    visibilidad       ENUM('usuario','interno_soporte') NOT NULL,
    fecha_comentario  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_comentario_caso PRIMARY KEY (id_comentario),
    CONSTRAINT ck_comentario_no_vacio CHECK (TRIM(comentario) <> ''),          -- RN-10
    CONSTRAINT ck_comentario_visibilidad
        CHECK (visibilidad IN ('usuario','interno_soporte')),                  -- RN-10, RN-06
    CONSTRAINT fk_comentario_caso
        FOREIGN KEY (id_caso) REFERENCES caso_soporte (id_caso)
        ON DELETE CASCADE ON UPDATE CASCADE,                                   -- R16 · RN-10
    CONSTRAINT fk_comentario_autor
        FOREIGN KEY (id_usuario_autor) REFERENCES usuario (id_usuario)
        ON DELETE RESTRICT ON UPDATE CASCADE                                   -- R17 · RN-10
) ENGINE=InnoDB COMMENT='Comentarios del caso (RN-06, RN-10)';
-- RN-06 / RN-10: el solicitante nunca ve comentarios con visibilidad 'interno_soporte'.
--   NO IMPLEMENTABLE EN DDL: filtrar por perfil en la capa de servicio o con vistas.

/* ---------------------------------------------------------------------
   2.15 historial_caso  (Tabla 235) - bitácora inmutable
   --------------------------------------------------------------------- */
CREATE TABLE historial_caso (
    id_historial       INT          NOT NULL AUTO_INCREMENT,
    id_caso            INT          NOT NULL,
    id_usuario_accion  INT          NOT NULL,
    accion             ENUM('creacion','cambio_estado','reasignacion','comentario','adjunto',
                            'cierre','reapertura','cambio_clasificacion') NOT NULL,
    campo_modificado   VARCHAR(60)  NULL,
    valor_anterior     TEXT         NULL,
    valor_nuevo        TEXT         NULL,
    motivo             VARCHAR(255) NULL,                                      -- (v2) reapertura / corrección
    fecha_accion       DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_historial_caso PRIMARY KEY (id_historial),
    CONSTRAINT ck_historial_accion
        CHECK (accion IN ('creacion','cambio_estado','reasignacion','comentario','adjunto',
                          'cierre','reapertura','cambio_clasificacion')),      -- RN-08
    CONSTRAINT fk_historial_caso
        FOREIGN KEY (id_caso) REFERENCES caso_soporte (id_caso)
        ON DELETE RESTRICT ON UPDATE CASCADE,                                  -- R18 · RN-08 (protege el historial)
    CONSTRAINT fk_historial_usuario_accion
        FOREIGN KEY (id_usuario_accion) REFERENCES usuario (id_usuario)
        ON DELETE RESTRICT ON UPDATE CASCADE                                   -- R19 · RN-08
) ENGINE=InnoDB COMMENT='Bitácora inmutable de cambios del caso (RN-08)';
-- RN-08: el historial no se modifica ni se elimina. NO IMPLEMENTABLE con restricciones
--   estándar: crear triggers BEFORE UPDATE y BEFORE DELETE que lancen SIGNAL, o retirar
--   los permisos UPDATE/DELETE de esta tabla al usuario de la aplicación.

/* ---------------------------------------------------------------------
   2.16 adjunto_caso  (Tabla 236) - con borrado lógico (C09)
   --------------------------------------------------------------------- */
CREATE TABLE adjunto_caso (
    id_adjunto           INT          NOT NULL AUTO_INCREMENT,
    id_caso              INT          NOT NULL,
    id_usuario_autor     INT          NOT NULL,
    nombre_archivo       VARCHAR(150) NOT NULL,
    tipo_archivo         VARCHAR(50)  NOT NULL,
    ruta_almacenamiento  VARCHAR(255) NOT NULL,
    tamano_kb            INT          NOT NULL,
    fecha_carga          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado_adjunto       ENUM('activo','eliminado') NOT NULL DEFAULT 'activo',
    fecha_eliminacion    DATETIME     NULL,
    CONSTRAINT pk_adjunto_caso PRIMARY KEY (id_adjunto),
    CONSTRAINT ck_adjunto_tipo_archivo
        CHECK (tipo_archivo IN ('image/png','image/jpeg','application/pdf','text/plain')),  -- RN-27
    CONSTRAINT ck_adjunto_tamano CHECK (tamano_kb > 0 AND tamano_kb <= 10240),              -- RN-27 (máx. 10 MB)
    CONSTRAINT ck_adjunto_estado CHECK (estado_adjunto IN ('activo','eliminado')),          -- RN-27 (borrado lógico)
    CONSTRAINT ck_adjunto_fecha_eliminacion
        CHECK (fecha_eliminacion IS NULL OR fecha_eliminacion >= fecha_carga),              -- RN-27
    CONSTRAINT fk_adjunto_caso
        FOREIGN KEY (id_caso) REFERENCES caso_soporte (id_caso)
        ON DELETE CASCADE ON UPDATE CASCADE,                                   -- R20 · RN-27
    CONSTRAINT fk_adjunto_autor
        FOREIGN KEY (id_usuario_autor) REFERENCES usuario (id_usuario)
        ON DELETE RESTRICT ON UPDATE CASCADE                                   -- R21 · RN-27
) ENGINE=InnoDB COMMENT='Evidencias del caso, borrado lógico (RN-27)';
-- RN-27: eliminar un adjunto es lógico: estado_adjunto='eliminado' + fecha_eliminacion, y
--   queda el rastro en historial_caso (accion='adjunto'). Servicio.
-- fecha_eliminacion debe ser NULL mientras estado_adjunto='activo' (diccionario). No es
--   implementable como CHECK estándar sin duplicar la regla; validar en servicio.

/* ---------------------------------------------------------------------
   2.17 aviso  (Tabla 239)
   --------------------------------------------------------------------- */
CREATE TABLE aviso (
    id_aviso             INT          NOT NULL AUTO_INCREMENT,
    id_caso              INT          NOT NULL,
    id_usuario_destino   INT          NOT NULL,
    canal                ENUM('correo','aviso_emergente','detalle_del_caso') NOT NULL,
    mensaje              TEXT         NOT NULL,
    fecha_envio          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado_envio         ENUM('enviado','pendiente','fallido') NOT NULL,
    intentos             INT          NOT NULL DEFAULT 0,                      -- RN-15 (D24)
    fecha_ultimo_intento DATETIME     NULL,                                    -- RN-15 (D24)
    motivo_fallo         VARCHAR(255) NULL,                                    -- RN-15 (D24)
    fecha_lectura        DATETIME     NULL,                                    -- D24
    CONSTRAINT pk_aviso PRIMARY KEY (id_aviso),
    CONSTRAINT ck_aviso_canal
        CHECK (canal IN ('correo','aviso_emergente','detalle_del_caso')),      -- RN-15
    CONSTRAINT ck_aviso_estado_envio
        CHECK (estado_envio IN ('enviado','pendiente','fallido')),             -- RN-15
    CONSTRAINT fk_aviso_caso
        FOREIGN KEY (id_caso) REFERENCES caso_soporte (id_caso)
        ON DELETE CASCADE ON UPDATE CASCADE,                                   -- R22 · RN-15
    CONSTRAINT fk_aviso_usuario_destino
        FOREIGN KEY (id_usuario_destino) REFERENCES usuario (id_usuario)
        ON DELETE RESTRICT ON UPDATE CASCADE                                   -- R23 · RN-15
) ENGINE=InnoDB COMMENT='Avisos por cambios de situación (RN-15, RN-16)';
-- RN-15: todo cambio de situación genera un aviso (correo, aviso emergente y detalle del
--   caso); si el envío falla se guarda motivo_fallo y se reintenta hasta 3 veces con 5
--   minutos entre intentos (RNF). NO IMPLEMENTABLE EN DDL: servicio / tarea programada.
-- RN-16: el caso queda registrado aunque falle el correo: el aviso es una fila aparte con
--   estado_envio='fallido'; no hay dependencia del caso hacia el aviso.

/* ---------------------------------------------------------------------
   2.18 transicion_estado_caso  (Tabla 240) - nueva en D15
   --------------------------------------------------------------------- */
CREATE TABLE transicion_estado_caso (
    id_transicion           INT          NOT NULL AUTO_INCREMENT,
    estado_origen           ENUM('recibido','en_revision','en_atencion','resuelto','cerrado','reabierto') NOT NULL,
    estado_destino          ENUM('recibido','en_revision','en_atencion','resuelto','cerrado','reabierto') NOT NULL,
    perfil_autorizado       ENUM('solicitante','soporte','supervisor','administrador') NOT NULL,
    estado                  ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',
    fecha_creacion          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- Diccionario D23
    fecha_actualizacion     DATETIME     NULL,                                 -- Diccionario D23
    id_usuario_modificacion INT          NULL,                                 -- Diccionario D23 (FK en sección 3)
    CONSTRAINT pk_transicion_estado_caso PRIMARY KEY (id_transicion),
    CONSTRAINT uq_transicion_origen_destino_perfil
        UNIQUE (estado_origen, estado_destino, perfil_autorizado),             -- RN-07 (C11)
    CONSTRAINT ck_transicion_estado_origen
        CHECK (estado_origen IN ('recibido','en_revision','en_atencion','resuelto','cerrado','reabierto')),   -- RN-07
    CONSTRAINT ck_transicion_estado_destino
        CHECK (estado_destino IN ('recibido','en_revision','en_atencion','resuelto','cerrado','reabierto')),  -- RN-07
    CONSTRAINT ck_transicion_perfil
        CHECK (perfil_autorizado IN ('solicitante','soporte','supervisor','administrador')),                  -- RN-07
    CONSTRAINT ck_transicion_estado CHECK (estado IN ('activo','inactivo'))    -- RN-07
) ENGINE=InnoDB COMMENT='Transiciones de estado permitidas por perfil (RN-07)';


/* =====================================================================
   3. CLAVES FORÁNEAS DE AUDITORÍA (id_usuario_modificacion -> usuario)
      Se agregan después de crear usuario para resolver la referencia
      circular. Relaciones R24 y R25 y convención D23 del diccionario.
      SET NULL (no RESTRICT): la baja de un usuario no se bloquea por auditoría.
      Respaldo: Diccionario D23 y RN-21 (los usuarios se inactivan, no se borran).
   ===================================================================== */
ALTER TABLE usuario
    ADD CONSTRAINT fk_usuario_usuario_modificacion
    FOREIGN KEY (id_usuario_modificacion) REFERENCES usuario (id_usuario)
    ON DELETE SET NULL ON UPDATE CASCADE;                                      -- R25 · RN-21
ALTER TABLE area
    ADD CONSTRAINT fk_area_usuario_modificacion
    FOREIGN KEY (id_usuario_modificacion) REFERENCES usuario (id_usuario)
    ON DELETE SET NULL ON UPDATE CASCADE;                                      -- D23 · RN-30
ALTER TABLE cargo
    ADD CONSTRAINT fk_cargo_usuario_modificacion
    FOREIGN KEY (id_usuario_modificacion) REFERENCES usuario (id_usuario)
    ON DELETE SET NULL ON UPDATE CASCADE;                                      -- D23 · RN-30
ALTER TABLE rol_empleado
    ADD CONSTRAINT fk_rol_empleado_usuario_modificacion
    FOREIGN KEY (id_usuario_modificacion) REFERENCES usuario (id_usuario)
    ON DELETE SET NULL ON UPDATE CASCADE;                                      -- D23 · RN-30
ALTER TABLE tipo_activo
    ADD CONSTRAINT fk_tipo_activo_usuario_modificacion
    FOREIGN KEY (id_usuario_modificacion) REFERENCES usuario (id_usuario)
    ON DELETE SET NULL ON UPDATE CASCADE;                                      -- D23 · RN-30
ALTER TABLE tipo_problema
    ADD CONSTRAINT fk_tipo_problema_usuario_modificacion
    FOREIGN KEY (id_usuario_modificacion) REFERENCES usuario (id_usuario)
    ON DELETE SET NULL ON UPDATE CASCADE;                                      -- D23 · RN-30
ALTER TABLE tipo_solicitud
    ADD CONSTRAINT fk_tipo_solicitud_usuario_modificacion
    FOREIGN KEY (id_usuario_modificacion) REFERENCES usuario (id_usuario)
    ON DELETE SET NULL ON UPDATE CASCADE;                                      -- D23 · RN-30
ALTER TABLE tabla_importancia
    ADD CONSTRAINT fk_tabla_importancia_usuario_modificacion
    FOREIGN KEY (id_usuario_modificacion) REFERENCES usuario (id_usuario)
    ON DELETE SET NULL ON UPDATE CASCADE;                                      -- D23 · RN-05
ALTER TABLE activo
    ADD CONSTRAINT fk_activo_usuario_modificacion
    FOREIGN KEY (id_usuario_modificacion) REFERENCES usuario (id_usuario)
    ON DELETE SET NULL ON UPDATE CASCADE;                                      -- D23 · RN-24
ALTER TABLE tiempo_atencion_sla
    ADD CONSTRAINT fk_sla_usuario_modificacion
    FOREIGN KEY (id_usuario_modificacion) REFERENCES usuario (id_usuario)
    ON DELETE SET NULL ON UPDATE CASCADE;                                      -- D23 · RN-13
ALTER TABLE transicion_estado_caso
    ADD CONSTRAINT fk_transicion_usuario_modificacion
    FOREIGN KEY (id_usuario_modificacion) REFERENCES usuario (id_usuario)
    ON DELETE SET NULL ON UPDATE CASCADE;                                      -- R24 · RN-07


/* =====================================================================
   4. DATOS SEMILLA MÍNIMOS (INSERT válidos)
      Datos de PRUEBA coherentes con las historias de usuario (Marcela Ríos,
      Carlos Peña, caso MA-2026-000145). No son datos oficiales de Nexa.
      Las contraseñas son marcadores de posición, no hashes reales (RN-19).
      De la matriz de prioridad solo se cargan las cuatro combinaciones que
      documenta HU-022 (CA-1); el resto de la matriz no está documentado.
   ===================================================================== */

-- 4.1 Catálogos (RN-26, RN-30)
INSERT INTO area (id_area, nombre_area) VALUES
    (1, 'Contabilidad'),
    (2, 'Tecnología');
INSERT INTO cargo (id_cargo, nombre_cargo) VALUES
    (1, 'Analista contable'),
    (2, 'Técnico de soporte');
INSERT INTO rol_empleado (id_rol_empleado, nombre_rol) VALUES
    (1, 'administrativo'),
    (2, 'operativo'),
    (3, 'supervisor');

-- 4.2 Usuarios: un usuario por perfil (RN-17, RN-18, RN-19, RN-23)
INSERT INTO usuario (id_usuario, nombre, correo, telefono, contrasena_hash,
                     id_cargo, id_area, id_rol_organizacional, perfil_acceso) VALUES
    (1, 'Jorge (administrador de prueba)', 'jorge.admin@nexa.test',   '3000000001', 'HASH_DE_PRUEBA_01', 2, 2, 3, 'administrador'),
    (2, 'Carlos Peña',                     'carlos.pena@nexa.test',   '3000000002', 'HASH_DE_PRUEBA_02', 2, 2, 2, 'soporte'),
    (3, 'Marcela Ríos',                    'marcela.rios@nexa.test',  '3000000003', 'HASH_DE_PRUEBA_03', 1, 1, 1, 'solicitante'),
    (4, 'Supervisor de prueba',            'supervisor@nexa.test',    '3000000004', 'HASH_DE_PRUEBA_04', 2, 2, 3, 'supervisor');

-- 4.3 Disponibilidad del personal de soporte (RN-28)
INSERT INTO info_personal_soporte (id_usuario_soporte, disponibilidad) VALUES (2, 'disponible');

-- 4.4 Token de recuperación (RN-19, RN-22)
INSERT INTO token_recuperacion (id_usuario, token_hash, fecha_generacion, fecha_expiracion, estado_token) VALUES
    (3, 'HASH_TOKEN_DE_PRUEBA_01', '2026-03-10 09:00:00', '2026-03-10 09:30:00', 'vigente');

-- 4.5 Catálogos de clasificación y activos (RN-04, RN-24)
INSERT INTO tipo_activo (id_tipo_activo, nombre) VALUES (1, 'Computador'), (2, 'Impresora');
INSERT INTO tipo_problema (id_tipo_problema, nombre) VALUES (1, 'Internet'), (2, 'Hardware');
INSERT INTO tipo_solicitud (id_tipo_solicitud, nombre) VALUES (1, 'Acceso');
INSERT INTO activo (id_activo, nombre, id_tipo_activo, marca, modelo, numero_serie, id_area) VALUES
    (1, 'Portátil de contabilidad', 1, 'MarcaPrueba', 'ModeloPrueba', 'SN-0001', 1),
    (2, 'Impresora de contabilidad', 2, NULL, NULL, NULL, 1);   -- serie opcional (RN-24)

-- 4.5b Auditoría D23: quién cargó los catálogos
UPDATE area SET fecha_actualizacion = CURRENT_TIMESTAMP, id_usuario_modificacion = 1 WHERE id_area = 1;

-- 4.6 Matriz de prioridad: solo combinaciones documentadas en HU-022 CA-1 (RN-05)
INSERT INTO tabla_importancia (id_tabla_importancia, afectacion, urgencia, resultado_importancia) VALUES
    (1, 'empresa', 'critica', 'P1'),
    (2, 'area',    'critica', 'P1'),
    (3, 'empresa', 'baja',    'P3'),
    (4, 'usuario', 'baja',    'P4');

-- 4.7 Regla de tiempos: P1 + problema, 30 min de respuesta y 240 de solución (HU-029, RN-13)
INSERT INTO tiempo_atencion_sla (id_tiempo_atencion, id_tabla_importancia, tipo_caso,
                                 fecha_inicio_vigencia, tiempo_respuesta, tiempo_solucion) VALUES
    (1, 1, 'problema', '2026-01-01', 30, 240);

-- 4.8 Transiciones permitidas (HU-003, HU-007, HU-013; RN-07)
INSERT INTO transicion_estado_caso (estado_origen, estado_destino, perfil_autorizado) VALUES
    ('recibido',    'en_revision', 'soporte'),
    ('en_revision', 'en_atencion', 'soporte'),
    ('en_atencion', 'resuelto',    'soporte'),
    ('resuelto',    'cerrado',     'soporte'),
    ('resuelto',    'reabierto',   'solicitante');
-- Nota: «resuelto -> cerrado» también lo hace el sistema por vencimiento (RN-12); el
-- perfil 'soporte' se carga aquí solo como dato de prueba.

-- 4.9 Casos de prueba
--     Caso 1 (HU-007): problema, en atención, con activo y responsable de soporte
INSERT INTO caso_soporte (id_caso, numero_seguimiento, titulo, descripcion, lugar, estado_caso,
                          id_usuario_solicitante, id_personal_asignado, id_activo,
                          id_tabla_importancia, id_tiempo_atencion, tipo_caso, id_tipo_problema,
                          fecha_creacion, fecha_primera_respuesta) VALUES
    (1, 'MA-2026-000145', 'Sin internet en contabilidad',
        'El computador no se conecta a la red desde la mañana.', 'Oficina de contabilidad',
        'en_atencion', 3, 2, 1, 1, 1, 'problema', 1,
        '2026-03-10 08:00:00', '2026-03-10 08:20:00');
--     Caso 2 (HU-007 CA-2): problema recibido, sin responsable ni activo (RN-25: activo opcional)
INSERT INTO caso_soporte (id_caso, numero_seguimiento, titulo, descripcion, lugar, estado_caso,
                          id_usuario_solicitante, id_tabla_importancia, id_tiempo_atencion,
                          tipo_caso, id_tipo_problema, fecha_creacion) VALUES
    (2, 'MA-2026-000150', 'Falla de hardware', 'La pantalla parpadea.', 'Sala de reuniones',
        'recibido', 3, 1, 1, 'problema', 2, '2026-03-10 10:00:00');
--     Caso 3 (RN-03): solicitud de tipo «Acceso», clase «nuevo». Reutiliza la regla de tiempos 1
--     solo por no haber otra cargada; que la regla corresponda al tipo de caso es RN-13 (servicio).
INSERT INTO caso_soporte (id_caso, numero_seguimiento, titulo, descripcion, lugar,
                          id_usuario_solicitante, id_tabla_importancia, id_tiempo_atencion,
                          tipo_caso, id_tipo_solicitud, clase_solicitud, fecha_creacion) VALUES
    (3, 'MA-2026-000151', 'Acceso a carpeta compartida', 'Necesito acceso a la carpeta de contabilidad.',
        'Oficina de contabilidad', 3, 4, 1, 'solicitud', 1, 'nuevo', '2026-03-10 11:00:00');

-- 4.10 Comentarios con visibilidad (RN-10)
INSERT INTO comentario_caso (id_caso, id_usuario_autor, comentario, visibilidad) VALUES
    (1, 2, 'Estamos revisando el punto de red.',            'usuario'),
    (1, 2, 'Posible falla del switch; escalar si persiste.', 'interno_soporte');

-- 4.11 Historial (RN-08)
INSERT INTO historial_caso (id_caso, id_usuario_accion, accion, campo_modificado, valor_anterior, valor_nuevo) VALUES
    (1, 3, 'creacion',      NULL,          NULL,          'recibido'),
    (1, 2, 'cambio_estado', 'estado_caso', 'recibido',    'en_revision'),
    (1, 2, 'cambio_estado', 'estado_caso', 'en_revision', 'en_atencion');

-- 4.12 Adjunto y su borrado lógico (RN-27)
INSERT INTO adjunto_caso (id_caso, id_usuario_autor, nombre_archivo, tipo_archivo, ruta_almacenamiento, tamano_kb) VALUES
    (1, 3, 'captura_error.png', 'image/png', '/almacen/privado/captura_error.png', 350);
UPDATE adjunto_caso
   SET estado_adjunto = 'eliminado', fecha_eliminacion = CURRENT_TIMESTAMP
 WHERE id_adjunto = 1;                                    -- borrado lógico, no se borra la fila

-- 4.13 Avisos (RN-15, RN-16): uno enviado y uno fallido
INSERT INTO aviso (id_caso, id_usuario_destino, canal, mensaje, estado_envio, intentos, fecha_ultimo_intento, motivo_fallo) VALUES
    (1, 3, 'detalle_del_caso', 'Su caso pasó a «en atención».', 'enviado', 1, '2026-03-10 08:25:00', NULL),
    (1, 3, 'correo',           'Su caso pasó a «en atención».', 'fallido', 1, '2026-03-10 08:25:00', 'Servidor de correo no disponible');


/* =====================================================================
   5. VERIFICACIONES: INSERT INVÁLIDOS (cada uno DEBE fallar)
      Para probarlos, quite el comentario de UNA sentencia a la vez. Cada una
      viola la restricción nombrada y la RN indicada.
      Nota: en modo estricto (el predeterminado de MySQL 8) el valor fuera de un
      ENUM se rechaza antes de evaluar el CHECK; el CHECK nombrado deja la regla
      escrita y la sigue haciendo cumplir si el servidor corre en modo no estricto.
   ===================================================================== */

-- 5.1 Debe fallar por RN-17 (correo duplicado, uq_usuario_correo)
-- INSERT INTO usuario (nombre, correo, contrasena_hash, perfil_acceso)
--     VALUES ('Otra Marcela', 'marcela.rios@nexa.test', 'HASH_X', 'solicitante');

-- 5.2 Debe fallar por RN-17 (correo sin formato válido, ck_usuario_correo_formato)
-- INSERT INTO usuario (nombre, correo, contrasena_hash, perfil_acceso)
--     VALUES ('Sin arroba', 'correo-invalido', 'HASH_X', 'solicitante');

-- 5.3 Debe fallar por RN-23 (perfil inexistente, ck_usuario_perfil_acceso)
-- INSERT INTO usuario (nombre, correo, contrasena_hash, perfil_acceso)
--     VALUES ('Perfil malo', 'perfil.malo@nexa.test', 'HASH_X', 'invitado');

-- 5.4 Debe fallar por RN-26 (área duplicada, uq_area_nombre_area)
-- INSERT INTO area (nombre_area) VALUES ('Contabilidad');

-- 5.5 Debe fallar por RN-30 (estado de catálogo inválido, ck_area_estado)
-- INSERT INTO area (nombre_area, estado) VALUES ('Compras', 'eliminada');

-- 5.6 Debe fallar por RN-24 (número de serie repetido, uq_activo_numero_serie)
-- INSERT INTO activo (nombre, id_tipo_activo, numero_serie) VALUES ('Otro portátil', 1, 'SN-0001');

-- 5.7 Debe fallar por RN-24 (tipo de activo obligatorio, NOT NULL id_tipo_activo)
-- INSERT INTO activo (nombre) VALUES ('Equipo sin tipo');

-- 5.8 Debe fallar por RN-25 (estado de activo inválido, ck_activo_estado)
-- INSERT INTO activo (nombre, id_tipo_activo, estado) VALUES ('Equipo raro', 1, 'perdido');

-- 5.9 Debe fallar por RN-02 (número de seguimiento repetido, uq_caso_numero_seguimiento)
-- INSERT INTO caso_soporte (numero_seguimiento, titulo, descripcion, lugar, id_usuario_solicitante,
--                           id_tabla_importancia, id_tiempo_atencion, tipo_caso, id_tipo_problema)
--     VALUES ('MA-2026-000145', 'Duplicado', 'x', 'x', 3, 1, 1, 'problema', 1);

-- 5.10 Debe fallar por RN-02 (formato incorrecto, ck_caso_numero_seguimiento_formato)
-- INSERT INTO caso_soporte (numero_seguimiento, titulo, descripcion, lugar, id_usuario_solicitante,
--                           id_tabla_importancia, id_tiempo_atencion, tipo_caso, id_tipo_problema)
--     VALUES ('CASO-1', 'Formato', 'x', 'x', 3, 1, 1, 'problema', 1);

-- 5.11 Debe fallar por RN-03 (problema con tipo de solicitud, ck_caso_clasificacion_exclusiva)
-- INSERT INTO caso_soporte (numero_seguimiento, titulo, descripcion, lugar, id_usuario_solicitante,
--                           id_tabla_importancia, id_tiempo_atencion, tipo_caso, id_tipo_problema,
--                           id_tipo_solicitud, clase_solicitud)
--     VALUES ('MA-2026-000160', 'Mezcla', 'x', 'x', 3, 1, 1, 'problema', 1, 1, 'nuevo');

-- 5.12 Debe fallar por RN-03 (solicitud sin clase, ck_caso_clasificacion_exclusiva)
-- INSERT INTO caso_soporte (numero_seguimiento, titulo, descripcion, lugar, id_usuario_solicitante,
--                           id_tabla_importancia, id_tiempo_atencion, tipo_caso, id_tipo_solicitud)
--     VALUES ('MA-2026-000161', 'Sin clase', 'x', 'x', 3, 1, 1, 'solicitud', 1);

-- 5.13 Debe fallar por RN-07 (estado de caso inexistente, ck_caso_estado_caso)
-- INSERT INTO caso_soporte (numero_seguimiento, titulo, descripcion, lugar, estado_caso,
--                           id_usuario_solicitante, id_tabla_importancia, id_tiempo_atencion,
--                           tipo_caso, id_tipo_problema)
--     VALUES ('MA-2026-000162', 'Estado malo', 'x', 'x', 'archivado', 3, 1, 1, 'problema', 1);

-- 5.14 Debe fallar por RN-14 (primera respuesta anterior a la creación, ck_caso_primera_respuesta)
-- INSERT INTO caso_soporte (numero_seguimiento, titulo, descripcion, lugar, id_usuario_solicitante,
--                           id_tabla_importancia, id_tiempo_atencion, tipo_caso, id_tipo_problema,
--                           fecha_creacion, fecha_primera_respuesta)
--     VALUES ('MA-2026-000163', 'Fechas', 'x', 'x', 3, 1, 1, 'problema', 1,
--             '2026-03-10 10:00:00', '2026-03-10 09:00:00');

-- 5.15 Debe fallar por RN-11 (contador de reaperturas negativo, ck_caso_contador_reaperturas)
-- INSERT INTO caso_soporte (numero_seguimiento, titulo, descripcion, lugar, id_usuario_solicitante,
--                           id_tabla_importancia, id_tiempo_atencion, tipo_caso, id_tipo_problema,
--                           contador_reaperturas)
--     VALUES ('MA-2026-000164', 'Reaperturas', 'x', 'x', 3, 1, 1, 'problema', 1, -1);

-- 5.16 Debe fallar por RN-01 (lugar obligatorio, NOT NULL lugar)
-- INSERT INTO caso_soporte (numero_seguimiento, titulo, descripcion, id_usuario_solicitante,
--                           id_tabla_importancia, id_tiempo_atencion, tipo_caso, id_tipo_problema)
--     VALUES ('MA-2026-000165', 'Sin lugar', 'x', 3, 1, 1, 'problema', 1);

-- 5.17 Debe fallar por RN-05 (misma afectación y urgencia, uq_tabla_importancia_afectacion_urgencia)
-- INSERT INTO tabla_importancia (afectacion, urgencia, resultado_importancia)
--     VALUES ('empresa', 'critica', 'P2');

-- 5.18 Debe fallar por RN-13 (misma regla con la misma vigencia, uq_sla_importancia_tipo_vigencia)
-- INSERT INTO tiempo_atencion_sla (id_tabla_importancia, tipo_caso, fecha_inicio_vigencia, tiempo_respuesta, tiempo_solucion)
--     VALUES (1, 'problema', '2026-01-01', 20, 200);

-- 5.19 Debe fallar por RN-13 (fin de vigencia anterior al inicio, ck_sla_vigencia)
-- INSERT INTO tiempo_atencion_sla (id_tabla_importancia, tipo_caso, fecha_inicio_vigencia, fecha_fin_vigencia, tiempo_respuesta, tiempo_solucion)
--     VALUES (2, 'problema', '2026-06-01', '2026-05-01', 30, 240);

-- 5.20 Debe fallar por RN-10 (comentario vacío, ck_comentario_no_vacio)
-- INSERT INTO comentario_caso (id_caso, id_usuario_autor, comentario, visibilidad)
--     VALUES (1, 3, '   ', 'usuario');

-- 5.21 Debe fallar por RN-10 (visibilidad inválida, ck_comentario_visibilidad)
-- INSERT INTO comentario_caso (id_caso, id_usuario_autor, comentario, visibilidad)
--     VALUES (1, 3, 'Hola', 'publico');

-- 5.22 Debe fallar por RN-08 (acción de historial inexistente, ck_historial_accion)
-- INSERT INTO historial_caso (id_caso, id_usuario_accion, accion) VALUES (1, 2, 'borrado');

-- 5.23 Debe fallar por RN-27 (tipo de archivo no permitido, ck_adjunto_tipo_archivo)
-- INSERT INTO adjunto_caso (id_caso, id_usuario_autor, nombre_archivo, tipo_archivo, ruta_almacenamiento, tamano_kb)
--     VALUES (1, 3, 'virus.exe', 'application/x-msdownload', '/almacen/privado/virus.exe', 100);

-- 5.24 Debe fallar por RN-27 (archivo mayor a 10 MB, ck_adjunto_tamano)
-- INSERT INTO adjunto_caso (id_caso, id_usuario_autor, nombre_archivo, tipo_archivo, ruta_almacenamiento, tamano_kb)
--     VALUES (1, 3, 'grande.pdf', 'application/pdf', '/almacen/privado/grande.pdf', 10241);

-- 5.25 Debe fallar por RN-22 (token que vence antes de generarse, ck_token_expiracion)
-- INSERT INTO token_recuperacion (id_usuario, token_hash, fecha_generacion, fecha_expiracion)
--     VALUES (3, 'HASH_TOKEN_DE_PRUEBA_02', '2026-03-10 09:00:00', '2026-03-10 08:00:00');

-- 5.26 Debe fallar por RN-22 (estado de token inválido, ck_token_estado)
-- INSERT INTO token_recuperacion (id_usuario, token_hash, fecha_expiracion, estado_token)
--     VALUES (3, 'HASH_TOKEN_DE_PRUEBA_03', '2099-01-01 00:00:00', 'caducado');

-- 5.27 Debe fallar por RN-28 (disponibilidad inválida, ck_info_soporte_disponibilidad)
-- INSERT INTO info_personal_soporte (id_usuario_soporte, disponibilidad) VALUES (4, 'dormido');

-- 5.28 Debe fallar por RN-28 (un usuario con dos filas de disponibilidad, uq_info_soporte_usuario)
-- INSERT INTO info_personal_soporte (id_usuario_soporte, disponibilidad) VALUES (2, 'ocupado');

-- 5.29 Debe fallar por RN-15 (canal inválido, ck_aviso_canal)
-- INSERT INTO aviso (id_caso, id_usuario_destino, canal, mensaje, estado_envio)
--     VALUES (1, 3, 'sms', 'Hola', 'enviado');

-- 5.30 Debe fallar por RN-07 (transición repetida para el mismo perfil, uq_transicion_origen_destino_perfil)
-- INSERT INTO transicion_estado_caso (estado_origen, estado_destino, perfil_autorizado)
--     VALUES ('recibido', 'en_revision', 'soporte');

-- 5.31 Debe fallar por R08 / RN-06 (solicitante inexistente, fk_caso_solicitante)
-- INSERT INTO caso_soporte (numero_seguimiento, titulo, descripcion, lugar, id_usuario_solicitante,
--                           id_tabla_importancia, id_tiempo_atencion, tipo_caso, id_tipo_problema)
--     VALUES ('MA-2026-000166', 'Huérfano', 'x', 'x', 999, 1, 1, 'problema', 1);

-- 5.32 Debe fallar por RN-08 (el caso tiene historial: no se puede borrar físicamente,
--      fk_historial_caso ON DELETE RESTRICT). Se muestra solo como referencia: este
--      proyecto NO ejecuta eliminaciones; los casos se cierran por estado.

-- Reglas que ningún INSERT inválido puede demostrar en DDL (se validan en servicio o con trigger):
--   RN-01 (datos de contacto), RN-04 (solo opciones activas), RN-05 (importancia fija),
--   RN-06 (visibilidad de casos propios), RN-07 (transición permitida), RN-08 (historial inmutable),
--   RN-09 (responsable con perfil soporte), RN-11 (reapertura), RN-12 (cierre automático),
--   RN-13 (una regla activa por combinación), RN-14 (caso atrasado), RN-15 (reintentos),
--   RN-18 (área del solicitante), RN-20 (bloqueo a los 4 intentos), RN-21 (usuario inactivo),
--   RN-22 (un solo uso del enlace), RN-23 (perfil y sesión), RN-25 (activo dado de baja),
--   RN-28 (solo personal de soporte), RN-29 (periodos sin información).


/* =====================================================================
   6. CONSULTAS DE VERIFICACIÓN (solo lectura)
   ===================================================================== */
SELECT table_name AS tabla, table_rows AS filas_aprox
  FROM information_schema.tables
 WHERE table_schema = 'mesa_ayuda_ti' ORDER BY table_name;           -- deben ser 18 tablas

SELECT table_name AS tabla, constraint_name AS restriccion, constraint_type AS tipo
  FROM information_schema.table_constraints
 WHERE table_schema = 'mesa_ayuda_ti' ORDER BY table_name, constraint_type, constraint_name;

/* ===================== FIN DEL SCRIPT ===================== */
