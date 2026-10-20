# Inciso 14: Comparación entre el análisis local y el pipeline

## Diferencias encontradas

Al comparar el reporte local de `entregables/parte b` con el reporte HTML adjunto generado por el pipeline, no se observa una diferencia en la cantidad de hallazgos por severidad. Ambos reportes muestran:

| Severidad | Análisis local | Pipeline |
|---|---:|---:|
| Crítica | 21 | 21 |
| Alta | 22 | 22 |
| Media | 32 | 32 |
| Baja | 322 | 322 |
| Advertencia | 0 | 0 |

Los dos HTML también indican la fecha de generación **20 de octubre de 2026 a las 06:22:39 UTC**. Por lo tanto, con los archivos disponibles, los resultados reportados son equivalentes en sus totales y no se aprecia una diferencia cuantitativa.

La diferencia está principalmente en dónde y cómo se ejecuta el análisis:

- **Análisis local:** se ejecuta manualmente desde el equipo de desarrollo. Permite probar cambios de inmediato y revisar los reportes HTML y SARIF guardados en `entregables/parte b`.
- **Análisis del pipeline:** se ejecuta en GitHub Actions sobre el código del repositorio cuando ocurre un evento configurado, como un `push`, un `pull request` o una ejecución manual. El workflow publica el SARIF en GitHub Code Scanning y conserva el reporte HTML como artefacto de esa ejecución.

Aunque estos dos reportes presentan los mismos totales, eso no garantiza que todos los análisis futuros siempre coincidan. El resultado puede variar si se analiza un commit diferente, cambian las opciones o exclusiones del escáner, o se usan versiones o entornos distintos de Bearer.

## ¿Por qué conviene tener los dos?

El análisis local sirve para recibir retroalimentación rápida durante el desarrollo: se puede ejecutar después de un cambio, investigar un hallazgo y corregirlo antes de subir el código. El pipeline aporta una comprobación repetible e independiente del equipo de cada desarrollador, ejecutada sobre el código enviado al repositorio; además, centraliza los resultados en Code Scanning y deja disponible el HTML como artefacto.

Usarlos en conjunto permite detectar problemas pronto y, a la vez, comprobar que los cambios que llegan a GitHub también pasan por el análisis automatizado. El análisis local complementa al pipeline, pero no lo sustituye; el pipeline complementa al análisis local, pero no elimina la utilidad de revisar cambios mientras se trabaja.
