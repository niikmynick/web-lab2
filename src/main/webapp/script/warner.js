export function showError(errorMessage) {
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

