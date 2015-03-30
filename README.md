# nodedotenv
Loads environment variables from .env for your projects with nodejs support.

## Install

```sh
npm install https://github.com/DsXack/nodedotenv --save
```

## Use

include module:

```javascript
env = require('nodedotenv')
```

async load:

```javascript
env.load('.env', callback)

// or

env.load(callback)
```

sync load:

```javascript
env.loadSync('.env')

// or

env.loadSync()
```

`require` and `default` env variables and variable values

```javascript
env = require('nodedotenv')

env.load(function () {
    env.require('APP_ENV', ['dev', 'production'])
    env.require('MYSQL_USERNAME')
    env.require('MYSQL_PASSWORD')
    env.require('MYSQL_DATABASE')
    env.default('MYSQL_HOST', 'localhost')
    env.default('MYSQL_PORT', '3306')
})
```

## Test

coming soon

## Build

```sh
npm install
gulp
```