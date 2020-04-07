class LazyLoad {
  constructor(options, element) {
    this.options = options;
    this.element = element;
    this.$element = $(this.element);

    const defaults = {
      errorClass: 'error',
      successClass: 'loaded'
    };

    this.options = $.extend(defaults, this.options);
    this._bind();
  }

  _beforeLoad(el) {
    this.$element.css({ opacity: 0 });
  }

  _afterLoad() {
    let $el = this.$element;

    if($el.hasClass('spinner-wrap')) {
      setTimeout(function() {
        $el.find('.loading-spinner').remove();
      }, 200);
    } else {
      setTimeout(function() {
        $el.parents('.spinner-wrap').find('.loading-spinner').remove();
      }, 200);
    }
    $el.addClass(this.options.successClass);
    $el.css({ opacity: 1 });
  }

  _onError() {
    let $el = this.$element;

    if($el.hasClass('spinner-wrap')) {
      var target = $el.find('.loading-spinner')
    } else {
      var target = $el.parents('.spinner-wrap').find('.loading-spinner')
    }
    $(target).html('<div class="broken-img text-muted text-center"><i class="mdi mdi-image-off"></i></div>');

    if(!$el.is('img')) {
      $el.css({ opacity: 1 });
    }

    $el.addClass(this.options.errorClass);
  }

  _bind() {
    let _this = this;

    this.options = $.extend(this.options, this.$element.data('alert-options'));
    this.$element.lazy({
      visibleOnly: false,
      enableThrottle: true,
      beforeLoad: function() { _this._beforeLoad() },
      afterLoad: function() { _this._afterLoad() },
      onError: function() { _this._onError() }
    });
  }
};

export default LazyLoad;