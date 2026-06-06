# Escenarios

# Escenario: Registrar un caso de soporte

- **Actor principal:** Usuario solicitante  

- **Precondiciones:**  
El usuario debe estar registrado y haber iniciado sesión en el sistema.

- **Flujo principal:**  
1. El usuario ingresa al sistema.  
2. El usuario selecciona la opción de crear caso.  
3. El sistema muestra preguntas claras.  
4. El usuario responde qué necesita, dónde ocurre y qué tan grave es.  
5. El usuario envía el caso.  
6. El sistema registra el caso y genera un número de seguimiento.  

- **Flujos alternativos:**  
- Si el usuario no completa la información mínima, el sistema no permite enviar el caso.  

- **Postcondiciones:**  
El caso queda registrado con un número único y listo para ser atendido.  

---

# Escenario: Consultar estado del caso

- **Actor principal:** Usuario solicitante  

- **Precondiciones:**  
El usuario debe tener casos registrados en el sistema.

- **Flujo principal:**  
1. El usuario ingresa al sistema.  
2. Accede a la lista de sus casos.  
3. Selecciona un caso.  
4. Visualiza la información y estado del caso.  

- **Flujos alternativos:**  
- Si el usuario no tiene casos, el sistema muestra un mensaje indicando que no hay registros.  

- **Postcondiciones:**  
El usuario conoce el estado actual de su caso.  

---

# Escenario: Atender un caso

- **Actor principal:** Personal de soporte  

- **Precondiciones:**  
Debe existir al menos un caso registrado pendiente de atención.

- **Flujo principal:**  
1. El personal de soporte ingresa al sistema.  
2. Consulta los casos pendientes.  
3. Selecciona un caso.  
4. Revisa la información.  
5. Realiza acciones necesarias para atenderlo.  
6. Cambia la situación del caso.  

- **Flujos alternativos:**  
- Si el caso no puede resolverse, se pasa a otra persona o área.  

- **Postcondiciones:**  
El caso queda actualizado con avances en su atención.  

---

# Escenario: Cambiar la situación de un caso

- **Actor principal:** Personal de soporte  

- **Precondiciones:**  
El caso debe existir y estar activo.

- **Flujo principal:**  
1. El personal de soporte abre el caso.  
2. Selecciona la nueva situación.  
3. Guarda el cambio.  
4. El sistema registra quién hizo el cambio y cuándo.  

- **Flujos alternativos:**  
- Si el cambio no es válido, el sistema no permite guardarlo.  

- **Postcondiciones:**  
El caso queda actualizado y el cambio registrado.  

---

# Escenario: Reabrir un caso

- **Actor principal:** Usuario solicitante  

- **Precondiciones:**  
El caso debe haber sido marcado como solucionado recientemente.

- **Flujo principal:**  
1. El usuario consulta el caso.  
2. Selecciona la opción de reabrir.  
3. El sistema valida el tiempo permitido.  
4. El sistema reactiva el caso.  

- **Flujos alternativos:**  
- Si el tiempo permitido ya pasó, el sistema no permite reabrir el caso.  

- **Postcondiciones:**  
El caso vuelve a estado activo con el mismo número de seguimiento.  

---

# Escenario: Cerrar un caso

- **Actor principal:** Personal de soporte  

- **Precondiciones:**  
El caso debe estar en proceso de atención.

- **Flujo principal:**  
1. El personal finaliza la atención.  
2. Marca el caso como solucionado.  
3. El sistema envía aviso al usuario.  

- **Flujos alternativos:**  
- Si el usuario no responde, el sistema cierra el caso automáticamente después del tiempo definido.  

- **Postcondiciones:**  
El caso queda cerrado o pendiente de confirmación del usuario.  

---

# Escenario: Calificar la atención

- **Actor principal:** Usuario solicitante  

- **Precondiciones:**  
El caso debe estar cerrado.

- **Flujo principal:**  
1. El usuario consulta el caso.  
2. Selecciona la calificación.  
3. (Opcional) agrega comentario.  
4. Guarda la evaluación.  

- **Flujos alternativos:**  
- Si el usuario no desea calificar, puede salir sin registrar evaluación.  

- **Postcondiciones:**  
La atención queda evaluada por el usuario.  
  
