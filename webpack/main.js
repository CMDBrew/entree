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

function sanitizeText(str) {
  return str.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '-');
}

// Initialize application js
$(document).ready(function() {
  $('[data-js="carousel"]').appCarousel();
  $('[data-toggle="popover"]').popover();
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-js="lazy"]').lazy({
    // called after an element was successfully handled
    afterLoad: function(element) {
      if($(element).hasClass('spinner-wrap')) {
        $(element).find('.loading-spinner').remove();
      } else {
        $(element).parents('.spinner-wrap').find('.loading-spinner').remove();
      }
    }
  });

  var $alert = $('#notice-alert');
  var alert_cookie = getCookie('notice-alert');
  var alert_msg = sanitizeText($alert.find('.message').text());

  if(alert_msg === alert_cookie){
    $alert.remove();
  } else {
    removeCookie('notice-alert');
  }

  $alert.on('close.bs.alert', function() {
    setCookie('notice-alert', sanitizeText($alert.find('.message').text()), 30);
  });
});
