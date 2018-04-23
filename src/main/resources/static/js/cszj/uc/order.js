$(function() {
	var page=1;
	var canload=false;
	var orderstatus=[];
	$(document).ready(function(){
		FastClick.attach(document.body);
		
		util.ajax("get",ctx+"/get?api=/uc/dict/kv/orderStatus",null,{"User-Token":util.getSDB('token')},false,'加载中',false,function (data){
			if(data.code==2000){
				for(var i=0;i<data.dataList.length;i++){
					orderstatus[parseInt(data.dataList[i].fieldValue)]=data.dataList[i].fieldKey;
				}
				getMyOrder(page,dosetCanload);	
           	}else{
           		util.chargeErrmsg(data);
           	}
		});
	});
	
	$(".weui-tab__panel").infinite().on("infinite", function() {
		if(canload) getMyOrder(page,dosetCanload);
		canload=false;
    }).css('padding-bottom','10px');
	
	function getMyOrder(page,callback){
		var size=10;
		var urls="/uc/order/user/all/invoice?userId="+util.getSDB('userId')+"&page="+page+"&size="+size;
		util.ajax("GET",ctx+"/gets?api="+util.base64EN(urls),null,{"User-Token":util.getSDB('token')},false,'',false,function (data){
			if(data.code==2000){
			  var dataList=JSON.parse(data.dataList);
			  for(var i=0;i<dataList.length;i++){
				    var order=dataList[i];
					var url=(order.orderProductBOList[0].imageUrl)?util.getSDB('cfgUrl')+order.orderProductBOList[0].imageUrl:'';
				    var _bd=$('<a class="weui-media-box weui-media-box_appmsg" bind-id="'+order.orderNo+'"></a>').click(function(){
						  showOrder($(this).attr('bind-id'));
					});;
				    _bd.append('<div class="weui-media-box__hd"><img height="60" class="weui-media-box__thumb" src="'+url+'" alt=""></div>')
				    var _box=$('<div class="weui-media-box__bd"></div>');
				    _box.append('<h4 class="weui-media-box__title">'+order.orderNo+'&nbsp;</h4>');
				    _box.append('<p class="weui-media-box__desc">下单时间:'+util.dateFormat(order.createTime)+'&nbsp;&nbsp;<label style="color:orange;">'+(order.tradeMethod=='RMB'?"￥"+order.totalPrice:order.totalPrice+"积分")+'</label>&nbsp;&nbsp;<i class="iconfont" style="float:right;">&#xe702;</i></p>');
				    _box.append('<ul class="weui-media-box__info"><li class="weui-media-box__info__meta">'+order.orderProductBOList[0].name+'</li><li class="weui-media-box__info__meta"></li><li><label style="color:green;">'+orderstatus[parseInt(order.orderStatus)]+'</label></li></ul>');
				    _bd.append(_box);
				  $("#detail1").append(_bd);
			  }
			  if (typeof callback === "function"){callback(Math.ceil(data.total/size));}
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
	
	function showOrder(orderNo){
		util.ajax("get",ctx+"/get?api=/uc/order/select/"+orderNo,null,{"User-Token":util.getSDB('token')},true,'加载中',true,function (data){
			if(data.code==2000){
				var order=data.data;
				$("#ddhm").text(order.orderNo);
				$("#jjzt").text(orderstatus[parseInt(order.orderStatus)]);
				$("#zsjf").text(order.giftPoints?order.giftPoints:'0');
				$("#jsfs").text((order.tradeMethod=='POINTS')?'积分':'人民币');
				$("#jsje").text((order.tradeMethod=='POINTS')?order.totalPrice+'分':'￥'+order.totalPrice);
				$("#orderRmk").val(order.remark);
				$("#xdsj").text(util.dateTimeFormat(order.createTime));
				for(var i=0;i<order.orderProductBOList.length;i++){
					var url=(order.orderProductBOList[0].imageUrl)?util.getSDB('cfgUrl')+order.orderProductBOList[0].imageUrl:'';
					var _lab=$('<div class="weui-cell"></div>');
				    var _bd=$('<div class="weui-panel__bd weui-media-box_appmsg"></div>');
				    _bd.append('<div class="weui-media-box__hd"><img height="60" class="weui-media-box__thumb" src="'+url+'" alt=""></div>')
				    var _box=$('<div class="weui-media-box__bd"></div>');
				    _box.append('<h4 class="weui-media-box__title">'+order.orderProductBOList[i].name+'&nbsp;<label style="color:orange;">'+(order.tradeMethod=='RMB'?"￥"+order.totalPrice:order.totalPrice+"积分")+'</label>&nbsp;<label style="color:#0066CC;">数量:'+order.orderProductBOList[i].num+'</label></h4>');
				    _box.append('<p class="weui-media-box__desc">规格:'+(order.orderProductBOList[i].specInfo?order.orderProductBOList[i].specInfo:"-")+'</p>');
				    _bd.append(_box);
				    _lab.append(_bd);
				    $("#goods").empty().append(_lab);
				}
				if(order.isShipping==1 && order.userAddressBO){
					$('div[for="peisong"]').css('display','flex');
					$("#kudihm").text(order.waybillNum);
					$("#sjr").text(order.userAddressBO.name);
					$("#dhhm").text(order.userAddressBO.phone);
					$("#dizhi").text(order.userAddressBO.provinceName+order.userAddressBO.cityName+order.userAddressBO.areaName);
					$("#xxdizhi").text(order.userAddressBO.detail);
				}else{
					$('div[for="peisong"]').css('display','none');
				}
				$("#showorder").click();
           	}else{
           		util.chargeErrmsg(data);
           	}
		});
		
	}
})