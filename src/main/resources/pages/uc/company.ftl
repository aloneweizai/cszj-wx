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
<#--
<span class="weui-cell weui-cell_access weui-navbar__item weui-bar__item--on" style='background-color: #18b4ed;color:white;font-weight:bold;padding: 5px 15px;font-size: 20px;border-bottom: 1px solid #e5e5e5;'>
    <span class="weui-cell__bd" style='text-align: center;'>
		<a onclick="javascript:window.history.back(-1);" style='float:left;'><i class="iconfont" style='font-size: 20px;font-weight:bold;color:white'>&#xe700;</i></a>
		<label>我的纳税企业</label>
    </span>
</span>
-->
<div class="weui-tab">
 <div class="weui-navbar">
     <a class="weui-navbar__item weui-bar__item--on" href="#tab1">国税电子申报</a>
     <a class="weui-navbar__item" data-href="#tab2" needloding='true'>国税网上办税</a>
     <a class="weui-navbar__item" data-href="#tab3" needloding='true'>地税网上办税</a>
 </div>
 <div class="weui-tab__bd">
    <a class="open-popup" data-target="#full" id='showadd' style='display:none;'></a>
    <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
       <div class="weui-panel__bd" style='border-bottom: 1px solid #e5e5e5;'>
          <span href="javascript:void(0);" class="weui-cell weui-cell_access weui-cell_link" swid='dzsb'>
			<div class="weui-cell__hd" style='color:#18b4ed;padding:0 10px;'><i class="iconfont" >&#xe730;</i></div>
            <div class="weui-cell__bd">新增绑定</div>
            <span class="weui-cell__ft"></span>
          </span>    
        </div>
    </div>
    <div id="tab2" class="weui-tab__bd-item">
        <div class="weui-panel__bd" style='border-bottom: 1px solid #e5e5e5;'>
          <span href="javascript:void(0);" class="weui-cell weui-cell_access weui-cell_link" swid='hngs'>
			<div class="weui-cell__hd" style='color:#18b4ed;padding:0 10px;'><i class="iconfont" >&#xe730;</i></div>
			<div class="weui-cell__bd">新增绑定</div>
            <span class="weui-cell__ft"></span>
          </span>    
        </div>
    </div>
    <div id="tab3" class="weui-tab__bd-item">
        <div class="weui-panel__bd" style='border-bottom: 1px solid #e5e5e5;'>
          <span href="javascript:void(0);" class="weui-cell weui-cell_access weui-cell_link" swid='hnds'>
			<div class="weui-cell__hd" style='color:#18b4ed;padding:0 10px;'><i class="iconfont" >&#xe730;</i></div>
			<div class="weui-cell__bd">新增绑定</div>
            <span class="weui-cell__ft"></span>
          </span>    
        </div>
    </div>
  </div>
</div>

<div id="full" class='weui-popup__container' style='z-index:1000;'>
      <div class="weui-popup__overlay"></div>
      <div class="weui-popup__modal">
	  <form id='editCompany'>
		 <div class="toolbar">
          <div class="toolbar-inner">
            <a href="javascript:;" id='close-popup' class="picker-button">关闭</a>
			<a href="javascript:;" style='display:none;' id='close' class="picker-button close-popup"></a>
            <h1 class="title" id='mytitle'></h1>
          </div>
         </div>
		 <div class="modal-content">
		 <div class="weui-cells weui-cells_form">
		  <div class="weui-cell" needshow style='display:none;' showid='dzsb'>
            <div class="weui-cell__hd"><label class="weui-label">纳税人识别号</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="text" name='nsrsbhOrShxydm' id='nsrsbhOrShxydm' placeholder="纳税人识别号/社会信用代码">
            </div>
          </div>
		  <div class="weui-cell" needshow style='display:none;' showid='dzsb'>
            <div class="weui-cell__hd"><label class="weui-label">申报服务密码</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="text" name='fwmm' id='fwmm' placeholder="申报服务密码">
            </div>
          </div>
		  <div class="weui-cell" needshow style='display:none;' showid='hngs'>
            <div class="weui-cell__hd"><label class="weui-label">办税号</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="text" name='bsy' id='bsy' placeholder="办税号">
            </div>
          </div>
		  <div class="weui-cell" needshow style='display:none;' showid='hngs'>
            <div class="weui-cell__hd"><label class="weui-label">密码</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="text" name='password' id='password' placeholder="密码">
            </div>
          </div>
		  <div class="weui-cell  weui-cell_select weui-cell_select-after" needshow style='display:none;' showid='hngs'>
            <div class="weui-cell__hd">
              <label class="weui-label">申报角色</label>
            </div>
            <div class="weui-cell__bd" >
              <select class="weui-select" id="role" name='role'>
                  <option value='R0001'>办税人01</option>
				  <option value='R0002'>办税人02</option>
				  <option value='R0003'>办税人03</option>
              </select>
            </div>
          </div>
		  <div class="weui-cell" needshow style='display:none;' showid='hnds'>
            <div class="weui-cell__hd"><label class="weui-label">用户许可证</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="text" name='username' id='username' placeholder="用户许可证">
            </div>
          </div>
		  <div class="weui-cell" needshow style='display:none;' showid='hnds'>
            <div class="weui-cell__hd"><label class="weui-label">子用户账号</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="text" name='subuser' id='subuser' placeholder="子用户账号">
            </div>
          </div>
		  <div class="weui-cell" needshow style='display:none;' showid='hnds'>
            <div class="weui-cell__hd"><label class="weui-label">子用户密码</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="text" name='dspassword' id='dspassword' placeholder="子用户密码">
            </div>
          </div>
		  <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">手机号码</label></div>
            <div class="weui-cell__bd" id='phoneNo'>  
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
              <label id='getCode' class="weui-vcode-btn">获取验证码</label>
            </div>
          </div>
		  <div class="weui-btn-area">
        	<a class="weui-btn weui-btn_primary" href="javascript:" id="xgmm">确定</a>
          </div>
         </div>
      </div>
	  </form>
      </div>
	  
</div>
</body>
<script data-main="${ctx}/js/cszj/uc/company" src="${ctx}/js/require.js"></script>
</html>