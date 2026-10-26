#!/bin/bash
# ==============================================================================
# PortMaster / ArkOS Launch Script for "Pokemon Emerald Argentina"
# Compatible with R36S, Anbernic RG351/RG353, RGB20S (RK3326 / RK3566)
# ==============================================================================

XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

if [ -d "/opt/system/Tools/PortMaster/" ]; then
  controlfolder="/opt/system/Tools/PortMaster"
elif [ -d "/opt/tools/PortMaster/" ]; then
  controlfolder="/opt/tools/PortMaster"
else
  controlfolder="/roms/ports/PortMaster"
fi

source $controlfolder/control.txt
[ -f "${controlfolder}/mod_${CFW_NAME}.txt" ] && source "${controlfolder}/mod_${CFW_NAME}.txt"
get_controls

GAMEDIR="/$directory/ports/pokeemerald-arg"
cd "$GAMEDIR"

> "$GAMEDIR/log.txt" && exec > >(tee "$GAMEDIR/log.txt") 2>&1

# Export environment variables for SDL2 & RK3326 Mali GPU
export DEVICE_ARCH="aarch64"
export SDL_VIDEODRIVER="kmsdrm"
export SDL_RENDER_DRIVER="opengles2"
export SDL_AUDIO_DRIVER="alsa"
export LD_LIBRARY_PATH="$GAMEDIR/libs:$LD_LIBRARY_PATH"

# Setup gptokeyb for RK3326 gamepad mapping
$GPTOKEYB "pokeemerald" -c "$GAMEDIR/pokeemerald-arg.gptk" &
GPT_PID=$!

# Run native binary if compiled, otherwise run optimized high-performance standalone runner
if [ -f "$GAMEDIR/pokeemerald.aarch64" ]; then
    echo "Starting native aarch64 pokeemerald engine..."
    ./pokeemerald.aarch64
elif [ -f "$GAMEDIR/pokeemerald.armhf" ]; then
    echo "Starting native armhf pokeemerald engine..."
    ./pokeemerald.armhf
elif [ -f "$GAMEDIR/pokeemerald-argentina.gba" ]; then
    echo "Running GBA payload via ArkOS optimized core..."
    if [ -f "/usr/local/bin/mgba" ]; then
        /usr/local/bin/mgba -f "$GAMEDIR/pokeemerald-argentina.gba"
    elif [ -f "/usr/bin/retroarch" ]; then
        /usr/bin/retroarch -L /home/ark/.config/retroarch/cores/mgba_libretro.so "$GAMEDIR/pokeemerald-argentina.gba"
    else
        echo "Error: No compatible runner found."
    fi
else
    echo "Error: Neither native binary nor pokeemerald-argentina.gba found!"
fi

# Cleanup
kill -9 $GPT_PID 2>/dev/null
unset LD_LIBRARY_PATH
printf "\033c" >> /dev/tty1
