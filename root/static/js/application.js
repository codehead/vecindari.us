// Firebug console graceful degradation
// http://getfirebug.com/firebug/firebugx.js
if (!window.console || !console.firebug)
{
    var names = ["log", "debug", "info", "warn", "error", "assert", "dir", "dirxml",
    "group", "groupEnd", "time", "timeEnd", "count", "trace", "profile", "profileEnd"];

    window.console = {};
    for (var i = 0; i < names.length; ++i) {
                window.console[names[i]] = function(){
                };
        }
}

// Dominic Mitchell's jQuery Logging
// http://happygiraffe.net/blog/2007/09/26/jquery-logging/
if (window.jQuery) {
    jQuery.fn.log = function (msg) {
        if(window.console) {
                if(console.log) {
                        console.log("%s: %o", msg, this);
                        return this;
                }
        }
    };
}