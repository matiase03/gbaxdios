# ==============================================================================
# GUÍA DE INSTALACIÓN Y EJECUCIÓN EN R36S (ArkOS)
# Proyecto: Pokémon Edición Argentina (Base: pokeemerald-expansion)
# ==============================================================================

## 1. MODO "PORTS" DE ARKOS (Recomendado para PortMaster)
En tu consola R36S con ArkOS:
1. Conecta la tarjeta MicroSD de juegos (TF2/EXT o TF1 si usas una sola tarjeta) a tu PC.
2. Ve a la carpeta `roms/ports/` (o `EASYROMS/ports/`).
3. Copia el archivo ejecutable del script:
   - `Pokemon Argentina.sh` -> directo en `roms/ports/`
4. Copia la carpeta del juego:
   - `pokeemerald-arg/` -> directo en `roms/ports/pokeemerald-arg/`
5. Dentro de `pokeemerald-arg/`, coloca el binario compilado:
   - `pokeemerald.aarch64` (binario nativo ARM64)
   - O bien `pokeemerald-argentina.gba` (la ROM GBA que el launcher ejecutará automáticamente con el núcleo optimizado sin latencia y con pantalla 640x480 ajustada).
6. Expulsa la tarjeta, colócala en tu R36S y abre el menú **PORTS**. Verás "Pokemon Argentina" listo para jugar.

## 2. MODO "GBA STANDALONE"
Si prefieres tener el juego en la sección regular de Game Boy Advance:
1. Copia directamente `pokeemerald-argentina.gba` en `roms/gba/`.
2. Actualiza la lista de juegos en EmulationStation (Start > UI Settings > Update Gamelists).

## 3. ASIGNACIÓN DE BOTONES R36S (RK3326)
- **D-Pad / Stick Izquierdo**: Movimiento
- **Botón A**: Confirmar / Hablar / Seleccionar
- **Botón B**: Cancelar / Correr (con Zapatillas)
- **Botón Start**: Menú Principal
- **Botón Select**: Registrar ítem rápido (Bicicleta, Caña de pescar)
- **Botones L / R**: Ayuda / Cambiar páginas en mochila o caja
- **Select + Start**: Salir al menú de ArkOS
