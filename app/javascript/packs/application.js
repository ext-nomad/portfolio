require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("@rails/actiontext");
require("trix");

import "bootstrap/dist/js/bootstrap";
import "bootstrap/dist/css/bootstrap";
import "@fortawesome/fontawesome-free/css/all";
require("stylesheets/application.scss");

$(document).on("turbolinks:load", function () {
  $('[data-toggle="tooltip"]').tooltip();
});
