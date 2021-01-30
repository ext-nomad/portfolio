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
  var plates = document.querySelectorAll(".plate");
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
    switchPlate(selectedIndex % cellCount, (selectedIndex % cellCount) + 1);
  });

  var nextButton = document.querySelector(".next-button");
  nextButton.addEventListener("click", function () {
    selectedIndex++;
    rotateCarousel();
    switchPlate(selectedIndex % cellCount, (selectedIndex % cellCount) - 1);
  });

  function switchPlate(current, previous) {
    current < 0 ? (current = eval(cellCount + current)) : current;
    previous < 0 ? (previous = eval(cellCount + previous)) : previous;
    var prev = plates[previous];
    var next = plates[current];
    prev.style.opacity = 0;
    prev.style.zIndex = "-1";
    next.style.opacity = 1;
    next.style.zIndex = "10";
  }

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

    for (var i = 1; i < plates.length; i++) {
      var plate = plates[i];
      plate.style.opacity = 0;
      plate.style.zIndex = "-1";
    }
    plates[0].style.opacity = 1;
    plates[0].style.zIndex = "10";

    rotateCarousel();
  }

  changeCarousel();
});
