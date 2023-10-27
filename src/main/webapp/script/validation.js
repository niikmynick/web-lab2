import {showError} from "./warner";

export function validateForm() {
    // get values from page
    let x = document.forms[0]["x-value"].value;
    let y = document.forms[0]["y-value"].value;
    let r = document.forms[0]["r-value"];

    // check constraints
    let flag = true;
    let error_message = "";

    if (!(parseInt(x) >= -4 && parseInt(x) <= 4) || (x.search(/[^0-9.-]/) !== -1) || x === "") {
        flag = false;
        error_message += "You can use X only in range (-5 ... 3)<br>";
    }

    if (!(parseInt(y) > -3 && parseInt(y) < 3) || (y.search(/[^0-9.-]/) !== -1) || y === "") {
        flag = false;
        error_message += "You can use Y only in range (-3 ... 3)<br>";
    }

    if (!flag) {
        showError(error_message);
    }

    return flag;

}
