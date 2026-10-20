# 5 hallazgos más importantes

**Fuente:** reportes de seguridad Bearer (`bearer-report.html` y `bearer-report.sarif`).

**Criterios de selección:** vulnerabilidades de severidad **Critical** o **High** ubicadas en código de la aplicación, excluyendo archivos de pruebas, ejemplos y datos estáticos. Se seleccionaron cinco tipos de riesgo distintos.

| # | Regla / ID | Severidad | CWE | Archivo:línea | ¿Verdadero o falso positivo? ¿Por qué? |
|---|---|---|---|---|---|
| 1 | `javascript_lang_sql_injection` | Critical | CWE-89 | `routes/login.ts:34` | **Probable verdadero positivo.** Se construye una consulta SQL interpolando `req.body.email`, lo que puede permitir inyección SQL si no existen controles adicionales. |
| 2 | `javascript_lang_eval_user_input` | Critical | CWE-95 | `routes/userProfile.ts:65` | **Probable verdadero positivo.** Se ejecuta `eval(code)`, operación peligrosa si `code` proviene de una entrada controlada por el usuario. |
| 3 | `javascript_lang_hardcoded_secret` | Critical | CWE-798 | `lib/insecurity.ts:42` | **Verdadero positivo respecto al secreto incrustado.** Se observa una clave HMAC escrita literalmente en el código; su impacto depende de dónde se use y de si sigue activa. |
| 4 | `javascript_express_cross_site_scripting` | High | CWE-79 | `routes/userProfile.ts:101` | **Posible verdadero positivo.** Se devuelve `res.send(fn(user))`; habría riesgo de XSS si el contenido incluye datos no escapados y se interpreta como HTML. |
| 5 | `javascript_express_server_side_request_forgery` | High | CWE-918 | `routes/profileImageUrlUpload.ts:24` | **Probable verdadero positivo.** Se realiza `fetch(url)`; si el usuario controla esa URL y no hay restricciones, podría provocar solicitudes a servicios internos. |

## Observación

La clasificación de verdadero o falso positivo es **preliminar**, basada en las líneas y descripciones de los reportes. Para confirmar la explotabilidad es necesario revisar el flujo completo del código y sus validaciones. Un hallazgo de análisis estático no demuestra por sí solo una explotación real.
