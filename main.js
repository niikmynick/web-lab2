import {validateForm} from "./src/main/webapp/script/validation";
import {showError} from "./src/main/webapp/script/warner"
import {draw} from "./src/main/webapp/script/drawer";


// change values
// let selector_R = document.querySelector("#r-value");
let selector_X = document.querySelector("#x-value");
let input_Y = document.querySelector("#y-value");

// selector_R.addEventListener("change", function() {
//     draw(selector_X.value, input_Y.value, selector_R.value);
// });

selector_X.addEventListener("change", function() {
    let rValues = document.querySelectorAll('.rBox');
    let r;

    rValues.forEach(checkbox => {
        if (checkbox.checked) {
            r = checkbox.value;
        }
    });
    draw(selector_X.value, input_Y.value, r);
});

input_Y.addEventListener("input", function() {
    let rValues = document.querySelectorAll('.rBox');
    let r;

    rValues.forEach(checkbox => {
        if (checkbox.checked) {
            r = checkbox.value;
        }
    });
    draw(selector_X.value, input_Y.value, r);
});


// svg listener

let svg = document.getElementById("graph-svg");

svg.addEventListener('click', function (event) {

    let rValues = document.querySelectorAll('.rBox');
    let r;

    rValues.forEach(checkbox => {
        let flag = true
        if (checkbox.checked && flag) {
            r = checkbox.value;
            flag = false
        }
    });

    if (r !== null) {
        let option = document.createElement('option');
        let x = (event.offsetX - 200) / (100 / r)
        let y = (event.offsetY - 200) / (-100 / r)

        option.value = x.toString();
        document.getElementById('x-value').appendChild(option);
        document.getElementById('x-value').value = x;

        document.getElementById('y-value').value = y;

        document.getElementById('user-input').submit();
    }
});

// form listener

const form = document.getElementById('user-input')
form.addEventListener('submit', event => {
    if (!validateForm()) {
        event.preventDefault();
    }
})