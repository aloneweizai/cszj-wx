$(function() {
	$(document).ready(function(){
		FastClick.attach(document.body);
		util.ajax("GET",ctx+"/get?api=/uc/points/"+util.getSDB('userId'),null,{"User-Token":util.getSDB('token')},true,'加载中',true,function (data){
			if(data.code==2000){
				$("#mypoint").html(data.data.myPoints);
				$("#income").html(data.data.income==null?"0":data.data.income);
				$("#outcome").html(data.data.outgo==null?"0":data.data.outgo);
           	}else{
           		util.chargeErrmsg(data);
           	}
		});	
	});	
	
	
	
	$("#showdetail").click(function(){
		page=1;
		$("#detail1").empty();
		$("a[needloding]").attr('needloding','true');
		$("#detail2").empty();
		$("#tab1hed").click();
		$("#loading1").html('<i class="weui-loading"></i><span class="weui-loadmore__tips">正在加载</span>');
		$("#loading2").html('<i class="weui-loading"></i><span class="weui-loadmore__tips">正在加载</span>');
		getPointsLog(1,false,false,dosetCanload);
        $("#dossopen").click();
	});
	
	function payLog(page,callback){
		var size=10;
		var urls="/uc/order/user?tradeMethod=POINTS&status=6&userId="+util.getSDB('userId')+"&page="+page+"&size="+size;
		util.ajax("GET",ctx+"/gets?api="+util.base64EN(urls),null,{"User-Token":util.getSDB('token')},false,'加载中',false,function (data){
			if(data.code==2000){
			  var dataList=JSON.parse(data.dataList);
			  for(var i=0;i<dataList.length;i++){
				     var htm='<label style="color:red">'+(0-dataList[i].totalPrice)+'</lable>';
					 var _t=$('<div class="weui-media-box weui-media-box_text"></div>');
					 var _title=$('<h4 class="weui-media-box__title">'+dataList[i].orderProductBOList[0].name+'<span style="float:right;">'+htm+'</span></h4>');
					 _t.append(_title);
					 var _ul=$('<ul class="weui-media-box__info"><li class="weui-media-box__info__meta">'+dataList[i].orderNo+'&nbsp;&nbsp;&nbsp;&nbsp;</li><li class="weui-media-box__info__meta">日期:'+util.dateFormat(dataList[i].createTime)+'</li></ul>');
					 _t.append(_ul);
					 $("#detail2").append(_t);
			  }
			  if (typeof callback === "function"){callback(Math.ceil(data.total/size));}
           	}else{
           		util.chargeErrmsg(data,function(){$("#loading2").remove();});
           	}
			
		});
	}
	
	function getPointsLog(page,load,closeload,callback){
		var size=10;
		var urls="/uc/upoints/log?userId="+util.getSDB('userId')+"&page="+page+"&size="+size;
		util.ajax("GET",ctx+"/gets?api="+util.base64EN(urls),null,{"User-Token":util.getSDB('token')},load,'加载中',closeload,function (data){
			if(data.code==2000){
			  var list=data.dataList;
			  for(var i=0;i<list.length;i++){
				 var ponit=list[i].income-list[i].outgo;
				 var htm=(ponit>0)?('<label style="color:green">+'+ponit+'</lable>'):('<label style="color:red">'+ponit+'</lable>');
				 var _t=$('<div class="weui-media-box weui-media-box_text"></div>').attr('data-id',list[i].id);
				 var _title=$('<h4 class="weui-media-box__title">'+list[i].remark+'<span style="float:right;">'+htm+'</span></h4>');
				 _t.append(_title);
				 var _ul=$('<ul class="weui-media-box__info"><li class="weui-media-box__info__meta">累计积分:'+list[i].usablePoints+'&nbsp;&nbsp;&nbsp;&nbsp;</li><li class="weui-media-box__info__meta">日期:'+util.dateFormat(list[i].createTime)+'</li></ul>');
				 _t.append(_ul);
				 $("#detail1").append(_t);
			  }
			  if (typeof callback === "function"){callback(Math.ceil(data.total/size));}
           	}else{
           	  util.chargeErrmsg(data,function(){$("#loading1").remove();});           	  
           	}
			
		});
	}
	
	
	var page=1;
	var canload=false;
	var page2=1;
	var canload2=false;
	
	$(".infinite").infinite().on("infinite", function() {
		if(canload) getPointsLog(page,false,false,dosetCanload);
		canload=false;
    });
	$(".infinite2").infinite().on("infinite", function() {
		if(canload2) payLog(page2,true,true,dosetCanload2);
		canload2=false;
    });
	
	function dosetCanload(pageT){
		page+=1;
        if(page>pageT){
        	$("#loading1").html('<div class="weui-loadmore weui-loadmore_line"><span class="weui-loadmore__tips">全部加载完毕</span></div>');
        }else{
        	canload=true;
        }
	}
	
	function dosetCanload2(pageT){
		page2+=1;
        if(page2>pageT){
        	$("#loading2").html('<div class="weui-loadmore weui-loadmore_line"><span class="weui-loadmore__tips">全部加载完毕</span></div>');
        }else{
        	canload2=true;
        }
	}
	
	$("a[tabber]").click(function(){
		 var data_toggle=$(this).attr("data-href");
		 $(".weui-bar__item--on").removeClass('weui-bar__item--on');
         $(this).addClass("weui-bar__item--on");
         $(".weui-tab__bd-item--active").removeClass('weui-tab__bd-item--active');
         $(data_toggle).addClass("weui-tab__bd-item--active");
         if($(this).attr('needloding')=='true'){
        	 $(this).attr('needloding','false');
        	 payLog(page2,dosetCanload2);
         }
	});
}); 