# Fase 0 — Concepción

> *Conocer el sistema antes de construirlo.* Es el capítulo que responde: **¿qué vamos a construir y por qué?** La entrevista alimenta las historias de usuario de la [Fase 1](../fase_1/README.md).

**Fuente:** documento Word *Proyecto.docx*, capítulo 0 «Fase 0: Planteamiento del proyecto».

## Trazabilidad con la guía de seguimiento

| Actividad de la guía | Documento | Estado |
|---|---|:---:|
| 0.1 Descripción del problema y Alcance | [0.1-descripcion-del-problema-y-alcance.md](0.1-descripcion-del-problema-y-alcance.md) | ✅ |
| 0.2 Objetivo General y Objetivos Específicos | [0.2-objetivos.md](0.2-objetivos.md) | ✅ |
| 0.3 Estado del arte y Marco teórico | [0.3.1-estado-del-arte.md](0.3.1-estado-del-arte.md) · [0.3.2-marco-teorico.md](0.3.2-marco-teorico.md) | ✅ |
| 0.4 Recolección de información y metodología de trabajo (incluye entrevista y su análisis) | [0.4-recoleccion-de-informacion-y-metodologia.md](0.4-recoleccion-de-informacion-y-metodologia.md) · [0.4.1-entrevista-resultados.md](0.4.1-entrevista-resultados.md) | ✅ |
| 0.5 Cronograma de trabajo del semestre | [0.5-cronograma-del-semestre.md](0.5-cronograma-del-semestre.md) (diagrama de Gantt en [`img/`](img/)) | ✅ |

```mermaid
flowchart TD
    A[0.1 Problema y alcance] --> B[0.2 Objetivos]
    B --> C[0.3 Estado del arte y marco teórico]
    C --> D[0.4 Recolección de información<br/>entrevista + análisis]
    D --> E[0.5 Cronograma]
    D -. alimenta las HU .-> F[[Fase 1 — Análisis]]
```

> **Nota:** [0.4.1](0.4.1-entrevista-resultados.md) es el archivo `entrevista.md` del proyecto (resultados tabulados P1 a P13). El documento *Proyecto.docx* dice en la sección 0.4 que la entrevista abordó **doce aspectos**.

Las referencias bibliográficas de todo el documento están en [docs/referencias.md](../referencias.md).
