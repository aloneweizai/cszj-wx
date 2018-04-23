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
<div class="weui-tab__bd">
  <div class="weui-tab__bd weui-tab__panel csdt" style="padding-bottom:0;"> 
	 <div class="content-padded" id='csdtdetail'>
     </div>
     <div class="weui-loadmore" id='csdtloading'>
        <i class="weui-loading"></i>
        <span class="weui-loadmore__tips">正在加载</span>
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
    var csdtpage=1;
    var csdtcanload=false;
	$(document).ready(function(){
	    getCSDT(csdtpage,dosetCSDTCanload);
	});
	
	$(".csdt").infinite().on("infinite", function() {
		if(csdtcanload) getCSDT(csdtpage,dosetCSDTCanload);
		csdtcanload=false;
    });
	
	function dosetCSDTCanload(pageT){
		csdtpage+=1;
        if(csdtpage>pageT){
        	$("#csdtloading").html('<div class="weui-loadmore weui-loadmore_line"><span class="weui-loadmore__tips">全部加载完毕</span></div>');
        }else{
        	csdtcanload=true;
        }
	}
	
	function getCSDT(page,callback){
		var size=10;
		var urls="/cms/content/selectListcszxw?page="+page+"&size="+size;
		util.ajax("GET",ctx+"/gets?api="+util.base64EN(urls),null,{"User-Token":util.getSDB('token')},false,'加载中',false,function (data){
			if(data.code==2000){
			  var list=data.dataList;
			  for(var i=0;i<list.length;i++){
				  var _a;
				  if(list[i].titleImg){
					  _a=$('<div data-id="'+list[i].contentId+'" class="weui-media-box weui-media-box_appmsg clickmsg"></div>');
					  _a.append('<div class="weui-media-box__hd"><img width="70px" height="70px" class="weui-media-box__thumb" src="http://'+list[i].domain+list[i].titleImg+'" alt=""></div>');
					  _a.append('<div class="weui-media-box__bd"><h4 class="weui-media-box__title" style="color:'+list[i].titleColor+'">'+list[i].title+'</h4><p class="weui-media-box__desc">'+list[i].shortTitle+'</p><ul class="weui-media-box__info"><li class="weui-media-box__info__meta">'+list[i].origin+'</li><li class="weui-media-box__info__meta"></li><li><label style="color:green;">'+util.dateFormat(list[i].releaseDate)+'</label></li></ul></div>'); 
				  }else{
					  _a=$('<div data-id="'+list[i].contentId+'" class="weui-media-box weui-media-box_text clickmsg"></div>');
					  _a.append('<h4 class="weui-media-box__title" style="color:'+list[i].titleColor+'">'+list[i].title+'</h4>'); 
					  _a.append('<p class="weui-media-box__desc">'+list[i].shortTitle+'</p>'); 
					  _a.append('<ul class="weui-media-box__info"><li class="weui-media-box__info__meta">'+list[i].origin+'</li><li class="weui-media-box__info__meta"><label style="color:green;">'+util.dateFormat(list[i].releaseDate)+'</label></li></ul>')
				  }
				  _a.click(function(){
					  location.href=ctx+'/csdtinfo.html?id='+$(this).attr('data-id');
				  });
				  $("#csdtdetail").append(_a);  
			  }
			  if (typeof callback === "function"){callback(Math.ceil(data.total/size));}
           	}else{
           	  util.chargeErrmsg(data,function(){
           		$("#csdtloading").remove();
           	  })   	           	  
           	}
		});
	}
});
</script>
</body>
</html>
