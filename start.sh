#!/bin/bash
case "$1" in
    "clean")
        cd purescript; npm run clean;
        cd ../sketch-plugin; rm -rf node_modules;; 
    "setup") 
        npm i -g skpm nodemon;
        cd purescript; npm i && bower i;
        cd ../sketch-plugin; npm i;;
    "build") cd purescript; npm run build; cd ../sketch-plugin; npm run build;;
    "watch") cd purescript; npm run build; cd ../sketch-plugin; npm run run;;
esac