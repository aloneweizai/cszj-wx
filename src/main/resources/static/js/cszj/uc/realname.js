require(["../../config"], function () {
    require(["jquery.ui"], function ($) {
    	$(function() {
    		 $(document).ready(function(){
    			 util.ajax("POST",ctx+"/post?api=/uc/wxgzh/getwxJsConfig"+(util.getLDB('charge')?"?charge="+util.getLDB('charge'):""),{url:location.href.split('#')[0]},{"User-Token":util.getSDB('token')},false,'加载中',false,function (data){
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
    			 
    			 util.ajax("GET",ctx+"/get?api=/uc/user/extend/"+util.getSDB('userId'),null,{"User-Token":util.getSDB('token')},true,'加载中',true,function (data){
       				if(data.code==2000){
       				   if(data.data.validStatus==0){
       					   $("#status").html("<span style='color:red;'>未认证</span>");
       					   $("#truenamecell").css('display','none');
	       				   $("#idcardcell").css('display','none');
	       				   $("#remark").css('display','none');
	       				   $("#remarks").css('display','none');
	       				   $("div[for='renzhen']").css('display','flex');
	       				   $("#realname").css('display','block');
       				   }else{
       					   $("#truename").html(data.data.realName);
       					   $("#idcard").html(data.data.idcard);
       					   var statusHtm="";
       					   if(data.data.validStatus==1){
       						   statusHtm="<span style='color:orange;'>待认证</span>";
       					   }else if(data.data.validStatus==2){
       						   statusHtm="<span style='color:#00ee00;'>已认证</span>";
       					   }else{
       						   statusHtm="<span style='color:red;'>认证失败</span>";
       						   $("div[for='renzhen']").css('display','flex');
       						   $("#realname").css('display','block');
       					   }
       					   $("#status").html(statusHtm);
       					   $("#detail").val(data.data.remark);
       				   }
       				   $("#phoneNo").val(util.getSDB('userInfo').phone.substr(0,3)+'****'+util.getSDB('userInfo').phone.substr(7,4));
                     }else{
                    	 util.chargeErrmsg(data);
                     }
       			 });
    			 
    			 $("#getCode2").attr('data-phone',util.getSDB('userInfo').phone).one('click',getmsgcode);
    			 
    		 }); 
    		 
    		 function getmsgcode(){
    			 util.ajax("POST",ctx+"/post?api=/message/getcode",{phone:$("#getCode2").attr('data-phone'),type:"实名认证"},null,true,'发送验证码中',true,function (data){
     				if(data.code==2000){
                   		$.toast("发送成功，5分钟内有效","text");
                   		settime();
                   	}else{
                   		$.toptip(data.message,'error');
                   		$("#getCode2").one('click',getmsgcode);
                   	}
     			 });
    		 }
    		 
    		 var countdown=60;
    		 var imgsrc=['',''];
             function settime() { //发送验证码倒计时
                 if (countdown == 0) {
                	 $("#getCode2").html("重新发送").one('click',getmsgcode);;
                	 countdown=60;
                     return;
                 } else {
                	 $("#getCode2").html("重新发送(" + countdown + ")");
                	 countdown--;
                 }
                 setTimeout(function() {settime() },1000)
             }
    		 
    		 wx.error(function(res){
     			$.hideLoading();
     			$.toptip("初始化插件异常："+JSON.stringify(res),'error');
     		 });
    		 
    		 $('img[do-id="LAY_demo_upload1"]').click(function(){
    			 var _img=$(this);
    			 var _dex=parseInt(_img.attr('do-in'));
    			 wx.chooseImage({
     			    count: 1, // 默认9
     			    sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
     			    sourceType: ['camera','album'], // 可以指定来源是相册还是相机，默认二者都有
     			    success: function (res) {
     			    	_img.prop('src',res.localIds[0]);
     			    	imgsrc[_dex]=res.localIds[0];
     			    }
     		    });
    		 });
    		 
    		 $("#close-popup").click(function(){
    			 $.confirm('确认放弃提交实名认证?', '', function() {
            		 $("#close-popup2").click();
        	     });
    		 });
    		 
    		 $("#smrzBt").click(function(){
    			 var _data={};
    			 var nimgid=[];
    			 if(imgsrc[0]==''){
    				 $.toptip('请上传手持身份证正面','warning');
    				 return;
    			 }
    			 if(imgsrc[1]==''){
    				 $.toptip('请上传身份证反面','warning');
    				 return;
    			 }
    			 var zsxm=$("#zsxm").val();
      			 if(!zsxm){$.toptip('请输入真实姓名','warning');return}
      			 var sfzhm=$("#sfzhm").val();
     			 if(!sfzhm || !/^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/.test(sfzhm)){$.toptip('请输入正确的身份证号码','warning');return}
     			 var code = $('#code2').val();
           	     if(!code || !/\d{6}/.test(code)){$.toptip('请输入六位手机验证码','warning');return;}
           	     _data['idcard']=sfzhm;
           	     _data['realName']=zsxm;
           	     _data['validStatus']='1';
           	     _data['remark']='';
           	     $.confirm('确认提交?', '', function() {
           	    	 $.showLoading('实名认证资料提交中');
           	    	 util.ajax("POST",ctx+"/post?api=/message/verify",{phone:$("#getCode2").attr('data-phone'),type:"实名认证",code:code},null,false,'提交中',false,function (data){
                		if(data.code==2000){
                 		    	wx.uploadImage({
            			            localId:imgsrc[0] ,
            			            isShowProgressTips: 0, 
            			            success: function (res) {
            			            	_data['frontImage']=res.serverId;
            			            	wx.uploadImage({
                    			            localId:imgsrc[1] ,
                    			            isShowProgressTips: 0, 
                    			            success: function (res) {
                    			            	_data['backImage']=res.serverId;
                    			            	util.ajax("PUT",ctx+"/put?api=/uc/user/extend/wx/"+util.getSDB('userId'),_data,{"User-Token":util.getSDB('token')},false,'',true,function (data){
                    				     				if(data.code==2000){
                    				     					$.toast("提交成功,请等待审核!",1500, function() {
                    		                         			window.location.href=ctx+'/realname.html';
                    		                         	    });
                    				                   	}else{
                    				                   		util.chargeErrmsg(data);
                    				                   	}
                    				     		});
                    			            		
                    			            }
                    			        });  
            			            }
            			        });
                      	}else{
                      		$.hideLoading();
                      		$.toptip(data.message,'error');
                      	}
          		   });
         		     
     	         });
    		 });
    	});
    })
});