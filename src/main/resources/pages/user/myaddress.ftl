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
		<label>我的地址</label>
    </span>
</span>
-->
<div class="page__bd">
<div class="weui-panel weui-panel_access">
        <div class="weui-panel__hd"></div>
        <div class="weui-panel__bd" id='addresslist'>
        
		</div>
        <div class="weui-panel__ft">
          <span href="javascript:void(0);" id='addnew' class="weui-cell weui-cell_access weui-cell_link open-popup" data-target="#full">
			<div class="weui-cell__hd" style='color:#18b4ed;padding:0 10px;'><i class="iconfont" >&#xe730;</i></div>
			<div class="weui-cell__bd">新增地址</div>
            <span class="weui-cell__ft"></span>
          </span>    
        </div>
</div>
</div>	

<div id="full" class='weui-popup__container'>
      <div class="weui-popup__overlay"></div>
      <div class="weui-popup__modal">
	  <form id='editAddress'>
		<div class="toolbar">
          <div class="toolbar-inner">
            <a href="javascript:;" id='close-popup' class="picker-button">关闭</a>
			<a href="javascript:;" style='display:none;' id='close' class="picker-button close-popup"></a>
            <h1 class="title">地址编辑</h1>
          </div>
        </div>
		<div class="modal-content">
          <div class="weui-cells weui-cells_form">
		  <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">收货人</label></div>
            <div class="weui-cell__bd">
			  <input type="hidden" id='addressId'>
              <input class="weui-input" type="text" name='name' id='name' placeholder="请输入收货人">
            </div>
          </div>
		  <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">手机号码</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="tel"  name='phone'  id='tel' placeholder="请输入手机号码" >
            </div>
          </div>
          <div class="weui-cell weui-cell_select weui-cell_select-after">
            <div class="weui-cell__hd"><label class="weui-label">省份</label></div>
            <div class="weui-cell__bd" id='phoneNo'>
               <select class="weui-select" id="select1" name='province'>
                  <option value=''>请选择</option>
               </select>
            </div>
          </div>
          <div class="weui-cell  weui-cell_select weui-cell_select-after">
            <div class="weui-cell__hd">
              <label class="weui-label">城市</label>
            </div>
            <div class="weui-cell__bd">
              <select class="weui-select" id="select2" name='city'>
                  <option value=''>请选择</option>
              </select>
            </div>
          </div>
		  <div class="weui-cell  weui-cell_select weui-cell_select-after">
            <div class="weui-cell__hd"><label class="weui-label">区域</label></div>
            <div class="weui-cell__bd">
              <select class="weui-select" id="select3" name='area'>
                  <option value=''>请选择</option>
              </select>
            </div>
          </div>
		  <div class="weui-cells__title">详细地址</div>
          <div class="weui-cell">
            <div class="weui-cell__bd">
                  <textarea class="weui-textarea" id='detail' name='detail' placeholder="请输入详细地址" rows="3"></textarea>
             </div>
          </div>
		  <div class="weui-btn-area">
        	<a class="weui-btn weui-btn_primary" href="javascript:" id="xgmm">确定</a>
			<a class="weui-btn weui-btn_warn" href="javascript:" style='display:none;' id="shanchu">删除</a>
          </div>
          </div>
        </div>
	  </form>
      </div>	  
</div>
</body>
<script data-main="${ctx}/js/cszj/user/address" src="${ctx}/js/require.js"></script>
</html>