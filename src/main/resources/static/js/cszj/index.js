$(function() {
	        FastClick.attach(document.body);
	        
	        $(document).ready(function(){
	           $('.fxswiper-slide').css({'max-height':$(window).height()-55-$('#tab').height()-$('.weui-tabbar').height(),'overflow-y':'auto','height':'auto'});	
	        	
	           if(util.getSDB('index')){
	    	        $('a[tabbar__item="'+util.getSDB('index')+'"]').click();
	    	   }	
	        	
	           var myswap=$("#zixunwdswiper").swiper({
		               loop: false,
			           autoplay: 3000,
			           observer:true,
			           observeParents:true,
			           autoplayDisableOnInteraction : false,
			           pagination : '.swiper-pagination',
			           onClick: function(swiper){
			            	   //$.alert(swiper.clickedSlide.innerHTML);
			           }
			   });	
	           
	           var fxswapIndex=0;
	           var tabIndex=0;
	           var fxswap=$("#faxianswiper").swiper({
	               loop: false,
		           observer:true,
		           observeParents:true,
		           autoplayDisableOnInteraction : false,
		           onClick: function(swiper){
		            	
		           },
		           onSlideChangeStart: function(swiper){
			          var _index=swiper.activeIndex; 
			          var li= $("li[class='current']");
			          li.removeClass('current');
			          $("li[index='"+_index+"']").attr('class','current');
			          
			          var size=$("#faxian").children().length;
			          var le=li.width();
			          var _left=0;
			          var _gsize=size-4;
			          if(_index>fxswapIndex){
			        	  if(tabIndex+1<=_gsize){
			        		  tabIndex+=1;
			        		  _left=0-le*tabIndex;
				   		      $("#faxian").css({'-webkit-transition':'transform 0.2s ease-in','-webkit-transform':'translate3d('+_left+'px, 0px, 0px)'}); 
			        	  }
			          }else{
			        	  if(tabIndex-1>=0){
			        		  tabIndex-=1;
			        		  _left=0-le*tabIndex;
			        		  $("#faxian").css({'-webkit-transition':'transform 0.2s ease-in','-webkit-transform':'translate3d('+_left+'px, 0px, 0px)'}); 
			        	  }
			          }
			          fxswapIndex=_index;
			       }
		       });
	           
	           $("li[index]").click(function(){
	        	   var _index=$(this).attr('index');
	        	   fxswap.slideTo(_index, 500, true)
	           });
	        	
	           var urls3="/cms/adpages?page=0&size=0";
		       util.ajax("GET",ctx+"/gets?api="+util.base64EN(urls3),null,{"User-Token":util.getSDB('token')},true,'加载中',true,function (data){
	     			   if(data.code==2000){
	     				  var list=data.dataList;
	     				  for(var i=0;i<list.length;i++){
	     					  $("#wdswiper").append('<div class="swiper-slide"><img width="100%" data-link="'+list[i].link+'" height="150" src="'+util.getSDB('cfgUrl')+'/images'+list[i].url+'"/></div>');
	     				  }
	                   }else{
	                	  util.chargeErrmsg(data);
	                   }
	     	   });	
		       
		       getCSDT(caishuidongtaipage,dosetscdtCanload);
		       getHD(huodongpage,dosethdCanload);
		       getRDWT(redianwentipage,dosetrdwtCanload);
		       getBYRY(bangyoureyipage,dosetbyryCanload);
		       getCSKT(caishuiketangpage,dosetscktCanload);
		    	    	
	    	   if(util.getSDB('userInfo')){
    	    	   var urls2="/uc/nsrbindquery?page=0&size=0&username="+util.getSDB('userInfo').username;
    	    	   util.ajax("GET",ctx+"/gets?api="+util.base64EN(urls2),null,{"User-Token":util.getSDB('token')},false,'加载中',false,function (data){
         			   if(data.code==2000){
         				  var list=data.dataList;
         				  $("#wdsh").empty();
         				  for(var i=0;i<list.length;i++){
         					  if(list[i].bindType=='dzsb'){
         						  
         					  }
         					  $("#wdsh").append('<option value="'+list[i].nsrsbh+'">'+list[i].nsrmc+'</option>');
							  //util.setSDB('nsrsbh',list[i].nsrsbh);
         				  }
         				  
         				  util.setSDB('nsrsbh',$("#wdsh").val());
                       }else{
                    	  util.chargeErrmsg(data);
                       }
         		   });
    	       }
	    	   
	    	   
	    	   
    	    });
	        
	        
	        $("#wdsh").change(function(){
	        	util.setSDB('nsrsbh',$(this).val());
	        })
	        
	        var huodongpage=1;
	    	var huodongcanload=false;
	    	$("#huodong").infinite().on("infinite", function() {
	    		if(huodongcanload) getHD(huodongpage,dosethdCanload);
	    		huodongcanload=false;
	        });
	    	function dosethdCanload(pageT){
	    		huodongpage+=1;
	            if(huodongpage>pageT){
	            	$("#huodongloading").html('<div class="weui-loadmore weui-loadmore_line"><span class="weui-loadmore__tips">全部加载完毕</span></div>');
	            }else{
	            	huodongcanload=true;
	            }
	    	}
	    	function getHD(page,callback){
	    	   var urlsB="/cms/event/selectEventList?size=5&status=2&category=fl3&page="+page;
 	    	   util.ajax("GET",ctx+"/gets?api="+util.base64EN(urlsB),null,{"User-Token":util.getSDB('token')},false,'加载中',false,function (data){
      			   if(data.code==2000){
      				  var list=data.dataList;
      				  for(var i=0;i<list.length;i++){
      					 var _section=$('<section style="width:100%;padding:10px 2%;"></section>');
      					 var _div=$('<div class="imgbox" style="width:96%;padding:10px 2%;"></div>')
      					_div.append('<img  width="98%" height="200px" src="'+util.getSDB('cfgUrl')+list[i].picture+'" alt="">');
      					_div.append('<h2 class="title" style="font-weight:bold;width:98%;">'+list[i].title+'</h2>');
      					_div.append('<p style="width:98%;font-size:15px;"><i class="iconfont huodongi" >&#xe735;</i>'+util.dateTimeFormat(list[i].begintime)+"~"+util.dateTimeFormat(list[i].endtime)+'</p>');
      					_div.append('<p style="width:98%;font-size:15px;"><i class="iconfont huodongi" >&#xe648;</i>'+list[i].province+list[i].city+list[i].address+'</p>');
      					_div.append('<p style="width:98%;font-size:15px;"><i class="iconfont huodongi" >&#xe697;</i>活动名额:'+list[i].peoppleNum+'</p>');
      					_div.append('<p style="width:98%;"><label style="font-weight:bold;">主办方:</label><label style="font-weight:bold;color:#00a5e0">艾博克</label></p></br>');
      					_div.append('<a class="weui-btn weui-btn_primary" href="javascript:" id="zhuceBt">马上报名</a></br>');
      					_section.append(_div)
		 				 $("#huodongdetail").append(_section);
      				  }
      				  if (typeof callback === "function"){callback(Math.ceil(data.total/5));}
                    }else{
                 	   util.chargeErrmsg(data);
                    }
      		   });
	    	}
	    	
	    	
	    	var caishuiketangpage=1;
	    	var caishuiketangcanload=false;
	    	$("#caishuiketang").infinite().on("infinite", function() {
	    		if(caishuiketangcanload) getCSKT(caishuiketangpage,dosetscktCanload);
	    		caishuiketangcanload=false;
	        });
	    	function dosetscktCanload(pageT){
	    		caishuiketangpage+=1;
	            if(caishuiketangpage>pageT){
	            	$("#caishuiketangloading").html('<div class="weui-loadmore weui-loadmore_line"  style="border-top: 0px solid #e5e5e5;"><span class="weui-loadmore__tips" style="margin-top:20px">全部加载完毕</span></div>');
	            }else{
	            	caishuiketangcanload=true;
	            }
	    	}
	    	function getCSKT(page,callback){
	    		var zxkc="/bangbang/curriculum/selectListNew?size=10&page="+page;
	    	 	util.ajax("GET",ctx+"/gets?api="+util.base64EN(zxkc),null,{"User-Token":util.getSDB('token')},false,'加载中',false,function (data){
	    			 if(data.code==2000){
	    					var list=data.dataList;
	    					for(var i=0;i<list.length;i++){
	    						var _kc=$('<li class="kechengli" data-id="'+list[i].curriculumId+'"><div class="kecheng"><img width="100%" height="100px;" src="'+util.getSDB('cfgUrl')+list[i].cover+'"><h5 class="kechengt"><span style="color:red;">'+(list[i].isFree==1?"":"[VIP]")+'</span>'+list[i].title+'</h5></div></li>').click(function(){
	    							var _id=$(this).attr('data-id');
	    							location.href=ctx+"/classinfo.html?id="+_id;
	    						});
	    						$("#zuixin").append(_kc);
	    					}
	    					if (typeof callback === "function"){callback(Math.ceil(data.total/10));}
	    	          }else{
	    	       	     util.chargeErrmsg(data);
	    	          }
	    		 });
	    	}
	    	
	    	var caishuidongtaipage=1;
	    	var caishuidongtaicanload=false;
	    	$("#caishuidongtai").infinite().on("infinite", function() {
	    		if(caishuidongtaicanload) getCSDT(caishuidongtaipage,dosetscdtCanload);
	    		caishuidongtaicanload=false;
	        });
	    	function dosetscdtCanload(pageT){
	    		caishuidongtaipage+=1;
	            if(caishuidongtaipage>pageT){
	            	$("#caishuidongtailoading").html('<div class="weui-loadmore weui-loadmore_line"><span class="weui-loadmore__tips">全部加载完毕</span></div>');
	            }else{
	            	caishuidongtaicanload=true;
	            }
	    	}
	    	
	    	function getCSDT(page,callback){
	    		var urlsA="/cms/content/selectListcszxw?size=10&page="+page;
	   	    	util.ajax("GET",ctx+"/gets?api="+util.base64EN(urlsA),null,{"User-Token":util.getSDB('token')},false,'加载中',false,function (data){
        			  if(data.code==2000){
        				  var list=data.dataList;
        				  for(var i=0;i<list.length;i++){
        					  var _a;
        					  if(list[i].titleImg){
        						  _a=$('<div data-id="'+list[i].contentId+'" class="weui-media-box weui-media-box_appmsg clickmsg"></div>');
            					  _a.append('<div class="weui-media-box__hd"><img width="70px" height="70px" class="weui-media-box__thumb" src="http://'+list[i].domain+list[i].titleImg+'" alt=""></div>');
            					  _a.append('<div class="weui-media-box__bd"><h4 class="weui-media-box__title" style="color:'+list[i].titleColor+'">'+list[i].title+'</h4><p class="weui-media-box__desc">'+list[i].shortTitle+'</p><ul class="weui-media-box__info"><li class="weui-media-box__info__meta">'+list[i].origin+'</li><li class="weui-media-box__info__meta"></li><li><label style="color:green;">'+util.dateFormat(list[i].releaseDate)+'</label></li></ul></div>'); 
        					  }else{
        						  _a=$('<div data-id="'+list[i].contentId+'" class="weui-media-box weui-media-box_text clickmsg"></div>');
        						  _a.append('<h4 class="weui-media-box__title" style="color:'+list[i].titleColor+'">'+list[i].title+'</h4>'); 
        						  _a.append('<p class="weui-media-box__desc">'+list[i].shortTitle+'</p>'); 
        						  _a.append('<ul class="weui-media-box__info"><li class="weui-media-box__info__meta">'+list[i].origin+'</li><li class="weui-media-box__info__meta"><label style="color:green;">'+util.dateFormat(list[i].releaseDate)+'</label></li></ul>')
        					  } 
        					  _a.click(function(){
        						  location.href=ctx+'/csdtinfo.html?id='+$(this).attr('data-id');
        					  });
        					  $("#caishuidongtaidetail").append(_a);
        				  }
        				  if (typeof callback === "function"){callback(Math.ceil(data.total/10));}
                      }else{
                   	     util.chargeErrmsg(data);
                      }
	        	   });	
	    	}
	    	
	    	
	    	
	    	
	    	var redianwentipage=1;
	    	var redianwenticanload=false;
	    	$("#redianwenti").infinite().on("infinite", function() {
	    		if(redianwenticanload) getRDWT(redianwentipage,dosetrdwtCanload);
	    		redianwenticanload=false;
	        });
	    	function dosetrdwtCanload(pageT){
	    		redianwentipage+=1;
	            if(redianwentipage>pageT){
	            	$("#redianwentiloading").html('<div class="weui-loadmore weui-loadmore_line"><span class="weui-loadmore__tips">全部加载完毕</span></div>');
	            }else{
	            	redianwenticanload=true;
	            }
	    	}
	    	function getRDWT(page,callback){
	    	   var urlsC="/bangbang/knowledgeBase/hotUnClassifyList?KnowledgePageSize=8&KnowledgeType=QA&KnowledgeRecommend=hot";
 	    	   util.ajax("GET",ctx+"/gets?api="+util.base64EN(urlsC),null,{"User-Token":util.getSDB('token')},false,'加载中',false,function (data){
     			   if(data.code==2000){
     				  var list=data.dataList;
     				  for(var i=0;i<list.length;i++){
     					 var _a=$('<a data-id="'+list[i].id+'" class="weui-cell weui-cell_access" href="javascript:;"></a>');
     					_a.append('<div class="weui-cell__hd"><i class="iconfont" style="font-size:20px;margin-right:7px;color:#FCBC5A;">&#xe935;</i></div>');
     					_a.append('<div class="weui-cell__bd weui-cell_primary" style="line-height: 1.2;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">'+list[i].subject+'</div>');
     					$("#redianwentidetail").append(_a);
     				  }
                   }else{
                	   util.chargeErrmsg(data);
                   }
     		   });
	    	}
	    	
	    	var bangyoureyipage=1;
	    	var bangyoureyicanload=false;
	    	$("#bangyoureyi").infinite().on("infinite", function() {
	    		if(bangyoureyicanload) getBYRY(bangyoureyipage,dosetbyryCanload);
	    		bangyoureyicanload=false;
	        });
	    	function dosetbyryCanload(pageT){
	    		bangyoureyipage+=1;
	            if(bangyoureyipage>pageT){
	            	$("#bangyoureyiloading").html('<div class="weui-loadmore weui-loadmore_line"><span class="weui-loadmore__tips">全部加载完毕</span></div>');
	            }else{
	            	bangyoureyicanload=true;
	            }
	    	}
	        function getBYRY(page,callback){
	        	var urlsD="/bangbang/hotspot/comments?size=10&page="+page;
	    	    util.ajax("GET",ctx+"/gets?api="+util.base64EN(urlsD),null,{"User-Token":util.getSDB('token')},false,'加载中',false,function (data){
    			  if(data.code==2000){
    				  var list=data.dataList;
    				  for(var i=0;i<list.length;i++){
    					var color="#ccc";
    					if(i==0){color="#FF3B35";}else if(i==1){color="#FC7D30;";}else if(i==2){color="#FCBF30";}
    					 var _a=$('<a data-id="'+list[i].id+'" class="weui-cell weui-cell_access" href="javascript:;"></a>');
    					_a.append('<div class="weui-cell__hd"><i class="iconfont" style="font-size:20px;margin-right:7px;color:'+color+';">&#xe634;</i></div>');
    					_a.append('<div class="weui-cell__bd weui-cell_primary" style="line-height: 1.2;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">'+list[i].ask+'</div>');
    					$("#bangyoureyidetail").append(_a);
    				  }
    				  if (typeof callback === "function"){callback(Math.ceil(data.total/10));}
                  }else{
               	    util.chargeErrmsg(data);
                  }
	           });
	        }
	        
	        $("span[href]").click(function(){
    	    	var _href=$(this).attr('href');
    	    	if(typeof($(this).attr("needlogin"))=="undefined"
    	    		|| (typeof($(this).attr("needlogin"))!="undefined" && util.getSDB('userInfo'))){
    	    		if(typeof($(this).attr("neednsrsbh"))=="undefined"||
    	    				(typeof($(this).attr("neednsrsbh"))!="undefined" && util.getSDB('nsrsbh'))){
	        	        location.href=_href;
    	    		}else{
    	    			$.toptip("当前用户暂未绑定纳税企业", 'error');
    	    		}
    	    	}else{
    	    		util.setSDB('tohref',_href);
    	    		location.href=ctx+'/login.html';
    	    	}
    	    });
    	  
    	    
    	    $("a[needlogin]").bind("click", function(){
              	  if(util.getSDB('userInfo')){
          	    	   var userInfo=util.getSDB('userInfo');
          	    	   $("#nickname").html(userInfo.nickname);
          	    	   $("#username").html("财税专家:"+userInfo.username);
          	    	   if(userInfo.userPicturePath){
          	    		   $("#userPicturePath").attr('src',util.getSDB('cfgUrl')+userInfo.userPicturePath);
          	    	   }
          	    	   $(".weui-bar__item--on").removeClass('weui-bar__item--on');
                       $(this).addClass("weui-bar__item--on");
                       $(".weui-tab__bd-item--active").removeClass('weui-tab__bd-item--active');
                       var data_toggle =$(this).attr("data_href");
                       $(data_toggle).addClass("weui-tab__bd-item--active");
          	      }else{
          	    	   window.location.href=ctx+'/login.html';
          	      } 
            });
    	    
    	    $(".weui-tabbar__item").click(function(){
    	    	util.setSDB('index',$(this).attr('tabbar__item'))
    	    });
    	    
    	    $("div[tz-href]").click(function(){
    	    	location.href=$(this).attr('tz-href');
    	    });
});    	
