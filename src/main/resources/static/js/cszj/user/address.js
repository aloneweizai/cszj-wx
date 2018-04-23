require(["../../config"], function () {
    require(["jquery.ui"], function ($) {
    	$(function() {
    		$(document).ready(function(){
    			
    			var urls="/uc/address/"+util.getSDB('userId')+"?page=0&size=0";
    			util.ajax("GET",ctx+"/gets?api="+util.base64EN(urls),null,{"User-Token":util.getSDB('token')},true,'加载中',true,function (data){
     				if(data.code==2000){
     					var list=data.dataList;
     					if(list.length>0){
     					  for(var i=0;i<list.length;i++){
     						 var _t=$('<div class="weui-media-box weui-media-box_text"></div>').attr('data-id',list[i].id);
     						 var _title=$('<h4 class="weui-media-box__title">'+list[i].provinceName+list[i].cityName+list[i].areaName+'</h4>');
     						 if(list[i].isDefault){
    							 var _a=$('<label style="color:red">&nbsp;[默认地址]</label>');
    							 _title.append(_a);
    						 }else{
    							 var _a=$('<label data-id="'+list[i].id+'" style="color:blue">&nbsp;[设为默认]</label>').click(function(){
    								setDefault($(this).attr('data-id'));
    							 });
    							 _title.append(_a);
    						 }
     						 _t.append(_title);
     						 var _edit=$('<i class="iconfont" data-id="'+list[i].id+'" style="line-height: 1.4;float:right;font-size:20px;color:#18b4ed;padding:0 10px;">&#xe70f;</i>').click(function(){
     							doEdit($(this).attr('data-id'));
     						 });
     						 var _p=$('<p class="weui-media-box__desc">'+list[i].detail+'</p>');
     						_p.append(_edit);
     						 var _ul=$('<ul class="weui-media-box__info"><li class="weui-media-box__info__meta">'+list[i].name+'</li><li class="weui-media-box__info__meta">'+list[i].phone+'</li></ul>');
     						 _t.append(_p).append(_ul);
     						 $("#addresslist").append(_t);
     					  }
     					}
                	}else{
                		util.chargeErrmsg(data);
                	}
    			});
    			
    			util.ajax("GET",ctx+"/get?api=/uc/province",null,{"User-Token":util.getSDB('token')},false,'',false,function (data){
     				if(data.code==2000){
     					for(var i=0;i<data.dataList.length;i++){
     						$("#select1").append('<option value="'+data.dataList[i].provinceId+'">'+data.dataList[i].province+'</option>');
     					}
                   	}else{
                   		util.chargeErrmsg(data);
                   	}
     			});
    			
    			$("#select1").change(function(){
    				city($(this).val());
    			});
    			$("#select2").change(function(){
    				area($(this).val());
    			});
    		});
    		
    		$("#xgmm").click(function(){
    			var name=$("#name").val();
    			if(!name){$.toptip('请输入正确的用户名','warning');return}
    			var phone=$("#tel").val();
    			if(!phone || !/^1[3|4|5|8][0-9]\d{4,8}$/.test(phone)){$.toptip('请填写正确的手机号码','warning');return}
    			var province=$("#select1").val();
    			if(!province){$.toptip('请选择省份','warning');return}
    			var city=$("#select2").val();
    			if(!city){$.toptip('请选择城市','warning');return}
    			var area=$("#select3").val();
    			if(!area){$.toptip('请选择区域','warning');return}
    			var detail=$("#detail").val();
    			if(!detail){$.toptip('请填写详细的地址','warning');return}
    			var addressId=$("#addressId").val();
    			var address={name:name,province:province,city:city,area:area,detail:detail,phone:phone,status:true};
    			if(!addressId){
    				util.ajax("post",ctx+"/post?api=/uc/address/"+util.getSDB('userId'),address,{"User-Token":util.getSDB('token')},true,'提交中',true,function (data){
         				if(data.code==2000){
         					$.toast("新增成功",1000,function() {window.location.href=ctx+'/myaddress.html';});
                       	}else{
                       		util.chargeErrmsg(data);
                       	}
         			});
    			}else{
    				address['id']=addressId;
    				util.ajax("put",ctx+"/put?api=/uc/address/"+util.getSDB('userId')+'/'+addressId,address,{"User-Token":util.getSDB('token')},true,'提交中',true,function (data){
         				if(data.code==2000){
         					$.toast("修改成功",1000,function() {window.location.href=ctx+'/myaddress.html';});
                       	}else{
                       		util.chargeErrmsg(data);
                       	}
         			});
    			}
    			
    		});
    		
    		function city(id,_val){
    			util.ajax("GET",ctx+"/get?api=/uc/city/"+id,null,{"User-Token":util.getSDB('token')},true,'加载城市中',true,function (data){
     				if(data.code==2000){
     					$("#select2").empty().append('<option value="">请选择</option>');
     					for(var i=0;i<data.dataList.length;i++){
     						$("#select2").append('<option value="'+data.dataList[i].cityId+'">'+data.dataList[i].city+'</option>');
     					}
     					if(_val){$("#select2").val(_val);}
                   	}else{
                   		util.chargeErrmsg(data);
                   	}
     			});
    		}
    		
    		function area(id,_val){
    			util.ajax("GET",ctx+"/get?api=/uc/area/"+id,null,{"User-Token":util.getSDB('token')},true,'加载地区中',true,function (data){
     				if(data.code==2000){
     					$("#select3").empty().append('<option value="">请选择</option>');
     					for(var i=0;i<data.dataList.length;i++){
     						$("#select3").append('<option value="'+data.dataList[i].areaId+'">'+data.dataList[i].area+'</option>');
     					}
     					if(_val){$("#select3").val(_val);}
                   	}else{
                   		util.chargeErrmsg(data);
                   	}
     			});
    		}
    		
    		function setDefault(id){
        		$.confirm('确认设置为默认地址?', '', function() {
        			 util.ajax("PUT",ctx+"/put?api=/uc/address/default/"+util.getSDB('userId')+"/"+id,{isDefault:true},{"User-Token":util.getSDB('token')},true,'提交中',true,function (data){
         				if(data.code==2000){
         					$.toast("设置成功",1000,function() {window.location.href=ctx+'/myaddress.html';});
                       	}else{
                       		util.chargeErrmsg(data);
                       	}
         			 });
          	    });
        	}
    		
    		$("#shanchu").click(function(){
    			$.confirm('确认删除该地址?', '', function() {
       			 util.ajax("GET",ctx+"/delete?api=/uc/address/"+util.getSDB('userId')+"/"+$("#addressId").val(),null,{"User-Token":util.getSDB('token')},true,'提交中',true,function (data){
        				if(data.code==2000){
        					$.toast("删除成功",1000,function() {window.location.href=ctx+'/myaddress.html';});
                      	}else{
                      		util.chargeErrmsg(data);
                      	}
        			 });
         	    });
    		});
    		
    		function doEdit(id){
    			util.ajax("GET",ctx+"/get?api=/uc/address/"+util.getSDB('userId')+"/"+id,null,{"User-Token":util.getSDB('token')},true,'加载地址中',true,function (data){
     				if(data.code==2000){
     					$("#shanchu").css('display','block');
     					$("#addressId").val(data.data.id);
     					$("#name").val(data.data.name);
     					$("#tel").val(data.data.phone);
     					$("#select1").val(data.data.province);
     					city(data.data.province,data.data.city);
     					area(data.data.city,data.data.area);
     					$("#detail").val(data.data.detail);
     					$("#addnew").click();
                   	}else{
                   		util.chargeErrmsg(data);
                   	}
     			});
    		}
        	
        	$("#close-popup").click(function(){
           	   $.confirm('确认放弃编辑?', '', function() {
           		  $("#close").click();
           		  $("#shanchu").css('display','none');
           		  $("#editAddress")[0].reset();
       	       });
            });
    		
    		

    	});
    	
    	
    })
});