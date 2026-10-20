# Inciso 8. Excluir carpetas que no son código de la aplicación

## Objetivo

Refinar los resultados de Bearer excluyendo rutas que no corresponden al código principal de la aplicación, como archivos de prueba, ejemplos, documentación y dependencias. Se parte de los **43 hallazgos Critical y High** obtenidos en el inciso 7.

## Procedimiento

1. Revisé la ruta de archivo de cada uno de los 43 hallazgos prioritarios.
2. Apliqué la exclusión por **segmentos de ruta** a las carpetas `data/`, `test/`, `tests/`, `node_modules/`, `frontend/` y `docs/`.
3. Conservé los resultados ubicados en las demás rutas, incluidos `routes/`, `lib/` y `scripts/`.
4. Volví a contar los hallazgos por severidad después de aplicar las exclusiones.

> **Alcance de la exclusión:** `data/` contiene ejemplos y archivos estáticos de desafíos; `frontend/` se excluyó bajo el criterio de analizar únicamente el código principal del backend. Si la evaluación debe abarcar también la interfaz de usuario, no corresponde excluir `frontend/`. Las carpetas se excluyeron por alcance del análisis, no porque sus archivos sean necesariamente seguros o carezcan de código.

## Resultados

| Etapa | Critical | High | Total |
|---|---:|---:|---:|
| Después del filtro por severidad (inciso 7) | 21 | 22 | 43 |
| Excluidos por carpeta | 9 | 6 | 15 |
| **Hallazgos restantes** | **12** | **16** | **28** |

### Distribución de los 43 hallazgos antes de excluir carpetas

| Carpeta de primer nivel | Hallazgos Critical + High | Tratamiento |
|---|---:|---|
| `routes/` | 19 | Conservar |
| `lib/` | 8 | Conservar |
| `scripts/` | 1 | Conservar |
| `data/` | 12 | Excluir |
| `frontend/` | 3 | Excluir para el alcance backend |
| **Total** | **43** | |

Las demás carpetas de la lista de exclusión no presentaron hallazgos Critical o High en estos reportes.

## Conclusión

Al eliminar **15 resultados** de las carpetas fuera del alcance definido, el análisis queda concentrado en **28 hallazgos** de severidad Critical o High. Esto facilita revisar primero las vulnerabilidades del backend sin mezclar ejemplos, datos de desafíos ni archivos del frontend.

**Nota:** Este filtrado es una decisión de alcance. No demuestra que las carpetas excluidas estén libres de vulnerabilidades y no sustituye una revisión de seguridad integral.
