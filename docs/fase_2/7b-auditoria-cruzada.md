# 6. Auditoría cruzada

> **Guía de seguimiento:** Fase 2 — actividad *7b. Auditoría cruzada: diccionario ↔ MER ↔ clases* (punto de control de lectura). El detalle tabla por tabla está en la [sección 9.3 del diagrama de clases](7-diagrama-de-clases.md#93-auditoría-cruzada-diccionario--mer--diagrama-de-clases).
>
> **Fuente:** documento Word *Proyecto.docx* — «Mesa de Ayuda TI de Nexa Servicios» (F. J. Motta Quintero y E. Vásquez Valencia · Ingeniería de Software II · Docente: Lora Patiño Gloria Amparo · Octubre de 2026), sección 6.

Esta sección es el punto de control de lectura del modelo de datos: se leen entre sí el diccionario de datos (capítulo 7), el MER (capítulo 8) y el diagrama de clases UML (capítulo 9). Solo se compara lo que está escrito en esos capítulos; donde la relación no está documentada se escribe «Parcial» o «No sistematizada». El detalle completo de la comparación, hecha por programa sobre los archivos vigentes, está en la sección 9.3.

El esquema de la Tabla 219 muestra qué pares se cruzan y la pregunta que se les hace.

**Tabla 219**  
*Esquema de la auditoría cruzada*

<table>
<thead>
<tr class="header">
<th><strong>Diccionario de datos</strong>
(capítulo 7)</th>
<th><strong>↔︎</strong>
¿mismas tablas, atributos y tipos?</th>
<th><strong>Modelo entidad-relación</strong>
(MER, capítulo 8)</th>
<th><strong>↔︎</strong>
¿cada tabla es una clase? ¿cada FK es una asociación?</th>
<th><strong>Diagrama de clases</strong>
(UML v3, capítulo 9)</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td colspan="5"><strong>Diccionario ↔︎ diagrama de clases (cruce directo):</strong> ¿cada atributo de la clase existe en el diccionario con el mismo tipo? ¿cada método tiene un RF?</td>
</tr>
</tbody>
</table>

*Nota.* Elaboración propia, a partir de los capítulos 7 a 9 de este documento.

La Tabla 220 aplica siete verificaciones de la forma «sí / no». Las dos columnas siguen dos entidades representativas: Usuario, de la que cuelgan casi todas las relaciones, y CasoSoporte, la entidad central. «Parcial» indica que la verificación se cumple en parte y que la diferencia está registrada como hallazgo.

**Tabla 220**  
*Verificaciones de la auditoría cruzada*

| **\#** | **Verificación (sí / no)**                                                              | **Usuario**                                                                                                                                                                        | **CasoSoporte**                                                                                                                                         |
|--------|-----------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1      | Toda tabla del diccionario es una entidad del MER y una clase del diagrama, y viceversa | ✓ usuario ↔ Usuario                                                                                                                                                                | ✓ caso_soporte ↔ CasoSoporte (alias «caso» en el MER)                                                                                                   |
| 2      | Cada atributo coincide en nombre, tipo y nulidad entre los tres                         | Parcial: 15 atributos en el diccionario y el MER; 12 propios en el diagrama. Nombre y tipo coinciden; la nulidad se marca solo en 4 de 35 atributos anulables del diagrama (IN-24) | Parcial: 21 atributos en el diccionario y el MER; 14 propios en el diagrama (las 7 FK son asociaciones). Nombre y tipo coinciden; nulidad como en IN-24 |
| 3      | Ninguna clase declara un método para modificar su clave primaria                        | ✓ id_usuario sin setter                                                                                                                                                            | ✓ id_caso sin setter                                                                                                                                    |
| 4      | Cada FK del MER es una asociación del diagrama con la misma multiplicidad               | Parcial: R01, R02, R03, R05 y R25 coinciden; R04 (Usuario – InfoPersonalSoporte) difiere (IN-25)                                                                                   | ✓ 7 de 7 FK (R08 a R14): solicitante 1, asignado 0..1, activo 0..1, importancia 1, SLA 1, tipo de problema 0..1 y tipo de solicitud 0..1                |
| 5      | Cada UNIQUE / CHECK del diccionario cita una RN y esa RN tiene RF                       | Parcial: UNIQUE(correo) responde a RN-17 (vigilada por RF-03, RF-26 y RF-28), pero la restricción del diccionario no cita la regla                                                 | Parcial: UNIQUE(numero_seguimiento) responde a RN-02 (vigilada por RF-01 y RF-03); el diccionario cita D25, no la RN                                    |
| 6      | Cada método de la clase cita un RF existente (sin métodos huérfanos)                    | ✓ 15 métodos con HU y RF en 4.5.1 (por ejemplo autenticar(): HU-023, RF-34); registrarIntentoFallido() y bloquearCuenta() figuran «sin botón»                                      | ✓ 10 métodos con HU y RF en 4.5.1 (por ejemplo crearCaso(): HU-001, RF-01); cerrarCaso() y cumpleSLA() figuran «sin botón»                              |
| 7      | Los ENUM son listas cerradas definidas en el diccionario                                | ✓ perfil_acceso (4 valores) y estado_usuario (activo, inactivo)                                                                                                                    | ✓ estado_caso (6 valores), tipo_caso (problema, solicitud) y clase_solicitud (nuevo, cambio, consulta)                                                  |

*Nota.* Elaboración propia, a partir de la sección 9.3 (Tablas 245 a 250) y de 4.5.1.

La Tabla 221 da el resultado de las mismas siete verificaciones sobre todo el modelo (18 tablas, 161 atributos y 57 métodos).

**Tabla 221**  
*Resultado de la auditoría cruzada sobre todo el modelo*

| **\#** | **Verificación (sí / no)**                                                              | **Resultado sobre todo el modelo**                                                                                                                                                                                                                         |
|--------|-----------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1      | Toda tabla del diccionario es una entidad del MER y una clase del diagrama, y viceversa | ✓ 18 de 18 tablas con entidad y clase (el diagrama agrega la clase abstracta Catalogo: 19 clases)                                                                                                                                                          |
| 2      | Cada atributo coincide en nombre, tipo y nulidad entre los tres                         | Parcial: 161 de 161 atributos entre diccionario y MER; el diagrama dibuja 141 como atributos y el resto como asociaciones; 0 diferencias de tipo base; nulidad marcada solo en 4 de 35 (IN-24)                                                             |
| 3      | Ninguna clase declara un método para modificar su clave primaria                        | ✓ ninguna de las 19 clases declara setters                                                                                                                                                                                                                 |
| 4      | Cada FK del MER es una asociación del diagrama con la misma multiplicidad               | Parcial: 23 de 23 FK funcionales coinciden en los tres, con una multiplicidad distinta (IN-25); 9 FK de auditoría sin línea (IN-26)                                                                                                                        |
| 5      | Cada UNIQUE / CHECK del diccionario cita una RN y esa RN tiene RF                       | No sistematizada: el diccionario describe las restricciones por columna; solo algunas descripciones citan una regla (varias con la numeración antigua, por ejemplo «RN01»). No se rellenó                                                                  |
| 6      | Cada método de la clase cita un RF existente (sin métodos huérfanos)                    | ✓ 57 de 57 métodos con HU y pantalla en 4.5.1; 10 figuran sin botón en los mockups (cerrarCaso, cumpleSLA, listarAdjuntos, actualizarEstadoEnvio, reintentarEnvio, listarComentarios, registrarIntentoFallido, bloquearCuenta, revocar y Catalogo.obtener) |
| 7      | Los ENUM son listas cerradas definidas en el diccionario                                | ✓ todos los ENUM llevan CHECK IN (…); los valores que cambian viven en los seis catálogos, que se administran con HU-043 a HU-048 (RF-48)                                                                                                                  |

*Nota.* Elaboración propia, a partir de la sección 9.3 (Tablas 245 a 250) y de 4.5.1.

**Hallazgos de la auditoría.** Cada uno indica dónde está, qué relación rompe y qué corrección se propone; ninguno se aplicó al contenido aprobado y todos siguen abiertos (9.3.5).

**Tabla 222**  
*Hallazgos de la auditoría cruzada*

| **Hallazgo**     | **Qué se encontró**                                                                                              | **Dónde**                                               | **Qué rompe**                                                                                      | **Corrección propuesta**                                                            |
|------------------|------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------|----------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------|
| **H-01 · IN-23** | Area, Cargo y RolEmpleado declaran nombre_area, nombre_cargo y nombre_rol además de Catalogo.nombre, que heredan | Diagrama de clases (capítulo 9)                         | Diccionario y MER tienen una sola columna de nombre por tabla; la clase la duplica                 | Conservar solo el atributo heredado (propuesta a la docente; abierta)               |
| **H-02 · IN-24** | Marca \[0..1\] en solo 4 de los 35 atributos que el diccionario declara anulables                                | Diagrama de clases (capítulo 9)                         | La nulidad del diccionario no se ve completa en el diagrama (notación; no cambia datos ni métodos) | Marcar los 35 en una próxima versión, si la docente lo aprueba                      |
| **H-03 · IN-25** | Usuario – InfoPersonalSoporte con multiplicidad 0..1 en ambos extremos                                           | Diagrama de clases (capítulo 9) y MER, R04 (capítulo 8) | La FK info_personal_soporte.id_usuario_soporte es obligatoria y el MER la dibuja uno a cero o uno  | El extremo de Usuario debería ser 1; abierta, pertenece al diagrama aprobado        |
| **H-04 · IN-26** | Las FK de auditoría id_usuario_modificacion de 9 tablas están como atributo, sin línea de relación               | MER (capítulo 8) y diagrama de clases (capítulo 9)      | Solo usuario (R25) y transicion_estado_caso (R24) la dibujan                                       | Mantener la convención de dibujo D23; el dato está en los tres documentos (abierta) |

*Nota.* Elaboración propia, a partir de 9.3.5 (IN-23 a IN-26).

Adaptación de la imagen de referencia. Las entidades de ejemplo de la imagen se reemplazan por Usuario y CasoSoporte y sus hallazgos de práctica por los reales del proyecto (IN-23 a IN-26). La verificación 5 queda «Parcial» o «No sistematizada» porque el diccionario no cita la RN en cada restricción. La lectura y firma por otro equipo no está documentada, por lo que no se incluye constancia.
