$(function() {
	         FastClick.attach(document.body);
    		 
    		 var login = new Swiper('#loginType',{
                autoplayDisableOnInteraction : true
             });
    		
    		 $("#changeLogin").click(function(){
    			 if(login.activeIndex==0) login.slideNext(200);
    			 else login.slidePrev(200);
    		 });
    		 
    		 $("#getCode").one('click',getmsgcode);
    		 
    		 function getmsgcode(){
    			 var telcode = $('#telcode').val();
    			 if(!telcode || !/^1[3|4|5|8][0-9]\d{4,8}$/.test(telcode)){$.toptip('请输入正确的手机号','warning');$("#getCode").one('click',getmsgcode);return;}
    			 util.ajax("POST",ctx+"/post?api=/message/getcode",{phone:telcode,type:"手机登录"},null,true,'发送验证码中',true,function (data){
    				if(data.code==2000){
                  		$.toast("发送成功，5分钟内有效", "text");
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
    		 
    		 $("#showTooltips").click(function() {
    			var urls="";
    			var data={};
     			if(login.activeIndex==0){
     				var tel = $('#tel').val();
          	        var password = $('#password').val();
          	        if(!tel){$.toptip('请输入用户名','warning');return;}
          	        else if(!password) {$.toptip('请输入密码','warning');return;}
          	        else{
          	        	urls=ctx+'/login.html';
          	        	data={usernameOrPhone:tel,password:$.md5(password)};
          	        }
     			}else{
     				var telcode = $('#telcode').val();
          	        var code = $('#code').val();
     				if(!telcode || !/^1[3|4|5|8][0-9]\d{4,8}$/.test(telcode)){$.toptip('请输入正确的手机号','warning');return;}
          	        else if(!code || !/\d{6}/.test(code)){$.toptip('请输入六位手机验证码','warning');return;}
          	        else{
          	        	urls=ctx+'/post?api=/uc/verifylogin';
          	        	data={phone:telcode,code:code,type:'手机登录'};
          	        }
     			}
     			util.ajax("POST",urls,data,null,true,'登录中',true,function (data){
     				if(data.code==2000){
     					util.setSDB('userInfo',data.data.user);
     					util.setSDB('userId',data.data.user.id);
     					util.setSDB('token',data.data.token);
     					var _tohref=util.getSDB('tohref');
     					if(_tohref){
     						util.delSDB("tohref");
     						window.location.href=_tohref;
     					}else{
     						window.location.href=ctx+'/';
     					}
                	}else{
                		$.toptip(data.message,'error');
                	}
    			});    			
     	     });
    		 
    		 $("#close-popup").click(function(){
            	 $.confirm('确认放弃注册账号?', '', function() {
            		 $("#close").click();
                     $("#zhuce")[0].reset();
        	     });
             });
    		 
    		 $("#zhuceBt").click(function(){
    			 var telcode2 = $('#telcode2').val();
    			 if(!telcode2 || !/^1[3|4|5|8][0-9]\d{4,8}$/.test(telcode2)){$.toptip('请输入正确的手机号','warning');return;}
    			 var code = $('#code2').val();
            	 if(!code || !/\d{6}/.test(code)){$.toptip('请输入六位手机验证码','warning');return;}
            	 var pasword = $('#password2').val();
            	 if(!pasword || pasword.length<8 || pasword.length>32){$.toptip('请输入8-32位有效密码','warning');return;}
            	 var newpasword = $('#newpassword2').val();
            	 if(pasword!=newpasword){$.toptip('两次输入密码不一致','warning');return;}
            	 var register={phone:telcode2,password:pasword,status:true,verifyingCode:code,verifyingType:"用户注册"};
            	 util.ajaxComfirm("确认提交？", "账号注册","POST",ctx+"/post?api=/uc/register",register,{"User-Token":util.getSDB('token')},true,'提交中',true,function (data){
     				if(data.code==2000){
     					$.toast("注册成功",1500, function() {
     						util.ajax("POST",ctx+'/post?api=/uc/login',{usernameOrPhone:telcode2,password:pasword},null,true,'登录中',true,function (data){
     		     				if(data.code==2000){
     		     					util.setSDB('userInfo',data.data.user);
     		     					util.setSDB('userId',data.data.user.id);
     		     					util.setSDB('token',data.data.token);
     		                		window.location.href=ctx+'/';
     		                	}else{
     		                		$.toptip(data.message,'error');
     		                	}
     		    			});
                 	    });
                 	}else{
                 		$.toptip(data.message,'error');
                 	}
     			});
    		 });
    		 
             $("#getCode2").one('click',getmsgcode2);
    		 
    		 function getmsgcode2(){
    			 var telcode2 = $('#telcode2').val();
    			 if(!telcode2 || !/^1[3|4|5|8][0-9]\d{4,8}$/.test(telcode2)){$.toptip('请输入正确的手机号','warning');$("#getCode2").one('click',getmsgcode2);return;}
    			 util.ajax("POST",ctx+"/post?api=/message/getcode",{phone:telcode2,type:"用户注册"},null,true,'发送验证码中',true,function (data){
    				if(data.code==2000){
                  		$.toast("发送成功，5分钟内有效", "text");
                  		settime2();
                  	}else{
                  		$.toptip(data.message,'error');
                  	}
    			 });
    		 }
    		 var countdown2=60;
             function settime2() { //发送验证码倒计时
                 if (countdown2 == 0) {
                	 $("#getCode2").html("重新发送").one('click',getmsgcode2);
                	 countdown2=60;
                     return;
                 } else {
                	 $("#getCode2").html("重新发送(" + countdown2 + ")");
                	 countdown2--;
                 }
                 setTimeout(function() {settime2();},1000);
             }
    		 
});    	
