$(function() {
	var type;
	var page=1;
	var canload=false;
	var orderstrNos;
	var status=[];
	$(document).ready(function(){
		FastClick.attach(document.body);
		type = new Swiper('#loginType',{
		    autoHeight: true,
		    observer:true,
		    observeParents:true,
		    effect:"coverflow",
            autoplayDisableOnInteraction : true
        });
		
		util.ajax("get",ctx+"/get?api=/uc/dict/kv/fqsqstatus",null,{"User-Token":util.getSDB('token')},false,'加载中',false,function (data){
			if(data.code==2000){
				for(var i=0;i<data.dataList.length;i++){
				   status[parseInt(data.dataList[i].fieldValue)]=data.dataList[i].fieldKey;
				}
           	}else{
           		util.chargeErrmsg(data);
           	}
		});
		
		var urls="/uc/order/user?tradeMethod=RMB&status=6&isInvoice=false&page=0&size=0&userId="+util.getSDB('userId');
		util.ajax("GET",ctx+"/gets?api="+util.base64EN(urls),null,{"User-Token":util.getSDB('token')},true,'加载中',true,function (data){
			if(data.code==2000){
				var dataList=JSON.parse(data.dataList);
				if(dataList.length>0){
					for(var i=0;i<dataList.length;i++){
						var order=dataList[i];
						var url=(order.orderProductBOList[0].imageUrl)?util.getSDB('cfgUrl')+order.orderProductBOList[0].imageUrl:'';
						var _lab=$('<label class="weui-cell" for><i id="select" data-id="'+order.orderNo+'" class="weui-icon-circle"></i></label>');
					    var _bd=$('<div class="weui-panel__bd weui-media-box_appmsg"></div>');
					    _bd.append('<div class="weui-media-box__hd"><img height="60" class="weui-media-box__thumb" src="'+url+'" alt=""></div>')
					    var _box=$('<div class="weui-media-box__bd"></div>');
					    _box.append('<h4 class="weui-media-box__title">'+order.orderNo+'</h4>');
					    _box.append('<p class="weui-media-box__desc">下单时间:'+util.dateFormat(order.createTime)+'&nbsp;&nbsp;<label style="color:orange;">￥'+order.totalPrice+'</label></p>');
					    _box.append('<ul class="weui-media-box__info"><li class="weui-media-box__info__meta">'+order.orderProductBOList[0].name+'</li><li class="weui-media-box__info__meta"></li></ul>');
					    _bd.append(_box);
					    _lab.append(_bd);
					    $("#zwqm").before(_lab);
					}
				}else{
					$("#zwqm").before('<div class="weui-loadmore weui-loadmore_line"><span class="weui-loadmore__tips">暂无数据</span></div>');
				}
				$("label[for]").click(function(){
					 var _s=$(this).find("#select"); 	
					 if(_s.hasClass("weui-icon-circle")){
						 _s.prop("class","weui-icon-success")
					 }else{
						 _s.prop("class","weui-icon-circle");
					 }
				});
        	}else{
        		util.chargeErrmsg(data);
        	}
		});
		
		
		
	});
	
	$("span[index]").click(function(){
	   var _s=$(this);
	   if(!_s.hasClass('weui-bar__item--on')){
		   $('.weui-bar__item--on').removeClass('weui-bar__item--on');
		   _s.addClass('weui-bar__item--on');
		   var index=_s.attr('index');
		   if(index==1 && _s.attr('needloading')=='true'){
			   getHistory(page,dosetCanload,_s);
		   }
		   type.slideTo(index, 500, false); 
	   } 
	});
	
	
	$(".infinite2").infinite().on("infinite", function() {
		if(canload) getHistory(page,dosetCanload);
		canload=false;
    });
	
	function dosetCanload(pageT){
		page+=1;
        if(page>pageT){
        	$("#loading2").html('<div class="weui-loadmore weui-loadmore_line"><span class="weui-loadmore__tips">全部加载完毕</span></div>');
        }else{
        	canload=true;
        }
	}
	
	function getHistory(page,callback,obj){
		var size=10;
		var urls="/uc/invoice/history?page="+page+"&size="+size+"&userId="+util.getSDB('userId');
		util.ajax("GET",ctx+"/gets?api="+util.base64EN(urls),null,{"User-Token":util.getSDB('token')},false,'加载中',false,function (data){
			if(data.code==2000){
			  var list=data.dataList;
			  for(var i=0;i<list.length;i++){
				  var _t=$('<div class="weui-media-box weui-media-box_text" data-id="'+list[i].id+'"></div>').click(function(){
						doShow($(this).attr('data-id'));
				  });;
				  var _title=$('<h4 class="weui-media-box__title">'+(list[i].name=='1'?'个人':list[i].nsrmc)+'&nbsp;['+(list[i].property=='1'?'纸质发票':'电子发票')+']</h4>');
				  _t.append(_title);
				  var _edit=$('<i class="iconfont" style="float:right;">&#xe702;</i>')
				  var _p=$('<p class="weui-media-box__desc">'+util.dateFormat(list[i].createTime)+'&nbsp;&nbsp;&nbsp;&nbsp;￥'+(list[i].amount?list[i].amount:"0.00")+'&nbsp;&nbsp;&nbsp;&nbsp;'+status[parseInt(list[i].status)]+'</p>');
				  _p.append(_edit);
				  var _ul=$('<ul class="weui-media-box__info" ><li class="weui-media-box__info__meta">备注:'+(list[i].remark?list[i].remark:"")+'</li><li class="weui-media-box__info__meta"></li></ul>');
				  _t.append(_p).append(_ul);
				  $("#detail2").append(_t);
			  }
			  type.onResize();
			  if (typeof callback === "function"){callback(Math.ceil(data.total/size));}
			  if(obj){obj.attr('needloading','false');}
           	}else{
           		util.chargeErrmsg(data,function(){$("#loading2").remove();});
           	}
			
		});
	}
	
	function doShow(id){
		util.ajax("GET",ctx+"/get?api=/uc/invoice/user/"+id+"/"+util.getSDB('userId'),null,{"User-Token":util.getSDB('token')},true,'加载中',true,function (data){
			if(data.code==2000){
				var invoice=data.data;
				$("#sfpzt").html(status[parseInt(invoice.status)]);
				$("#sfpje").html('￥'+(invoice.amount?invoice.amount:"0.00"));
				$("#sfptt").html(invoice.name=='1'?'个人':invoice.nsrmc);
				var detail;
				if(invoice.contentDetail=='1'){
					detail="软件服务费";
				}else if(invoice.contentDetail=='2'){
					detail="财税咨询费";
				}else if(invoice.contentDetail=='3'){
					detail="技术服务费";
				}else{
					detail="财税培训费";
				}
				$("#sfpnr").html(detail);
				//$("#sfplx").html(invoice.invoiceNo);
				$("#sfpbm").html(invoice.invoiceNo);
				$("#sfpxz").html(invoice.property=='1'?'纸质发票':'电子发票');
				$("#sfpsj").html(util.dateFormat(invoice.createTime));
				$("#bzxx").val(invoice.remark);
				if(invoice.property=='2'){
					$("[for='dianzi']").css('display','none');
				}else{
					$("[for='dianzi']").css('display','flex');
					$("#sfpsjr").html(invoice.userAddressBO.name);
					$("#sfpdz").html(invoice.userAddressBO.provinceName+invoice.userAddressBO.cityName+invoice.userAddressBO.areaName+invoice.userAddressBO.detail);
					$("#sfpdh").html(invoice.userAddressBO.phone);
					$("#sfpwl").html(invoice.deliveryFee);
					$("#sfpwlbh").html(invoice.waybillNum);
				}
				$("#syxqclick").click();
        	}else{
        		util.chargeErrmsg(data);
        	}
		});	
	}
	
	
	$("#syfpBt").click(function(){
		orderstrNos=[];
		$("i[id='select']").each(function(){
			if($(this).hasClass("weui-icon-success")){
				orderstrNos.push($(this).attr('data-id'));
			}
		})
		if(orderstrNos.length==0){
			$.toptip('请选择需要索要发票的订单','warning');
			return;
		}
		if($("#select4").attr('needloading')=='true'){
			var urls="/uc/address/"+util.getSDB('userId')+"?page=0&size=0";
			util.ajax("GET",ctx+"/gets?api="+util.base64EN(urls),null,{"User-Token":util.getSDB('token')},true,'加载中',true,function (data){
				if(data.code==2000){
					var list=data.dataList;
					if(list.length>0){
					  for(var i=0;i<list.length;i++){
						 $("#select4").append('<option '+(list[i].isDefault?"selected":"")+' value="'+list[i].id+'">['+list[i].name+"]"+list[i].provinceName+list[i].cityName+list[i].areaName+'</option>');
					  }
					  $("#select4").attr('needloading','false');
					  $("#syfpclick").click();
					}else{
					  $.toptip('您还未添加地址','warning');
					}
	        	}else{
	        		util.chargeErrmsg(data);
	        	}
			});
		}else{
			$("#syfpclick").click();
		}	
	});
	
	$("#select1").change(function(){
		if($(this).val()=='1'){
			$('div[for-tp]').css('display','none');
		}else{
			$('div[for-tp]').css('display','flex');
		}
	});
	
	$("#select3").change(function(){
		if($(this).val()=='1'){
			$('#doaddress').css('display','flex');
		}else{
			$('#doaddress').css('display','none');
		}
	});
	
	
	$("#close-popup").click(function(){
		$.confirm('确认放弃?', '', function() {
     		$("#close").click();
     		$("#syfpform")[0].reset();
 	    });
	});
	
	
	$("#tijiaofp").click(function(){
		var tjdata={status:'1',userId:util.getSDB('userId'),username:util.getSDB('userInfo').username,orderNos:orderstrNos};
		tjdata['property']= $('#select3').val();
		tjdata['content']= $('#select2').val();
		tjdata['name']= $('#select1').val();
		if($("#select1").val()=='2'){
			var nsrsb = $('#nsrsb').val();
  	        if(!nsrsb){$.toptip('请输入纳税人识别号','warning');return;}
  	        var gsmc = $('#gsmc').val();
	        if(!gsmc){$.toptip('请输入公司名称','warning');return;}
	        var zcdz = $('#zcdz').val();
  	        if(!zcdz){$.toptip('请输入注册地址','warning');return;}
  	        var zcdh = $('#zcdh').val();
	        if(!zcdh){$.toptip('请输入注册电话','warning');return;}
	        var khyh = $('#khyh').val();
	        if(!khyh){$.toptip('请输入注册银行','warning');return;}
	        tjdata['nsrsbh']=nsrsb;
	        tjdata['nsrmc']=gsmc;
	        tjdata['address']=zcdz;
	        tjdata['phone']=zcdh;
	        tjdata['bank']=khyh;
		}
		if($('#select3').val()=='1'){
			tjdata['addressId']= $('#select4').val();
		}
		
		util.ajaxComfirm("确认提交？", "索要发票","POST",ctx+"/post?api=/uc/invoice/"+util.getSDB('userId'),tjdata,{"User-Token":util.getSDB('token')},true,'提交中',true,function (data){
			if(data.code==2000){
				$.toast("索要发票成功",1000,function() {window.location.href=ctx+'/invoice.html';});
        	}else{
        		util.chargeErrmsg(data);
        	}
		});
		
	});
	
});
