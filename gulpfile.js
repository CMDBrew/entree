// Load plugins
const gulp = require('gulp');
const del = require('del');

// Cleaning
gulp.task('clean', function() {
  return del.sync('./assets/vendors').then(function(cb) {
    return cache.clearAll(cb);
  });
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

  // Popper
  gulp.src([
      './node_modules/popper.js/dist/umd/popper.min.*'
    ])
    .pipe(gulp.dest('./assets/vendors/popper'))

  // SmartBanner
  gulp.src([
      './node_modules/smartbanner.js/dist/smartbanner.min.*'
    ])
    .pipe(gulp.dest('./assets/vendors/smartbanner'))

  // Font Awesome
  gulp.src([
      './node_modules/@fortawesome/**/*',
    ])
    .pipe(gulp.dest('./assets/vendors'))

  cb();

});

gulp.task("default", gulp.parallel('vendors'));