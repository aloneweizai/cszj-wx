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
  util.ajax("POST",ctx+"/tax/post?api=/sssearch/queryjsxx4cszj",{nsrsbh:util.getSDB('nsrsbh'),jkrqq:'',jkrqz:'',zsxmDm:'',minNum:minNum,maxNum:maxNum},{"User-Token":util.getSDB('token')},false,'加载中',false,function (data){
	if(data.code==000){
	 for(var i=0;i<data.jsxxList.length;i++){
	    var _s=$("<div class='shade'></div>");
	    var _h=$('<div class="weui-form-preview__hd" style="line-height: 1.2em;"><div class="weui-form-preview__item"><label class="weui-form-preview__label" style="color:#00a5e0">'+data.jsxxList[i].zsxmmc+'</label></div></div>');
	    var _bd=$('<div class="weui-form-preview__bd"></div>');
		_bd.append('<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">纳税时间</label><span class="weui-form-preview__value _value">'+data.jsxxList[i].jkrq+'</span></div>');
		_bd.append('<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">税票号码</label><span class="weui-form-preview__value _value">'+data.jsxxList[i].yssphm+'</span></div>');
		_bd.append('<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">征收品目名称</label><span class="weui-form-preview__value _value">'+data.jsxxList[i].zspmmc+'</span></div>');
		_bd.append('<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">税款属性</label><span class="weui-form-preview__value _value">'+data.jsxxList[i].sksxmc+'</span></div>');
		_bd.append('<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">所属期</label><span class="weui-form-preview__value _value">'+data.jsxxList[i].skssqq+'至'+data.jsxxList[i].skssqz+'</span></div>');
		_bd.append('<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">开票日期</label><span class="weui-form-preview__value _value">'+data.jsxxList[i].kprq+'</span></div>');
		_bd.append('<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">缴款期限</label><span class="weui-form-preview__value _value">'+data.jsxxList[i].jkqx+'</span></div>');
		_bd.append('<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">入库日期</label><span class="weui-form-preview__value _value">'+data.jsxxList[i].rkrq+'</span></div>');
	    _s.append(_h).append(_bd);
        _s.append('<div class="weui-form-preview__ft" ><a class="weui-form-preview__btn_primary weui-form-preview_bot">税额:<span style="color:orange;">'+data.jsxxList[i].se+'</span>元</a></div>');
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