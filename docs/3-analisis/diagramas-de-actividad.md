# Diagramas de Actividad

---

## 1. Registrar un caso de soporte

```mermaid
flowchart TD
A[Inicio] --> B[Usuario ingresa al sistema]
B --> C[Selecciona crear caso]
C --> D[Sistema muestra preguntas]
D --> E[Usuario responde información]
E --> F{¿Información completa?}
F -- Sí --> G[Enviar caso]
G --> H[Generar número de seguimiento]
H --> I[Fin]
F -- No --> J[Solicitar completar datos]
J --> D
 ```

---
## 2. Confirmación del caso

```mermaid
flowchart TD
A[Inicio] --> B[Usuario envía el caso]
B --> C[Sistema registra el caso]
C --> D[Generar número de seguimiento]
D --> E[Mostrar confirmación]
E --> F[Enviar aviso al usuario]
F --> G[Fin]
 ```

---

## 3. Atender un caso

```mermaid
flowchart TD
A[Inicio] --> B[Personal de soporte ingresa]
B --> C[Consulta casos pendientes]
C --> D[Selecciona un caso]
D --> E[Revisa información]
E --> F[Realiza atención]
F --> G[Cambia situación del caso]
G --> H{¿Se puede resolver?}
H -- Sí --> I[Marcar como solucionado]
I --> J[Fin]
H -- No --> K[Pasar a otra persona o área]
K --> J
```

---

## 4. Consultar estado del caso

```mermaid
flowchart TD
A[Inicio] --> B[Usuario ingresa]
B --> C[Accede a sus casos]
C --> D[Selecciona caso]
D --> E[Visualiza estado]
E --> F[Fin]
```

---

## 5. Cambiar la situación del caso

```mermaid
flowchart TD
A[Inicio] --> B[Soporte abre el caso]
B --> C[Selecciona nueva situación]
C --> D[Guarda cambios]
D --> E[Registrar cambio]
E --> F[Fin]
```

---

## 6. Reabrir un caso

```mermaid
flowchart TD
A[Inicio] --> B[Usuario consulta caso cerrado]
B --> C[Selecciona reabrir]
C --> D{¿Está dentro del tiempo permitido?}
D -- Sí --> E[Reabrir caso]
E --> F[Fin]
D -- No --> G[Mostrar mensaje]
G --> F
```

---

## 7. Cerrar un caso

```mermaid
flowchart TD
A[Inicio] --> B[Soporte finaliza atención]
B --> C[Marca como solucionado]
C --> D[Sistema envía aviso]
D --> E{¿Usuario responde?}
E -- Sí --> F[Cerrar caso]
F --> G[Fin]
E -- No --> H[Esperar 5 días hábiles]
H --> I[Cerrar automáticamente]
I --> G
```

---

## 8. Calificar la atención

```mermaid
flowchart TD
A[Inicio] --> B[Usuario accede al caso]
B --> C[Selecciona calificación]
C --> D[Opcional comentar]
D --> E[Guardar evaluación]
E --> F[Fin]
```

---

## 9. Enviar avisos

```mermaid
flowchart TD
A[Inicio] --> B[Cambio en el caso]
B --> C[Generar aviso]
C --> D[Enviar correo]
D --> E[Mostrar en sistema]
E --> F[Guardar aviso en el caso]
F --> G[Fin]
```



```mermaid

```
