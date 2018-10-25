var gulp = require('gulp');
var cleanCSS = require('gulp-clean-css');
var uglify = require('gulp-uglify');
var browserSync = require('browser-sync').create();
var imageMin = require('gulp-imagemin');
var concat = require('gulp-concat');
var htmlMin = require('gulp-htmlmin');
var notify = require('gulp-notify');
var replace = require('gulp-replace');

var cssFiles = ['./public/assets/css/**/*.css'];
var jsFiles = ['./public/assets/js/**/*.js'];
var imgFiles = [
  './public/assets/img/**/*.jpg',
  './public/assets/img/**/*.gif',
  './public/assets/img/**/*.png',
  '!./public/assets/img/originals/**/*'
];
var videoFiles = ['./public/assets/video/**/*.mp4'];
var htmlFile = ['./public/assets/*.html'];

// Copy third party libraries from /node_modules into /vendor
gulp.task('vendor', function() {
  
  // Bootstrap
  gulp.src([
    './node_modules/bootstrap/dist/**/*',
    '!./node_modules/bootstrap/dist/css/bootstrap-grid*',
    '!./node_modules/bootstrap/dist/css/bootstrap-reboot*'
  ])
  .pipe(gulp.dest('./vendor/bootstrap'))

  // Font Awesome
  gulp.src([
    './node_modules/@fortawesome/fontawesome-free/**/*',
    '!./node_modules/@fortawesome/fontawesome-free/{less,less/*}',
    '!./node_modules/@fortawesome/fontawesome-free/{scss,scss/*}',
    '!./node_modules/@fortawesome/fontawesome-free/.*',
    '!./node_modules/@fortawesome/fontawesome-free/*.{txt,json,md}'
  ])
  .pipe(gulp.dest('./vendor/@fortawesome/fontawesome-free'))

  // jQuery
  gulp.src([
    './node_modules/jquery/dist/*',
    '!./node_modules/jquery/dist/core.js'
  ])
  .pipe(gulp.dest('./vendor/jquery'))

  // jQuery Easing
  gulp.src([
    './node_modules/jquery.easing/*.js'
  ])
  .pipe(gulp.dest('./vendor/jquery-easing'))

});

// Copy video from ./assets/video into ./dist/video
gulp.task('video', function() {
  gulp.src(videoFiles)
    .pipe(gulp.dest('./public/dist/video/'));
});

// Replace HTML
gulp.task('html:replace', function() {
  return gulp.src(htmlFile)
  .pipe(replace('https://<user>.github.io/<rep>/', 'https://www.<proj>.com.br/'))
  .pipe(replace('UA-124234746-1', 'UA-124836988-1'))
  .pipe(replace('ramon-carvalho@', 'ramon-carvalho@<proj>.com.br'))
  .pipe(replace('rafael-franco@', 'rafael-franco@<proj>.com.br'))
  .pipe(replace('rafael-santos@', 'rafael-santos@<proj>.com.br'))
  .pipe(gulp.dest('./'));
});

// Minify Production HTML
gulp.task('html:prod:minify', ['html:replace'], function() {
  return gulp.src('./index.html')
  .pipe(htmlMin({
    collapseWhitespace:true
  }))
  .on("error", notify.onError("Error: <%= error.message %>"))
  .pipe(gulp.dest('./'))
  .pipe(browserSync.stream());
});

// Production HTML
gulp.task('html:prod', ['html:replace', 'html:prod:minify']);

// Minify HTML
gulp.task('html:minify', function() {
  return gulp.src(htmlFile)
  .pipe(htmlMin({
    collapseWhitespace:true
  }))
  .on("error", notify.onError("Error: <%= error.message %>"))
  .pipe(gulp.dest('./'))
  .pipe(browserSync.stream());
});

// HTML
gulp.task('html', ['html:minify']);

// Minify CSS
gulp.task('css:minify', function() {
  return gulp.src(cssFiles)
    .pipe(cleanCSS())
    .pipe(concat('<proj>.min.css'))
    .pipe(gulp.dest('./public/dist/css'))
    .pipe(browserSync.stream());
});

// CSS
gulp.task('css', ['css:minify']);

// Minify JavaScript
gulp.task('js:minify', function() {
  return gulp.src(jsFiles)
    .pipe(uglify())
    .on("error", notify.onError("Error: <%= error.message %>"))
    .pipe(concat('<proj>.min.js'))
    .pipe(gulp.dest('./public/dist/js'))
    .pipe(browserSync.stream());
});

// JS
gulp.task('js', ['js:minify']);

// Minify Image
gulp.task('img', function() {
  return gulp.src(imgFiles)
    .pipe(imageMin())
    .pipe(gulp.dest('./public/dist/img/'));
});

// Default task
gulp.task('default', ['html', 'css', 'js', 'img', 'video', 'vendor']);

// Configure the browserSync task
gulp.task('browserSync', function() {
  browserSync.init({
    server: {
      baseDir: "./"
    }
  });
});

//Dev task
gulp.task('dev', ['html', 'css', 'js', 'img', 'video', 'vendor', 'browserSync'], function() {
  gulp.watch(cssFiles, ['css']);
  gulp.watch(jsFiles, ['js']);
  gulp.watch(imgFiles, ['img']);
  gulp.watch(htmlFile, ['html']);
});

//Prod task
gulp.task('prod', ['html:prod', 'css', 'js', 'img', 'video', 'vendor', 'browserSync'], function() {
  gulp.watch(cssFiles, ['css']);
  gulp.watch(jsFiles, ['js']);
  gulp.watch(imgFiles, ['img']);
  gulp.watch(htmlFile, ['html:prod']);
});