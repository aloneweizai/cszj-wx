var player;
function charge(){
	/*util.ajax("GET",ctx+"/get?api=/bangbang/courseware/selectCourseware/"+_id,null,{"User-Token":util.getSDB('token')},false,'加载中',false,function (data){
		
	});*/
	player.play();
}
var kclist=[];
var kcpage=1;
var kccanload=false;
$(function() {
	FastClick.attach(document.body);
	player = videojs('show-video');
	$(document).ready(function(){
		util.ajax("GET",ctx+"/get?api=/bangbang/curriculum/selectCurriculum/"+_id,null,{"User-Token":util.getSDB('token')},true,'加载中',false,function (data){
			if(data.code==2000){
				$("#kejs").html(data.data.curriculumidIntro);
				$("#kctitle").html(data.data.title);
				$("#mytitle").html(data.data.title);
				$("#show-img").css({'width':'100%','height':'180px'}).prop('src',util.getSDB('cfgUrl')+data.data.cover);
				
				var _vip='';
				for(var z=0;z<data.data.membergradeList.length;z++){
					 _vip+=data.data.membergradeList[z].memberGradeName+" ";
				}
				$("#vips").text(_vip);		
				
				if(data.data.trainTimeBegin!=null && data.data.trainTimeEnd !=null
					 && !(data.data.trainTimeBegin <=new Date().getTime() && new Date().getTime() <= data.data.trainTimeEnd)){
					$.hideLoading();
					$("#doBt").html('<a class="weui-btn weui-btn_disabled weui-btn_primary" href="javascript:" id="zhuceBt">已过期('+util.dateFormat(data.data.trainTimeBegin)+'~'+util.dateFormat(data.data.trainTimeEnd)+')</a>');
				}else{
					var _goodId=data.data.goodsId;
					if(data.data.isFree!=1){
						util.ajax("GET",ctx+"/get?api=/uc/goods/user/"+_goodId,null,{"User-Token":util.getSDB('token')},false,'加载中',false,function (_data){
							if(_data.code==2000){
							   var marketPrice=_data.data.productBOList[0].marketPrice;
							   var sellingPrice=_data.data.productBOList[0].sellingPrice;
							   $("#jiage").text(marketPrice);
							   $("#yhjiage").text(sellingPrice);
							   $("#jifen").text(parseFloat(marketPrice)*1200);
							   $("#yhjifen").text(parseFloat(sellingPrice)*1200);
							   
							   var zxkc="/uc/order/goods?userId="+util.getSDB('userId')+"&goodsId="+_goodId;
							   util.ajax("GET",ctx+"/gets?api="+util.base64EN(zxkc),null,{"User-Token":util.getSDB('token')},false,'加载中',true,function (data){
								  if(data.code==2000){
									 if(data.data){
										 var learn=$('<a class="weui-btn weui-btn_primary" href="javascript:" id="zhuceBt">开始学习</a>').click(function(){
											 dolearn();
										 });
										 $("#doBt").append(learn);
									 }else{
										 $("#doBt").html('<a class="weui-btn weui-btn_disabled weui-btn_primary" href="javascript:" id="zhuceBt">购买(暂时仅支持电脑端购买)</a>');
									 }		
							      }else{
							       	 util.chargeErrmsg(data);
							      }
								});
							}else{
					           util.chargeErrmsg(_data);
					        }
						});
						
					}else{
						$.hideLoading();
						var learn=$('<a class="weui-btn weui-btn_primary" href="javascript:" id="zhuceBt">开始学习</a>').click(function(){
							 dolearn();
						});
						$("#doBt").append(learn);
					}
				}
				var list=data.data.chapterBoList;
				for(var i=0;i<list.length;i++){
                   var _a=$('<div class="weui-cells__title" style="font-size: 16px;">第'+(i+1)+'章：'+list[i].chapterName+'</div>');
                   var _b=$('<div class="weui-cells" style="font-size: 14px;"></div>');
                   var _a1=$('<div class="weui-cells__title" style="font-size: 16px;">第'+(i+1)+'章：'+list[i].chapterName+'</div>');
                   var _b1=$('<div class="weui-cells" style="font-size: 14px;"></div>');
                   var coursewareList=list[i].coursewareList;
                   for(var j=0;j<list.length;j++){
                	   var _c=$('<a class="weui-cell weui-cell_access"  href="javascript:;" ><div class="weui-cell__bd" style="padding-left:15px;"><p>第'+(j+1)+'节：'+coursewareList[j].title+'</p></div></a>');
                	   var _c1=$('<a class="weui-cell weui-cell_access '+(kclist.length==0?"isplay":"")+'" kcindex="'+kclist.length+'"   href="javascript:;" ><div class="weui-cell__bd" style="padding-left:15px;"><p>第'+(j+1)+'节：'+coursewareList[j].title+'</p></div></a>').click(function(){
                		  if(!$(this).hasClass('isplay')){
                			  changeLink(kclist[parseInt($(this).attr('kcindex'))],true);  
                			  $(".isplay").removeClass('isplay');
                			  $(this).addClass('isplay');
                		  }  
                	   });
                	   if(kclist.length==0){
                		   changeLink(coursewareList[j],false);
                	   }
                	   kclist.push(coursewareList[j]);
                	   _b.append(_c);
                	   _b1.append(_c1);
                   }
                   $("#keml").append(_a).append(_b); 
                   $("#kemls").append(_a1).append(_b1);  
				}
				for(var k=0;k<data.data.lecturerList.length;k++){
	                var lecturer=data.data.lecturerList[k];
	                var _a=$('<div class="weui-media-box weui-media-box_text clickmsg"></div>');
					_a.append('<h4 class="weui-media-box__title" style="color:#18b4ed;font-weight:bold;">'+lecturer.lecturerName+'</h4>'); 
					_a.append('<p class="weui-media-box__desc">'+lecturer.intro+'</p>'); 
					//_a.append('<ul class="weui-media-box__info" style="font-size:16px"><li class="weui-media-box__info__meta" style="color:green;">好评度:'+lecturer.praiseNum+'%</li><li class="weui-media-box__info__meta"><label style="color:green;">课程数:'+lecturer.currNum+'</label></li><li class="weui-media-box__info__meta"><label style="color:green;">学生数:'+lecturer.studentNum+'</label></li></ul>')
	                $("#lsje").append(_a).append('<div class="laoshi_pingjia"><span class="br1"><p>好评度</p>'+lecturer.praiseNum+'%</span><span class="br1"><p>课程数</p>'+lecturer.currNum+'</span><span><p>学生数</p>'+lecturer.studentNum+'</span></div>');
					
				}
	         }else{
	         	  util.chargeErrmsg(data);
	         }
		});
		
		getkcjs(kcpage,dosetCanload);
		$(".currentli").css({'overflow-y':'auto','max-height':$(window).height()-50,'height':'auto'});
	});
	
	
	
	$("#kepj").infinite().on("infinite", function() {
		if(kccanload) getkcjs(kcpage,dosetCanload);
		kccanload=false;
    });
	
	
	function getkcjs(page,callback){
		var urls3="/bangbang/currEvaluate/selectListBycurrId?page="+page+"&size=10&curriculumId="+_id;
	    util.ajax("GET",ctx+"/gets?api="+util.base64EN(urls3),null,{"User-Token":util.getSDB('token')},false,'加载中',false,function (data){
  			if(data.code==2000){
  				var list=data.dataList;
  				for(var i=0;i<list.length;i++){
  					 var _a=$('<div class="weui-media-box weui-media-box_appmsg"></div>');
  					 var _star="";
  					 for(var j=1;j<6;j++){
  						_star+=(j<=list[i].grade?"<i class='iconfont ired'>&#xe729;</i>":"<i class='iconfont igray'>&#xe729;</i>");
  					 }
					 _a.append('<div class="weui-media-box__hd"><img style="border-radius:70px" width="70px" height="70px" class="weui-media-box__thumb" src="'+util.getSDB('cfgUrl')+list[i].userPicturePath+'" alt=""></div>');
					 _a.append('<div class="weui-media-box__bd"><h4 class="weui-media-box__title" style="color:">'+list[i].nickname+'&nbsp;'+_star+'</h4><p class="weui-media-box__desc">'+list[i].studyFeel+'</p><ul class="weui-media-box__info"><li class="weui-media-box__info__meta"></li><li class="weui-media-box__info__meta"></li><li><label style="color:green;">'+util.dateFormat(list[i].evaluateTime)+'</label></li></ul></div>'); 
				     $("#kcdetail").append(_a);
  				}
  				if (typeof callback === "function"){callback(Math.ceil(data.total/10));}
           }else{
             	util.chargeErrmsg(data);
           }
  	    });
	}
	
	function dosetCanload(pageT){
		kcpage+=1;
        if(kcpage>pageT){
        	$("#kcloading").html('<div class="weui-loadmore weui-loadmore_line"><span class="weui-loadmore__tips">全部加载完毕</span></div>');
        }else{
        	kccanload=true;
        }
	}
	
	function dolearn(){
		$("#kcgkopen").click();
	}
	
	function changeLink(kc,doPlay){
		var link="",_type='';
		if(kc.uploadWay==0){
			if(kc.link && (kc.link).indexOf('m3u8')!=-1){
				_type='application/x-mpegURL';
			}else{
				_type='video/mp4';
			}
			link=kc.link;
		}else{
			if((kc.fileSite).indexOf('m3u8')!=-1){
				_type='application/x-mpegURL';
			}else{
				_type='video/mp4';
			}
			link=util.getSDB('cfgUrl')+kc.fileSite;
		}
		player.src({
			src: link,
			type: _type,
			withCredentials: true
		});
		if(doPlay){charge()};
	}
	
	$("li[at-id]").click(function(){
	   if(!$(this).hasClass("current")){
		   $("li[at-id][class='current']").removeClass("current");
		   $(this).addClass('current');
		   var _index=parseInt($(this).attr('index'));
		   var _width=0-_index*$(window).width();
		   $("#miantb").css({'-webkit-transition':'transform 0.2s ease-in','-webkit-transform':'translate3d('+_width+'px, 0px, 0px)'}); 
		   //$(".currentli").css('height','0').removeClass('currentli');
		   //var _atid=$(this).attr('at-id')
		   //$("#"+_atid).addClass('currentli').css({'overflow-y':'auto','height':$(window).height()-50});
	   }
	});

	
	/*$("li[at-ids]").click(function(){
		   if(!$(this).hasClass("current")){
			   $("li[at-ids][class='current']").removeClass("current");
			   $(this).addClass('current');
			   var _index=parseInt($(this).attr('index'));
			   var _width=0-_index*$(document).width();
			   var str='width:200%;transition-property: transform; transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0.2s; transform: translate('+_width+'px, 0px) translateZ(0px);';
			   $("#bfkcjs").prop('style',str);
		   }
	});*/
	
	$("#close-popup").click(function(){
		 player.pause();
   		 $("#close").click();
    });

})


