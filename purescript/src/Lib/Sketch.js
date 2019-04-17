"use strict";

var sketch = require('sketch/dom');
var ui = require('sketch/ui');
var paste = NSPasteboard.generalPasteboard();

exports.getSelection = function () {
  return sketch.getSelectedDocument().selectedLayers.layers;
};

exports.showAlert = function(title) {
  return function(helpText) {
    return function () {
      ui.alert(title, helpText);
      return {};
    };
  };
};

exports.showMessage = function(text) {
  return function() {
    ui.message(text);
    return {};  
  };
};

exports.copy2Pasteboard = function (str) {
  return function() {
    paste.clearContents();
    paste.setString_forType(str,"public.utf8-plain-text");
    return {};
  };
};

exports._getInputFromUser = function (msg) {
  return function (initValue) {
    return function (cbs) {
      return function (cbe) {
        return function() {
          var options = {
            initialValue: initValue,
          };
          ui.getInputFromUser(msg, options, function (err, value) {
            if (err) return cbe(err)(); else cbs(value)();
          });
        };
      };
    };
  };
};