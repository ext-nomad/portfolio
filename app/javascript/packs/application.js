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

  var carousel = document.querySelector(".carousel");
  var cells = carousel.querySelectorAll(".carousel_cell");
  var cellCount = carousel.dataset.cells;
  var selectedIndex = 0;
  var radius, theta;

  function rotateCarousel() {
    var angle = theta * selectedIndex * -1;
    carousel.style.transform =
      "translateZ(" + -radius + "px) " + "rotateY" + "(" + angle + "deg)";
  }

  var prevButton = document.querySelector(".previous-button");
  prevButton.addEventListener("click", function () {
    selectedIndex--;
    rotateCarousel();
  });

  var nextButton = document.querySelector(".next-button");
  nextButton.addEventListener("click", function () {
    selectedIndex++;
    rotateCarousel();
  });

  function changeCarousel() {
    theta = 360 / cellCount;
    var cellSize = carousel.offsetWidth;
    radius = Math.round(cellSize / 2 / Math.tan(Math.PI / cellCount));
    for (var i = 0; i < cells.length; i++) {
      var cell = cells[i];
      if (i < cellCount) {
        // visible cell
        cell.style.opacity = 1;
        var cellAngle = theta * i;
        cell.style.transform =
          "rotateY" + "(" + cellAngle + "deg) translateZ(" + radius + "px)";
      } else {
        // hidden cell
        cell.style.opacity = 0;
        cell.style.transform = "none";
      }
    }

    rotateCarousel();
  }

  changeCarousel();
});
