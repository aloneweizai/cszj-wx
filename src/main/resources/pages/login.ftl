<#assign ctx=request.getContextPath()>
<!DOCTYPE html>
<html>
<head>
<title>财税专家</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
<meta name="format-detection" content="telephone=no">
<meta name="Keywords" content="财税专家，ABC4000，智能申报，AI企易税，e企惠税，易企惠税，ABC4000惠报税，电子申报，电子税务局，电子税局,掌上办税厅,营改增,互联网+税务,帮邦,">
<meta name="description" content="由艾博克公司打造的财税云服务平台，提供在线涉税业务办理、信息查询、在线培训、知识库学习等财税综合服务，为税务机关提供财税信息化解决方案" />
<link rel="stylesheet" href="${ctx}/css/weui.min.css">
<link rel="stylesheet" href="${ctx}/css/jquery-weui.min.css">
<link rel="stylesheet" href="${ctx}/css/main.css">
<link rel="stylesheet" href="${ctx}/css/index.css">
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?a6abbd47e203dea0e025df6e6476c084";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
<script type="text/javascript">
     var ctx = "${ctx}";
	 if(sessionStorage.getItem('userInfo')){
	   sessionStorage.setItem('index','1');
	   location.href='${ctx}/'
	 }
</script>
</head>
<body ontouchstart >
<#--
<span class="weui-cell weui-cell_access weui-navbar__item weui-bar__item--on" style='background-color: #18b4ed;color:white;font-weight:bold;padding: 5px 15px;font-size: 20px;border-bottom: 1px solid #e5e5e5;'>
    <span class="weui-cell__bd" style='text-align: center;'>
		<label>登陆</label>
    </span>
</span>
-->
<div class="weui-msg">
        <div class="weui-msg__icon-area">
			<div style='width: 127px;height: 127px;margin: 20px auto;background: url(${ctx}/images/rjxz.png) no-repeat #fff;'></div>
			<div class="swd-t" style='text-align: center;color: #5e5d5c;font-size: 22px;font-weight: bold;'>掌上财税专家</div>
		</div>
</div>
<div class="swiper-container" id="loginType">
   <div class="swiper-wrapper" >
       <div class="swiper-slide swiper-no-swiping">
		  <div class="weui-cells weui-cells_form">
              <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">用户名</label></div>
                <div class="weui-cell__bd">
                  <input class="weui-input" type="text" id='tel' placeholder="请输入用户名">
                </div>
              </div>
              <div class="weui-cell ">
                <div class="weui-cell__hd"><label class="weui-label">密码</label></div>
                <div class="weui-cell__bd">
                  <input class="weui-input" type="password" id='password' placeholder="请输入密码">
                </div>
              </div>
          </div>
       </div>
       <div class="swiper-slide swiper-no-swiping"> 
		   <div class="weui-cells weui-cells_form">
              <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">手机号码</label></div>
                <div class="weui-cell__bd">
                  <input class="weui-input" type="tel" id='telcode' placeholder="请输入手机号码" >
                </div>
              </div>
              <div class="weui-cell ">
                <div class="weui-cell__hd">
                  <label class="weui-label">验证码</label>
                </div>
                <div class="weui-cell__bd">
                  <input class="weui-input" type="number" id='code' placeholder="请输入验证码">
                </div>
                <div class="weui-cell__ft">
                  <button id='getCode' class="weui-vcode-btn">获取验证码</button>
                </div>
              </div>
              </div>
	   </div>           
   </div>
</div>	
<div class="weui-btn-area">
	<a class="weui-btn weui-btn_primary" href="javascript:" id="showTooltips">登录</a>
</div>
<div class="weui-btn-area" style='text-align:center;line-height: 40px;color:#14B9D5;'>
	<a id="changeLogin">切换登录方式</a>&nbsp;|&nbsp;<a class="open-popup" data-target="#full">立即注册账号</a>
</div>
<div class="weui-footer weui-footer_fixed-bottom">
  <p class="weui-footer__text">Copyright © 2017-2027 ABC</p>
</div>

<div id="full" class='weui-popup__container'>
      <div class="weui-popup__overlay"></div>
      <div class="weui-popup__modal">
		<div class="toolbar">
          <div class="toolbar-inner">
            <a href="javascript:;" id='close-popup' class="picker-button">关闭</a>
			<a href="javascript:;" style='display:none;' id='close' class="picker-button close-popup"></a>
            <h1 class="title">账号注册</h1>
          </div>
        </div>
		<div class="modal-content">
		 <form id='zhuce'>
          <div class="weui-cells weui-cells_form">
          <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">手机号码</label></div>
            <div class="weui-cell__bd" id='phoneNo'>
				<input class="weui-input" type="tel" id='telcode2' placeholder="请输入手机号码">
            </div>
          </div>
          <div class="weui-cell ">
            <div class="weui-cell__hd">
              <label class="weui-label">验证码</label>
            </div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="number" id='code2' placeholder="请输入验证码">
            </div>
            <div class="weui-cell__ft">
              <label id='getCode2' class="weui-vcode-btn">获取验证码</label>
            </div>
          </div>
		  <div class="weui-cell ">
            <div class="weui-cell__hd"><label class="weui-label">密码</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="password" id='password2' placeholder="密码">
            </div>
          </div>
		  <div class="weui-cell ">
            <div class="weui-cell__hd"><label class="weui-label">确认密码</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="password" id='newpassword2' placeholder="确认密码">
            </div>
          </div>
          </div>
		  <div class="weui-btn-area">
        	<a class="weui-btn weui-btn_primary" href="javascript:" id="zhuceBt">注册</a>
          </div>
		 </form>
        </div>
      </div>
</div>
<script src="${ctx}/js/jqweui/jquery.js"></script>
<script src="${ctx}/js/util.js"></script>
<script src="${ctx}/js/jqweui/jquery-weui.min.js"></script>
<script src="${ctx}/js/jqweui/swiper.min.js"></script>
<script src="${ctx}/js/jqweui/fastclick.js"></script>
<script src="${ctx}/js/lib/jquery.md5.js"></script>
<script src="${ctx}/js/cszj/login.js"></script>
</body>
</html>