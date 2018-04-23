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
<script type="text/javascript">
     var ctx = "${ctx}";
</script>
</head>
<body ontouchstart>
<div class="weui-tab__bd" >
      <div class="weui-tab__bd weui-tab__panel csdt" style="padding-bottom:0;"> 
		 <div class="weui-tab__bd" style='padding-top: 5px;'>
          <div class="weui-tab__bd weui-tab__panel" style="padding-bottom:0;" id="csxxdetail"> 
          </div>
        </div>
      </div>
</div>
</div>
<script src="${ctx}/js/jqweui/jquery.js"></script>
<script src="${ctx}/js/jqweui/jquery-weui.min.js"></script>
<script src="${ctx}/js/jqweui/swiper.min.js"></script>
<script src="${ctx}/js/jqweui/fastclick.js"></script>
<script src="${ctx}/js/util.js"></script>
<script>
$(function() {
     $("#csxxdetail").html('<div class="weui-loadmore"><i class="weui-loading"></i><span class="weui-loadmore__tips">正在加载</span></div>');
	 var urls3="/cms/content/selectContent?contentId=${id!}";
	 util.ajax("GET",ctx+"/gets?api="+util.base64EN(urls3),null,{"User-Token":util.getSDB('token')},false,'加载中',false,function (data){
	     if(data.code==2000){
	    	 var _div=$('<div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active" style="padding-left:10px;padding-right:10px;"></div>');
	    	 _div.append('<h2 id="title">'+data.data.contentExt.title+'</h2>');
	    	 _div.append('<span><label style="color: #999;" id="laiyuan">'+data.data.contentExt.origin+'</label>&nbsp;&nbsp;&nbsp;&nbsp;<label style="color: #999;" id="riqi">'+util.dateFormat(data.data.contentExt.releaseDate)+'</label></span>');
			 var _content=$('<div id="content" style="margin-top:20px;line-height: 34px;border-bottom: 1px dashed #ddd;font-size: 15px;"></div>');
			 _content.html(data.data.contentTxt.txt);
			 _div.append(_content);
			 $("#csxxdetail").empty().append(_div);
			 $("img").attr("width","100%");
	     }else{
	         util.chargeErrmsg(data);
	     }
	 });
});
</script>
</body>
</html>
