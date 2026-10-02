const ps = panels();

for (let i = 0; i < ps.length; i++) {
    const panel = ps[i];

    // Borra todo lo que haya ahora mismo en el panel
    const ids = [...panel.widgetIds];

    for (let j = 0; j < ids.length; j++) {
        const widget = panel.widgetById(ids[j]);

        if (widget) {
            widget.remove();
        }
    }

    // SOLO botón de Fedora / menú de aplicaciones
    panel.addWidget("org.kde.plasma.kickoff");

    // Escritorios virtuales
    panel.addWidget("org.kde.plasma.pager");

    // Barra donde luego pondremos SOLO Firefox + Ghostty
    panel.addWidget("org.kde.plasma.icontasks");

    // Bandeja
    panel.addWidget("org.kde.plasma.systemtray");

    // Reloj
    panel.addWidget("org.kde.plasma.digitalclock");
}
