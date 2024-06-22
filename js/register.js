document.addEventListener('DOMContentLoaded', function() {
    const buttons = document.querySelectorAll('.register-btn');

    buttons.forEach(button => {
        button.addEventListener('click', function() {
            alert(`Anda memilih ${this.textContent}`);
        });
    });
});
