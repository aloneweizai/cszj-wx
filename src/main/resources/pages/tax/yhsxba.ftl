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
.shade{box-sizing: border-box;-webkit-box-shadow: 0 0 3px rgba(0,0,0,.35);box-shadow: 0 0 3px #00a5e0;margin-bottom:20px;margin-top:20px;}
.weui-form-preview_bot{padding-left:15px;color:black;}
._label{color:black;}
._value{color:green;}
</style>
<script type="text/javascript">
    var ctx = "${ctx}";
</script>
</head>
<body ontouchstart style='padding:10px 10px' id='dobody'>
<div class="weui-cells weui-cells_form">
  <div class="weui-cell" style='border-bottom: 1px solid #e5e5e5;margin-bottom:5px;'>
    <div class="weui-cell__hd"><label class="weui-label">年份</label></div>
    <div class="weui-cell__bd">
      <input class="weui-input" type="text" name='nian' id="time-format" >
    </div>
  </div>
 </div>
 <a class="weui-btn weui-btn_primary" href="javascript:" id="xgmmzl">确定</a>
<div class="content-padded" id='detail'>
	
</div>
<div class="weui-loadmore" id='loading1' style='margin-top:20px'>
    
</div>
</body>
<script src="${ctx}/js/jqweui/jquery.js"></script>
<script src="${ctx}/js/jqweui/jquery-weui.min.js"></script>
<script src="${ctx}/js/jqweui/fastclick.js"></script>
<script src="${ctx}/js/util.js"></script>
<script>
function getjsxx(nd){
  util.ajax("POST",ctx+"/tax/post?api=/nsrls/cxsdsyh4cszj",{nsrsbh:util.getSDB('nsrsbh'),nd:nd},{"User-Token":util.getSDB('token')},true,'加载中',true,function (data){
	if(data.code==000){
	 if(data.dataList.length>0){
    	 for(var i=0;i<data.dataList.length;i++){
    	    var _s=$("<div class='shade'></div>");
    	    var _bd=$('<div class="weui-form-preview__bd"></div>');
    		_bd.append('<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">优惠事项名称</label><span class="weui-form-preview__value _value" style="text-align-last: center;">'+data.dataList[i].swsxmc+'</span></div>');
    		_bd.append('<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">享受优惠期间</label><span class="weui-form-preview__value _value">'+data.dataList[i].jmqxq+'至'+data.dataList[i].jmqxz+'</span></div>');
    		_bd.append('<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">文件有效期</label><span class="weui-form-preview__value _value">'+data.dataList[i].wjyxqq+'至'+data.dataList[i].wjyxqz+'</span></div>');
    	    _s.append(_bd);
            $('#detail').append(_s);
    	 } 
		 $("#loading1").html('<div class="weui-loadmore weui-loadmore_line"><span class="weui-loadmore__tips">全部加载完毕</span></div>');
	  }else{
	     $("#loading1").html('<div class="weui-loadmore weui-loadmore_line"><span class="weui-loadmore__tips">暂无相关数据</span></div>');
	  }
    }else{
      util.chargeErrmsg(data);
    }
  });
}
$("#xgmmzl").click(function(){
    var year=$('#time-format').val();
    if(!/^((19|20)\d{2})$/.test(year)){
	    $.toptip('年份格式不正确','warning')
	    return;
	}
	getjsxx(year);
});
$(document).ready(function(){
    FastClick.attach(document.body);
    $('#time-format').val(new Date().getFullYear())
	getjsxx(new Date().getFullYear());
});
</script>
</html>