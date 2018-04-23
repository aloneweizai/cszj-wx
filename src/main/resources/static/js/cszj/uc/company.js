require(["../../config"], function () {
    require(["jquery.ui"], function ($) {
    	$(function() {
    		 $(document).ready(function(){
    			 var userInfo=util.getSDB('userInfo');
    			 $("#phoneNo").html(userInfo.phone.substr(0,3)+'****'+userInfo.phone.substr(7,4));
  	    	     $("#getCode").attr('data-phone',userInfo.phone).one('click',getmsgcode);
    			 
    			 var urls="/uc/bind/dzsb/"+util.getSDB('userId')+"?page=0&size=0";
    			 util.ajax("GET",ctx+"/gets?api="+util.base64EN(urls),null,{"User-Token":util.getSDB('token')},true,'加载中',true,function (data){
      				if(data.code==2000){
      				  var list=data.dataList;
      				  for(var i=0;i<list.length;i++){
						 var _t=$('<div class="weui-media-box weui-media-box_text"></div>').attr('data-id',list[i].id);
						 var _title=$('<h4 class="weui-media-box__title">'+list[i].nsrmc+'</h4>');
						 _t.append(_title);
						 var _ca=$('<i class="weui-icon-cancel" data-id="'+list[i].id+'" style="float:right;"></i>').click(function(){
							 deleteC($(this),1);
						 });
						 var _p=$('<p class="weui-media-box__desc">纳税号:'+list[i].nsrsbh+'&nbsp;'+list[i].swjgMc+'</p>');
						 _p.append(_ca);
						 var _ul=$('<ul class="weui-media-box__info"><li class="weui-media-box__info__meta">信用代码:'+list[i].shxydm+'</li><li class="weui-media-box__info__meta">绑定时间:'+util.dateFormat(list[i].createTime)+'</li></ul>');
						 _t.append(_p).append(_ul);
						 $("#tab1").prepend(_t);
					  }
                    }else{
                      $.toptip(data.message,'error');
                    }
      			 });
    			 
    			 $("a[needloding]").bind("click", function(){
    				   var _a=$(this);
    				   var needloding=_a.attr('needloding');
    				   var data_toggle=_a.attr("data-href");
    	    	       if(needloding=='true'){
    	    	    	  if(data_toggle=='#tab2'){
    	    	    		  var urls="/uc/bind/hngs/"+util.getSDB('userId')+"?page=0&size=0";
	    	    			  util.ajax("GET",ctx+"/gets?api="+util.base64EN(urls),null,{"User-Token":util.getSDB('token')},true,'加载中',true,function (data){
	    	      				if(data.code==2000){
	    	      				   var list=data.dataList;
	    	      				   for(var i=0;i<list.length;i++){
	    	      					 var _t=$('<div class="weui-media-box weui-media-box_text"></div>').attr('data-id',list[i].id);
	    							 var _title=$('<h4 class="weui-media-box__title">'+list[i].nsrmc+'</h4>');
	    							 _t.append(_title);
	    							 var _ca=$('<i class="weui-icon-cancel" data-id="'+list[i].id+'" style="float:right;"></i>').click(function(){
	    								 deleteC($(this),2);
	    							 });
	    							 var _p=$('<p class="weui-media-box__desc">纳税号:'+list[i].nsrsbh+'</p>');
	    							 _p.append(_ca);
	    							 var _ul=$('<ul class="weui-media-box__info"><li class="weui-media-box__info__meta">信用代码:'+list[i].shxydm+'</li><li class="weui-media-box__info__meta">绑定时间:'+util.dateFormat(list[i].createTime)+'</li></ul>');
	    							 _t.append(_p).append(_ul);
	    							 $("#tab2").prepend(_t);
	    						   }
	    	      				   _a.attr('needloding','false')
	    	                    }else{
	    	                       $.toptip(data.message,'error');
	    	                    }
	    	      			  });
    	    	    	  }else{
    	    	    		  var urls="/uc/bind/hnds/"+util.getSDB('userId')+"?page=0&size=0";
	    	    			  util.ajax("GET",ctx+"/gets?api="+util.base64EN(urls),null,{"User-Token":util.getSDB('token')},true,'加载中',true,function (data){
	    	      				if(data.code==2000){
	    	      				   var list=data.dataList;
	    	      				   for(var i=0;i<list.length;i++){
	    	      					 var _t=$('<div class="weui-media-box weui-media-box_text"></div>').attr('data-id',list[i].id);
	    							 var _title=$('<h4 class="weui-media-box__title">'+list[i].nsrmc+'</h4>');
	    							 _t.append(_title);
	    							 var _ca=$('<i class="weui-icon-cancel" data-id="'+list[i].id+'" style="float:right;"></i>').click(function(){
	    								 deleteC($(this),3);
	    							 });
	    							 var _p=$('<p class="weui-media-box__desc">纳税号:'+list[i].nsrsbh+'</p>');
	    							 _p.append(_ca);
	    							 var _ul=$('<ul class="weui-media-box__info"><li class="weui-media-box__info__meta">信用代码:'+list[i].shxydm+'</li><li class="weui-media-box__info__meta">绑定时间:'+util.dateFormat(list[i].createTime)+'</li></ul>');
	    							 _t.append(_p).append(_ul);
	    							 $("#tab2").prepend(_t);
	    						   }
	    	      				   _a.attr('needloding','false')
	    	                    }else{
	    	                       $.toptip(data.message,'error');
	    	                    }
	    	      			  });
    	    	    	  }
    	    	       }
    				   $(".weui-bar__item--on").removeClass('weui-bar__item--on');
	                   $(this).addClass("weui-bar__item--on");
	                   $(".weui-tab__bd-item--active").removeClass('weui-tab__bd-item--active');
	                   $(data_toggle).addClass("weui-tab__bd-item--active");
    	         });
    			 
    			 $("#close-popup").click(function(){
    	           	   $.confirm('确认放弃编辑?', '', function() {
    	           		  $("#close").click();
    	           		  $("#editCompany")[0].reset();
    	           		  $('div[needshow]').css('display','none');
    	       	       });
    	         });
    			 
    			 function deleteC(obj,type){
    				 var _id=obj.attr('data-id');
    				 var urls='';
    				 if(type==1){
    					 urls=ctx+'/put?api=/uc/unbind/dzsb/'+_id;
    				 }else if(type==2){
    					 urls=ctx+'/put?api=/uc/unbind/hngs/'+_id;
    				 }else{
    					 urls=ctx+'/put?api=/uc/unbind/hnds/'+_id;
    				 }
    				 $.confirm('确认删除该绑定信息?', '', function() {
            			 util.ajax("PUT",urls,{},{"User-Token":util.getSDB('token')},true,'提交中',true,function (data){
             				if(data.code==2000){
             					$.toast("删除成功",1000,function() {
             						$("div[data-id='"+_id+"']").remove();
             					});
                           	}else{
                           		$.toptip(data.message,'error');
                           	}
             			 });
              	    });
    			 }
    			 
    			 $('span[swid]').click(function(){
    				 var _id=$(this).attr('swid');
    				 if(_id=='dzsb'){
        				 $("#mytitle").text('新增国税电子申报用户绑定');
        			 }else if(_id=='hngs'){
        				 $("#mytitle").text('新增国税网上办税用户绑定');
        			 }else{
        				 $("#mytitle").text('新增地税网上办税用户绑定');
        			 }
    				 $('div[showid="'+_id+'"]').css('display','flex');
    				 $("#xgmm").attr('swid',_id);
    				 $("#showadd").click();
    			 });
    			 
    		 });
    		 
    		 
    		 $("#xgmm").click(function(){
    			 var swid=$(this).attr('swid');
    			 var url='';;
    			 var mydata={};
    			 if(swid=='dzsb'){
    				 url='/post?api=/uc/bind/dzsb';
    				 var nsrsbhOrShxydm = $('#nsrsbhOrShxydm').val();
                	 if(!nsrsbhOrShxydm){$.toptip('请输入纳税人识别号货信用代码','warning');return;}
                	 var fwmm = $('#fwmm').val();
                	 if(!fwmm){$.toptip('请输入服务密码','warning');return;}
                	 mydata['nsrsbhOrShxydm']=nsrsbhOrShxydm;
                	 mydata['fwmm']=fwmm;
    			 }else if(swid=='hngs'){
    				 url='/post?api=/uc/bind/hngs';
    				 var bsy = $('#bsy').val();
                	 if(!bsy){$.toptip('请输入办税号','warning');return;}
                	 var password = $('#password').val();
                	 if(!password){$.toptip('请输入密码','warning');return;}
                	 mydata['bsy']=bsy;
                	 mydata['password']=password;
                	 mydata['role']=$("#role").val();
    			 }else{
    				 url='/post?api=/uc/bind/hnds';
    				 var username = $('#username').val();
                	 if(!username){$.toptip('请输入用户许可证','warning');return;}
                	 var subuser = $('#subuser').val();
                	 if(!subuser){$.toptip('请输入子用户账号','warning');return;}
                	 var dspassword = $('#dspassword').val();
                	 if(!dspassword){$.toptip('请输入子用户密码','warning');return;}
                	 mydata['username']=username;
                	 mydata['subuser']=subuser;
                	 mydata['dspassword']=dspassword;
    			 }
    			 
    			 var _code = $('#code').val();
            	 if(!_code || !/\d{6}/.test(_code)){$.toptip('请输入六位手机验证码','warning');return;}
            	 util.ajax("POST",ctx+"/post?api=/message/verify",{phone:$("#getCode").attr('data-phone'),type:"纳税人绑定",code:_code},{"User-Token":util.getSDB('token')},true,'提交中',false,function (data){
             		if(data.code==2000){
             			util.ajax("POST",ctx+url,mydata,{"User-Token":util.getSDB('token')},false,'提交中',true,function (datas){
                     		if(datas.code==2000){
                     			$.toast("绑定成功",1500, function() {
                         			window.location.href=ctx+'/company.html';
                         	    });
                           	}else{
                           		$.toptip(datas.message,'error');
                           	}
               			 });
                   	}else{
                   		$.hideLoading();
                   		$.toptip(data.message,'error');
                   	}
       			 });
    			 
    		 });
    		 
    		 
    		 
    		 
    		 function getmsgcode(){
    			 util.ajax("POST",ctx+"/post?api=/message/getcode",{phone:$("#getCode").attr('data-phone'),type:"纳税人绑定"},null,true,'发送验证码中',true,function (data){
     				if(data.code==2000){
                   		$.toast("发送成功，5分钟内有效","text");
                   		settime();
                   	}else{
                   		$.toptip(data.message,'error');
                   	}
     			 });
    		 }
    		 var countdown=60;
             function settime() { //发送验证码倒计时
                 if (countdown == 0) {
                	 $("#getCode").html("重新发送").one('click',getmsgcode);;
                	 countdown=60;
                     return;
                 } else {
                	 $("#getCode").html("重新发送(" + countdown + ")");
                	 countdown--;
                 }
                 setTimeout(function() {settime() },1000)
             }
    	});
    })
});