// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require('materialize-css/dist/js/materialize')
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("chartkick").use(require("highcharts"))

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

document.addEventListener('DOMContentLoaded', function() {
  var _sidenav = document.querySelectorAll('.sidenav');
  var sidenav = M.Sidenav.init(_sidenav);

  var _modal = document.querySelectorAll('.modal');
  var modal = M.Modal.init(_modal);

  // Alert Message
  let alertMessage = document.getElementById('alert');
  
  alertMessage.classList.add('alert-message--visible');
  
  setTimeout((() => {
    alertMessage.classList.remove('alert-message--visible');
  }), 10000);
  
  alertMessage.addEventListener('click', () => {
    alertMessage.classList.remove('alert-message--visible');
  });
});