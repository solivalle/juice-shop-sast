# Inciso 16: Criterios para bloquear el merge de un PR por hallazgos SAST

Sí bloquearía el merge cuando el SAST encuentre un hallazgo nuevo, confiable y con riesgo significativo que no haya sido corregido o aceptado formalmente. No bloquearía automáticamente por cualquier alerta: el análisis estático puede producir falsos positivos, y el impacto depende del flujo de datos, la posibilidad de alcanzar el código y el contexto de ejecución.

## Criterios de decisión

| Hallazgo | Decisión sugerida | Criterio |
|---|---|---|
| Crítico | Bloquear | Riesgo claro de compromiso grave, como ejecución de código, inyección con impacto importante, exposición de credenciales activas o acceso no autorizado. Debe corregirse antes del merge o contar con una excepción aprobada y documentada. |
| Alto | Bloquear normalmente | Existe un impacto relevante y el flujo parece alcanzable, como SQL injection, SSRF o XSS almacenado. Confirmar el contexto y la exposición antes de exigir una corrección. |
| Medio | Revisión requerida | Evaluar explotabilidad, datos afectados, controles existentes y si el cambio introdujo el problema. Puede aceptarse temporalmente con responsable y fecha de corrección. |
| Bajo o informativo | No bloquear por defecto | Registrar y priorizar según el contexto. No debe impedir el merge si no existe un impacto significativo demostrado. |

## Tipos que justificarían bloqueo prioritario

- Inyección SQL, comandos o código cuando se use entrada controlada externamente.
- Autenticación o autorización incorrectas que permitan acceso a cuentas o funciones protegidas.
- Secretos válidos expuestos en el código o en los cambios del PR.
- XSS con datos controlados por usuarios, especialmente si persiste y afecta a otros usuarios.
- SSRF, traversal o escritura de archivos cuando permitan acceso a recursos sensibles.
- Deserialización insegura u otros flujos que puedan conducir a ejecución de código.

La severidad del escáner debe orientar la decisión, pero no ser el único criterio. También consideraría la confianza de la regla, si el código es alcanzable, el origen y destino de los datos, los controles existentes, el impacto sobre confidencialidad, integridad y disponibilidad, y si el hallazgo fue introducido por el PR.

## Excepciones y operación

Un hallazgo confirmado de severidad crítica o alta debe impedir el merge hasta corregirse. Si se determina que es un falso positivo o un riesgo aceptado, la excepción debe incluir justificación, evidencia, persona responsable y, cuando corresponda, fecha de revisión. Los hallazgos existentes que no introduce el PR pueden gestionarse mediante un plan de remediación, pero no deberían ocultarse ni confundirse con los nuevos.

En este proyecto hay vulnerabilidades intencionales para fines educativos. Por eso, las reglas de bloqueo deben considerar el alcance del repositorio y distinguir los hallazgos esperados en el código deliberadamente vulnerable de los introducidos accidentalmente en componentes que deberían ser seguros.

## Conclusión

Bloquearía el merge ante hallazgos críticos y ante hallazgos altos confirmados, explotables y relevantes para el cambio. Para severidades medias, bajas o alertas dudosas, exigiría revisión y seguimiento en lugar de un bloqueo automático. Así se reduce el riesgo sin convertir cada falso positivo o hallazgo contextual en un obstáculo para el desarrollo.
