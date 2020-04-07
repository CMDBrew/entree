class ScrolledBy {
  constructor(options, element) {
    this.options = options;
    this.element = element;
    this.$element = $(this.element);
    this.offsetTop = this.$element.offset().top;
    this.scrollPosY = 0;

    const defaults = {
      offset: 50,
      delay: 50,
      activeClass: 'scrolled-by',
    };

    this.options = $.extend(defaults, this.options);
    this._bind();
  }

  _calcPosition() {
    let height = this.$element.height();

    return this.offsetTop + height + this.options.offset;
  }

  _checkIfScrolledBy() {
    let offset = this._calcPosition(),
        scrollPosY = $(window).scrollTop();

    if(Math.abs($(window).scrollTop() - this.scrollPosY) > this.options.delay) {
      if(scrollPosY > offset) {
        this.$element.addClass(this.options.activeClass);
      } else {
        this.$element.removeClass(this.options.activeClass);
      }

      this.scrollPosY = scrollPosY;
    }
  }

  _bind() {
    let _this = this;

    this.options = $.extend(this.options, this.$element.data('scrolled-by-options'));
    this._checkIfScrolledBy();

    $(window).resize(function(_e) { _this._checkIfScrolledBy() });
    $(window).scroll(function(_e) { _this._checkIfScrolledBy() });
  }
};

export default ScrolledBy;