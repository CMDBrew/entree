class Carousel {
  constructor(options, element) {
    this.options = options;
    this.element = element;
    this.$element = $(this.element);

    const defaults = {
      items: 3,
      margin: 16,
      touchDrag: true,
      mouseDrag: true,
      autoplay: true,
      autoWidth: false,
      autoplayTimeout: 4000,
      autoplayHoverPause: true,
      loop: true,
      nav: false,
      dots: false,
    };

    this.options = $.extend(defaults, this.options);
    this._bind();
  }

  _bind() {
    this.options = $.extend(this.options, this.$element.data('owl-options'));
    this.$element.owlCarousel(this.options);
  }
};

export default Carousel;