function draw(x, y, r) {
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

let selector_R = document.querySelector("#r-value");
let selector_X = document.querySelector("#x-value");

selector_R.addEventListener("change", function() {
    draw(selector_X.value, 0, selector_R.value);
});

selector_X.addEventListener("change", function() {
    draw(selector_X.value, 0, selector_R.value);
});


let svg = document.getElementById("graph-svg");

svg.addEventListener('click', function (event) {

    let r = document.getElementById('r-value').value;

    if (r !== null) {
        let option = document.createElement('option');
        let x = Math.round(((event.offsetX - 200) / (120 / r) + Number.EPSILON) * 100) / 100;
        let y = Math.round(((event.offsetY - 200) / (-120 / r) + Number.EPSILON) * 100) / 100

        option.value = x.toString();
        document.getElementById('x-value').appendChild(option);
        document.getElementById('x-value').value = x;

        document.getElementById('y-value').value = y;

        document.getElementById('user-input').submit();
    }
});