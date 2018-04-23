$(function() {
	$(document).ready(function(){
		FastClick.attach(document.body);
		util.ajax("GET",ctx+"/get?api=/uc/experience/"+util.getSDB('userId'),null,{"User-Token":util.getSDB('token')},true,'加载中',true,function (data){
			if(data.code==2000){
				$("#mypoint").html(data.data.exp);
				$("#incomeM").html(data.data.incomeMonth);
				$("#outcomeM").html(data.data.outgoMonth);
				$("#incomeY").html(data.data.incomeYear);
				$("#outcomeY").html(data.data.outgoYear);
           	}else{
           		util.chargeErrmsg(data);
           	}
		});	
	});
	
	$("#showdetail").click(function(){
		page=1;
		$("#detail").empty();
		$("#loading").html('<i class="weui-loading"></i><span class="weui-loadmore__tips">正在加载</span>');
		getExpLog(page,dosetCanload);
        $("#dossopen").click();
	});
	
	function getExpLog(page,callback){
		var size=10;
		var urls="/uc/uexp/log?userId="+util.getSDB('userId')+"&page="+page+"&size="+size;
		util.ajax("GET",ctx+"/gets?api="+util.base64EN(urls),null,{"User-Token":util.getSDB('token')},false,'加载中',false,function (data){
			if(data.code==2000){
			  var list=data.dataList;
			  for(var i=0;i<list.length;i++){
				     var ponit=list[i].income-list[i].outgo;
					 var htm=(ponit>0)?('<label style="color:green">+'+ponit+'</lable>'):('<label style="color:red">'+ponit+'</lable>');
					 var _t=$('<div class="weui-media-box weui-media-box_text"></div>').attr('data-id',list[i].id);
					 var _title=$('<h4 class="weui-media-box__title">'+list[i].name+'<span style="float:right;">'+htm+'</span></h4>');
					 _t.append(_title);
					 var _ul=$('<ul class="weui-media-box__info"><li class="weui-media-box__info__meta">累计经验值:'+list[i].usableExp+'</li><li class="weui-media-box__info__meta">日期:'+util.dateFormat(list[i].createTime)+'</li></ul>');
					 _t.append(_ul);
					 $("#detail").append(_t);
			  }
			  if (typeof callback === "function"){callback(Math.ceil(data.total/size));}
           	}else{
           	  util.chargeErrmsg(data,function(){
           		$("#loading").remove();
	          })            	  
           	}
		});
	}
	
	
	var page=1;
	var canload=false;
	
	$(".infinite").infinite().on("infinite", function() {
		if(canload) getExpLog(page,dosetCanload);
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
	
}); 