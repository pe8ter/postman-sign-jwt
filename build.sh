#!/usr/bin/env bash -ex

npm i

# Directories.
SRC=src
DIST=dist
TEMP=dist-temp

# Commands.
BROWSERIFY=./node_modules/browserify/bin/cmd.js
UGLIFY=./node_modules/uglify-js/bin/uglifyjs

rm -rf $DIST
mkdir $DIST

rm -rf $TEMP
mkdir $TEMP

# Bundle the jsonwebtoken module and its dependencies.
$BROWSERIFY $SRC/main.js --standalone jwt > $TEMP/main.bundle.js

# Wrap the bundle in its own named callable scope.
cat $SRC/main-prefix.txt $TEMP/main.bundle.js $SRC/main-suffix.txt > $TEMP/main.bundle.wrapped.js

# Minify.
$UGLIFY --compress --mangle -- $TEMP/main.bundle.wrapped.js > $TEMP/main.bundle.wrapped.min.js

# Prepend the setup code.
cat $SRC/preamble.txt $TEMP/main.bundle.wrapped.min.js > $DIST/pre-request-script.js
