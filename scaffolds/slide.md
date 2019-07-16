title: {{ title }}
date: {{ date }}
desc:
tags: 
    - 原创
    - slides
abstract: "[Slide] YOUR DESCRIPTION HERE"
---

<iframe id="ppt" src="https://ppt.baomitu.com/embed/${ID}?style=dark" width="640" height="420" scrolling="no" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
<script>
;(function() {
var $ = function (e) {return document.querySelector(e)};
var w = $('.post-block');
var p = $('#ppt');
resize();
window.addEventListener('resize', resize);
function resize() {
  var r = w.clientWidth;
  p.width = r;
  p.height = r * 21 / 32;
}
}());
</script>