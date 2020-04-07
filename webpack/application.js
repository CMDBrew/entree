// Import components and bridge them
import Carousel from './components/carousel';
import NewReleaseIndicator from './components/new_release_undicator';
import Alert from './components/alert';
import LazyLoad from './components/lazy_load';
import VisibleIndicator from './components/visible_indicator';
import ScrolledBy from './components/scrolled_by';

$.widget.bridge('appCarousel', Carousel);
$.widget.bridge('appNewReleaseIndicator', NewReleaseIndicator);
$.widget.bridge('appAlert', Alert);
$.widget.bridge('appLazyLoad', LazyLoad);
$.widget.bridge('appVisibleIndicator', VisibleIndicator);
$.widget.bridge('appScrolledBy', ScrolledBy);

// Initialize Bootstrap addons
window.Popper = Popper;

// Initialize application js
$(document).ready(function() {
  $('[data-js="carousel"]').appCarousel();
  $('[data-toggle="popover"]').popover();
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-js="new-release"]').appNewReleaseIndicator();
  $('[data-js="lazy"]').appLazyLoad();
  $('#alert').appAlert();
  $('[data-js="visible"]').appVisibleIndicator();
  $('[data-js="scrolled-by"]').appScrolledBy();
});
