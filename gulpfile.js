// Load plugins
const gulp = require('gulp');
const del = require('del');

// Cleaning
gulp.task('clean', function() {
  return del.sync('./assets/vendor').then(function(cb) {
    return cache.clearAll(cb);
  });
})

// Copy third party libraries from /node_modules into /vendor
gulp.task('vendor', function(cb) {

  // Bootstrap
  gulp.src([
      './node_modules/bootstrap/scss/**/*',
    ])
    .pipe(gulp.dest('./assets/vendor/bootstrap/scss'))

  // jQuery
  gulp.src([
      './node_modules/jquery/dist/*',
      '!./node_modules/jquery/dist/core.js'
    ])
    .pipe(gulp.dest('./assets/vendor/jquery'))

  // Font Awesome
  gulp.src([
      './node_modules/@fortawesome/**/*',
    ])
    .pipe(gulp.dest('./assets/vendor'))

  cb();

});

gulp.task("default", gulp.parallel('vendor'));