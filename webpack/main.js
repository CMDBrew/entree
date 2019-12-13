// Import components and bridge them
import Carousel from './components/carousel';
$.widget.bridge('appCarousel', Carousel);

// Initialize Bootstrap addons
window.Popper = Popper;

// cookies
function setCookie(cname, cvalue, exdays) {
  var d = new Date();
  d.setTime(d.getTime() + (exdays*24*60*60*1000));
  var expires = "expires=" + d.toGMTString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function removeCookie(cname, cvalue, exdays) {
  document.cookie = cname + "=" + ";path=/";
}

function getCookie(cname) {
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(';');
  for(var i = 0; i < ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

// Initialize application js
$(document).ready(function() {
  $('[data-js="carousel"]').appCarousel()
  $('[data-toggle="popover"]').popover();
  $('[data-toggle="tooltip"]').tooltip();

  let $alert = $('#notice-alert')
  let alert_cookie = getCookie('notice-alert');
  let alert_msg = $alert.find('.message').text();

  if( alert_msg === alert_cookie ){
    $alert.alert('dispose');
  } else {
    removeCookie('notice-alert');
  }

  $alert.on('close.bs.alert', function() {
    setCookie('notice-alert', $('#notice-alert').find('.message').text(), 1);
  });
});
