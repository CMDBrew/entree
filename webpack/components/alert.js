class Alert {
  constructor(options, element) {
    this.options = options;
    this.element = element;
    this.$element = $(this.element);

    const defaults = {
      cookieName: 'alert',
      expireInDays: 30
    };

    this.options = $.extend(defaults, this.options);
    this._bind();
  }

  _sanitizeText(str) {
    return str.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '-');
  }

  _content() {
    return this._sanitizeText(this.$element.find('.content').text());
  }

  _setCookie() {
    let expires_at = new Date();

    expires_at.setTime(expires_at.getTime() + (this.options.expireInDays*24*60*60*1000));
    document.cookie = `${this.options.cookieName}=${this._content()};expires=${expires_at.toGMTString()};path=/`
  }

  _getCookie() {
    var name = `${this.options.cookieName}=`;
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

  _checkContent() {
    let msg = this._content(),
        cookie = this._getCookie();

    if(msg !== cookie) {
      this._setCookie();
      this.$element.show();
    }
  }

  _bind() {
    this.options = $.extend(this.options, this.$element.data('alert-options'));
    this._checkContent();
  }
};

export default Alert;