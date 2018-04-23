requirejs.config({
    baseUrl :ctx+"/js/lib",
    paths : {
        "jquery" : "../jqweui/jquery",
        "jquery-weui" : "../jqweui/jquery-weui.min",
        "swiper" : "../jqweui/swiper.min",
        "fastclick" : "../jqweui/fastclick",
        "zepto" : "../jqweui/zepto",
        "jquery.mobile" : "jquery.mobile-1.4.5.min",
        "jweixin" : "jweixin-1.2.0",
        "util" : "../util"
    },
    shim: {
    	"fastclick": {
            deps: ["jquery"]
        },
    	"jquery-weui": {
            deps: ["jquery"]
        },
        "swiper": {
            deps: ["jquery"]
        },
        "util": {
            deps: ["jquery","fastclick","jquery-weui"]
        }
    },
    urlArgs: "v=" + (new Date()).getTime()
});

define("jquery.ui",["jquery","fastclick","jquery-weui","util"],function($,FastClick){
	FastClick.attach(document.body);
    return $;
});

