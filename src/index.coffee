fs = require 'fs'
p = require 'path'
r = require 'regexpbuilder'

module.exports = new class
  normalizePath: (path) ->
    path ?= ".env"
    path = p.join process.cwd(), path

    return path

  parse: (content) ->
    regex = r
    .min(0).whitespace()
    .some(["A-Za-z0-9_"]).asGroup()
    .min(0).whitespace()
    .then('=')
    .min(0).whitespace()
    .min(0).from(["A-Za-z0-9_"]).asGroup()
    .lineBreak()
    .globalMatch()
    .getRegExp()

    loop
      match = regex.exec content
      break if not match

      process.env[match[1]] = match[2]

  loadSync: (path) ->
    file = fs.readFileSync @.normalizePath(path)

    @.parse file.toString()

  load: (path, callback) ->
    env = @

    if typeof path == "function"
      callback = path
      path = null

    fs.readFile env.normalizePath(path), (err, file) ->
      throw err if err

      env.parse file.toString()
      callback?()

  require: (name, values) ->
    value = process.env[name]

    throw new Error if not value
    throw new Error if values and values.indexOf(value) is -1

  default: (name, value) ->
    process.env[name] ?= value

