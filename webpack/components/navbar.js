// class NavBar {
//   constructor(options, element) {
//     this.options = options;
//     this.element = element;
//     this.$element = $(this.element);

//     const defaults = {
//       activeClass: 'navbar-light bg-light',
//       inactiveClass: 'navbar-dark'
//     };

//     this.options = $.extend(defaults, this.options);
//     this._bind();
//   }

//   open() {
//     this.$element.addClass("navbar-light bg-light");
//     this.$element.removeClass("navbar-dark");
//     return this;
//   }

//   close() {
//     this.$element.addClass("navbar-dark");
//     this.$element.removeClass("navbar-light bg-light");
//     return this;
//   }

//   destroy() {
//     this.$element = null;
//     return this;
//   }

//   _bind() {
//     $(document).on("scroll", () => {
//       if($(window).scrollTop > $(document).find("#jumbotron").height()) {
//         this.open();
//       } else {
//         this.close();
//       }
//     });
//   }
// };

// export default NavBar;