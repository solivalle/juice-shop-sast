# Inciso 17: Gestión de un falso positivo en Bearer

## Hallazgo seleccionado

En el reporte HTML de la parte B aparece este hallazgo:

- **Regla:** `javascript_lang_logger_leak`
- **Severidad:** baja
- **CWE:** CWE-532, exposición de información en mensajes de log
- **Archivo y línea:** `data/static/codefixes/registerAdminChallenge_1.ts:34`
- **Código señalado:** `console.log(err)`
- **Fingerprint del reporte:** `b8d17717880e1bfcf8f0b5d88b51a25a_0`

La regla detecta correctamente que se imprime un objeto de error. Sin embargo, este archivo está bajo `data/static/codefixes/`: es una variante de código almacenada como material de un desafío educativo, no una ruta normal del servidor que se ejecute durante el funcionamiento de la aplicación. Por ese contexto, considero que el hallazgo es un falso positivo respecto al riesgo de exposición en producción, aunque la línea sí coincide con el patrón que la regla busca.

## Cómo lo gestionaría

Mantendría activa la regla `javascript_lang_logger_leak` para el resto del repositorio. Si se confirma que esta variante no se ejecuta ni se distribuye como código ejecutable, registraría una excepción puntual limitada a esta combinación:

- Regla: `javascript_lang_logger_leak`.
- Archivo exacto: `data/static/codefixes/registerAdminChallenge_1.ts`.
- Hallazgo: la línea señalada en el reporte, identificada por el fingerprint anterior.

La excepción debe acompañarse de una justificación como: *“Falso positivo de riesgo de ejecución: el archivo es una variante estática de código de un desafío y no forma parte de las rutas ejecutadas por la aplicación”*. La documentaría en la configuración de exclusiones de Bearer del proyecto, con alcance solo a ese archivo y esa regla, y la revisaría si cambia el uso o despliegue del archivo. No excluiría toda la regla ni todo el directorio `data/static/codefixes`, para que Bearer siga señalando otros mensajes de log potencialmente sensibles.

Antes de aplicar la exclusión, comprobaría el flujo de build y despliegue para asegurar que estos archivos no se ejecutan ni se incorporan a un artefacto desplegable. Si esa comprobación no se cumple, trataría el hallazgo como real y corregiría o redactaría el error en lugar de suprimirlo.

## Resultado esperado

Bearer dejaría de reportar únicamente este caso contextual, pero la regla continuaría analizando las demás ubicaciones del proyecto y reportando nuevos hallazgos de `javascript_lang_logger_leak`.
