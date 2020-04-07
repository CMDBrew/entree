class VisibleIndicator {
  constructor(options, element) {
    this.options = options;
    this.element = element;
    this.$element = $(this.element);

    let target = this.$element.data('target');

    const defaults = {
      visibleClass: 'is-visible',
      alreadyVisibleClass: 'already-visible',
      invisibleClass: 'is-invisible'
    };

    this.options = $.extend(defaults, this.options);

    if(target) {
      this.$container = this.$element.parents(target);
    } else {
      this.$container = this.$element;
    }

    this._bind();
  }

  _checkIfVisible() {
    var $t = this.$container,
        $w = $(window),
        viewTop = $w.scrollTop(),
        viewBottom = viewTop + $w.height(),
        _top = $t.offset().top,
        _bottom = _top + $t.height(),
        compareTop = _bottom,
        compareBottom = _top;

    return ((compareBottom <= viewBottom) && (compareTop >= viewTop));
  }

  _markAlreadyVisible() {
    if(this._checkIfVisible()) {
      this.$container.addClass(this.options.alreadyVisibleClass);
    }
  }

  _trackScroll() {
    let _this = this;

    $(window).scroll(function(_event) {
      if(_this._checkIfVisible()) {
        _this.$container.addClass(_this.options.visibleClass);
      } else {
        _this.$container.addClass(_this.options.invisibleClass);
      }
    })
  }

  _bind() {
    this.options = $.extend(this.options, this.$element.data('visible-options'));
    this._markAlreadyVisible();
    this._trackScroll();
  }
};

export default VisibleIndicator;