<#assign ctx=request.getContextPath()>
<!DOCTYPE html>
<html>
<head>
<title>财税专家</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="${ctx}/css/weui.min.css">
<link rel="stylesheet" href="${ctx}/css/jquery-weui.min.css">
<link rel="stylesheet" href="${ctx}/css/main.css">
<link rel="stylesheet" href="${ctx}/css/iconfont.css">
<style>
.shade{box-sizing: border-box;-webkit-box-shadow: 0 0 3px rgba(0,0,0,.35);box-shadow: 0 0 3px #00a5e0;margin-bottom:20px;}
.weui-form-preview_bot{padding-left:15px;color:black;}
._label{color:black;}
._value{color:green;}
</style>
<script type="text/javascript">
     var ctx = "${ctx}";
</script>
</head>
<body ontouchstart style='padding:10px 10px' id='dobody'>
<div class="content-padded" id='detail'>
	
</div>
<div class="weui-loadmore" id='loading' style='margin-top:20px'>
    <i class="weui-loading"></i>
    <span class="weui-loadmore__tips">正在加载</span>
</div>
</body>
<script src="${ctx}/js/jqweui/jquery.js"></script>
<script src="${ctx}/js/jqweui/jquery-weui.min.js"></script>
<script src="${ctx}/js/jqweui/fastclick.js"></script>
<script src="${ctx}/js/util.js"></script>
<script>
var page=1;
var canload=false;
$("#dobody").infinite().on("infinite", function() {
	if(canload) getjsxx(page,dosetCanload);
	canload=false;
});
function dosetCanload(pageT){
	page+=1;
	if(page>pageT){
	    $("#loading").html('<div class="weui-loadmore weui-loadmore_line"><span class="weui-loadmore__tips">全部加载完毕</span></div>');
	}else{
	    canload=true;
	}
}
function getjsxx(page,callback){
  var size=5;
  var minNum = (page-1)*size+1;
  var maxNum = (page)*size;
  util.ajax("POST",ctx+"/tax/post?api=/sssearch/ssfpjc4cszj",{nsrsbh:util.getSDB('nsrsbh'),fpDm:'',fpqh:'',fpzh:'',minNum:minNum,maxNum:maxNum},{"User-Token":util.getSDB('token')},false,'加载中',false,function (data){
	if(data.code==000){
	 for(var i=0;i<data.fpjcxxList.length;i++){
	    var _s=$("<div class='shade'></div>");
	    var _h=$('<div class="weui-form-preview__hd" style="line-height: 1.2em;"><div class="weui-form-preview__item"><label class="weui-form-preview__label" style="text-align-last: center;color:#00a5e0">'+data.fpjcxxList[i].fpzlMc+'</label></div></div>');
	    var _bd=$('<div class="weui-form-preview__bd"></div>');
		_bd.append('<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">发票代码</label><span class="weui-form-preview__value _value">'+data.fpjcxxList[i].fpDm+'</span></div>');
		_bd.append('<div class="weui-form-preview__item" style="text-align: center;font-size:5em;line-height:1.2;color:#00E3E3">'+data.fpjcxxList[i].fs+'<span style="font-size:0.32em;">张</span></div>');
	    _s.append(_h).append(_bd);
        _s.append('<div class="weui-form-preview__ft" ><a class="weui-form-preview__btn_primary weui-form-preview_bot">发票结存起止:<span style="color:orange;">'+data.fpjcxxList[i].fpqh+'~'+data.fpjcxxList[i].fpzh+'</span></a></div>');
		$('#detail').append(_s);
	 }
	 if (typeof callback === "function"){callback(Math.ceil(data.count/size));}   
    }else{
      util.chargeErrmsg(data);
    }
  });
}
$(document).ready(function(){
	FastClick.attach(document.body);
	getjsxx(page,dosetCanload);
});
</script>
</body>
</html>