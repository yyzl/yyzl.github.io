var fs = require('fs');
var UglifyJS = require("uglify-js");

var files = fs.readdirSync('./public/scripts');
files.forEach(function (file) {
    if (/\.js$/.test(file)) {
        var res = UglifyJS.minify(['./public/scripts/' + file]);
        fs.writeFileSync('./public/scripts/' + file, res.code);
    }
});