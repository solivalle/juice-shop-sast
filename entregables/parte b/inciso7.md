# Inciso 7. Filtrar los resultados por severidad

## Objetivo

Concentrar el análisis de vulnerabilidades detectadas por **Bearer** en los hallazgos de severidad **Critical** y **High**, utilizando los reportes `bearer-report.html` y `bearer-report.sarif`.

## Procedimiento

1. Revisé los hallazgos del reporte HTML, donde Bearer identifica expresamente la severidad de cada detección.
2. Seleccioné únicamente los resultados etiquetados como **critical** o **high**.
3. Descarté de este análisis los resultados **medium**, **low** y **warning**.
4. Conservé la regla/ID, el archivo y la línea para poder revisar los hallazgos prioritarios en el código.

## Resultados

| Severidad | Hallazgos originales | Hallazgos seleccionados |
|---|---:|---:|
| Critical | 21 | 21 |
| High | 22 | 22 |
| Medium | 32 | 0 |
| Low | 322 | 0 |
| Warning | 0 | 0 |
| **Total** | **397** | **43** |

El filtrado por severidad reduce el conjunto de **397 a 43 hallazgos**. En esta etapa **todavía no se excluyen carpetas**; ese paso se documenta en el inciso 8.

## Criterio técnico

Se tomó como referencia la severidad indicada por el reporte HTML. El nivel `error` del formato SARIF no necesariamente permite distinguir por sí solo entre **Critical** y **High**, por lo que no se asumió que todos los `error` equivalen a una sola de estas severidades.

## Conclusión

El filtrado permite priorizar las vulnerabilidades potencialmente más graves y reducir el volumen de resultados que requieren revisión manual. La severidad asignada por el escáner no confirma por sí sola que cada hallazgo sea explotable.
