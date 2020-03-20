document.addEventListener("turbolinks:load", () => {
   function init() {
       closeModal();
   }

   function closeModal() {
       const modal = document.querySelector(".modal");
       const closeButton = document.querySelector('.js-close-modal');
       const modalInner = document.querySelector('.modal-inner');

       function closeIt() {
           modal.classList.remove("is-active");
           modalInner.innerHTML = "";
       }

       if (closeButton) {
           closeButton.addEventListener('click', closeIt, false);
       }
   }

   init();
});