require(["../../config"], function () {
    require(["jquery.ui","jweixin"], function ($,wx) {
    	$(function() {
    		$(document).ready(function(){
    			var userInfo=util.getSDB('userInfo');
    			$("#nickname").html(userInfo.nickname);
 	    	    $("#username").html(userInfo.username);
 	    	    if(userInfo.userPicturePath){
 	    		   $("#headImg").attr('src',util.getSDB('cfgUrl')+userInfo.userPicturePath);
 	    	    }else{
 	    	       $("#headImg").attr('src','https://team.weui.io/avatar/bear.jpg');
 	    	    }
 	    	    $("#phoneNo").html(userInfo.phone.substr(0,3)+'****'+userInfo.phone.substr(7,4));
 	    	    $("#getCode").attr('data-phone',userInfo.phone).one('click',getmsgcode);
    			
    			util.ajax("POST",ctx+"/post?api=/uc/wxgzh/getwxJsConfig?charge="+util.getLDB('charge'),{url:location.href.split('#')[0]},{"User-Token":util.getSDB('token')},true,'加载中',false,function (data){
 	    	    	  if(data.code && data.code!=2000){
	                	 $.toptip("初始化插件异常",'error');  
	                  }else{
	                	 if(data.charge){util.setLDB('charge',data.charge)}
	                	 wx.config({
	 	              	      debug: false, 
	 	              	      appId: data.appId, 
	 	              	      timestamp: data.timestamp, 
	 	              	      nonceStr: data.nonceStr, 
	 	              	      signature: data.signature,
	 	              	      jsApiList: [ 'chooseImage','previewImage','uploadImage','downloadImage'] 
	 	              	 }); 
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
    			
    			util.ajax("GET",ctx+"/get?api=/uc/dict/kv/industry",null,{"User-Token":util.getSDB('token')},false,'',false,function (data){
 	  				if(data.code==2000){
 	  					for(var i=0;i<data.dataList.length;i++){
 	  						$("#select5").append('<option value="'+data.dataList[i].fieldValue+'">'+data.dataList[i].fieldKey+'</option>');
 	  					}
 	                }else{
 	                	util.chargeErrmsg(data);
 	                }
 	  			});
    			
    			util.ajax("GET",ctx+"/get?api=/uc/dict/kv/goodat",null,{"User-Token":util.getSDB('token')},false,'',false,function (data){
 	  				if(data.code==2000){
 	  					for(var i=0;i<data.dataList.length;i++){
 	  						$("#select6").append('<option value="'+data.dataList[i].fieldValue+'">'+data.dataList[i].fieldKey+'</option>');
 	  					}
 	                }else{
 	                	util.chargeErrmsg(data);
 	                }
 	  			});
 	    	    
    			
 	    	    
 	    	    $("#time-format").datetimePicker({
 	                 title: '日期',
 	                 yearSplit: '-',
 	                 monthSplit: '-',
 	                 times:function(){},
 	                 max: new Date(),
 	                 onChange: function (picker, values, displayValues) {
 	                  
 	                 }
 	            }); 
 	    	    
 	    	    
 	    	    
 	    	});
    		
    		wx.ready(function(){
    			$.hideLoading();
    		});
    		
    		wx.error(function(res){
    			$.hideLoading();
    			$.toptip("初始化插件异常："+JSON.stringify(res),'error');
    		});
    		
    		$("#exitBtn").click(function(){
    			util.ajaxComfirm("确认退出该账号？", "退出登录","GET",ctx+"/delete?api=/uc/logout/"+util.getSDB('token'),null,{"User-Token":util.getSDB('token')},false,'',false,function (data){
    				if(data.code==2000){
    					util.clearSDB();
                		window.location.href=ctx+'/';
                	}else{
                		util.chargeErrmsg(data);
                	}
    			});
    			
        	});
    		
    		
    		$("#headImg").click(function(){
    			wx.chooseImage({
    			    count: 1, // 默认9
    			    sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
    			    sourceType: ['camera','album'], // 可以指定来源是相册还是相机，默认二者都有
    			    success: function (res) {
    			    	$.showLoading('图片上传中');
    			        wx.uploadImage({
    			            localId: res.localIds[0],
    			            isShowProgressTips: 0, 
    			            success: function (res) {
    			            	 util.ajax("PUT",ctx+"/put?api=/uc/user/changeheadbywx/"+util.getSDB('userId')+"/"+res.serverId,{},{"User-Token":util.getSDB('token')},false,'图片上传中',true,function (data){
    			     				if(data.code==2000){
    			     					var userInfo=util.getSDB('userInfo');
    			     					userInfo.userPicturePath=data.data.userPicturePath;
    			     					util.setSDB('userInfo',userInfo);
    			     					$('#headImg').prop('src',util.getSDB('cfgUrl')+userInfo.userPicturePath);
    			                   	}else{
    			                   		util.chargeErrmsg(data);
    			                   	}
    			     			 });
    			            }
    			        });
    			    }
    		   });
    		});
    		
    		 
    		 function getmsgcode(){
    			 util.ajax("POST",ctx+"/post?api=/message/getcode",{phone:$("#getCode").attr('data-phone'),type:"密码修改"},null,true,'发送验证码中',true,function (data){
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
             
             $("#xgmm").click(function(){
            	 
            	 var code = $('#code').val();
            	 if(!code || !/\d{6}/.test(code)){$.toptip('请输入六位手机验证码','warning');return;}
            	 var pasword = $('#password').val();
            	 if(!pasword || pasword.length<8 || pasword.length>32){$.toptip('请输入8-32位有效密码','warning');return;}
            	 var newpasword = $('#newpassword').val();
            	 if(pasword!=newpasword){$.toptip('两次输入密码不一致','warning');return;}
            	 
            	 util.ajax("POST",ctx+"/post?api=/message/verify",{phone:$("#getCode").attr('data-phone'),type:"密码修改",code:code},null,true,'提交中',false,function (data){
            		if(data.code==2000){
            			 util.ajax("put",ctx+"/put?api=/uc/user/password",{phone:$("#getCode").attr('data-phone'),password:pasword},{"User-Token":util.getSDB('token')},false,null,true,function (data){
            				if(data.code==2000){
                         		$.toast("密码修改成功",1500, function() {
                         			$("#close-popup").click();
                         	    });
                         	}else{
                         		util.chargeErrmsg(data);
                         	}
               			 });
                  	}else{
                  		$.hideLoading();
                  		$.toptip(data.message,'error');
                  	}
      			 });
            	 
             });
             
             $("#close-popup").click(function(){
            	 $.confirm('确认放弃修改密码?', '', function() {
            		 $("#close").click();
            		 $('#code').val('');
                	 $('#password').val('');
                	 $('#newpassword').val('');
        	     });
             });
             
             $("#close-popup2").click(function(){
            	 $.confirm('确认放弃编辑资料?', '', function() {
            		 $("#myziliao")[0].reset();
            		 $("#close").click();
        	     });
             })
             
             $("label[for]").click(function(){
            	 $('[name="sex"][checked]').removeAttr('checked');
            	 $("#"+$(this).attr('for')).attr('checked','checked');
             });
             
             $("#showziliao").click(function(){
            	util.ajax("GET",ctx+"/get?api=/uc/user/"+util.getSDB('userId'),null,{"User-Token":util.getSDB('token')},true,'加载中',true,function (data){
      				if(data.code==2000){
      				  if(data.user.usernameModifiedTimes && data.user.usernameModifiedTimes!=0){
      					$("#usernamess").attr('readonly','readonly');
      				  }
      				  $("#usernamess").val(data.user.username);
      				  $("#nicknamess").val(data.user.nickname);
      				  $("#email").val(data.user.regMail);
      				  if(data.user_extend){
      					  $('#select4').val(data.user_extend.sex)
        				  $("#time-format").val(util.dateFormat(data.user_extend.birthday));
        				  $("#time-format2").val(data.user_extend.careerDuration);
        				  $("#education").val(data.user_extend.education);
        				  $("#select1").val(data.user_extend.province);
   					      city(data.user_extend.province,data.user_extend.city);
   					      area(data.user_extend.city,data.user_extend.area);
        				  $("#detailss").val(data.user_extend.postAddress);
        				  //$("#scly").val(data.user_extend.tags);
        				  $("#QQ").val(data.user_extend.qq);  
        				  $("#select5").val(data.user_extend.occupation);
        				  $("#select6").val(data.user_extend.tags);
      				  }  
      				$("#showziliaofull").click();
                    }else{
                    	util.chargeErrmsg(data);
                    }
      			});
             });
             
            
 			$("#select1").change(function(){
 				city($(this).val());
 			});
 			$("#select2").change(function(){
 				area($(this).val());
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
     		
     		$("#xgmmzl").click(function(){
     			
     			var username=$("#usernamess").val();
     			if(!username){$.toptip('请输入用户名','warning');return}
     			var nickname=$("#nicknamess").val();
     			if(!nickname){$.toptip('请输入昵称','warning');return}
     			var birthday=$("#time-format").val();
     			if(!birthday){$.toptip('请输入生日','warning');return}
     			var careerDuration=$("#time-format2").val();
     			if(!careerDuration){$.toptip('请输入从业时间','warning');return}
     			var education=$("#education").val();
     			if(!education){$.toptip('请选择最高学历','warning');return}
     			var province=$("#select1").val();
    			if(!province){$.toptip('请选择省份','warning');return}
    			var city=$("#select2").val();
    			if(!city){$.toptip('请选择城市','warning');return}
    			var area=$("#select3").val();
    			if(!area){$.toptip('请选择区域','warning');return}
    			var detail=$("#detailss").val();
    			if(!detail){$.toptip('请填写详细的地址','warning');return}
    			var QQ=$("#QQ").val();
    			if(!QQ || !/\d{3,10}/.test(QQ)){$.toptip('请填写正确的QQ号码','warning');return}
    			var email=$("#email").val();
    			if(!email){$.toptip('请填写电子邮箱','warning');return}
    			var occupation=$("#select5").val();
    			if(!occupation){$.toptip('请选择所属行业','warning');return}
    			var tags=$("#select6").val();
    			if(!tags){$.toptip('请选择擅长领域','warning');return}
    			
    			var user={username:username,nickname:nickname,regMail:email};
    			var user_extend={occupation:occupation,qq:QQ,province:province,city:city,area:area,postAddress:detail,careerDuration:careerDuration,education:education,birthday:birthday};
    			user_extend['tags']=tags;
    			user_extend['sex']=$('#select4').val();
    			util.ajaxComfirm("确认提交？", "修改个人信息","PUT",ctx+"/put?api=/uc/user/"+util.getSDB('userId'),user,{"User-Token":util.getSDB('token')},true,'提交中',false,function (data){
    				if(data.code==2000){
    					util.ajax("PUT",ctx+"/put?api=/uc/user/extend/"+util.getSDB('userId'),user_extend,{"User-Token":util.getSDB('token')},false,'',true,function (data){
    	      				if(data.code==2000){
    	      					$.toast("个人信息修改成功",1500, function() {
    	      						$("#close").click();
                         	    });
    	                    }else{
    	                    	util.chargeErrmsg(data);
    	                    }
    	      			});
                	}else{
                		util.chargeErrmsg(data);
                	}
    			});
    			
    			
     		});
    		
    	});
    })
});