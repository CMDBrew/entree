// Load plugins
const gulp = require('gulp');
const del = require('del');

// Cleaning
gulp.task('clean', function() {
  return del('.assets/vendors/**', { force:true });
})

// Copy third party libraries from /node_modules into /vendor
gulp.task('vendors', function(cb) {

  // Bootstrap
  gulp.src([
      './node_modules/bootstrap/scss/**/*',
    ])
    .pipe(gulp.dest('./assets/vendors/bootstrap/scss'))

  gulp.src([
      './node_modules/bootstrap/dist/js/bootstrap.min.*',
    ])
    .pipe(gulp.dest('./assets/vendors/bootstrap/js'))

  // jQuery
  gulp.src([
      './node_modules/jquery/dist/*',
      '!./node_modules/jquery/dist/core.js'
    ])
    .pipe(gulp.dest('./assets/vendors/jquery'))

  gulp.src([
      './node_modules/jquery-ui/ui/widget.js',
    ])
    .pipe(gulp.dest('./assets/vendors/jquery-ui'))

  // jQuery Lazy
  gulp.src([
      './node_modules/jquery-lazy/jquery.lazy.min.js',
    ])
    .pipe(gulp.dest('./assets/vendors/jquery-lazy'))

  // Popper
  gulp.src([
      './node_modules/popper.js/dist/umd/popper.min.*'
    ])
    .pipe(gulp.dest('./assets/vendors/popper'))

  // Font Awesome
  gulp.src([
      './node_modules/@fortawesome/**/*',
    ])
    .pipe(gulp.dest('./assets/vendors'))

  // OwlCarousel
  gulp.src([
      './node_modules/owl.carousel/dist/**/*',
    ])
    .pipe(gulp.dest('./assets/vendors/owl.carousel'))

  cb();

});

gulp.task("default", gulp.parallel('vendors'));