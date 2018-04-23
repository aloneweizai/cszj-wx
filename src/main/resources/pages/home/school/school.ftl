<#assign ctx=request.getContextPath()>
<!DOCTYPE html>
<html>
<head>
<title>财税专家</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="${ctx}/css/weui.min.css">
<link rel="stylesheet" href="${ctx}/css/jquery-weui.min.css">
<link rel="stylesheet" href="${ctx}/css/main.css">
<link rel="stylesheet" href="${ctx}/css/iconfont.css">
<script type="text/javascript">
     var ctx = "${ctx}";
</script>
<style>
.placeholder{
margin: 5px;
padding: 0 5px;
background-color: #ebebeb;
height: 2.3em;
line-height: 2.3em;
text-align: center;
color: #cfcfcf;
border-radius:5px;
font-weight:bold;
}
.placeholderA{
margin: 5px;
padding: 0 5px;
background-color: #ebebeb;
height: 2.3em;
line-height: 2.3em;
text-align: center;
color: #cfcfcf;
border-radius:5px;
font-weight:bold;
}
.placeholder_activeA{
  color: white;
  background:#00DB00;
}
.placeholder_active{
  color: white;
  background:#00DB00;
}
.kechengli{
  width:46%;float:left;border-radius:5px;padding: 8px 2%;display: block;
}
.kecheng{
  border-right:0px solid #d9d9d9;padding:8px;box-sizing: border-box;-webkit-box-shadow: 0 0 3px rgba(0,0,0,.35);box-shadow: 0 0 3px rgba(0,0,0,.35);transition:all 0.2s;
}
.kecheng:active{background-color:#ececec;transform:scale(1.1);}
.kechengt{
  height:42px;overflow:hidden; text-overflow:ellipsis;
}
.lcolor{
color: #04BE02;
}
.weui-bar__item--on > .weui-tabbar__icon >.iconfont{
    color: #04BE02;
    background-size: cover;
}
</style>
</head>
<body ontouchstart>
<div class="weui-tab">
	  <div class="weui-tab__bd" >
	  <div class="weui-tab__bd weui-tab__panel" >
        <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active" style='overflow:hidden'>
			<div class="weui-flex" style='margin-top:10px;'>
              <div class="weui-flex__item"><div class="placeholderA placeholder_activeA" index="0">最新上线</div></div>
              <div class="weui-flex__item"><div class="placeholderA" index="1" needloading='true'>最近热播</div></div>
              <div class="weui-flex__item"><div class="placeholderA" index="2" needloading='true'>会员专享</div></div>
              <div class="weui-flex__item"><div class="placeholderA" index="3" needloading='true'>免费专区</div></div>
            </div>
			<div class="swiper-container" id="_aclss">
             <div class="swiper-wrapper" >
            	<div class="swiper-slide swiper-no-swiping"  >
				   <ul id="zuixin" style='box-sizing: border-box;list-style: none;'></ul>
				</div>
            	<div class="swiper-slide swiper-no-swiping"  >
				   <ul id="zuijin" style='box-sizing: border-box;list-style: none;'></ul>
				</div>
				<div class="swiper-slide swiper-no-swiping"  >
				   <ul id="huiyuan" style='box-sizing: border-box;list-style: none;'></ul>
				</div>
				<div class="swiper-slide swiper-no-swiping"  >
				   <ul id="mianfei" style='box-sizing: border-box;list-style: none;'></ul>
				</div>
              </div>
            </div>
        </div>
		<div id="tab2" class="weui-tab__bd-item " style='overflow:hidden'>
			<div class="weui-flex" style='margin-top:10px;'>
              <div class="weui-flex__item"><div class="placeholder placeholder_active" index="0">学习历史</div></div>
              <div class="weui-flex__item"><div id='mycollect' class="placeholder" index="1" needloading='true'>我的收藏</div></div>
            </div>
			<div class="swiper-container" id="myclasses">
             <div class="swiper-wrapper" >
            	<div class="swiper-slide swiper-no-swiping" >
				   <ul id="history" style='box-sizing: border-box;padding: 5px 5px 0 5px;list-style: none;'></ul>
				</div>
            	<div class="swiper-slide swiper-no-swiping"  >
				   <ul id="collect" style='box-sizing: border-box;padding: 5px 5px 0 5px;list-style: none;'></ul>
				</div>
              </div>
             </div>
        </div>
 </div>
 <div class="weui-tabbar ">
    <span href="#tab1" class="weui-tabbar__item weui-bar__item--on tabbar__label" needlogin tabbar__item='1'>
      <div class="weui-tabbar__icon">
         <i class="iconfont" style="line-height:1">&#xe756;</i>
      </div>
      <p class="weui-tabbar__label">学堂服务</p>
    </span>
    <span href="#tab2" class="weui-tabbar__item " needlogin tabbar__item='2'>
      <div class="weui-tabbar__icon">
         <i class="iconfont" style="line-height:1">&#xe653;</i>
      </div>
      <p class="weui-tabbar__label">我的课堂</p>
    </span>
  </div>
</div>
</div>
<script src="${ctx}/js/jqweui/jquery.js"></script>
<script src="${ctx}/js/jqweui/jquery-weui.min.js"></script>
<script src="${ctx}/js/jqweui/swiper.min.js"></script>
<script src="${ctx}/js/jqweui/fastclick.js"></script>
<script src="${ctx}/js/util.js"></script>
<script src="${ctx}/js/cszj/home/school.js"></script>
</body>
</html>
