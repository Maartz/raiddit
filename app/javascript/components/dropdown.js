document.addEventListener('turbolinks:load', () => {
    const dropdown = document.querySelector('.js-dropdown-user-target');
    const dropdownList = document.querySelector('.dropdown-list');

    dropdown.addEventListener('click', event => event.preventDefault());

    document.addEventListener('click', event => {
        if(event.target.closest('.dropdown')) {
            dropdownList.classList.remove("hidden");
        } else {
            dropdownList.classList.add('hidden');
        }
    })
});