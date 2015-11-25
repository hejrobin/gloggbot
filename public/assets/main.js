(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
(function() {
  var Rating,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Rating = (function() {
    Rating.prototype.targetNode = null;

    Rating.prototype.targetNodes = null;

    function Rating(targetNode, targetNodes) {
      this.targetNode = targetNode;
      this.targetNodes = targetNodes;
      this.updateRating = __bind(this.updateRating, this);
      this.observe(this.targetNodes);
      this.updateRating();
    }

    Rating.prototype.updateRating = function() {
      var rating, targetNode, values, _i, _len, _ref;
      values = [];
      _ref = this.targetNodes;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        targetNode = _ref[_i];
        values.push($(targetNode).val());
      }
      rating = values.map(function(n, i, a) {
        return n / a.length;
      }).reduce(function(a, b) {
        return a + b;
      });
      $(this.targetNode).html("" + (rating.toFixed(1)));
    };

    Rating.prototype.observe = function(targetNodes) {
      return $(targetNodes).on('change', this.updateRating);
    };

    return Rating;

  })();

  module.exports = Rating;

}).call(this);

},{}],2:[function(require,module,exports){
(function() {
  var Rating, rating, targetNode, targetNodes;

  Rating = require('./Rating');

  targetNode = $('.score__value').get(0);

  targetNodes = $('.rating__input');

  rating = new Rating(targetNode, targetNodes);

}).call(this);

},{"./Rating":1}]},{},[2]);
