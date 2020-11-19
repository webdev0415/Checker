// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

function onClickOutside(elements, callback) {
  document.addEventListener("click", (event) => {
    if (!elements.some(element => element.contains(event.target))) {
      callback();
    }
  })
};

function setupToggleMenu() {
  const toggleMenu = document.querySelector("#toogle-menu");
  const globalNav = document.querySelector('#menu');

  toggleMenu.addEventListener('click', () => globalNav.classList.toggle("hidden"));
};

function setupDropdown() {
  const dropdownOpenClass = 'hidden';
  const dropdown = document.querySelector('.dropdown');
  const dropdownItems = document.querySelector(".dropdown-items");

  if (dropdown) {
    dropdown.addEventListener('click', (event) => {
      dropdownItems.classList.toggle(dropdownOpenClass);
    });

    onClickOutside([dropdown, dropdownItems], () => {
      dropdownItems.classList.add(dropdownOpenClass)
    })
  }
};

document.addEventListener('turbolinks:load', () => {
  setupToggleMenu();
  setupDropdown();
});
