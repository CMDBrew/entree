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

function lazyLoadImage() {
  $('[data-js="lazy"]').lazy({
    appendScroll: $('.overflow-y'),
    visibleOnly: true,
    // called before an elements gets handled
    beforeLoad: function(element) {
      $(element).css({ opacity: 0 });
    } ,
    // called after an element was successfully handled
    afterLoad: function(element) {
      if($(element).hasClass('spinner-wrap')) {
        setTimeout(function() {
          $(element).find('.loading-spinner').remove();
        }, 200);
      } else {
        setTimeout(function() {
          $(element).parents('.spinner-wrap').find('.loading-spinner').remove();
        }, 200);
      }
      $(element).addClass('loaded');
      $(element).css({ opacity: 1 });
    },
    // called whenever an element could not be handled
    onError: function(element) {
      if($(element).hasClass('spinner-wrap')) {
        var target = $(element).find('.loading-spinner')
      } else {
        var target = $(element).parents('.spinner-wrap').find('.loading-spinner')
      }
      $(target).html('<div class="text-danger text-center"><i class="far fa-file-image fa-2x"></i></div>');

      if(!$(element).is('img')) {
        $(element).css({ opacity: 1 });
      }

      $(element).addClass('error');
    }
  });
}

// Initialize application js
$(document).ready(function() {
  $('[data-js="carousel"]').appCarousel();
  $('[data-toggle="popover"]').popover();
  $('[data-toggle="tooltip"]').tooltip();
  lazyLoadImage();

  $('a[data-toggle="tab"]').on('shown.bs.tab', function() {
    lazyLoadImage();
  });

  // Files Mode (START)
  var mode = getCookie('files-mode');
  if(mode) {
    $('#files-mode-viewport').attr('data-mode', mode);
    lazyLoadImage();
  }

  $("#files-mode-switcher .btn").on('click', function(e){
    var mode = $(this).data('mode');
    $('#files-mode-viewport').attr('data-mode', mode);
    setCookie('files-mode', mode, 30);
    lazyLoadImage();
    e.preventDefault();
    e.stopPropagation();
  });
  // Files Mode (END)

  // Alert (START)
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
  // Alert (END)
});
