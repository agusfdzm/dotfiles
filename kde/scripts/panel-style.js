const ps = panels();

for (let i = 0; i < ps.length; i++) {
    const panel = ps[i];

    panel.location = "top";
    panel.height = 42;
    panel.alignment = "center";
    panel.lengthMode = "fill";
    panel.hiding = "none";
}
