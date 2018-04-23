$(document).ready(function(){
	
	 $(".fxswiper-slide").css({'overflow-y':'auto','height':$(window).height()-50})
	 
	 util.ajax("POST",ctx+"/tax/post?api=/sssearch/nsrjcxx4cszj",{nsrsbh:util.getSDB('nsrsbh')},{"User-Token":util.getSDB('token')},true,'加载中',true,function (data){
		if(data.code==000){
		   var nsrjcxxvo=data.nsrjcxxvo;
		   var ids=['nsrmc','nsrsbh','fddbrmc','frDhhm','frYddhhm','frDydz','cwfzrYddhhm','cwfzrmc','kyslrq','pzjg','cwfzrmc','zcdz','zczb'];
		   for(var index in ids){
			  $("#"+ids[index]).html(eval('nsrjcxxvo.'+ids[index]));
		   }
		   $("#jyfw").val(nsrjcxxvo.jyfw);
		   
		   for(var i=0;i<nsrjcxxvo.kkyhList.length;i++){
			   var _kkyh=$('<div class="weui-panel__bd doxinxi"><div class="weui-media-box weui-media-box_text"><h4 class="weui-media-box__title">扣款银行名称：'+nsrjcxxvo.kkyhList[i].kkyhmc+'</h4><p class="weui-media-box__desc">扣款银行账号：'+nsrjcxxvo.kkyhList[i].kkyhzh+'</p></div></div>')
		       $("#yinhangxinxidetail").append(_kkyh);
		   }
		   
		   for(var j=0;j<nsrjcxxvo.szhdxxList.length;j++){
			   var _kkyh=$('<div class="weui-panel__bd doxinxi"><div class="weui-media-box weui-media-box_text"><h4 class="weui-media-box__title">征收项目名称：'+nsrjcxxvo.szhdxxList[j].zsxmMc+'</h4><h4 class="weui-media-box__title">征收品目名称：'+nsrjcxxvo.szhdxxList[j].zspmMc+'</h4><h4 class="weui-media-box__title">税率：'+nsrjcxxvo.szhdxxList[j].sl+'</h4><p class="weui-media-box__desc">有效期：'+nsrjcxxvo.szhdxxList[j].hdqxq+'-'+nsrjcxxvo.szhdxxList[j].hdqxz+'</p></div></div>')
		       $("#hedingxinxidetail").append(_kkyh);
		   }
		   
       	}else{
       	  util.chargeErrmsg(data);
       	}
	 });
	
	 
	 var fxswap=$("#faxianswiper").swiper({
         loop: false,
         observer:true,
         observeParents:true,
         autoplayDisableOnInteraction : false,
         onClick: function(swiper){
          	
         },
         onSlideChangeStart: function(swiper){
	          var _index=swiper.activeIndex; 
	          var li= $("li[class='current']");
	          li.removeClass('current');
	          $("li[index='"+_index+"']").attr('class','current');
	     }
     });
	 
	 $("li[index]").click(function(){
  	   var _index=$(this).attr('index');
  	   fxswap.slideTo(_index, 500, true)
     });
});