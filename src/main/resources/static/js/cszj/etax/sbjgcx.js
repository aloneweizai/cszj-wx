$(function() {
	var page=1;
	var canload=false;
	var orderstatus=[];
	$(document).ready(function(){
		FastClick.attach(document.body);
		getMyOrder(page,dosetCanload);
	});
	
	$(".weui-tab__panel").infinite().on("infinite", function() {
		if(canload) getMyOrder(page,dosetCanload);
		canload=false;
    }).css('padding-bottom','10px');
	
	function getMyOrder(page,callback){
		var size=10;
		var minNum = (page-1)*size+1;
		var maxNum = (page)*size;
		var urls="/sssearch/querysbxx4cszj";
		util.ajax("POST",ctx+"/tax/post?api="+urls,{api:urls,nsrsbh:util.getSDB('nsrsbh'),skssqq:"",skssqz:"",zsxmDm:"",minNum:minNum,maxNum:maxNum},{"User-Token":util.getSDB('token')},false,'',false,function (data){
			if(data.code==000){
			  var dataList=data.sbxxList;
			  for(var i=0;i<dataList.length;i++){
				  var sbjgcx=dataList[i];
				  var _s=$("<div class='shade'></div>");
				  var _bd=$('<div class="weui-form-preview"><div class="weui-form-preview__hd" style="line-height: 1.2em;"><div class="weui-form-preview__item"><label class="weui-form-preview__label" style="color:#00a5e0">'+sbjgcx.zsxmmc+'</label> </div></div>');
				  _bd.append('<div class="weui-form-preview__bd"><div class="weui-form-preview__item"><label class="weui-form-preview__label _label">应征凭证序号</label><span class="weui-form-preview__value _value">'+sbjgcx.pzxh+'</span></div>' +
				  '<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">所属期</label><span class="weui-form-preview__value _value">'+sbjgcx.skssqq+'至'+sbjgcx.skssqz+'</span></div>' +
				  '<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">申报期限</label><span class="weui-form-preview__value _value">'+sbjgcx.sbrq+'</span></div>' +
				  '<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">申报日期</label><span class="weui-form-preview__value _value">'+sbjgcx.sbrq+'</span></div>' +
				  '<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">应纳税额</label><span class="weui-form-preview__value _value">'+sbjgcx.ynse+'元</span></div>' +
				  '<div class="weui-form-preview__item"><label class="weui-form-preview__label _label">应税销售收入</label><span class="weui-form-preview__value _value">'+sbjgcx.ysxssr+'元</span></div></div>');
				    _bd.append('<div class="weui-form-preview__ft weui-form-preview_bot"><div class="weui-form-preview__item"><label class="weui-form-preview__label">应补退税额</label><span class="weui-form-preview__value">'+sbjgcx.ybtse+'元</span></div></div></div>');
				  _s.append(_bd);
				  $("#detail1").append(_s);
			  }
			  if (typeof callback === "function"){callback(Math.ceil(data.count/size));}
           	}else{
           	  util.chargeErrmsg(data,function(){$("#loading1").remove();});
           	}
		});
	}
	
	function dosetCanload(pageT){
		page+=1;
        if(page>pageT){
        	$("#loading1").html('<div class="weui-loadmore weui-loadmore_line"><span class="weui-loadmore__tips">全部加载完毕</span></div>');
        }else{
        	canload=true;
        }
	}
})