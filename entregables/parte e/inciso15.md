# Inciso 15: Ventajas y limitaciones de SAST frente a DAST

SAST (*Static Application Security Testing*) analiza el código fuente, bytecode o binarios sin ejecutar la aplicación. DAST (*Dynamic Application Security Testing*) evalúa la aplicación mientras está en ejecución, enviándole solicitudes y observando sus respuestas.

| Aspecto | SAST | DAST |
|---|---|---|
| Momento de uso | Durante el desarrollo, incluso antes de ejecutar o desplegar la aplicación. | Cuando existe una aplicación ejecutándose en un entorno de prueba o staging. |
| Qué examina | Código, patrones inseguros, dependencias y posibles flujos de datos. | Comportamiento observable desde el exterior: respuestas HTTP, configuración y vulnerabilidades explotables durante la ejecución. |
| Ventaja principal | Puede señalar el archivo y la línea asociados al problema, lo que ayuda a corregirlo temprano. | Comprueba el comportamiento real y puede confirmar problemas que dependen de la configuración o del entorno de ejecución. |
| Limitación principal | Puede producir falsos positivos y no siempre determina si una ruta vulnerable es alcanzable o explotable en el entorno real. | No ve el código interno y solo cubre las rutas y estados que logra probar; requiere que la aplicación esté disponible y configurada. |

## Ventajas de SAST

- Detecta posibles problemas en etapas tempranas, antes de publicar la aplicación.
- Se puede integrar en el editor, en el equipo de desarrollo o en el pipeline de integración continua.
- Facilita la ubicación del hallazgo en el código y su corrección por quien desarrolla esa funcionalidad.
- Puede revisar grandes cantidades de código de forma repetible.

## Limitaciones de SAST

- Analiza indicios estáticos y puede reportar código riesgoso que no sea alcanzable en la ejecución real.
- Puede generar falsos positivos o no comprender completamente el contexto, las validaciones y la configuración de la aplicación.
- No observa directamente problemas que solo aparecen en ejecución, por ejemplo, ciertas configuraciones incorrectas del servidor o comportamientos dependientes del entorno.
- La cobertura depende de los lenguajes, frameworks y reglas que soporte la herramienta.

## Ventajas de DAST

- Prueba la aplicación en ejecución y observa respuestas y comportamientos reales.
- Puede encontrar problemas de configuración y vulnerabilidades visibles desde la interfaz de la aplicación, aunque no tenga acceso al código fuente.
- Ayuda a comprobar si una condición detectada tiene un efecto observable en el entorno probado.

## Limitaciones de DAST

- Necesita una aplicación desplegada y un entorno de prueba seguro y representativo.
- Puede pasar por alto funcionalidades protegidas por autenticación, flujos complejos o rutas que no se ejercitaron durante el escaneo.
- Normalmente indica el endpoint o la interacción problemática, pero no necesariamente la línea de código que debe corregirse.
- La ejecución puede tardar y algunos casos requieren configurar cuentas, datos de prueba o recorridos específicos.

## Conclusión

SAST y DAST tienen alcances distintos y se complementan. SAST ayuda a localizar riesgos en el código con rapidez y a incorporarlos al proceso de desarrollo. DAST aporta evidencia del comportamiento de la aplicación desplegada y de los problemas que se manifiestan durante su ejecución. Conviene usar ambos: SAST para prevenir y corregir temprano, y DAST para validar la superficie expuesta en un entorno controlado. Ninguno por sí solo garantiza que la aplicación esté libre de vulnerabilidades.
