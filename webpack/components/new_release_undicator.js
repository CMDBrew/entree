class NewReleaseIndicator {
  constructor(options, element) {
    this.options = options;
    this.element = element;
    this.$element = $(this.element);

    const defaults = {
      activeClass: 'new-release',
      offset: 3
    };

    this.options = $.extend(defaults, this.options);
    this._bind();
  }

  _highlight() {
    let $el = this.$element;

    let date = Date.parse($el.data('date')),
        threshold_date = new Date();

    threshold_date.setTime(threshold_date.getTime() - (this.options.offset*24*60*60*1000));

    if(date > Date.parse(threshold_date)) {
      $el.addClass(this.options.activeClass);
    }
  }

  _bind() {
    this.options = $.extend(this.options, this.$element.data('tracker-options'));
    this._highlight();
  }
};

export default NewReleaseIndicator;