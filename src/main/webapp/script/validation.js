function showError(errorMessage) {
    const errorModal = document.getElementById("error-modal");
    const errorMessageElement = document.getElementById("error-message");

    errorMessageElement.innerHTML = errorMessage;

    // Отображаем модальное окно
    errorModal.style.display = "block";

    // Назначаем обработчик события для кнопки закрытия
    const closeBtn = document.querySelector(".close");
    closeBtn.addEventListener("click", function() {
        errorModal.style.display = "none"; // Закрываем модальное окно при клике на кнопку закрытия
    });

    // Закрываем модальное окно при клике вне окна
    window.addEventListener("click", function(event) {
        if (event.target === errorModal) {
            errorModal.style.display = "none";
        }
    });
}


function validateForm() {
    // get values from page
    let x = document.forms[0]["x-value"].value;
    let y = document.forms[0]["y-value"].value;
    let r = document.forms[0]["r-value"].value;

    // check constraints
    let flag = true;
    let error_message = "";

    if (!(parseInt(x) > -4 && parseInt(x) < 4) || (x.search(/[^0-9.-]/) !== -1) || x === "") {
        flag = false;
        error_message += "You can use X only in range (-5 ... 3)<br>";
    }

    if (!(parseInt(y) > -3 && parseInt(y) < 3) || (y.search(/[^0-9.-]/) !== -1) || y === "") {
        flag = false;
        error_message += "You can use Y only in range (-3 ... 3)<br>";
    }

    if (!(parseInt(r) >= 1 && parseInt(r) <= 3) || (r.search(/[^0-9.-]/) !== -1) || r === "") {
        flag = false;
        error_message += "You can use R only in range (1 ... 3)<br>";
    }

    if (!flag) {
        showError(error_message);
    }

    return flag;

}


const form = document.getElementById('user-input')
form.addEventListener('submit', event => {
    if (!validateForm()) {
        event.preventDefault();
    }
})
