# 14. Matriz de trazabilidad

> **Guía de seguimiento:** Fase 2 — actividad *12. Matriz de trazabilidad: HU → RF → entidad → clase.método → CU → mensaje de secuencia → pantalla*.
>
> **Fuente:** documento Word *Proyecto.docx* — «Mesa de Ayuda TI de Nexa Servicios» (F. J. Motta Quintero y E. Vásquez Valencia · Ingeniería de Software II · Docente: Lora Patiño Gloria Amparo · Octubre de 2026), sección 14.

**Tabla 255**  
*Matriz de trazabilidad: HU → RF → Entidad → Clase.Método → CU → Mensaje de secuencia → Pantalla (MK) → RN*

<table>
<thead>
<tr class="header">
<th><strong>HU</strong></th>
<th><strong>RF</strong></th>
<th><strong>Entidad</strong></th>
<th><strong>Clase.Método</strong></th>
<th><strong>CU</strong></th>
<th><strong>Mensaje (secuencia)</strong></th>
<th><strong>Pantalla (MK)</strong></th>
<th><strong>RN</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>HU-001 Reportar un caso de soporte</td>
<td>RF-01, RF-02, RF-18</td>
<td>CasoSoporte, HistorialCaso, TiempoAtencionSLA, Activo</td>
<td>CasoSoporte.crearCaso()<br />
HistorialCaso.registrarHistorial()<br />
TiempoAtencionSLA.obtenerSLA()<br />
Activo.obtenerActivo()</td>
<td>CU-001, CU-004, CU-021, CU-022, CU-S01, CU-S02</td>
<td>Sec. CU-001: crearCaso(), registrarHistorial(), obtenerSLA(), obtenerActivo()</td>
<td>MK-02, MK-06</td>
<td>RN-01, RN-02, RN-23, RN-25</td>
</tr>
<tr class="even">
<td>HU-002 Recibir confirmación del caso enviado</td>
<td>RF-03, RF-05</td>
<td>Aviso, CasoSoporte</td>
<td>Aviso.crearAviso(), actualizarEstadoEnvio(), reintentarEnvio()<br />
CasoSoporte.crearCaso()</td>
<td>CU-002, CU-003</td>
<td>Sec. CU-001: crearCaso()<br />
Sec. CU-007: crearAviso()</td>
<td>MK-03, MK-09</td>
<td>RN-02, RN-15, RN-16, RN-17</td>
</tr>
<tr class="odd">
<td>HU-003 Recibir avisos sobre el avance del caso</td>
<td>RF-04, RF-05, RF-06</td>
<td>Aviso</td>
<td>Aviso.crearAviso(), obtenerAviso(), actualizarEstadoEnvio(), reintentarEnvio(), marcarLeido()</td>
<td>CU-003</td>
<td>Sec. CU-007: crearAviso()</td>
<td>MK-09</td>
<td>RN-15, RN-16</td>
</tr>
<tr class="even">
<td>HU-004 Identificar si el caso es un problema o una solicitud</td>
<td>RF-02, RF-07</td>
<td>CasoSoporte</td>
<td>CasoSoporte.crearCaso()</td>
<td>CU-001, CU-004</td>
<td>Sec. CU-001: crearCaso()</td>
<td>MK-02</td>
<td>RN-03</td>
</tr>
<tr class="odd">
<td>HU-005 Consultar casos anteriores</td>
<td>RF-09, RF-10</td>
<td>CasoSoporte</td>
<td>CasoSoporte.obtenerCaso()</td>
<td>CU-005</td>
<td>N/A: caso no crítico</td>
<td>MK-04</td>
<td>RN-06</td>
</tr>
<tr class="even">
<td>HU-006 Revisar casos pendientes</td>
<td>RF-11</td>
<td>CasoSoporte, TablaImportancia</td>
<td>CasoSoporte.obtenerCaso()<br />
TablaImportancia.calcularResultadoImportancia()</td>
<td>CU-006</td>
<td>N/A: caso no crítico</td>
<td>MK-07</td>
<td>RN-05, RN-23</td>
</tr>
<tr class="odd">
<td>HU-007 Cambiar la situación actual del caso</td>
<td>RF-12, RF-13, RF-49, RF-50</td>
<td>CasoSoporte, HistorialCaso, TransicionEstadoCaso</td>
<td>CasoSoporte.actualizarCaso(), registrarPrimeraRespuesta(), marcarSolucionado()<br />
HistorialCaso.registrarHistorial()<br />
TransicionEstadoCaso.esTransicionValida()</td>
<td>CU-007, CU-003, CU-010, CU-S02</td>
<td>Sec. CU-007: registrarHistorial(), actualizarCaso(), registrarPrimeraRespuesta(), marcarSolucionado(), esTransicionValida()</td>
<td>MK-05, MK-06</td>
<td>RN-06, RN-07, RN-08, RN-14, RN-23</td>
</tr>
<tr class="even">
<td>HU-008 Asignar una persona encargada del caso</td>
<td>RF-14, RF-49</td>
<td>CasoSoporte, HistorialCaso</td>
<td>CasoSoporte.actualizarCaso()<br />
HistorialCaso.registrarHistorial()</td>
<td>CU-008, CU-S02</td>
<td>Sec. CU-001: registrarHistorial()<br />
Sec. CU-007: actualizarCaso()</td>
<td>MK-06</td>
<td>RN-08, RN-09</td>
</tr>
<tr class="odd">
<td>HU-009 Agregar comentarios al caso</td>
<td>RF-16, RF-17</td>
<td>ComentarioCaso</td>
<td>ComentarioCaso.registrarComentario(), listarComentarios()</td>
<td>CU-009</td>
<td>N/A: caso no crítico</td>
<td>MK-05, MK-06</td>
<td>RN-08, RN-10</td>
</tr>
<tr class="even">
<td>HU-010 Ver tiempo aproximado de atención</td>
<td>RF-13, RF-20</td>
<td>CasoSoporte, TiempoAtencionSLA</td>
<td>CasoSoporte.cumpleSLA()<br />
TiempoAtencionSLA.obtenerSLA()</td>
<td>CU-010, CU-S01</td>
<td>Sec. CU-001: obtenerSLA()</td>
<td>MK-05</td>
<td>RN-06, RN-13, RN-14</td>
</tr>
<tr class="odd">
<td>HU-011 Revisar resumen general de atención</td>
<td>RF-21</td>
<td>CasoSoporte</td>
<td>CasoSoporte.cumpleSLA(), obtenerCaso(), registrarPrimeraRespuesta()</td>
<td>CU-011</td>
<td>N/A: caso no crítico</td>
<td>MK-10</td>
<td>RN-14, RN-29</td>
</tr>
<tr class="even">
<td>HU-012 Revisar resumen por periodo</td>
<td>RF-22</td>
<td>CasoSoporte</td>
<td>CasoSoporte.obtenerResumenAtencion()</td>
<td>CU-012</td>
<td>N/A: caso no crítico</td>
<td>MK-10</td>
<td>RN-29</td>
</tr>
<tr class="odd">
<td>HU-013 Reabrir un caso</td>
<td>RF-23</td>
<td>CasoSoporte</td>
<td>CasoSoporte.reabrirCaso()</td>
<td>CU-013</td>
<td>N/A: caso no crítico</td>
<td>MK-05</td>
<td>RN-08, RN-11</td>
</tr>
<tr class="even">
<td>HU-015 Consultar información del personal de soporte</td>
<td>RF-24</td>
<td>InfoPersonalSoporte</td>
<td>InfoPersonalSoporte.obtenerInfoSoporte()</td>
<td>CU-015</td>
<td>N/A: caso no crítico</td>
<td>MK-11</td>
<td>RN-28</td>
</tr>
<tr class="odd">
<td>HU-016 Registrar usuarios del sistema</td>
<td>RF-26</td>
<td>Usuario, Catalogo</td>
<td>Usuario.crearUsuario(), encriptarContrasena(), validarCorreoUnico()<br />
Catalogo.obtener()</td>
<td>CU-016</td>
<td>Sec. CU-016: crearUsuario(), encriptarContrasena(), validarCorreoUnico(), obtener()</td>
<td>MK-14</td>
<td>RN-17, RN-18, RN-19</td>
</tr>
<tr class="even">
<td>HU-017 Consultar usuarios registrados</td>
<td>RF-27</td>
<td>Usuario</td>
<td>Usuario.obtenerUsuario()</td>
<td>CU-017</td>
<td>N/A: caso no crítico</td>
<td>MK-13</td>
<td>RN-23</td>
</tr>
<tr class="odd">
<td>HU-018 Indicar tipo de problema</td>
<td>RF-31</td>
<td>TipoProblema</td>
<td>Catalogo.obtener()</td>
<td>CU-018</td>
<td>N/A: caso no crítico</td>
<td>MK-02</td>
<td>RN-03, RN-04</td>
</tr>
<tr class="even">
<td>HU-019 Indicar tipo de solicitud</td>
<td>RF-32</td>
<td>TipoSolicitud</td>
<td>Catalogo.obtener()</td>
<td>CU-019</td>
<td>N/A: caso no crítico</td>
<td>MK-02</td>
<td>RN-03, RN-04</td>
</tr>
<tr class="odd">
<td>HU-020 Indicar clase de solicitud</td>
<td>RF-33</td>
<td>CasoSoporte (atributo clase_solicitud)</td>
<td>CasoSoporte.crearCaso()</td>
<td>CU-020</td>
<td>N/A: caso no crítico</td>
<td>MK-02</td>
<td>RN-03</td>
</tr>
<tr class="even">
<td>HU-021 Indicar cuántas personas se ven afectadas</td>
<td>RF-18, RF-19</td>
<td>TablaImportancia</td>
<td>TablaImportancia.calcularResultadoImportancia()</td>
<td>CU-021, CU-022</td>
<td>Sec. CU-001: calcularResultadoImportancia()</td>
<td>MK-02</td>
<td>RN-01, RN-05</td>
</tr>
<tr class="odd">
<td>HU-022 Indicar qué tan rápido necesito atención</td>
<td>RF-18, RF-19</td>
<td>TablaImportancia</td>
<td>TablaImportancia.calcularResultadoImportancia()</td>
<td>CU-021, CU-022</td>
<td>Sec. CU-001: calcularResultadoImportancia()</td>
<td>MK-02</td>
<td>RN-01, RN-05</td>
</tr>
<tr class="even">
<td>HU-023 Iniciar sesión</td>
<td>RF-34</td>
<td>Usuario</td>
<td>Usuario.autenticar(), registrarIntentoFallido(), resetearIntentosFallidos(), bloquearCuenta()</td>
<td>CU-023</td>
<td>N/A: caso no crítico</td>
<td>MK-01</td>
<td>RN-20, RN-21, RN-23</td>
</tr>
<tr class="odd">
<td>HU-024 Recuperar contraseña</td>
<td>RF-35</td>
<td>Usuario, TokenRecuperacion</td>
<td>Usuario.generarTokenRecuperacion(), encriptarContrasena(), enviarEnlaceRecuperacion(), restablecerContrasena()<br />
TokenRecuperacion.esValido(), marcarUsado(), revocar()</td>
<td>CU-024</td>
<td>N/A: caso no crítico</td>
<td>MK-01, MK-19</td>
<td>RN-19, RN-22</td>
</tr>
<tr class="even">
<td>HU-025 Cerrar sesión</td>
<td>RF-36</td>
<td>Usuario</td>
<td>Usuario.cerrarSesion()</td>
<td>CU-025</td>
<td>N/A: caso no crítico</td>
<td>MK-04</td>
<td>RN-23</td>
</tr>
<tr class="odd">
<td>HU-026 Pasar un caso a otra persona de soporte</td>
<td>RF-15, RF-49</td>
<td>CasoSoporte, HistorialCaso</td>
<td>CasoSoporte.actualizarCaso()<br />
HistorialCaso.registrarHistorial()</td>
<td>CU-026, CU-S02</td>
<td>Sec. CU-001: registrarHistorial()<br />
Sec. CU-007: actualizarCaso()</td>
<td>MK-06</td>
<td>RN-08, RN-09</td>
</tr>
<tr class="even">
<td>HU-028 Cerrar casos sin respuesta del usuario</td>
<td>RF-37</td>
<td>CasoSoporte, Aviso</td>
<td>CasoSoporte.cerrarCaso()<br />
Aviso.crearAviso()</td>
<td>CU-028</td>
<td>N/A: caso no crítico</td>
<td>Interno (aviso en MK-09)</td>
<td>RN-08, RN-12, RN-15</td>
</tr>
<tr class="odd">
<td>HU-029 Definir tiempos de atención</td>
<td>RF-38</td>
<td>TiempoAtencionSLA</td>
<td>TiempoAtencionSLA.crearSLA(), obtenerSLA(), actualizarSLA(), inactivarSLA()</td>
<td>CU-029</td>
<td>Sec. CU-029: crearSLA(), obtenerSLA(), actualizarSLA(), inactivarSLA()</td>
<td>MK-12</td>
<td>RN-13</td>
</tr>
<tr class="even">
<td>HU-030 Descargar reportes de atención</td>
<td>RF-40</td>
<td>CasoSoporte</td>
<td>CasoSoporte.generarReporte()</td>
<td>CU-030</td>
<td>N/A: caso no crítico</td>
<td>MK-10</td>
<td>RN-29</td>
</tr>
<tr class="odd">
<td>HU-031 Actualizar la información de un usuario registrado</td>
<td>RF-28</td>
<td>Usuario</td>
<td>Usuario.validarCorreoUnico(), actualizarUsuario()</td>
<td>CU-031</td>
<td>N/A: caso no crítico</td>
<td>MK-13, MK-14</td>
<td>RN-17, RN-18</td>
</tr>
<tr class="even">
<td>HU-032 Inactivar un usuario que ya no debe tener acceso</td>
<td>RF-29</td>
<td>Usuario</td>
<td>Usuario.inactivarUsuario(), actualizarUsuario()</td>
<td>CU-032</td>
<td>N/A: caso no crítico</td>
<td>MK-13</td>
<td>RN-21</td>
</tr>
<tr class="odd">
<td>HU-033 Desbloquear una cuenta de usuario</td>
<td>RF-30</td>
<td>Usuario</td>
<td>Usuario.desbloquearCuenta(), resetearIntentosFallidos()</td>
<td>CU-033</td>
<td>N/A: caso no crítico</td>
<td>MK-15</td>
<td>RN-20, RN-23</td>
</tr>
<tr class="even">
<td>HU-034 Actualizar mi disponibilidad para recibir casos</td>
<td>RF-25</td>
<td>InfoPersonalSoporte</td>
<td>InfoPersonalSoporte.actualizarDisponibilidad()</td>
<td>CU-034</td>
<td>N/A: caso no crítico</td>
<td>MK-11</td>
<td>RN-28, RN-23</td>
</tr>
<tr class="odd">
<td>HU-035 Registrar un activo tecnológico de la empresa</td>
<td>RF-44</td>
<td>Activo</td>
<td>Activo.crearActivo()</td>
<td>CU-035</td>
<td>N/A: caso no crítico</td>
<td>MK-17</td>
<td>RN-24</td>
</tr>
<tr class="even">
<td>HU-036 Consultar los activos tecnológicos registrados</td>
<td>RF-45</td>
<td>Activo</td>
<td>Activo.obtenerActivo()</td>
<td>CU-036</td>
<td>N/A: caso no crítico</td>
<td>MK-16</td>
<td>RN-23</td>
</tr>
<tr class="odd">
<td>HU-037 Actualizar la información de un activo tecnológico</td>
<td>RF-46</td>
<td>Activo</td>
<td>Activo.actualizarActivo()</td>
<td>CU-037</td>
<td>N/A: caso no crítico</td>
<td>MK-16, MK-17</td>
<td>RN-24</td>
</tr>
<tr class="even">
<td>HU-038 Dar de baja un activo tecnológico</td>
<td>RF-47</td>
<td>Activo</td>
<td>Activo.darDeBajaActivo()</td>
<td>CU-038</td>
<td>N/A: caso no crítico</td>
<td>MK-16</td>
<td>RN-25</td>
</tr>
<tr class="odd">
<td>HU-040 Consultar las reglas de tiempos de atención configuradas</td>
<td>RF-39</td>
<td>TiempoAtencionSLA</td>
<td>TiempoAtencionSLA.obtenerSLA()</td>
<td>CU-040</td>
<td>N/A: caso no crítico</td>
<td>MK-12</td>
<td>RN-13</td>
</tr>
<tr class="even">
<td>HU-041 Consultar el historial de cambios de un caso</td>
<td>RF-41, RF-49</td>
<td>HistorialCaso</td>
<td>HistorialCaso.listarHistorial(), registrarHistorial()</td>
<td>CU-041, CU-S02</td>
<td>Sec. CU-001: registrarHistorial()</td>
<td>MK-08</td>
<td>RN-08</td>
</tr>
<tr class="odd">
<td>HU-042 Adjuntar y consultar evidencias de un caso</td>
<td>RF-42, RF-43</td>
<td>AdjuntoCaso</td>
<td>AdjuntoCaso.cargarAdjunto(), obtenerAdjunto(), listarAdjuntos(), eliminarAdjunto()</td>
<td>CU-042</td>
<td>N/A: caso no crítico</td>
<td>MK-02, MK-05, MK-06</td>
<td>RN-08, RN-27</td>
</tr>
<tr class="even">
<td>HU-043 Administrar las áreas</td>
<td>RF-48</td>
<td>Area</td>
<td>Catalogo.crear(), obtener(), actualizar(), inactivar()</td>
<td>CU-043</td>
<td>N/A: caso no crítico</td>
<td>MK-18</td>
<td>RN-26, RN-30</td>
</tr>
<tr class="odd">
<td>HU-044 Administrar los cargos</td>
<td>RF-48</td>
<td>Cargo</td>
<td>Catalogo.crear(), obtener(), actualizar(), inactivar()</td>
<td>CU-044</td>
<td>N/A: caso no crítico</td>
<td>MK-18</td>
<td>RN-26, RN-30</td>
</tr>
<tr class="even">
<td>HU-045 Administrar los roles de empleado</td>
<td>RF-48</td>
<td>RolEmpleado</td>
<td>Catalogo.crear(), obtener(), actualizar(), inactivar()</td>
<td>CU-045</td>
<td>N/A: caso no crítico</td>
<td>MK-18</td>
<td>RN-26, RN-30</td>
</tr>
<tr class="odd">
<td>HU-046 Administrar los tipos de activo</td>
<td>RF-48</td>
<td>TipoActivo</td>
<td>Catalogo.crear(), obtener(), actualizar(), inactivar()</td>
<td>CU-046</td>
<td>N/A: caso no crítico</td>
<td>MK-18</td>
<td>RN-26, RN-30</td>
</tr>
<tr class="even">
<td>HU-047 Administrar los tipos de problema</td>
<td>RF-48</td>
<td>TipoProblema</td>
<td>Catalogo.crear(), obtener(), actualizar(), inactivar()</td>
<td>CU-047</td>
<td>N/A: caso no crítico</td>
<td>MK-18</td>
<td>RN-04, RN-26, RN-30</td>
</tr>
<tr class="odd">
<td>HU-048 Administrar los tipos de solicitud</td>
<td>RF-48</td>
<td>TipoSolicitud</td>
<td>Catalogo.crear(), obtener(), actualizar(), inactivar()</td>
<td>CU-048</td>
<td>N/A: caso no crítico</td>
<td>MK-18</td>
<td>RN-04, RN-26, RN-30</td>
</tr>
<tr class="even">
<td>HU-049 Corregir la clasificación de un caso</td>
<td>RF-08, RF-49</td>
<td>CasoSoporte, HistorialCaso</td>
<td>CasoSoporte.actualizarCaso()<br />
HistorialCaso.registrarHistorial()</td>
<td>CU-049, CU-S02</td>
<td>Sec. CU-001: registrarHistorial()<br />
Sec. CU-007: actualizarCaso()</td>
<td>MK-06</td>
<td>RN-03, RN-08, RN-23</td>
</tr>
</tbody>
</table>

*Nota. Elaboración propia, a partir de la matriz por historia de usuario de la Fase 1, la cobertura de métodos del diagrama de clases y los diagramas de secuencia de este documento. La matriz solo exige mensajes para los cuatro casos de uso críticos (CU-001, CU-007, CU-016 y CU-029); en las demás filas se indica «N/A: caso no crítico».*
