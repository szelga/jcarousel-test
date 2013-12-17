# How to use:

1. Make sure you have `node.js` and `npm` installed. I've tested this with `node.js v0.11.6` and `npm v1.3.9`.

2. Make sure you have `brunch` and `bower` installed. I've tested this with `brunch v1.7.10` and `bower v1.2.7`.

3. Run `npm install` and `bower install` commands. This should install all the needed dependencies.

4. Run `brunch watch --server` and open http://localhost:3333/

# Where the magic happens:

1. HTML page is in `app/views/base/assets/index.html`.

2. JS template for carousel is in `app/views/index/template.jade`.

3. JCarousel is fired in `app/views/index/view.coffee`.

