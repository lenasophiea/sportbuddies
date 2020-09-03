// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { autocompleteSearch } from '../components/autocomplete';
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

import { initConversationCable } from '../channels/conversation_channel'

import { initMapbox } from '../components/init_mapbox';
import "../plugins/flatpickr"

import flatpickr from "flatpickr";
import { initAutocomplete } from '../plugins/init_autocomplete.js';

import { hideNotification } from '../components/notification'




document.addEventListener('turbolinks:load', () => {
  autocompleteSearch();
  initConversationCable();
  flatpickr(".datepicker", {});
  hideNotification();
  // Call your functions here, e.g:
  // initSelect2();
  setTimeout(() => {
  initMapbox();
  },200);
  initAutocomplete();
});


