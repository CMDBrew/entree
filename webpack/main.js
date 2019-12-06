// Import components and bridge them
import Carousel from './components/carousel';
$.widget.bridge('appCarousel', Carousel);

// Initialize Bootstrap addons
window.Popper = Popper;

// Initialize application js
$(document).ready(function() {
  $('[data-js="carousel"]').appCarousel()
  $('[data-toggle="popover"]').popover();
  $('[data-toggle="tooltip"]').tooltip();
});
