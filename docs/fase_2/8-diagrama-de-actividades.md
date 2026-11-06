# 8. Diagrama de actividades

> **Guía de seguimiento:** Fase 2 — actividad *8. Diagrama de Actividades: cada rombo cita su RN*.

## Estado: ⚠️ por actualizar

En las fuentes solo existe la **primera versión** de los diagramas de actividad, que estaba en el repositorio (`docs/3-analisis`). Se conserva completa en [version-anterior/diagramas-de-actividad.md](version-anterior/diagramas-de-actividad.md) e incluye estos flujos en Mermaid:

1. Registrar un caso de soporte
2. Confirmación del caso
3. Atender un caso
4. Consultar estado del caso
5. Cambiar la situación del caso
6. Reabrir un caso
7. Cerrar un caso
8. Calificar la atención (no tiene HU vigente: el documento de HU de la Fase 1 no incluye historia de calificación)
9. Enviar avisos

Esa versión **no cumple todavía la regla de la guía**: sus rombos de decisión no citan ninguna RN y usan la terminología anterior (por ejemplo, «Marcar como solucionado» en lugar del estado `resuelto`).

## Qué falta para cerrar la actividad

Cada rombo de decisión debe citar la regla de negocio que lo controla. Las decisiones ya están escritas como flujos alternativos en los [casos de uso de la Fase 1](../fase_1/3-casos-de-uso.md), cada uno con su RN:

| Flujo de la versión anterior | Caso de uso vigente | Decisiones (rombos) y su RN |
|---|---|---|
| Registrar un caso de soporte | [CU-001](../fase_1/3-casos-de-uso.md#cu-001) | ¿Datos obligatorios completos? → RN-01 · ¿Tiene activo asociado? → RN-25 |
| Confirmación del caso | [CU-002](../fase_1/3-casos-de-uso.md#cu-002) | ¿Se envió el correo? → RN-16 |
| Atender un caso / Cambiar la situación | [CU-007](../fase_1/3-casos-de-uso.md#cu-007), [CU-026](../fase_1/3-casos-de-uso.md#cu-026) | ¿Transición permitida? → RN-07 · ¿Perfil autorizado? → RN-23 · ¿El nuevo responsable es de soporte? → RN-09 |
| Consultar estado del caso | [CU-005](../fase_1/3-casos-de-uso.md#cu-005), [CU-010](../fase_1/3-casos-de-uso.md#cu-010) | ¿El caso es propio? → RN-06 · ¿Hay coincidencias? |
| Reabrir un caso | [CU-013](../fase_1/3-casos-de-uso.md#cu-013) | ¿Está resuelto? · ¿Dentro de 5 días hábiles? · ¿Tiene motivo? → RN-11 |
| Cerrar un caso | [CU-028](../fase_1/3-casos-de-uso.md#cu-028) | ¿Cumplió 5 días hábiles sin respuesta? → RN-12 |
| Enviar avisos | [CU-003](../fase_1/3-casos-de-uso.md#cu-003) | ¿Falló el envío? → reintento, RN-15 |
