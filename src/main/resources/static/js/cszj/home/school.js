$(function() {
	var _myclss,_aclss;
	$(document).ready(function(){
	   FastClick.attach(document.body);
	   var urls3="/bangbang/curriculum/selectStudyHistory?userId="+util.getSDB('userId');
 	   util.ajax("GET",ctx+"/gets?api="+util.base64EN(urls3),null,{"User-Token":util.getSDB('token')},true,'加载中',true,function (data){
			if(data.code==2000){
				var list=data.dataList;
				for(var i=0;i<list.length;i++){
					var _kc=$('<li class="kechengli" data-id="'+list[i].curriculumId+'"><div class="kecheng"><img width="100%" height="100px;" src="'+util.getSDB('cfgUrl')+list[i].cover+'"><h5 class="kechengt"><span style="color:red;">'+(list[i].isFree==1?"":"[VIP]")+'</span>'+list[i].title+'</h5></div></li>').click(function(){
						var _id=$(this).attr('data-id');
						showkecheng(_id);
					});
					$("#history").append(_kc);
				}
				
            }else{
         	  util.chargeErrmsg(data);
            }
	   });
 	   
 	  var zxkc="/bangbang/curriculum/selectListNew?page=1&size=12";
 	  util.ajax("GET",ctx+"/gets?api="+util.base64EN(zxkc),null,{"User-Token":util.getSDB('token')},true,'加载中',true,function (data){
		 if(data.code==2000){
				var list=data.dataList;
				for(var i=0;i<list.length;i++){
					var _kc=$('<li class="kechengli" data-id="'+list[i].curriculumId+'"><div class="kecheng"><img width="100%" height="100px;" src="'+util.getSDB('cfgUrl')+list[i].cover+'"><h5 class="kechengt"><span style="color:red;">'+(list[i].isFree==1?"":"[VIP]")+'</span>'+list[i].title+'</h5></div></li>').click(function(){
						var _id=$(this).attr('data-id');
						showkecheng(_id);
					});
					$("#zuixin").append(_kc);
				}
          }else{
       	     util.chargeErrmsg(data);
          }
	   });
		
		
		_myclss = new Swiper('#myclasses',{
		    autoHeight: true,
		    observer:true,
		    observeParents:true,
		    simulateTouch : true,
		    //effect:"coverflow",
            autoplayDisableOnInteraction : true
        });
		
		_aclss = new Swiper('#_aclss',{
		    autoHeight: true,
		    observer:true,
		    observeParents:true,
		    simulateTouch : true,
		    //effect:"coverflow",
            autoplayDisableOnInteraction : true
        });
		
		$(".placeholder").click(function(){
			var _this=$(this);
			if(!_this.hasClass("placeholder_active")){
				$(".placeholder_active").removeClass("placeholder_active");
				_this.addClass("placeholder_active");
				var index=_this.attr('index');
				if(index==1 && _this.attr('needloading')=='true'){
				   var urls="/bangbang/curriculum/selectListCollect?userId="+util.getSDB('userId');
				   util.ajax("GET",ctx+"/gets?api="+util.base64EN(urls),null,{"User-Token":util.getSDB('token')},true,'加载中',true,function (data){
						if(data.code==2000){
							var list=data.dataList;
							for(var i=0;i<list.length;i++){
								var _kc=$('<li class="kechengli" data-id="'+list[i].curriculumId+'"><div class="kecheng"><img width="100%" height="100px;" src="'+util.getSDB('cfgUrl')+list[i].cover+'"><h5 class="kechengt"><span style="color:red;">'+(list[i].isFree==1?"":"[VIP]")+'</span>'+list[i].title+'</h5></div></li>').click(function(){
									var _id=$(this).attr('data-id');
									showkecheng(_id);
								});
								$("#collect").append(_kc);
							}
							_this.attr('needloading','false');
			            }else{
			         	  util.chargeErrmsg(data);
			            }
				   });
				}
				_myclss.slideTo(index, 500, false); 
			}
		});
		
		$(".placeholderA").click(function(){
			var _this=$(this);
			if(!_this.hasClass("placeholder_activeA")){
				$(".placeholder_activeA").removeClass("placeholder_activeA");
				_this.addClass("placeholder_activeA");
				var index=_this.attr('index');
				if(_this.attr('needloading')=='true'){
					var urls="",_id;
					if(index==1){
						urls="/bangbang/curriculum/selectListWatch?page=1&size=10";
						_id="#zuijin";
					}else if(index==2){
						urls="/bangbang/curriculum/selectListNew?page=1&size=10";
						_id="#huiyuan";
					}else if(index==3){
						urls="/bangbang/curriculum/selectListNew?page=1&size=10&isFree=1";
						_id="#mianfei";
					}
					util.ajax("GET",ctx+"/gets?api="+util.base64EN(urls),null,{"User-Token":util.getSDB('token')},true,'加载中',true,function (data){
						if(data.code==2000){
								var list=data.dataList;
								for(var i=0;i<list.length;i++){
									var _kc=$('<li class="kechengli" data-id="'+list[i].curriculumId+'"><div class="kecheng"><img width="100%" height="100px;" src="'+util.getSDB('cfgUrl')+list[i].cover+'"><h5 class="kechengt"><span style="color:red;">'+(list[i].isFree==1?"":"[VIP]")+'</span>'+list[i].title+'</h5></div></li>').click(function(){
										var _id=$(this).attr('data-id');
										showkecheng(_id);
									});
									$(_id).append(_kc);
								}
								_this.attr('needloading','false');
				         }else{
				         	  util.chargeErrmsg(data);
				         }
					});
				}
				_aclss.slideTo(index, 500, false); 
			}
		});
		$('.swiper-slide').css({'max-height':$(window).height()-10-$('.weui-flex').height()-$('.weui-tabbar').height(),'overflow-y':'auto','height':'auto'});		
	});
	
	function showkecheng(_id){
		location.href=ctx+"/classinfo.html?id="+_id;
	}
});
