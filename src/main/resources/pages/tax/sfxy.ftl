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
  util.ajax("POST",ctx+"/tax/post?api=/sssearch/sfxyxx4cszj",{nsrsbh:util.getSDB('nsrsbh'),qyrqq:'',qyrqz:'',qybz:'',minNum:minNum,maxNum:maxNum},{"User-Token":util.getSDB('token')},false,'加载中',false,function (data){
	if(data.code==000){
	 for(var i=0;i<data.sfxyxxList.length;i++){
	    var _s=$("<div class='shade'></div>");
	    var _h=$('<div class="weui-form-preview__hd" style="line-height: 1.2em;"><div class="weui-form-preview__item"><label class="weui-form-preview__label" style="color:#00a5e0;">'+data.sfxyxxList[i].yhhbmc+'</label></div></div>');
	    var _bd=$('<div class="weui-form-preview__bd"></div>');
		_bd.append('<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">三方协议号</label><span class="weui-form-preview__value _value">'+data.sfxyxxList[i].sfxyh+'</span></div>');
		_bd.append('<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">三方协议状态</label><span class="weui-form-preview__value _value">'+data.sfxyxxList[i].sfxyztmc+'</span></div>');
		_bd.append('<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">清算行行号</label><span class="weui-form-preview__value _value">'+data.sfxyxxList[i].qsyhhh+'</span></div>');
		_bd.append('<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">开户银行行号</label><span class="weui-form-preview__value _value">'+data.sfxyxxList[i].khyhhh+'</span></div>');
		_bd.append('<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">缴款账户名称</label><span class="weui-form-preview__value _value">'+data.sfxyxxList[i].jkzhmc+'</span></div>');
		_bd.append('<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">缴款账号</label><span class="weui-form-preview__value _value">'+data.sfxyxxList[i].jkzh+'</span></div>');
		_bd.append('<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">录入人名称</label><span class="weui-form-preview__value _value">'+data.sfxyxxList[i].lrrmc+'</span></div>');
		_bd.append('<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">签约时间</label><span class="weui-form-preview__value _value">'+data.sfxyxxList[i].lrrq+'</span></div>');
	    _s.append(_h).append(_bd);
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
</html>