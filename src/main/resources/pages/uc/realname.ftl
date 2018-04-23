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
<link rel="stylesheet" href="${ctx}/css/iconfont.css">
<script type="text/javascript">
     var ctx = "${ctx}";
</script>
</head>
<body ontouchstart>
<div class="weui-tab">
<div class="weui-tab__bd">
<div class="weui-tab__bd weui-tab__panel">
<div class="bd">
   <div class="page__bd">
        <div class="weui-cells__title">实名认证</div>
        <div class="weui-cells">
          <div class="weui-cell" id="truenamecell">
            <div class="weui-cell__bd">
              <p>姓名</p>
            </div>
            <div class="weui-cell__ft" id='truename'></div>
          </div>
		  <div class="weui-cell" id="idcardcell">
            <div class="weui-cell__bd">
              <p>身份证号</p>
            </div>
            <div class="weui-cell__ft" id='idcard'></div>
          </div>
		  <div class="weui-cell">
            <div class="weui-cell__bd">
              <p>认证状态</p>
            </div>
            <div class="weui-cell__ft" id='status'></div>
          </div>
        </div>
		<div class="weui-cells__title" id='remark'>备注</div>
        <div class="weui-cell" id='remarks'>
            <div class="weui-cell__bd">
                 <textarea class="weui-textarea" readonly id='detail' name='detail' rows="3"></textarea>
            </div>
        </div>
		<div class="weui-cells__title" for='renzhen' style='display:none;'>实名认证注意事项</div>
        <div class="weui-cell" for='renzhen'  style='display:none;'>
            <div class="shiming_jieshao">
                    <p>1、手持身份证保持本人头像清晰完整，手持身份证信息清晰无遮挡。</p>
                    <p>2、身份证反面单独拍照，保持证件清晰。</p>
                    <p>3、请使用证件原件拍摄，不支持复印件。</p>
                    <p>4、拍摄照片中无logo、水印、反光、遮挡等情况。</p>
                    <p>5、身份证上传仅支持jpg、jpeg、bmp格式图片，图片大小不超过5M</p>
            </div>
        </div>
		<div class="weui-cell" style='vertical-align:top;display:none;' for='renzhen'>
                 示例:<div><img src="${ctx}/images/shiming.jpg"/></div>
        </div>
		<div class="weui-btn-area"  style='display:none;' id="realname">
	      <a class="weui-btn weui-btn_primary open-popup" data-target="#full"   >立即认证</a>
        </div>
   </div>
</div>
</div>
</div>
</div>

<div id="full" class='weui-popup__container' style='z-index:1000;'>
      <div class="weui-popup__overlay"></div>
      <div class="weui-popup__modal">
		<div class="toolbar">
          <div class="toolbar-inner">
            <a href="javascript:;" id='close-popup' class="picker-button">关闭</a>
			<a href="javascript:;" style='display:none;' id='close-popup2' class="picker-button close-popup"></a>
            <h1 class="title" id='mytitle'>实名认证</h1>
          </div>
         </div>
	     <div class="modal-content">
		 <div class="weui-cells">
			<div class="weui-cell">
                <img do-id="LAY_demo_upload1" id='qianmian' do-in='0' src="${ctx}/images/sfz.png" style="width: 300px;">
            </div>
			<div class="weui-cell">
                <img do-id="LAY_demo_upload1" id='houmian' do-in='1' src="${ctx}/images/sfzfm.png" style="width: 300px;">
            </div>
         </div>
		 <form id='zhuce'>
          <div class="weui-cells weui-cells_form">
		  <div class="weui-cell ">
            <div class="weui-cell__hd"><label class="weui-label">真实姓名</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="text" id='zsxm' placeholder="真实姓名">
            </div>
          </div>
		  <div class="weui-cell ">
            <div class="weui-cell__hd"><label class="weui-label">身份证号码</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="text" id='sfzhm' placeholder="身份证号码">
            </div>
          </div>
          <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">手机号码</label></div>
            <div class="weui-cell__bd">
				<input class="weui-input" type="tel" id='phoneNo' readonly>
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
		  
          </div>
		  <div class="weui-btn-area">
        	<a class="weui-btn weui-btn_primary" href="javascript:" id="smrzBt">提交</a>
          </div>
		 </form>
         </div>
      </div>  
</div>

</body>
<script src="${ctx}/js/lib/jweixin-1.2.0.js"></script>
<script data-main="${ctx}/js/cszj/uc/realname" src="${ctx}/js/require.js"></script>
</html>