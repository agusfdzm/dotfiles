# Cambiar entre escritorios virtuales
for i in {1..4}; do
    kwriteconfig6 --file kglobalshortcutsrc \
        --group kwin \
        --key "Switch to Desktop $i" \
        "Meta+$i,Ctrl+F$i,Switch to Desktop $i"
done

# Mover ventanas entre escritorios
for i in {1..4}; do
    kwriteconfig6 --file kglobalshortcutsrc \
        --group kwin \
        --key "Window to Desktop $i" \
        "Meta+Shift+$i,,Window to Desktop $i"
done

# Cerrar la ventana activa
kwriteconfig6 --file kglobalshortcutsrc \
    --group kwin \
    --key "Window Close" \
    "Meta+Q,Alt+F4,Close Window"

# Acoplar ventanas a izquierda y derecha
kwriteconfig6 --file kglobalshortcutsrc \
    --group kwin \
    --key "Window Quick Tile Left" \
    "Meta+Left,Meta+Left,Quick Tile Window to the Left"

kwriteconfig6 --file kglobalshortcutsrc \
    --group kwin \
    --key "Window Quick Tile Right" \
    "Meta+Right,Meta+Right,Quick Tile Window to the Right"
