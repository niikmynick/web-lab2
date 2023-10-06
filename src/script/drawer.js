export function draw(x, y, r) {
    const circle = document.getElementById('point')

    const r_label = document.getElementsByClassName("r-label");
    const r_minus_label = document.getElementsByClassName("r-minus-label");
    const r_half_label = document.getElementsByClassName("r-half-label");
    const r_minus_half_label = document.getElementsByClassName("r-half-minus-label");


    const centerX = 200;
    const centerY = 200;
    const scaleFactor = 100 / r;

    const scaledX = (x * scaleFactor) + centerX;
    const scaledY = (y * -scaleFactor) + centerY;

    // set new coordinates for red circle
    circle.setAttribute("cx", scaledX.toString());
    circle.setAttribute("cy", scaledY.toString());

    // set values instead of R markers
    for (let label of r_label) {
        label.innerHTML = r.toString();
    }

    for (let label of r_minus_label) {
        label.innerHTML = (-r).toString();
    }

    for (let label of r_half_label) {
        label.innerHTML = (r/2).toString();
    }

    for (let label of r_minus_half_label) {
        label.innerHTML = (-r/2).toString();
    }

}
