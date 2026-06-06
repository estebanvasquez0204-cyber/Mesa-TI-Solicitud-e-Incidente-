# Diagramas de Actividad

---

## Registrar un caso de soporte

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
