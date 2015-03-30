gulp = require 'gulp'
del = require 'del'
p = require 'path'
coffee = require 'gulp-coffee'
uglify = require 'gulp-uglify'

gulp.task 'clean', (callback) ->
  del 'dist', callback

gulp.task 'build', ['clean'], ->
  gulp.src 'src/*.coffee'
    .pipe coffee()
    .pipe uglify()
    .pipe gulp.dest 'dist/'

gulp.task 'default', ['build', 'clean']
